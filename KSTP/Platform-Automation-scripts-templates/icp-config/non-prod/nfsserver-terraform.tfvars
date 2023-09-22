#######################################
##### vSphere Access Credentials ######
#######################################
vsphere_server = "ag1vc01.poc.ispw.ibm.local"

##############################################
##### vSphere deployment specifications ######
##############################################
# Following resources must exist in vSphere
vsphere_datacenter = "WDC04"
vsphere_cluster = "WDC04-PoC-CL1"
# vsphere_resource_pool = "ICP31_pool/terraform_icp_31"
network_label = "vxw-dvs-31-virtualwire-5-sid-5005-sres-app-internal02"
datastore = "vsanDatastore"
#datastore_etcd = "vsanDatastore"
template = "icp31_30012019"
# Folder to provision the new VMs in, does not need to exist in vSphere
folder = "terraform_nfs"

##################################
##### ICP deployment details #####
##################################

##### ICP instance name #####
# MUST consist of only lower case alphanumeric characters and '-'
instance_name = "poctestterraicp1"

##### Network #####
staticipblock = "158.87.63.83/27"
staticipblock_offset = 1
gateway = "158.87.63.65"
netmask = "27"
dns_servers = [ "158.87.63.3" ]

## Cluster access
#cluster_vip = "158.87.63.94"
# cluster_vip_iface = "ens160"
# proxy_vip = "158.87.63.95"
# proxy_vip_iface = "ens160"

# Calico settings
# calico_ipip_enabled = "false"
# and for consistency need to use the standard pod and cluster ranges we are using eleswhere:
# Network in IPv4 CIDR format
network_cidr =  "100.127.0.0/17"

# Kubernetes service IP range
#service_cluster_ip_range = "100.127.128.0/24"

##### Local Terraform connectivity details #####
#### THESE WILL NEED TO BE PULLED FROM environment Variables ######
ssh_user = "ispwadmin"
ssh_password = "FriNov30!=FriNov30!="


##### ICP admin user password #####
# Non default admin user password 'admin' recommended
#icppassword = "SuperPa88w0rd"

##### NFS Cluster Components #####
nfs-server = {
    nodes = "1"
    vcpu = "2"
    memory = "8192"
    disk_size1 = "250"
    disk_size2 = "200"
    thin_provisioned = "true"
    thin_provisioned_etcd = "false"
}


##### NFS Server #####
registry_mount_src = "158.87.63.12:/storage/user1-icp-31/registry"
audit_mount_src = "158.87.63.12:/storage/user1-icp-31/audit"
