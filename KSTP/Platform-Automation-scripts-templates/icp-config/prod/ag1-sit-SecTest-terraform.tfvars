#### SEGMENT SPECIFIC ####
# Folder to provision the new VMs in, does not need to exist in vSphere
folder = "/Compute/SIT-ICP3.1"
network_label = "vxw-dvs-78-virtualwire-3-sid-5003-ag1-gres-app-internal1"

##### Network #####
staticipblock = "158.87.50.0/24"
staticipblock_offset = 39
gateway = "158.87.50.1"
netmask = "24"
dns_servers = [ "158.87.48.2" ]

## Cluster access
cluster_vip = "158.87.50.38"
cluster_vip_iface = "ens192"
proxy_vip = "158.87.50.39"
proxy_vip_iface = "ens192"

# Calico settings
calico_ipip_enabled = "false"
# and for consistency need to use the standard pod and cluster ranges we are using eleswhere:
# Network in IPv4 CIDR format
network_cidr =  "100.127.0.0/17"

# Kubernetes service IP range
service_cluster_ip_range = "100.127.128.0/24"

#################################################################
#### ICP INSTANCE SPECIFIC ####
##################################
##### ICP instance name #####
# MUST consist of only lower case alphanumeric characters and '-'
instance_name = "ag1gr1icp2"

##### ICP installation method #####
objectstorage_image = "ibm-cloud-private-x86_64-3.1.1.tar.gz"
icp_inception_image = "ibmcom/icp-inception:3.1.1-ee"
image_location = "nfs:158.87.63.12:/storage/icp/3.1/ibm-cloud-private-x86_64-3.1.1.tar.gz"

##### NFS Server #####
registry_mount_src = "158.87.63.12:/storage/user1-icp-31/registry"
audit_mount_src = "158.87.63.12:/storage/user1-icp-31/audit"

#################################################################
#####Constants for all ICP Instances
##### Local Terraform connectivity details #####
ssh_user = "ispwadmin"
