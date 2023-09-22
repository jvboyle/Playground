
#####  DRAFT NEEDS UPDATING #########

#### SEGMENT SPECIFIC ####
# Folder to provision the new VMs in, does not need to exist in vSphere
folder = "/Compute/SRES-ICP3.1"
network_label = "vxw-dvs-78-virtualwire-5-sid-5005-ag1-sres1-app-internal1"


##### Network #####
staticipblock = "158.87.48.0/23"
staticipblock_offset = 44
gateway = "158.87.48.1"
netmask = "23"
dns_servers = [ "158.87.48.2" ]

## Cluster access
cluster_vip = "158.87.48.43"
cluster_vip_iface = "ens192"
proxy_vip = "158.87.48.44"
proxy_vip_iface = "ens192"

### GZ REVIEW: Are these next 3 items the same for ALL deployments?????
# Calico settings
calico_ipip_enabled = "false"
# and for consistency need to use the standard pod and cluster ranges we are using eleswhere:
# Network in IPv4 CIDR format
network_cidr =  "100.127.0.0/17"
# Kubernetes service IP range
service_cluster_ip_range = "100.127.128.0/24"

#################################################################
#### ICP INSTANCE SPECIFIC ####
##### ICP instance name #####
# MUST consist of only lower case alphanumeric characters and '-'
# Instance name and domain drive the naming of the VMs
instance_name = "npasr1icp1"
domain = "sr1.ag1.sp.ibm.local"

# Cluster_name and Cluster_CA_domain are used in the configuration of ICP
cluster_name = "npasr1icp1"
cluster_CA_domain = "npasr1icp1.sr1.ag1.sp.ibm.local"

##  Usage : dockerproxy = "Environment=\"HTTP_PROXY=http://http://<instancename><domain>:8080/\" \"HTTPS_PROXY=http://ag1pdr1prx.pdr1.ag1.sp.ibm.loca:8080/\" \"NO_PROXY=localhost,127.0.0.1,<CLUSTER PROXY VIP>,< Cluster_CA_domain>l:8500\""
dockerproxy = "Environment=\"HTTP_PROXY=http://ag1pdr1prx.pdr1.ag1.sp.ibm.local:8080/\" \"HTTPS_PROXY=http://ag1pdr1prx.pdr1.ag1.sp.ibm.local:8080/\" \"NO_PROXY=localhost,127.0.0.1,158.87.48.43,ag1sr1icp2.sr1.ag1.sp.ibm.local:8500\""

##### ICP installation method #####
icp_inception_image = "ibmcom/icp-inception-amd64:3.1.1-ee"
image_location = "nfs:158.87.48.45:/storage/icp/3.1/ibm-cloud-private-x86_64-3.1.1.tar.gz"

##### NFS Server #####
registry_mount_src = "158.87.48.45:/storage/user1-icp-31/registry"
audit_mount_src = "158.87.48.45:/storage/user1-icp-31/audit"

#################################################################
#####Constants for all ICP Instances
##### Local Terraform connectivity details #####
ssh_user = "icpenable"
