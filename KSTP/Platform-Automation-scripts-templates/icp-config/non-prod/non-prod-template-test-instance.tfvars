#### SEGMENT SPECIFIC ####
# Folder to provision the new VMs in, does not need to exist in vSphere
folder = "terraform_icp1_31"
network_label = "vxw-dvs-31-virtualwire-5-sid-5005-sres-app-internal02"

### GZ REVIEW: Why don't these IP addresses align with the POC iPAM spreadsheet?
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

### GZ REVIEW: Are these next 3 items the same for ALL deployments?????
# Calico settings
calico_ipip_enabled = "false"
# and for consistency need to use the standard pod and cluster ranges we are using eleswhere:
# Network in IPv4 CIDR format
network_cidr =  "100.127.0.0/17"

# Kubernetes service IP range
service_network_cidr = "100.127.128.0/24"

#################################################################
#### ICP INSTANCE SPECIFIC ####
##### ICP instance name #####
# MUST consist of only lower case alphanumeric characters and '-'
instance_name = "poctestterraicp1"

### GZ REVIEW:  Are these 2 needed?
cluster_name = "poctestterraicp01"
cluster_CA_domain = "poctestterraicp01.sres01.poc.ispw.ibm.local"

##### Local Terraform connectivity details #####
ssh_user = "icpenable"

### GZ REVIEW: We should parameterize the NFS Server IP Address
##### ICP installation method #####
icp_inception_image = "ibmcom/icp-inception-amd64:3.1.1-ee"
image_location = "nfs:158.87.63.83:/storage/icp/3.1/ibm-cloud-private-x86_64-3.1.1.tar.gz"

##### NFS Server #####
registry_mount_src = "158.87.63.83:/storage/user1-icp-31/registry"
audit_mount_src = "158.87.63.83:/storage/user1-icp-31/audit"
