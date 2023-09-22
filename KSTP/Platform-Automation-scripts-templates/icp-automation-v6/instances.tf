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
  count = "${local.folder != "" ? 1 : 0}"
  path = "${local.folder}"
  type = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


locals  {
  folder_path = "${local.folder != "" ?
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
  depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.nfs["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name      = "${format("${lower(var.instance_name)}nfs%02d", count.index + 1) }"
  num_cpus  = "${var.nfs["vcpu"]}"
  memory    = "${var.nfs["memory"]}"
  cpu_hot_add_enabled = "${var.hot_add_enabled}"
  memory_hot_add_enabled = "${var.hot_add_enabled}"


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
    label            = "${format("${lower(var.instance_name)}-nfs%02d_data.vmdk", count.index + 1) }"
    size             = "${var.nfs["data_disk_size"]}"
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
      "sudo apt update",
      "sudo apt -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' -y upgrade",
      "sudo pvcreate /dev/sdb",
      "sudo vgcreate datavg /dev/sdb",
      "sudo lvcreate -l+100%FREE datavg -n lvicpnfs",
      "sudo mkfs.xfs /dev/datavg/lvicpnfs",
      "sudo mkdir -m775 -p /data",
      "sudo mount /dev/datavg/lvicpnfs /data",
      "sudo sed -i '$a/dev/datavg/lvicpnfs    /data   ext4	defaults    0   2' /etc/fstab",
      "sudo apt install -y awscli nfs-kernel-server",
      "sudo systemctl stop nfs-server",     
      "sudo mkdir -m775 -p /data/icp/registry /data/icp/audit ${var.nfs_image_path}/tmp",
      "counter=$((${var.master["nodes"]}));for i in $(seq 1 $counter); do sudo mkdir -m775 ${var.nfs_image_path}/tmp/${var.instance_name}m0$i; done",
      "counter=$((${var.proxy["nodes"]}));for i in $(seq 1 $counter); do sudo mkdir -m775 ${var.nfs_image_path}/tmp/${var.instance_name}p0$i; done",
      "counter=$((${var.management["nodes"]}));for i in $(seq 1 $counter); do sudo mkdir -m775 ${var.nfs_image_path}/tmp/${var.instance_name}x0$i; done",
      "counter=$((${var.worker["nodes"]}));for i in $(seq 1 $counter); do sudo mkdir -m775 ${var.nfs_image_path}/tmp/${var.instance_name}n0$i; done",
      "counter=$((${var.va["nodes"]}));for i in $(seq 1 $counter); do sudo mkdir -m775 ${var.nfs_image_path}/tmp/${var.instance_name}va0$i; done",
      "mkdir -p /home/icpenable/.aws",
      "cp /tmp/terraform_scripts/credentials /home/icpenable/.aws/",
      "sed -i 's/object_access_key/${var.object_access_key}/g' /home/icpenable/.aws/credentials",
      "sed -i 's/object_key_id/${var.object_key_id}/g' /home/icpenable/.aws/credentials",
      "export https_proxy=https://${local.tillerproxy}",
      "sudo -E aws --endpoint-url=${var.object_url} s3 cp s3://${local.objectstoragelocation_image} ${var.nfs_image_path}",
      "counter=$((${var.master["nodes"]}));for i in $(seq 1 $counter); do sudo cp ${var.nfs_image_path}/${local.image_filename} ${var.nfs_image_path}/tmp/${lower(var.instance_name)}m0$i/; done",
      "sudo sed -i '$a/data ${var.staticipblock}(rw,sync,no_root_squash,no_all_squash,no_subtree_check)' /etc/exports",
      "sudo find /data -type f | sudo xargs chmod 664 ",
      "sudo find /data -type d | sudo xargs chmod 775 ",
      "sudo systemctl enable nfs-server",
      "sudo systemctl start nfs-server",     
      "sudo exportfs -av"
    ]
  }
}

