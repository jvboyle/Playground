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

##################################
### Create the nfs-server VMs
##################################
resource "vsphere_virtual_machine" "nfs-server" {
  folder     = "${local.folder_path}"

  #####
  # VM Specifications
  ####
  count            = "${var.nfs-server["nodes"]}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  name     = "${format("${lower(var.instance_name)}pv%02d", count.index + 1) }"
#  name     = "${var.instance_name}"

  num_cpus = "${var.nfs-server["vcpu"]}"
  memory   = "${var.nfs-server["memory"]}"


  #####
  # Disk Specifications
  ####
  datastore_id  = "${data.vsphere_datastore.datastore.id}"
  guest_id      = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type     = "${data.vsphere_virtual_machine.template.scsi_type}"

  disk {
    label            = "${format("${lower(var.instance_name)}pv%02d-disk1.vmdk", count.index + 1) }"
    size             = "${var.nfs-server["disk_size1"]        != "" ? var.nfs-server["disk_size1"]        : data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${var.nfs-server["eagerly_scrub"]    != "" ? var.nfs-server["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.nfs-server["thin_provisioned"] != "" ? var.nfs-server["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.nfs-server["keep_disk_on_remove"]}"
    unit_number      = 0
  }

  disk {
    label            = "${format("${lower(var.instance_name)}pv%02d-disk2.vmdk", count.index + 1) }"
    size             = "${var.nfs-server["disk_size2"]       != "" ? var.nfs-server["disk_size2"]        : data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${var.nfs-server["eagerly_scrub"]    != "" ? var.nfs-server["eagerly_scrub"]    : data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${var.nfs-server["thin_provisioned"] != "" ? var.nfs-server["thin_provisioned"] : data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    keep_on_remove   = "${var.nfs-server["keep_disk_on_remove"]}"
    unit_number      = 1
  }

  ####
  # Network specifications
  ####
  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
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
      "sudo /tmp/terraform_scripts/create-lvm.sh",
      "/tmp/terraform_scripts/install-nfsserver.sh"
      ]
  }


  #####
  # VM Customizations
  ####
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${format("${lower(var.instance_name)}pv%02d", count.index + 1) }"
        domain    = "${var.domain != "" ? var.domain : format("%s.local", var.instance_name)}"
      }

      network_interface {
        ipv4_address  = "${var.staticipblock != "0.0.0.0/0" ? cidrhost(var.staticipblock, 1 + var.staticipblock_offset  + count.index) : ""}"
        ipv4_netmask  = "${var.netmask}"
      }

      ipv4_gateway    = "${var.gateway}"
      dns_server_list = "${var.dns_servers}"
    }
  }


}
