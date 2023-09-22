#################################
# Configure the VMware vSphere Provider
##################################
provider "vsphere" {
  version        = "~> 1.1"
  vsphere_server = "${var.vsphere_server}"

  # if you have a self-signed cert
  allow_unverified_ssl = "${var.allow_unverified_ssl}"

}

##################################
#### Collect resource IDs
##################################
data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_datastore" "datastore_etcd" {
  name          = "${var.datastore_etcd != "" ? var.datastore_etcd : var.datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_cluster}/Resources/${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.network_label}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

# Create a folder
resource "vsphere_folder" "icpenv" {
  count = "${var.folder != "" ? 1 : 0}"
  path = "${var.folder}"
  type = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


locals  {
  folder_path = "${var.folder != "" ?
        element(concat(vsphere_folder.icpenv.*.path, list("")), 0)
        : ""}"
}

##############################################################
# Create temp public key for ssh connection
##############################################################
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
}

##################################
#### Create the NFS VM
##################################
resource "vsphere_virtual_machine" "icpnfs" {
  #depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.nfs["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name      = "${format("${lower(var.instance_name)}nfs%02d", count.index + 1) }"
  num_cpus  = "${var.nfs["vcpu"]}"
  memory    = "${var.nfs["memory"]}"

  scsi_controller_count = 1
  scsi_type = "lsilogic-sas"

  ####
  # Disk specifications
  ####
  datastore_id  = "${data.vsphere_datastore.datastore.id}"
  guest_id      = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type     = "${data.vsphere_virtual_machine.template.scsi_type}"

  disk {
    label            = "${format("${lower(var.instance_name)}-nfs%02d.vmdk", count.index + 1) }"
    size             = "${var.nfs["disk_size"]        != "" ? var.nfs["disk_size"]        : data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${var.nfs["eagerly_scrub"]    != "" ? var.nfs["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.nfs["thin_provisioned"] != "" ? var.nfs["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.nfs["keep_disk_on_remove"]}"
    unit_number      = 0
  }

  disk {
    label            = "${format("${lower(var.instance_name)}-nfs%02d_export.vmdk", count.index + 1) }"
    size             = "${var.nfs["export_disk_size"]}"
    eagerly_scrub    = "${var.nfs["eagerly_scrub"]    != "" ? var.nfs["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.nfs["thin_provisioned"] != "" ? var.nfs["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.nfs["keep_disk_on_remove"]}"
    unit_number      = 1
  }


  ####
  # Network specifications
  ####
  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  ####
  # VM Customizations
  ####
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${format("${lower(var.instance_name)}nfs%02d", count.index + 1) }"
        domain    = "${var.domain != "" ? var.domain : format("%s.local", var.instance_name)}"
      }
      network_interface {
        ipv4_address  = "${var.staticipblock != "0.0.0.0/0" ? cidrhost(var.staticipblock, 1 + var.staticipblock_offset + count.index) : ""}"
        ipv4_netmask  = "${var.netmask}"
      }

      ipv4_gateway    = "${var.gateway}"
      dns_server_list = "${var.dns_servers}"
    }
  }

  # Specify the ssh connection
  connection {
    user          = "${var.ssh_user}"
    password      = "${var.ssh_password}"
  }

  provisioner "file" {
    source      = "${path.module}/scripts"
    destination = "/tmp/terraform_scripts"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod u+x /tmp/terraform_scripts/*.sh",
      "/tmp/terraform_scripts/add-public-ssh-key.sh \"${tls_private_key.ssh.public_key_openssh}\"",
      "/tmp/terraform_scripts/add-private-ssh-key.sh \"${tls_private_key.ssh.private_key_pem}\" \"${var.ssh_user}\"",
      "sudo /tmp/terraform_scripts/Create-lvm_nfs.sh",
      "sudo touch /etc/apt/apt.conf.d/99proxy",
      "sudo chmod 644 /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpsproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "sudo mkdir -p /etc/systemd/system/docker.service.d",
      "sudo chmod 755 /etc/systemd/system/docker.service.d",
      "sudo cp /tmp/terraform_scripts/http-proxy.conf /etc/systemd/system/docker.service.d/",
      "sudo chmod 644 /etc/systemd/system/docker.service.d/http-proxy.conf",
      "echo '${var.dockerproxy}' | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf",
      "sudo apt-get update",
      "sudo systemctl daemon-reload",
      "sudo apt install -y awscli",
      "sudo apt install -y nfs-kernel-server",
      "sudo mkdir -p /storage/user1-icp-31/registry",
      "sudo mkdir -p /storage/user1-icp-31/audit",
      "sudo mkdir -p /storage/icp/3.1/",
      "mkdir -p /home/icpenable/.aws",
      "cp /tmp/terraform_scripts/credentials /home/icpenable/.aws/",
      "sed -i 's/object_access_key/${var.object_access_key}/g' /home/icpenable/.aws/credentials",
      "sed -i 's/object_key_id/${var.object_key_id}/g' /home/icpenable/.aws/credentials",
      "export https_proxy=${var.tillerproxy}",
      "sudo -E aws --endpoint-url=${var.object_url} s3 cp s3://${var.objectstoragelocation_image} /storage/icp/3.1/",
      "echo '/storage *(rw,sync,no_root_squash,no_subtree_check)' | sudo tee -a /etc/exports",
      "sudo systemctl enable nfs-server",
      "sudo systemctl start nfs-server",     
      "sudo exportfs -av",
      "sudo chmod -R 775 /storage"
    ]
  }
}

##################################
#### Create the Master VM
##################################
resource "vsphere_virtual_machine" "icpmaster" {
  #depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.master["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name      = "${format("${lower(var.instance_name)}m%02d", count.index + 1) }"
  num_cpus  = "${var.master["vcpu"]}"
  memory    = "${var.master["memory"]}"

  scsi_controller_count = 1
  scsi_type = "lsilogic-sas"

  ####
  # Disk specifications
  ####
  datastore_id  = "${data.vsphere_datastore.datastore.id}"
  guest_id      = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type     = "${data.vsphere_virtual_machine.template.scsi_type}"

  disk {
    label            = "${format("${lower(var.instance_name)}-master%02d.vmdk", count.index + 1) }"
    size             = "${var.master["disk_size"]        != "" ? var.master["disk_size"]        : data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${var.master["eagerly_scrub"]    != "" ? var.master["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.master["thin_provisioned"] != "" ? var.master["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.master["keep_disk_on_remove"]}"
    unit_number      = 0
  }

  disk {
    label            = "${format("${lower(var.instance_name)}-master%02d_docker.vmdk", count.index + 1) }"
    size             = "${var.master["docker_disk_size"]}"
    eagerly_scrub    = "${var.master["eagerly_scrub"]    != "" ? var.master["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.master["thin_provisioned"] != "" ? var.master["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.master["keep_disk_on_remove"]}"
    unit_number      = 1
  }

  ####
  # Network specifications
  ####
  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  ####
  # VM Customizations
  ####
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${format("${lower(var.instance_name)}m%02d", count.index + 1) }"
        domain    = "${var.domain != "" ? var.domain : format("%s.local", var.instance_name)}"
      }
      network_interface {
        ipv4_address  = "${var.staticipblock != "0.0.0.0/0" ? cidrhost(var.staticipblock, 1 + var.staticipblock_offset + var.nfs["nodes"] + count.index) : ""}"
        ipv4_netmask  = "${var.netmask}"
      }

      ipv4_gateway    = "${var.gateway}"
      dns_server_list = "${var.dns_servers}"
    }
  }

  # Specify the ssh connection
  connection {
    user          = "${var.ssh_user}"
    password      = "${var.ssh_password}"
  }

  provisioner "file" {
    source      = "${path.module}/scripts"
    destination = "/tmp/terraform_scripts"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod u+x /tmp/terraform_scripts/*.sh",
      "/tmp/terraform_scripts/add-public-ssh-key.sh \"${tls_private_key.ssh.public_key_openssh}\"",
      "/tmp/terraform_scripts/add-private-ssh-key.sh \"${tls_private_key.ssh.private_key_pem}\" \"${var.ssh_user}\"",
      "sudo /tmp/terraform_scripts/Create-lvm_master.sh",
      "sudo touch /etc/apt/apt.conf.d/99proxy",
      "sudo chmod 644 /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpsproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "sudo mkdir -p /etc/systemd/system/docker.service.d",
      "sudo chmod 755 /etc/systemd/system/docker.service.d",
      "sudo cp /tmp/terraform_scripts/http-proxy.conf /etc/systemd/system/docker.service.d/",
      "sudo chmod 644 /etc/systemd/system/docker.service.d/http-proxy.conf",
      "echo '${var.dockerproxy}' | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf",
      "sudo systemctl daemon-reload",
      "/tmp/terraform_scripts/install-docker.sh -p ${var.docker_package_location}",
      "sleep 300s",
      "sudo mkdir -p /var/lib/registry",
      "sudo mkdir -p /var/lib/icp/audit",
      "${var.registry_mount_src == "" ?
        "echo na"
        :
        "echo '${var.registry_mount_src} /var/lib/registry   ${var.registry_mount_type}  ${var.registry_mount_options}   0 0' | sudo tee -a /etc/fstab"
      }",
      "${var.audit_mount_src == "" ?
        "echo na"
        :
        "echo '${var.audit_mount_src} /var/lib/icp/audit   ${var.audit_mount_type}  ${var.audit_mount_options}  0 0' | sudo tee -a /etc/fstab"}",
      "sudo mount -a"
    ]
  }
}

##################################
### Create the Proxy VM
##################################
resource "vsphere_virtual_machine" "icpproxy" {
  #depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.proxy["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name     = "${format("${lower(var.instance_name)}p%02d", count.index + 1) }"
  num_cpus = "${var.proxy["vcpu"]}"
  memory   = "${var.proxy["memory"]}"


  ####
  # Disk specifications
  ####
  datastore_id  = "${data.vsphere_datastore.datastore.id}"
  guest_id      = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type     = "${data.vsphere_virtual_machine.template.scsi_type}"

  disk {
    label            = "${format("${lower(var.instance_name)}-proxy%02d.vmdk", count.index + 1) }"
    size             = "${var.proxy["disk_size"]        != "" ? var.proxy["disk_size"]        : data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${var.proxy["eagerly_scrub"]    != "" ? var.proxy["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.proxy["thin_provisioned"] != "" ? var.proxy["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.proxy["keep_disk_on_remove"]}"
  }

  disk {
    label            = "${format("${lower(var.instance_name)}-proxy%02d_docker.vmdk", count.index + 1) }"
    size             = "${var.proxy["docker_disk_size"]}"
    eagerly_scrub    = "${var.proxy["eagerly_scrub"]    != "" ? var.proxy["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.proxy["thin_provisioned"] != "" ? var.proxy["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.proxy["keep_disk_on_remove"]}"
    unit_number      = 1
  }

  ####
  # Network specifications
  ####
  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  ####
  # VM Customizations
  ####
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${format("${lower(var.instance_name)}p%02d", count.index + 1) }"
        domain    = "${var.domain != "" ? var.domain : format("%s.local", var.instance_name)}"
      }
      network_interface {
        ipv4_address  = "${var.staticipblock != "0.0.0.0/0" ? cidrhost(var.staticipblock, 1 + var.staticipblock_offset + var.nfs["nodes"] + var.master["nodes"] + count.index) : ""}"
        ipv4_netmask  = "${var.netmask}"
      }

      ipv4_gateway    = "${var.gateway}"
      dns_server_list = "${var.dns_servers}"
    }
  }

  # Specify the ssh connection
  connection {
    user          = "${var.ssh_user}"
    password      = "${var.ssh_password}"
  }

  provisioner "file" {
    source      = "${path.module}/scripts"
    destination = "/tmp/terraform_scripts"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod u+x /tmp/terraform_scripts/*.sh",
      "/tmp/terraform_scripts/add-public-ssh-key.sh \"${tls_private_key.ssh.public_key_openssh}\"",
      "sudo /tmp/terraform_scripts/Create-lvm_proxy.sh",
      "sudo touch /etc/apt/apt.conf.d/99proxy",
      "sudo chmod 644 /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpsproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "sudo mkdir -p /etc/systemd/system/docker.service.d",
      "sudo chmod 755 /etc/systemd/system/docker.service.d",
      "sudo cp /tmp/terraform_scripts/http-proxy.conf /etc/systemd/system/docker.service.d/",
      "sudo chmod 644 /etc/systemd/system/docker.service.d/http-proxy.conf",
      "echo '${var.dockerproxy}' | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf",
      "sudo systemctl daemon-reload",
      "/tmp/terraform_scripts/install-docker.sh -p ${var.docker_package_location}"
    ]
  }
}

resource "vsphere_virtual_machine" "icpmanagement" {
  #depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.management["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name      = "${format("${lower(var.instance_name)}x%02d", count.index + 1) }"
  num_cpus  = "${var.management["vcpu"]}"
  memory    = "${var.management["memory"]}"

  ####
  # Disk specifications
  ####
  datastore_id  = "${data.vsphere_datastore.datastore.id}"
  guest_id      = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type     = "${data.vsphere_virtual_machine.template.scsi_type}"

  disk {
    label            = "${format("${lower(var.instance_name)}-management%02d.vmdk", count.index + 1) }"
    size             = "${var.management["disk_size"]        != "" ? var.management["disk_size"]        : data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${var.management["eagerly_scrub"]    != "" ? var.management["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.management["thin_provisioned"] != "" ? var.management["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.management["keep_disk_on_remove"]}"
  }

  disk {
    label            = "${format("${lower(var.instance_name)}-management%02d_docker.vmdk", count.index + 1) }"
    size             = "${var.management["docker_disk_size"]}"
    eagerly_scrub    = "${var.management["eagerly_scrub"]    != "" ? var.management["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.management["thin_provisioned"] != "" ? var.management["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.management["keep_disk_on_remove"]}"
    unit_number      = 1
  }

  ####
  # Network specifications
  ####
  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  ####
  # VM Customizations
  ####
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${format("${lower(var.instance_name)}x%02d", count.index + 1) }"
        domain    = "${var.domain != "" ? var.domain : format("%s.local", var.instance_name)}"
      }
      network_interface {
        ipv4_address  = "${var.staticipblock != "0.0.0.0/0" ? cidrhost(var.staticipblock, 1 + var.staticipblock_offset + var.nfs["nodes"] + var.master["nodes"] + var.proxy["nodes"] + count.index) : ""}"
        ipv4_netmask  = "${var.netmask}"
      }
      ipv4_gateway    = "${var.gateway}"
      dns_server_list = "${var.dns_servers}"
    }
  }

  # Specify the ssh connection
  connection {
    user          = "${var.ssh_user}"
    password      = "${var.ssh_password}"
  }

  provisioner "file" {
    source      = "${path.module}/scripts"
    destination = "/tmp/terraform_scripts"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod u+x /tmp/terraform_scripts/*.sh",
      "/tmp/terraform_scripts/add-public-ssh-key.sh \"${tls_private_key.ssh.public_key_openssh}\"",
      "sudo /tmp/terraform_scripts/Create-lvm_management.sh",
      "sudo touch /etc/apt/apt.conf.d/99proxy",
      "sudo chmod 644 /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpsproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "sudo mkdir -p /etc/systemd/system/docker.service.d",
      "sudo chmod 755 /etc/systemd/system/docker.service.d",
      "sudo cp /tmp/terraform_scripts/http-proxy.conf /etc/systemd/system/docker.service.d/",
      "sudo chmod 644 /etc/systemd/system/docker.service.d/http-proxy.conf",
      "echo '${var.dockerproxy}' | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf",
      "sudo systemctl daemon-reload",
      "/tmp/terraform_scripts/install-docker.sh -p ${var.docker_package_location}"
    ]
  }
}

resource "vsphere_virtual_machine" "icpva" {
  #depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.va["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name      = "${format("${lower(var.instance_name)}va%02d", count.index + 1) }"
  num_cpus  = "${var.va["vcpu"]}"
  memory    = "${var.va["memory"]}"

  ####
  # Disk specifications
  ####
  datastore_id      = "${data.vsphere_datastore.datastore.id}"
  guest_id          = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type         = "${data.vsphere_virtual_machine.template.scsi_type}"

  disk {
    label            = "${format("${lower(var.instance_name)}-va%02d.vmdk", count.index + 1) }"
    size             = "${var.va["disk_size"]        != "" ? var.va["disk_size"]        : data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${var.va["eagerly_scrub"]    != "" ? var.va["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.va["thin_provisioned"] != "" ? var.va["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.va["keep_disk_on_remove"]}"
  }

  disk {
    label            = "${format("${lower(var.instance_name)}-va%02d_docker.vmdk", count.index + 1) }"
    size             = "${var.va["docker_disk_size"]}"
    eagerly_scrub    = "${var.va["eagerly_scrub"]    != "" ? var.va["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.va["thin_provisioned"] != "" ? var.va["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.va["keep_disk_on_remove"]}"
    unit_number      = 1
  }

  ####
  # Network specifications
  ####
  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  ####
  # VM Customizations
  ####
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${format("${lower(var.instance_name)}va%02d", count.index + 1) }"
        domain    = "${var.domain != "" ? var.domain : format("%s.local", var.instance_name)}"
      }
      network_interface {
        ipv4_address  = "${var.staticipblock != "0.0.0.0/0" ? cidrhost(var.staticipblock, 1 + var.staticipblock_offset + var.nfs["nodes"] + var.master["nodes"] + var.proxy["nodes"] + var.management["nodes"] + count.index) : ""}"
        ipv4_netmask  = "${var.netmask}"
      }
      ipv4_gateway    = "${var.gateway}"
      dns_server_list = "${var.dns_servers}"
    }
  }

  # Specify the ssh connection
  connection {
    user          = "${var.ssh_user}"
    password      = "${var.ssh_password}"
  }

  provisioner "file" {
    source      = "${path.module}/scripts"
    destination = "/tmp/terraform_scripts"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod u+x /tmp/terraform_scripts/*.sh",
      "/tmp/terraform_scripts/add-public-ssh-key.sh \"${tls_private_key.ssh.public_key_openssh}\"",
      "sudo /tmp/terraform_scripts/Create-lvm_va.sh",
      "sudo touch /etc/apt/apt.conf.d/99proxy",
      "sudo chmod 644 /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpsproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "sudo mkdir -p /etc/systemd/system/docker.service.d",
      "sudo chmod 755 /etc/systemd/system/docker.service.d",
      "sudo cp /tmp/terraform_scripts/http-proxy.conf /etc/systemd/system/docker.service.d/",
      "sudo chmod 644 /etc/systemd/system/docker.service.d/http-proxy.conf",
      "echo '${var.dockerproxy}' | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf",
      "sudo systemctl daemon-reload",
      "/tmp/terraform_scripts/install-docker.sh -p ${var.docker_package_location}"
    ]
  }
}

##################################
### Create the Worker VMs
##################################
resource "vsphere_virtual_machine" "icpworker" {
  #depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.worker["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name     = "${format("${lower(var.instance_name)}n%02d", count.index + 1) }"
  num_cpus = "${var.worker["vcpu"]}"
  memory   = "${var.worker["memory"]}"


  #####
  # Disk Specifications
  ####
  datastore_id  = "${data.vsphere_datastore.datastore.id}"
  guest_id      = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type     = "${data.vsphere_virtual_machine.template.scsi_type}"

  disk {
    label            = "${format("${lower(var.instance_name)}-worker%02d.vmdk", count.index + 1) }"
    size             = "${var.worker["disk_size"]        != "" ? var.worker["disk_size"]        : data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${var.worker["eagerly_scrub"]    != "" ? var.worker["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.worker["thin_provisioned"] != "" ? var.worker["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.worker["keep_disk_on_remove"]}"
  }

  disk {
    label            = "${format("${lower(var.instance_name)}-worker%02d_docker.vmdk", count.index + 1) }"
    size             = "${var.worker["docker_disk_size"]}"
    eagerly_scrub    = "${var.worker["eagerly_scrub"]    != "" ? var.worker["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.worker["thin_provisioned"] != "" ? var.worker["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.worker["keep_disk_on_remove"]}"
    unit_number      = 1
  }

  ####
  # Network specifications
  ####
  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }


  #####
  # VM Customizations
  ####
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${format("${lower(var.instance_name)}n%02d", count.index + 1) }"
        domain    = "${var.domain != "" ? var.domain : format("%s.local", var.instance_name)}"
      }

      network_interface {
        ipv4_address  = "${var.staticipblock != "0.0.0.0/0" ? cidrhost(var.staticipblock, 1 + var.staticipblock_offset + var.nfs["nodes"] + var.master["nodes"] + var.proxy["nodes"] + var.management["nodes"] + var.va["nodes"] + count.index) : ""}"
        ipv4_netmask  = "${var.netmask}"
      }

      ipv4_gateway    = "${var.gateway}"
      dns_server_list = "${var.dns_servers}"
    }
  }

  # Specify the ssh connection
  connection {
    user          = "${var.ssh_user}"
    password      = "${var.ssh_password}"
  }

  provisioner "file" {
    source      = "${path.module}/scripts"
    destination = "/tmp/terraform_scripts"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod u+x /tmp/terraform_scripts/*.sh",
      "/tmp/terraform_scripts/add-public-ssh-key.sh \"${tls_private_key.ssh.public_key_openssh}\"",
      "sudo /tmp/terraform_scripts/Create-lvm_worker.sh",
      "sudo touch /etc/apt/apt.conf.d/99proxy",
      "sudo chmod 644 /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "echo '${var.httpsproxy}' | sudo tee -a /etc/apt/apt.conf.d/99proxy",
      "sudo mkdir -p /etc/systemd/system/docker.service.d",
      "sudo chmod 755 /etc/systemd/system/docker.service.d",
      "sudo cp /tmp/terraform_scripts/http-proxy.conf /etc/systemd/system/docker.service.d/",
      "sudo chmod 644 /etc/systemd/system/docker.service.d/http-proxy.conf",
      "echo '${var.dockerproxy}' | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf",
      "sudo systemctl daemon-reload",
      "/tmp/terraform_scripts/install-docker.sh -p ${var.docker_package_location}"
    ]
  }
}