##################################
#### Create the Master VM
##################################
resource "vsphere_virtual_machine" "icpmaster" {
  depends_on = ["vsphere_folder.icpenv","vsphere_virtual_machine.icpnfs"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.master["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name      = "${format("${lower(var.instance_name)}m%02d", count.index + 1) }"
  num_cpus  = "${var.master["vcpu"]}"
  memory    = "${var.master["memory"]}"
  cpu_hot_add_enabled = "${var.hot_add_enabled}"
  memory_hot_add_enabled = "${var.hot_add_enabled}"

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
    label            = "${format("${lower(var.instance_name)}-master%02d_data.vmdk", count.index + 1) }"
    size             = "${var.master["data_disk_size"]}"
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
	"sudo pvcreate /dev/sdb",
	"sudo vgcreate datavg /dev/sdb",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibdocker"]} -n lvvarlibdocker datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibdocker",
	"sudo sed -i '$a/dev/datavg/lvvarlibdocker    /var/lib/docker   ext4    defaults	0   2' /etc/fstab",
	"sudo mkdir -m755 /var/lib/docker",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibetcd"]} -n lvvarlibetcd datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibetcd",
	"sudo mkdir -m755 /var/lib/etcd",
	"sudo sed -i '$a/dev/datavg/lvvarlibetcd    /var/lib/etcd   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibicp"]} -n lvvarlibicp datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibicp",
	"sudo mkdir -m755 /var/lib/icp",
	"sudo sed -i '$a/dev/datavg/lvvarlibicp    /var/lib/icp   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibmysql"]} -n lvvarlibmysql datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibmysql",
	"sudo mkdir -m755 /var/lib/mysql",
	"sudo sed -i '$a/dev/datavg/lvvarlibmysql    /var/lib/mysql   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibkubelet"]} -n lvvarlibkubelet datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibkubelet",
	"sudo mkdir -m755 /var/lib/kubelet",
	"sudo sed -i '$a/dev/datavg/lvvarlibkubelet    /var/lib/kubelet   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibetcdwal"]} -n lvvarlibetcdwal datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibetcdwal",
	"sudo mkdir -m755 /var/lib/etcd-wal",
	"sudo sed -i '$a/dev/datavg/lvvarlibetcdwal    /var/lib/etcd-wal   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["optibmcfc"]} -n lvoptibmcfc datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvoptibmcfc",
	"sudo mkdir -m755 /opt/ibm/cfc",
	"sudo sed -i '$a/dev/datavg/lvoptibmcfc    /opt/ibm/cfc  ext4    defaults	0   2' /etc/fstab",
	"sudo sed -i '/deb /s/^#//' /etc/apt/sources.list.d/docker.list",
	"sudo apt update",
	# Wait for NFS service to start
	"while ! nc -vz ${cidrhost(var.staticipblock, 1 + var.staticipblock_offset)} 2049; do sleep 30s; done",
	"sudo mount -a",
	"sudo rm -rf /var/lib/mysql/*",
	"sudo apt update",
	"sudo apt -y install docker-ce=${var.docker_engine_version}*",
	"sudo sed -i '/deb /s/^/#/' /etc/apt/sources.list.d/docker.list",
	"sudo cp /repo/ICP/docker.rules /etc/audit/rules.d/",
	"sudo augenrules --load",
	"sudo service auditd restart",
	"sudo auditctl -l",
	"sudo sed -i '/GRUB_CMDLINE_LINUX=/s/\"/\"cgroup_enable=memory swapaccount=1/' /etc/default/grub",
	"sudo update-grub",
	"sudo cp /repo/ICP/daemon.json /etc/docker/",
	"sudo cp /repo/ICP/91-icp.conf /etc/sysctl.d/",
	"sudo sysctl -p /etc/sysctl.d/91-icp.conf",
	"sudo systemctl reload docker",
	"sudo apt update",
	"sudo apt -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' -y upgrade",
      	"${local.registry_mount_src == "" ?
        	"echo na"
        	:
        	"echo '${local.registry_mount_src} /var/lib/registry   ${var.registry_mount_type}  ${var.registry_mount_options}   0 0' | sudo tee -a /etc/fstab"
      		}",
      	"${local.audit_mount_src == "" ?
        	"echo na"
        	:
        	"echo '${local.audit_mount_src} /var/lib/icp/audit   ${var.audit_mount_type}  ${var.audit_mount_options}  0 0' | sudo tee -a /etc/fstab"}",
      	"sudo shutdown -r +1"
    ]
  }
}

