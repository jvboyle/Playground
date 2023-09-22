locals {
    image          = "${length(var.private_registry) > 1 ? "${var.private_registry}/${local.icp_inception_image}" : "${local.icp_inception_image}"}"
    icp_pub_key    = "${tls_private_key.ssh.public_key_openssh}"
    icp_priv_key   = "${tls_private_key.ssh.private_key_pem}"
    ssh_user       = "${var.ssh_user}"
    ssh_key_base64 = "${base64encode(tls_private_key.ssh.private_key_pem)}"

    # This is just to have a long list of disabled items to use in icp-deploy.tf
    disabled_list = "${list("disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled","disabled")}"
    disabled_management_services = "${zipmap(var.disabled_management_services, slice(local.disabled_list, 0, length(var.disabled_management_services)))}"
}

##################################
### Deploy ICP to cluster
##################################
module "icpprovision" {
    source = "github.com/ibm-cloud-architecture/terraform-module-icp-deploy.git?ref=2.3.6"
#	source = "./icpprovision_module/custom-icpprovision.tf"

    # Provide IP addresses for master, proxy and workers
    boot-node = "${vsphere_virtual_machine.icpmaster.0.default_ip_address}"
    icp-host-groups = {
        master = ["${vsphere_virtual_machine.icpmaster.*.default_ip_address}"]
        proxy = ["${vsphere_virtual_machine.icpproxy.*.default_ip_address}"]
        worker = ["${vsphere_virtual_machine.icpworker.*.default_ip_address}"]
        // make the master nodes managements nodes if we don't have any specified
        management = "${slice(concat(vsphere_virtual_machine.icpmanagement.*.default_ip_address,
                                     vsphere_virtual_machine.icpmaster.*.default_ip_address),
                              0, var.management["nodes"] > 0 ? length(vsphere_virtual_machine.icpmanagement.*.default_ip_address) :  length(vsphere_virtual_machine.icpmaster.*.default_ip_address))}"
        va = ["${vsphere_virtual_machine.icpva.*.default_ip_address}"]
    }

    # Provide desired ICP version to provision
    icp-version = "${length(var.registry_username) > 1 ?  "${var.registry_username}:${var.registry_password}@${local.image}" : "${local.image}"}"
    image_location = "${local.image_location}"

    parallell-image-pull = "${var.parallel_image_pull}"

    /* Workaround for terraform issue #10857
     When this is fixed, we can work this out autmatically */
    cluster_size  = "${var.master["nodes"] +
        var.worker["nodes"] +
        var.proxy["nodes"] +
        var.management["nodes"] +
        var.va["nodes"]}"

    ###################################################################################################################################
    ## You can feed in arbitrary configuration items in the icp_configuration map.
    ## Available configuration items availble from https://www.ibm.com/support/knowledgecenter/SSBS6K_2.1.0.3/installing/config_yaml.html
    icp_config_file = "./icp-config-${var.icpversion}.yaml"
    icp_configuration = {
      "network_cidr"                    = "${var.network_cidr}"
      "service_cluster_ip_range"        = "${var.service_network_cidr}"
      "cluster_access_ip"               = "${local.cluster_vip}"
      "proxy_access_ip"                 = "${local.proxy_vip}"
      "cluster_vip"                     = "${local.cluster_vip}"
      "proxy_vip"                       = "${local.proxy_vip}"
      "vip_iface"                       = "${var.cluster_vip_iface}"
      "proxy_vip_iface"                 = "${var.proxy_vip_iface}"
      "cluster_lb_address"              = "${var.cluster_lb_address}"
      "proxy_lb_address"                = "${var.proxy_lb_address}"
      "vip_manager"                     = "keepalived"
      "cluster_name"                    = "${local.cluster_name}"
      "cluster_CA_domain"		= "${local.cluster_CA_domain}"
      "calico_ip_autodetection_method"  = "first-found"
      "default_admin_password"          = "${var.icppassword}"
      "tiller_http_proxy"		= "http://${local.tillerproxy}"
      "tiller_https_proxy"              = "https://${local.tillerproxy}"
      # This is the list of disabled management services
      "management_services"             = "${local.disabled_management_services}"
      "private_registry_enabled"        = "${length(var.private_registry) > 1 ? "true" : "false"}"
      "private_registry_server"         = "${var.private_registry}"
      "image_repo"                      = "${length(var.private_registry) > 1 ? "${dirname(local.image)}" : ""}"
      "docker_username"                 = "${var.registry_username}"
      "docker_password"                 = "${var.registry_password}"
      "offline_pkg_copy_path"		= "${var.offline_pkg_copy_path}"
    }

    # We will let terraform generate a new ssh keypair
    # for boot master to communicate with worker and proxy nodes
    # during ICP deployment
    generate_key    = false
    icp_pub_key     = "${local.icp_pub_key}"
    icp_priv_key    = "${local.icp_priv_key}"

    # SSH user and key for terraform to connect to newly created VMs
    # ssh_key is the private key corresponding to the public assumed to be included in the template
    ssh_user        = "${local.ssh_user}"
    ssh_key_base64  = "${local.ssh_key_base64}"
    ssh_agent       = false


    hooks = {
	"cluster-preconfig" = [
		"umask 022",
		"sudo mkdir -p ${var.offline_pkg_copy_path}",
		"sudo mount.nfs ${cidrhost(var.staticipblock, 1 + var.staticipblock_offset)}:${var.nfs_image_path}/tmp/$(uname -n) ${var.offline_pkg_copy_path}",
		"sudo chmod 1777 $(dirname ${var.offline_pkg_copy_path}) ${var.offline_pkg_copy_path}"
	]
    }


}
