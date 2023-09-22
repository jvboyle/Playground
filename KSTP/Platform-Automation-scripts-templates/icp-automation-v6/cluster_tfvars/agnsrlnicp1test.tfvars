#############
## Vsphere
#############
# Default vm folder cluster will be created is /Terraform/instance_name
site = "AG1" # Value can be either AG1 or EU1

vsphere_server = "ag1vc1.ag1.sp.ibm.local" #  Vcenter hostname or IP
vsphere_datacenter = "AG1-WDC04" # Datacenter name
vsphere_cluster = "AG1-N1" # ESX cluster to use
datastore = "ag1-n1-vsan" # Datastore to use
network_label = "vxw-dvs-25019-virtualwire-5-sid-5005-ag1-sres1-app-internal1" # Logical Switch (find the name from the corresponding cluster)
staticipblock = "158.87.48.0/23" # Network address/Mask
staticipblock_offset = 161 # Cluster IP will be offset -1, Proxy VIP will be equal to Offset, NFS IP will be Offset +1
gateway = "158.87.48.1" # Network gateway
netmask = "23" # Network mask
dns_servers = [ "158.87.48.2","158.87.48.3" ]
############
## ICP
############
icpversion = "3.1.1" # Tested for 3.1.1 & 3.1.2
instance_name = "agnsrlnicp1test"
domain = "sr1.ag1.sp.ibm.local"
# uncomment below to disable vulnerability-advisor
disabled_management_services = [ "istio", "vulnerability-advisor", "storage-glusterfs", "storage-minio", "nvidia-device-plugin", "multicluster-hub" , "multicluster-endpoint" ]

nfs = {
    nodes = "1"
    vcpu = "2"
    memory = "4096"
}
master = {
    nodes = "3"
    vcpu = "6"
    memory = "8192"
}
proxy = {
    nodes = "2"
    vcpu = "2"
    memory = "4096"
}
worker = {
    nodes = "3"
    vcpu = "4"
    memory = "8192"
}
# nodes with 'x' on them.
management = {
    nodes = "3"
    vcpu = "6"
    memory = "16384"
}
va = {
    nodes = "0"
    vcpu = "4"
    memory = "16384"
}


# vsphere_server
# allow_unverified_ssl
# vsphere_datacenter
# vsphere_cluster
# vsphere_resource_pool
# network_label
# datastore
# datastore_etcd
# template
# folder
# instance_name
# domain
# staticipblock
# staticipblock_offset
# gateway
# netmask
# dns_servers
# cluster_vip
# proxy_vip
# cluster_lb_address
# proxy_lb_address
# cluster_vip_iface
# proxy_vip_iface
# master
# proxy
# worker
# management
# va
# docker_package_location
# image_location
# private_registry
# registry_username
# registry_password
# registry_mount_src
# registry_mount_type
# registry_mount_options
# audit_mount_src
# audit_mount_type
# audit_mount_options
# icppassword
# ssh_user
# ssh_password
# ssh_keyfile
# icp_inception_image
# network_cidr
# service_network_cidr
# parallel_image_pull
# disabled_management_services