##################################
### Create the Proxy VM
##################################
resource "vsphere_virtual_machine" "icpproxy" {
  depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.proxy["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name     = "${format("${lower(var.instance_name)}p%02d", count.index + 1) }"
  num_cpus = "${var.proxy["vcpu"]}"
  memory   = "${var.proxy["memory"]}"
  cpu_hot_add_enabled = "${var.hot_add_enabled}"
  memory_hot_add_enabled = "${var.hot_add_enabled}"


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
    label            = "${format("${lower(var.instance_name)}-proxy%02d_data.vmdk", count.index + 1) }"
    size             = "${var.proxy["data_disk_size"]}"
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
	"/tmp/terraform_scripts/add-private-ssh-key.sh \"${tls_private_key.ssh.private_key_pem}\" \"${var.ssh_user}\"",
	"sudo pvcreate /dev/sdb",
	"sudo vgcreate datavg /dev/sdb",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibdocker"]} -n lvvarlibdocker datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibdocker",
	"sudo sed -i '$a/dev/datavg/lvvarlibdocker    /var/lib/docker   ext4    defaults	0   2' /etc/fstab",
	"sudo mkdir -m755 /var/lib/docker",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibkubelet"]} -n lvvarlibkubelet datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibkubelet",
	"sudo mkdir -m755 /var/lib/kubelet",
	"sudo sed -i '$a/dev/datavg/lvvarlibkubelet    /var/lib/kubelet   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["optibmcfc"]} -n lvoptibmcfc datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvoptibmcfc",
	"sudo mkdir -m755 /opt/ibm/cfc",
	"sudo sed -i '$a/dev/datavg/lvoptibmcfc    /opt/ibm/cfc  ext4    defaults	0   2' /etc/fstab",
	"sudo sed -i '/deb /s/^#//' /etc/apt/sources.list.d/docker.list",
	"sudo apt update",
	# Wait for NFS server to exportfs
	"while ! nc -vz ${cidrhost(var.staticipblock, 1 + var.staticipblock_offset)} 2049; do sleep 30s; done",
	"sudo mount -a",
	"sudo apt -y install docker-ce=${var.docker_engine_version}*",
	"sudo sed -i '/deb /s/^/#/' /etc/apt/sources.list.d/docker.list",
	"sudo cp /repo/ICP/docker.rules /etc/audit/rules.d/",
	"sudo augenrules --load",
	"sudo service auditd restart",
	"sudo auditctl -l",
	"sudo sed -i '/GRUB_CMDLINE_LINUX=/s/\"/\"cgroup_enable=memory swapaccount=1/' /etc/default/grub",
	"sudo update-grub",
	"sudo cp /repo/ICP/daemon.json /etc/docker/",
	"sudo cp /repo/ICP/91-icp.conf /etc/sysctl.d/",
	"sudo sysctl -p /etc/sysctl.d/91-icp.conf",
	"sudo systemctl reload docker",
	"sudo apt update",
	"sudo apt -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' -y upgrade",
      	"sudo shutdown -r +1"
    ]
  }
}

##################################
### Create the Management VM
##################################

