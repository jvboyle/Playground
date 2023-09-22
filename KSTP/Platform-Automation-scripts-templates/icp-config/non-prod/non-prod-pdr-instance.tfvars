#### SEGMENT SPECIFIC ####

#################################################################
#### ICP INSTANCE SPECIFIC ####
##### ICP instance name #####

# Folder to provision the new VMs in, does not need to exist in vSphere
folder = "PDR_ICP"
domain = "pdr1.poc.ispw.ibm.local"

##### ICP instance name #####
# MUST consist of only lower case alphanumeric characters and '-'
instance_name = "ag1pdr1icp"
cluster_name = "pocpdr1icp1"
cluster_CA_domain = "pocpdr1icp1.pdr1.poc.ispw.ibm.local"

##### Local Terraform connectivity details #####
# ssh_user = "icpenable"
# ssh_password = "w5z534XYMjotyBvn"

##### ICP installation method #####
icp_inception_image = "ibmcom/icp-inception-amd64:3.1.0-ee"
image_location = "nfs:100.120.35.19:/storage/icp/3.1/ibm-cloud-private-x86_64-3.1.0.tar.gz"
# private_registry    = "registry.example.com"
# registry_username   = "myUsername"
# registry_password   = "myPassword"

##### ICP admin user password #####
# Non default admin user password 'admin' recommended
# icppassword = "SuperPa88w0rd"

##### NFS Server #####
registry_mount_src = "100.120.35.19:/storage/user1-icp-31/registry"
audit_mount_src = "100.120.35.19:/storage/user1-icp-31/audit"

##### Network #####
staticipblock = "100.120.35.0/25"
staticipblock_offset = 18
gateway = "100.120.35.1"
netmask = "25"
dns_servers = [ "158.87.63.3" ]

# Cluster access
cluster_vip = "100.120.35.17"
cluster_vip_iface = "ens192"
proxy_vip = "100.120.35.18"
proxy_vip_iface = "ens192"

# Calico settings
calico_ipip_enabled = "false"
# and for consistency need to use the standard pod and cluster ranges we are using eleswhere:
# Network in IPv4 CIDR format
network_cidr =  "100.127.0.0/17"

# Kubernetes service IP range
service_network_cidr = "100.127.128.0/24"
