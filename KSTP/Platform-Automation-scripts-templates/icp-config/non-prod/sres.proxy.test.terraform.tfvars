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
folder = "terraform_icp1_31"
domain = "sres01.poc.ispw.ibm.local"

# Proxy Related information
httpproxy = "Acquire::http::proxy \"http://ag1pdr1prx.pdr1.poc.ispw.ibm.local:8080/\";"
httpsproxy = "Acquire::https::proxy \"http://ag1pdr1prx.pdr1.poc.ispw.ibm.local:8080/\";"
dockerproxy = "Environment=\"HTTP_PROXY=http://ag1pdr1prx.pdr1.poc.ispw.ibm.local:8080/\" \"HTTPS_PROXY=http://ag1pdr1prx.pdr1.poc.ispw.ibm.local:8080/\" \"NO_PROXY=localhost,127.0.0.1,158.87.63.93,poctestterraicp1.sres03.poc.ispw.ibm.local:8500\""
tillerproxy = "http://ag1pdr1prx.pdr1.poc.ispw.ibm.local:8080"
##################################
##### ICP deployment details #####
##################################

##### ICP instance name #####
# MUST consist of only lower case alphanumeric characters and '-'
instance_name = "poctestterraicp1"
cluster_name = "poctestterraicp01"
cluster_CA_domain = "poctestterraicp01.sres01.poc.ispw.ibm.local"


##### Network #####
staticipblock = "158.87.63.64/27"
staticipblock_offset = 18
gateway = "158.87.63.65"
netmask = "27"
dns_servers = [ "158.87.63.3" ]

# Cluster access
cluster_vip = "158.87.63.93"
cluster_vip_iface = "ens192"
proxy_vip = "158.87.63.94"
proxy_vip_iface = "ens192"

# Calico settings
calico_ipip_enabled = "false"
# and for consistency need to use the standard pod and cluster ranges we are using eleswhere:
# Network in IPv4 CIDR format
network_cidr =  "100.127.0.0/17"

# Kubernetes service IP range
service_network_cidr = "100.127.128.0/24"

##### Local Terraform connectivity details #####
ssh_user = "icpenable"
# ssh_password = "w5z534XYMjotyBvn"

##### ICP installation method #####
objectstorage_image = "ibm-cloud-private-x86_64-3.1.1.tar.gz"
icp_inception_image = "ibmcom/icp-inception-amd64:3.1.1-ee"
image_location = "nfs:158.87.63.83:/storage/icp/3.1/ibm-cloud-private-x86_64-3.1.1.tar.gz"
# private_registry    = "registry.example.com"
# registry_username   = "myUsername"
# registry_password   = "myPassword"

##### ICP admin user password #####
# Non default admin user password 'admin' recommended
# icppassword = "SuperPa88w0rd"

##### ICP Cluster Components #####
nfs = {
    nodes = "1"
    vcpu = "4"
    memory = "8192"
    thin_provisioned = "true"
}
master = {
    nodes = "3"
    vcpu = "8"
    memory = "16384"
    thin_provisioned = "true"
}
proxy = {
    nodes = "2"
    vcpu = "4"
    memory = "8192"
    thin_provisioned = "true"
}
worker = {
    nodes = "1"
    vcpu = "16"
    memory = "32768"
    thin_provisioned = "true"
}
management = {
    nodes = "2"
    vcpu = "4"
    memory = "16384"
    thin_provisioned = "true"
}
va = {
    nodes = "1"
    vcpu = "4"
    memory = "16384"
    thin_provisioned = "true"
}

##### NFS Server #####
registry_mount_src = "158.87.63.83:/storage/user1-icp-31/registry"
audit_mount_src = "158.87.63.83:/storage/user1-icp-31/audit"