resource "vsphere_virtual_machine" "icpmanagement" {
  depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.management["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name      = "${format("${lower(var.instance_name)}x%02d", count.index + 1) }"
  num_cpus  = "${var.management["vcpu"]}"
  memory    = "${var.management["memory"]}"
  cpu_hot_add_enabled = "${var.hot_add_enabled}"
  memory_hot_add_enabled = "${var.hot_add_enabled}"

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
    label            = "${format("${lower(var.instance_name)}-management%02d_data.vmdk", count.index + 1) }"
    size             = "${var.management["data_disk_size"]}"
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
	"/tmp/terraform_scripts/add-private-ssh-key.sh \"${tls_private_key.ssh.private_key_pem}\" \"${var.ssh_user}\"",
	"sudo pvcreate /dev/sdb",
	"sudo vgcreate datavg /dev/sdb",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibdocker"]} -n lvvarlibdocker datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibdocker",
	"sudo sed -i '$a/dev/datavg/lvvarlibdocker    /var/lib/docker   ext4    defaults	0   2' /etc/fstab",
	"sudo mkdir -m755 /var/lib/docker",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibicp"]} -n lvvarlibicp datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibicp",
	"sudo mkdir -m755 /var/lib/icp",
	"sudo sed -i '$a/dev/datavg/lvvarlibicp    /var/lib/icp   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibicplogging"]} -n lvvarlibicplogging datavg",
        "sudo mke2fs -t ext4 /dev/datavg/lvvarlibicplogging",
        "sudo mkdir -m755 /var/lib/icp/logging",
        "sudo sed -i '$a/dev/datavg/lvvarlibicplogging    /var/lib/icp/logging   ext4    defaults      0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibkubelet"]} -n lvvarlibkubelet datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibkubelet",
	"sudo mkdir -m755 /var/lib/kubelet",
	"sudo sed -i '$a/dev/datavg/lvvarlibkubelet    /var/lib/kubelet   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["optibmcfc"]} -n lvoptibmcfc datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvoptibmcfc",
	"sudo mkdir -m755 /opt/ibm/cfc",
	"sudo sed -i '$a/dev/datavg/lvoptibmcfc    /opt/ibm/cfc  ext4    defaults	0   2' /etc/fstab",
	"sudo sed -i '/deb /s/^#//' /etc/apt/sources.list.d/docker.list",
	"sudo apt update",
	# Wait for NFS server to exportfs
	"while ! nc -vz ${cidrhost(var.staticipblock, 1 + var.staticipblock_offset)} 2049; do sleep 30s; done",
	"sudo mount -a",
	"sudo apt -y install docker-ce=${var.docker_engine_version}*",
	"sudo sed -i '/deb /s/^/#/' /etc/apt/sources.list.d/docker.list",
	"sudo cp /repo/ICP/docker.rules /etc/audit/rules.d/",
	"sudo augenrules --load",
	"sudo service auditd restart",
	"sudo auditctl -l",
	"sudo sed -i '/GRUB_CMDLINE_LINUX=/s/\"/\"cgroup_enable=memory swapaccount=1/' /etc/default/grub",
	"sudo update-grub",
	"sudo cp /repo/ICP/daemon.json /etc/docker/",
	"sudo cp /repo/ICP/91-icp.conf /etc/sysctl.d/",
	"sudo sysctl -p /etc/sysctl.d/91-icp.conf",
	"sudo systemctl reload docker",
	"sudo apt update",
	"sudo apt -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' -y upgrade",
      	"sudo shutdown -r +1"
    ]
  }
}

##################################
### Create the VA VM
##################################

resource "vsphere_virtual_machine" "icpva" {
  depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.va["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name      = "${format("${lower(var.instance_name)}va%02d", count.index + 1) }"
  num_cpus  = "${var.va["vcpu"]}"
  memory    = "${var.va["memory"]}"
  cpu_hot_add_enabled = "${var.hot_add_enabled}"
  memory_hot_add_enabled = "${var.hot_add_enabled}"

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
    label            = "${format("${lower(var.instance_name)}-va%02d_data.vmdk", count.index + 1) }"
    size             = "${var.va["data_disk_size"]}"
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
	"/tmp/terraform_scripts/add-private-ssh-key.sh \"${tls_private_key.ssh.private_key_pem}\" \"${var.ssh_user}\"",
	"sudo pvcreate /dev/sdb",
	"sudo vgcreate datavg /dev/sdb",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlogcloudsight"]} -n lvvarlogcloudsight datavg",
        "sudo mke2fs -t ext4 /dev/datavg/lvvarlogcloudsight",
        "sudo sed -i '$a/dev/datavg/lvvarlogcloudsight    /var/log/cloudsight   ext4    defaults        0   2' /etc/fstab",
        "sudo mkdir -m755 /var/log/cloudsight",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibdocker"]} -n lvvarlibdocker datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibdocker",
	"sudo sed -i '$a/dev/datavg/lvvarlibdocker    /var/lib/docker   ext4    defaults	0   2' /etc/fstab",
	"sudo mkdir -m755 /var/lib/docker",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["vavarlibicp"]} -n lvvarlibicp datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibicp",
	"sudo mkdir -m755 /var/lib/icp",
	"sudo sed -i '$a/dev/datavg/lvvarlibicp    /var/lib/icp   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["vavarlibkubelet"]} -n lvvarlibkubelet datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibkubelet",
	"sudo mkdir -m755 /var/lib/kubelet",
	"sudo sed -i '$a/dev/datavg/lvvarlibkubelet    /var/lib/kubelet   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["optibmcfc"]} -n lvoptibmcfc datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvoptibmcfc",
	"sudo mkdir -m755 /opt/ibm/cfc",
	"sudo sed -i '$a/dev/datavg/lvoptibmcfc    /opt/ibm/cfc  ext4    defaults	0   2' /etc/fstab",
	"sudo sed -i '/deb /s/^#//' /etc/apt/sources.list.d/docker.list",
	"sudo apt update",
	# Wait for NFS server to exportfs
	"while ! nc -vz ${cidrhost(var.staticipblock, 1 + var.staticipblock_offset)} 2049; do sleep 30s; done",
	"sudo mount -a",
	"sudo apt -y install docker-ce=${var.docker_engine_version}*",
	"sudo sed -i '/deb /s/^/#/' /etc/apt/sources.list.d/docker.list",
	"sudo cp /repo/ICP/docker.rules /etc/audit/rules.d/",
	"sudo augenrules --load",
	"sudo service auditd restart",
	"sudo auditctl -l",
	"sudo sed -i '/GRUB_CMDLINE_LINUX=/s/\"/\"cgroup_enable=memory swapaccount=1/' /etc/default/grub",
	"sudo update-grub",
	"sudo cp /repo/ICP/daemon.json /etc/docker/",
	"sudo cp /repo/ICP/91-icp.conf /etc/sysctl.d/",
	"sudo sysctl -p /etc/sysctl.d/91-icp.conf",
	"sudo systemctl reload docker",
	"sudo apt update",
	"sudo apt -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' -y upgrade",
      	"sudo shutdown -r +1"
    ]
  }
}

