#### SEGMENT SPECIFIC ####
# Folder to provision the new VMs in, does not need to exist in vSphere
folder = "/Compute/SRES-ICP3.1"
network_label = "vxw-dvs-70-virtualwire-3-sid-7003-eu1-sres1-app-internal1"

##################################
##### ICP deployment details #####
##################################

##### ICP instance name #####
# MUST consist of only lower case alphanumeric characters and '-'
instance_name = "eu1sr1icp1"

### GZ REVIEW:  Are these 2 needed?
cluster_name = "eu1sr1icp1"
cluster_CA_domain = "eu1sr1icp1.sres01.poc.ispw.ibm.local"

dockerproxy = "Environment=\"HTTP_PROXY=http://eu1pdr1prx.pdr1.eu1.ispw.ibm.local:8080/\" \"HTTPS_PROXY=http://eu1pdr1prx.pdr1.eu1.ispw.ibm.local:8080/\" \"NO_PROXY=localhost,127.0.0.1,158.87.63.93,poctestterraicp1.sres03.poc.ispw.ibm.local:8500\""

##### Network #####
staticipblock = "158.87.52.0/23"
staticipblock_offset = 121
gateway = "158.87.52.1"
netmask = "23"
dns_servers = [ "158.87.52.2,158.87.52.3" ]

# Cluster access
cluster_vip = "158.87.52.120"
cluster_vip_iface = "ens192"
proxy_vip = "158.87.52.121"
proxy_vip_iface = "ens192"

### GZ REVIEW: Are these next 3 items the same for ALL deployments?????
# Calico settings
calico_ipip_enabled = "false"
# and for consistency need to use the standard pod and cluster ranges we are using eleswhere:
# Network in IPv4 CIDR format
network_cidr =  "100.127.0.0/17"
# Kubernetes service IP range
service_network_cidr = "100.127.128.0/24"

##### Local Terraform connectivity details #####
ssh_user = "icpenable"

### GZ REVIEW: We should parameterize the NFS Server IP Address
##### ICP installation method #####
objectstorage_image = "ibm-cloud-private-x86_64-3.1.1.tar.gz"
icp_inception_image = "ibmcom/icp-inception-amd64:3.1.1-ee"
image_location = "nfs:158.87.52.122:/storage/icp/3.1/ibm-cloud-private-x86_64-3.1.1.tar.gz"

##### NFS Server #####
registry_mount_src = "158.87.52.122:/storage/user1-icp-31/registry"
audit_mount_src = "158.87.52.122:/storage/user1-icp-31/audit"
