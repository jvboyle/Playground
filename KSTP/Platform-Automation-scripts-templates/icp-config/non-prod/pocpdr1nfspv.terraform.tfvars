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
network_label = "vxw-dvs-31-virtualwire-157-sid-5023-pdr-app-internal01"
datastore = "vsanDatastore"
template = "icp31_30012019"
# Folder to provision the new VMs in, does not need to exist in vSphere
folder = "PDR_ICP/nfspv"


##### Instance name used for VM naming and domain name #####
instance_name = "ag1pdr1icp"
domain = "pdr1.poc.ispw.ibm.local"

##### Network #####
staticipblock = "100.120.35.0/25"
staticipblock_offset = 33
gateway = "100.120.35.1"
netmask = "25"
dns_servers = [ "158.87.63.3" ]

##### Local Terraform connectivity details #####
#### THESE WILL NEED TO BE PULLED FROM environment Variables ######
ssh_user = "icpenable"
ssh_password = "w5z534XYMjotyBvn"

##### NFS Cluster Components #####
nfs-server = {
    nodes = "1"
    vcpu = "2"
    memory = "8192"
    disk_size2 = "100"
    thin_provisioned = "true"
}