##################################
### Create the Worker VMs
##################################
resource "vsphere_virtual_machine" "icpworker" {
  depends_on = ["vsphere_folder.icpenv"]
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.worker["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name     = "${format("${lower(var.instance_name)}n%02d", count.index + 1) }"
  num_cpus = "${var.worker["vcpu"]}"
  memory   = "${var.worker["memory"]}"
  cpu_hot_add_enabled = "${var.hot_add_enabled}"
  memory_hot_add_enabled = "${var.hot_add_enabled}"


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
    label            = "${format("${lower(var.instance_name)}-worker%02d_data.vmdk", count.index + 1) }"
    size             = "${var.worker["data_disk_size"]}"
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
	"/tmp/terraform_scripts/add-private-ssh-key.sh \"${tls_private_key.ssh.private_key_pem}\" \"${var.ssh_user}\"",
	"sudo pvcreate /dev/sdb",
	"sudo vgcreate datavg /dev/sdb",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibdocker"]} -n lvvarlibdocker datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibdocker",
	"sudo sed -i '$a/dev/datavg/lvvarlibdocker    /var/lib/docker   ext4    defaults	0   2' /etc/fstab",
	"sudo mkdir -m755 /var/lib/docker",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["varlibkubelet"]} -n lvvarlibkubelet datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvvarlibkubelet",
	"sudo mkdir -m755 /var/lib/kubelet",
	"sudo sed -i '$a/dev/datavg/lvvarlibkubelet    /var/lib/kubelet   ext4    defaults	0   2' /etc/fstab",
	"sudo lvcreate -L ${var.icp_filesystem_sizes["optibmcfc"]} -n lvoptibmcfc datavg",
	"sudo mke2fs -t ext4 /dev/datavg/lvoptibmcfc",
	"sudo mkdir -m755 /opt/ibm/cfc",
	"sudo sed -i '$a/dev/datavg/lvoptibmcfc    /opt/ibm/cfc  ext4    defaults	0   2' /etc/fstab",
	"sudo sed -i '/deb /s/^#//' /etc/apt/sources.list.d/docker.list",
	"sudo mount -a",
	# Wait for NFS server to exportfs
	"while ! nc -vz ${cidrhost(var.staticipblock, 1 + var.staticipblock_offset)} 2049; do sleep 30s; done",
	"sudo apt update",
	"sudo apt -y install docker-ce=${var.docker_engine_version}*",
	"sudo sed -i '/deb /s/^/#/' /etc/apt/sources.list.d/docker.list",
	"sudo cp /repo/ICP/docker.rules /etc/audit/rules.d/",
	"sudo augenrules --load",
	"sudo service auditd restart",
	"sudo auditctl -l",
	"sudo sed -i '/GRUB_CMDLINE_LINUX=/s/\"/\"cgroup_enable=memory swapaccount=1/' /etc/default/grub",
	"sudo update-grub",
	"sudo cp /repo/ICP/daemon.json /etc/docker/",
	"sudo cp /repo/ICP/91-icp.conf /etc/sysctl.d/",
	"sudo sysctl -p /etc/sysctl.d/91-icp.conf",
	"sudo systemctl reload docker",
	"sudo apt update",
	"sudo apt -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' -y upgrade",
      	"sudo shutdown -r +1"
    ]
  }
}
