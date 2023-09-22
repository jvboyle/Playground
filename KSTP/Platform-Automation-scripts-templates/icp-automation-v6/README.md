# ICP cluster provisioning using Terraform

Configuration is used to provision and prepare nodes for an ICP v3 cluster using Terraform tool. Environment is operating using VMware products.
Currently this is tested and works for ICP 3.1.x & 3.2.x using Ubuntu 16.04.

## Directory and file structure 
- `scripts`: Holds the files to be copied and used in the newly provisioned virtual machines
- `size`: Holds the current standard sizes for ICP cluster nodes
- `cluster_tfvars`: Holds a sample file, to be copied and used for each new cluster

- `variables.tf`: Variables used through the provisioning lifetime
- `custom_variables.tf`: Additional variables
- `instances.tf`: Configuration for VMware vSphere provider
- `icp-deploy.tf`: Configuration for icpprovision module used to prepare and configure IBM Cloud Private
- `icp-config-3.1.2.yaml`: Defaults for v3.1.2
- `icp-config-3.2.1.yaml`: Defaults for v3.2.1

## User input using tfvars

Sample

```
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
icpversion = "3.1.1" # Tested for 3.1.x & 3.2.x
instance_name = "agnsrlnicp1test"
domain = "sr1.ag1.sp.ibm.local"
# uncomment below to disable vulnerability-advisor
# disabled_management_services = [ "istio", "vulnerability-advisor", "storage-glusterfs", "storage-minio"]

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

```


## How to run this

### Provisioning
1. Disable history logging in control node, using `unset HISTFILE` so you will not expose your credentials in history or in log files
2. Export environment variables `VSPHERE_USER` & `VSPHERE_PASSWORD`
3. Clean up directory from previous runs,
    `rm -rf .terraform/ .terraform.tfstate* privatekey.pem`
4. Initialize terraform, `terraform init`
5. Prepare your tfvars by copying `cluster_tfvars/sample.tfvars` to `cluster_tfvars/ICP_Instance_Name.tfvars` and make the necessary adjustments
6. Create the execution plan, `terraform plan -var-file=cluster_tfvars/ICP_Instance_Name.tfvars -var 'ssh_password=' -var 'icppassword=' -out=ICP_Instance_Name.out `
7. If everything looks fine after the execution plan, apply it. `terraform apply ICP_Instance_Name.out`

> Hint, in case you want to provide a standard cluster size, comment all the lines regarding cluster nodes in your `ICP_Instance_Name.tfvars` and in step 6 creation of the execution plan, provide an additional variable file, e.g `-var-file=size/small-size-cluster.tfvars`

### Destroying
1. To destroy the cluster, `terraform destroy -var-file=cluster_tfvars/ICP_Instance_Name.tfvars`

### Backup of tfvars
Once you have successfully provision a cluster, clean up using step 3 by Provisioning the directory and push the changes in the automation repository. Make sure you will at least upload the instance tfvars so it can be reused if something goes wrong with the cluster.


## Improvements

- [x] Provisioning of ICP cluster 
- [X] Remain compatible with any 3.1.x version
- [X] Test provisioning of 3.2.x version
- [x] Use of generic OS template
- [x] Using nfs for temporary files
- [ ] Provision of glusterfs nodes
- [ ] Post-provisiong tasks related to ICP to be added in the cycle
