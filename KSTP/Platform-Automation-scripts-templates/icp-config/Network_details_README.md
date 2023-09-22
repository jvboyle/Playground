# Terraform ICP Variable Files Configuration

Production ICP Configurations Files.

## Usage
The purpose of this directory is to hold the reusable variable files for each instance we need.

## Configuration walkthrough: key things to note.
A view of an iPAM spreadheet...
![alt text](https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/blob/master/icp-config/iPAM%20ICP%20walkthrough.png)

For each .tfvar file.. the following variables are associated with information in the iPAM.
1. The value in the network_label comes from here:
network_label = "vxw-dvs-78-virtualwire-3-sid-5003-ag1-gres-app-internal1"

1. The Block of IP addresses reserved looks like this.
_Network_

 * KEY! the variable `staticipblock` references the subnet that can be found in #1. For example  = "100.64.69.0/24"
  YOU MUST set `staticipblock` to this value.

1. The ICP NFS Server always is the first to be deployed.....

1. This is the total number of IP addresses reserved.. yellow block.

  * KEY the value of `staticipblock_offset` is 1 minus the IP address you want to use for the NFS Server.
  * In the the example above, it's `staticipblock_offset = 9` because you want the NFS server to start at .10

1. This is the gateway for the segment....
gateway = "100.64.69.1"

NOTE!!! `netmask` needs to equal the value after the `\` in the `staticipblock`.
e.g. `netmask = "24"` per `staticipblock = "100.64.69.0/24"`

1. This is/are the DNS servers for the region.
dns_servers = [ "158.87.48.2" ]

1. This is the Cluster IP Address... exposes the API Server
cluster_vip = "100.64.69.8"
cluster_vip_iface = "ens160"

1. This is the Proxy VIP.. where Ingress's listen
proxy_vip = "100.64.69.9"
proxy_vip_iface = "ens192"

1. This is the instance name of the cluster... This is used in 2 ways:
  * as a prefix for the VMs: e.g. `instance_name = "ag1pdr1icp1"`
  * as the name of the cluster that ICP is configured with: e.g. `cluster_name = "ag1pdr1icp1"`

1. This is the NFS server used during install AND to hold images and audit logs
The IP address used needs to match the IP address you have planned above
image_location = "nfs:158.87.50.73:/storage/icp/3.1/ibm-cloud-private-x86_64-3.1.1.tar.gz"
registry_mount_src = "158.87.50.73:/storage/user1-icp-31/registry"
audit_mount_src = "158.87.50.73:/storage/user1-icp-31/audit"
