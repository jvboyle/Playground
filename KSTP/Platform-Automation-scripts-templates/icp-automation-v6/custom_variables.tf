
variable "icpversion" {
	description = "IBM Cloud Private Version"
	default = "3.1.1"
}

variable "site" {
	description = "Datacenter Location(AG1, EU1, etc)"
	default = ""
}

variable "env_type" {
	description = "Environment type(prod, nonProd, etc"
	default  = ""
}

variable "docker_engine_version" {
  description = "Docker CE Engine version to be installed by the repositories"
  default     = "5:18.09.7"
}

variable "icp_filesystem_sizes" {
	description = "ICP filesystem default sizes"
	type = "map"
	default = {
		"varlibdocker" 		= "100G"
		"varlibetcd" 		= "10G"
		"varlibicp" 		= "100G"
		"varlibicplogging"	= "50g"
		"varlibmysql"		= "10G"
		"varlibkubelet"		= "20G"
		"varlibetcdwal"		= "5G"
		"optibmcfc"		= "2G"
		"vavarlibkubelet"   = "100G"
        	"vavarlibicp"       = "80G"
        	"varlogcloudsight"       = "10G" #va
	}
}

variable "offline_pkg_copy_path" {
	description = "The directory to hold the temporary installation files during offline installation."
	default = "/data/tmp"
}

variable "nfs_image_path" {
	description = "The directory holding installation image"
	default = "/data/images"
}


variable "nfs" {
  type = "map"

  default = {
    nodes  = "0"
    vcpu   = "4"
    memory = "4096"

    disk_size           = ""      # Specify size or leave empty to use same size as template.
    data_disk_size    	= "200"     # Specify size for data disk, default 100.
    thin_provisioned    = "true"      # True or false. Whether to use thin provisioning on the disk. Leave blank to use same as template
    eagerly_scrub       = ""      # True or false. If set to true disk space is zeroed out on VM creation. Leave blank to use same as template
    keep_disk_on_remove = "false" # Set to 'true' to not delete a disk on removal.

    start_iprange = "" # Leave blank for DHCP, else workers will be allocated range starting from this address
  }
}

variable "master" {
  type = "map"

  default = {
    nodes  = "0"
    vcpu   = "8"
    memory = "16384"

    disk_size             = ""      # Specify size or leave empty to use same size as template.
    data_disk_size        = "300"   # Specify size for data disk, default 100.
    thin_provisioned      = "true"      # True or false. Whether to use thin provisioning on the disk. Leave blank to use same as template
    eagerly_scrub         = ""      # True or false. If set to true disk space is zeroed out on VM creation. Leave blank to use same as template
    keep_disk_on_remove   = "false" # Set to 'true' to not delete a disk on removal.

    start_iprange = "" # Leave blank for DHCP, else masters will be allocated range starting from this address
  }
}


variable "proxy" {
  type = "map"

  default = {
    nodes  = "0"
    vcpu   = "2"
    memory = "4096"

    disk_size           = ""      # Specify size or leave empty to use same size as template.
    data_disk_size    	= "150"   # Specify size for data disk, default 100.
    thin_provisioned    = "true"      # True or false. Whether to use thin provisioning on the disk. Leave blank to use same as template
    eagerly_scrub       = ""      # True or false. If set to true disk space is zeroed out on VM creation. Leave blank to use same as template
    keep_disk_on_remove = "false" # Set to 'true' to not delete a disk on removal.

    start_iprange = "" # Leave blank for DHCP, else proxies will be allocated range starting from this address
  }
}


variable "management" {
  type = "map"

  default = {
    nodes  = "0"
    vcpu   = "8"
    memory = "16384"

    disk_size           = ""      # Specify size or leave empty to use same size as template.
    data_disk_size    	= "300"   # Specify size for data disk, default 100.
    thin_provisioned    = "true"      # True or false. Whether to use thin provisioning on the disk. Leave blank to use same as template
    eagerly_scrub       = ""      # True or false. If set to true disk space is zeroed out on VM creation. Leave blank to use same as template
    keep_disk_on_remove = "false" # Set to 'true' to not delete a disk on removal.

    start_iprange = "" # Leave blank for DHCP, else workers will be allocated range starting from this address
  }
}

variable "worker" {
  type = "map"

  default = {
    nodes  = "0"
    vcpu   = "4"
    memory = "16384"

    disk_size           = ""      # Specify size or leave empty to use same size as template.
    data_disk_size    	= "150"   # Specify size for docker disk, default 100.
    thin_provisioned    = "true"      # True or false. Whether to use thin provisioning on the disk. Leave blank to use same as template
    eagerly_scrub       = ""      # True or false. If set to true disk space is zeroed out on VM creation. Leave blank to use same as template
    keep_disk_on_remove = "false" # Set to 'true' to not delete a disk on removal.

    start_iprange = "" # Leave blank for DHCP, else workers will be allocated range starting from this address
  }
}

variable "va" {
  type = "map"

  default = {
    nodes  = "0"
    vcpu   = "8"
    memory = "16384"

    disk_size           = ""      # Specify size or leave empty to use same size as template.
    data_disk_size    	= "350"   # Specify size for data disk, default 100.
    thin_provisioned    = "true"      # True or false. Whether to use thin provisioning on the disk. Leave blank to use same as template
    eagerly_scrub       = ""      # True or false. If set to true disk space is zeroed out on VM creation. Leave blank to use same as template
    keep_disk_on_remove = "false" # Set to 'true' to not delete a disk on removal.

    start_iprange = "" # Leave blank for DHCP, else workers will be allocated range starting from this address
  }
}


variable "object_url" {
	default = "https://s3.us-east.cloud-object-storage.appdomain.cloud"
}

variable "object_access_key" {
	default = "13e328623cf00e258798773cbeee6b51f2eed4f7b7aca9dc"
}

variable "object_key_id" {
	default = "b196ca4b0de84b33b5dc339ec14473c8"
}

variable "hot_add_enabled" {
	description = "Hot add defaults for CPU/Mem"
	default = "1"
}

locals {
	image_filename = "ibm-cloud-private-x86_64-${var.icpversion}.tar.gz"
	objectstoragelocation_image = "platform-deployment-support/${local.image_filename}"
	tillerproxy = "${ var.site == "EU1" ? "eu1pdr1prx.pdr1.eu1.sp.ibm.local:8080" : "ag1pdr1prx.pdr1.ag1.sp.ibm.local:8080" }"
	cluster_name = "${var.instance_name}"
	cluster_CA_domain = "${var.instance_name}.${var.domain}"
}
