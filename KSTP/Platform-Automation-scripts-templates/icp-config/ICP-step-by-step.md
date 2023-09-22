# Step by Step install and configure of IBM Cloud Private on the Platform Hosting Service

_Status: V1_

## Purpose:
The purpose of this document is to itemize the steps required to provision an instance of Platform Network Segment ( MicroSegmentation) and an instance of IBM Cloud Private (ICP) on the Network Segment.

## Pre-Requisites
- Ensure the proper ICP install Image is available to support ICP installation
  * This is done by either uploading an ICP 3.1.1 build image to the Platform Control Plane VM or an Object Storage bucket associated with the Platform Cloud ( SoftLayer ) account.
  ( NOTE: in this folder you will find the 2 different versions of the instances.tf file : https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/tree/master/icp-automation-v5/hold)
- Ensure that the hardened, compliant VM template (icp_30012019) has been loaded into vCenter in the region.

## Configure/Plan:
1. Reserve the Cluster VM IP addresses and ICP Cluster names
  * This includes the Cluster Master IP (where `kubectl` interacts with) and the Cluster Proxy VIP which is access to the Ingress Controller for the region.
  * IP Addresses are currently reserved in the `iPAM` spreadsheet for each Platform Region.
  * This is required for EACH instance of an ICP Cluster.
  This includes the cluster instance prefix. This is used in both the Terraform Template AND in setting up Security Groups and related Firewall Rules
2. Define the Firewall rules that will need to be configured in NSX to enable the nodes of an ICP Cluster to communicate.
  * Template spreadsheets can be found in this folder https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/tree/master/network-config/icp-fw-secgrp-config
3. Create/Setup the .tfvars file in git repo ( see below ) to support deployment of ICP to the appropriate region and segment.
  * This is required for EACH instance of an ICP Cluster.
  * The setup of an instance of this file requires the following sections to be properly configured:
    * 'Region' Information: VMWare config variables that are unique to each Region. These can be found HERE https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/tree/master/region-configs
    * 'Segment' Information: Network segment variables relative to the segment being deployed into.
    * 'ICP Instance' Information: ICP Instance specific variables.  The files are here: https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/blob/master/icp-config/
  (Non-Production configuration is here: https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/tree/master/icp-config/non-prod
  * Note that there is a _standard_ initial production node configuration here: https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/blob/master/icp-config/icp-cluster-small-node-config.tfvars

( An important "README" to help understand how to properly perform the configuration steps: https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/blob/master/icp-config/Network_details_README.md)

## Execute:
1. Request implementation the required Security Group and FW rules.
  * Current Process: The spreadsheet(s) defined in Step 2 above need to be submitted to the operations team via a Service Request.
  * Future Process: The values in the spreadsheet will be configured in an automation such that it can be performed without human interaction.
2. Update the Automation Git repo ( this repository ) on the Control Plane VM.
3. Setup Environment Variables required to execute Terraform Template.
These Environment variables are used to

   Access to vCenter

   `export VSPHERE_USER=<userid with access to vCenter>`

   `export VSPHERE_PASSWORD=<vCenter Password>`

4. Perform pre-deployment validation using the "PLAN" capability of terraforms

  It should be noted that key capability of Terraform is the ability to do a dry run, or planning stage, of a template before you run it. One of the reasons this is so important in our deployment of ICP Clusters is that it enables a check of the IP addresses to be used BEFORE the VMs are actually deployed to those IP addresses.
  Hence, this is a required step.

  `terraform plan -var ``ssh_password=<>`` -var ``icppassword=<>`` --var-file=<tfvars file specifying region variables> --var-file=<tfvars files specifying ICP instance variables> --var-file=<tfvars file specifying node config>`

  You may want to consider redirecting the standard output ( stdout ) of the above command to a file ( e.g. use `> filename`), then grep for '(hostname|ipv4_address)'. This will give you a quick list that looks like this where you can double check against the iPAM spreadsheet.

      clone.0.customize.0.linux_options.0.host_name:        "ag1sr1icp2x01"
      clone.0.customize.0.network_interface.0.ipv4_address: "158.87.48.51"


5. Execute the terraform template referencing the proper .tfvars file to drive the deployment of the ICP Cluster.
  * You must `cd` to `icp-automation-v5` on the Control Node VM before running the commands below.
    * _The production Terraform template for an HA ICP install is located in this Git directory:_ https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/tree/master/icp-automation-v5

  * (Note that the first time you run this you need to execute `terraform init` the first time you set this up to load in the Terraform VSphere Modules.)
  * Execute the terraform command to execute the template.

    `terraform apply -var ``ssh_password=<>`` -var ``icppassword=<>`` --var-file=<tfvars file specifying region variables> --var-file=<tfvars files specifying ICP instance variables> --var-file=<tfvars file specifying node config>   `

    For example:

    `terraform apply -var 'ssh_password=xxxxxxxx'  -var 'icppassword=xxxxxxxx' --var-file=../region-configs/non-prod/non-prod-region.tfvars --var-file=../icp-config/non-prod/non-prod-template-test-instance.tfvars --var-file=../icp-config/icp-cluster-small-node-config.tfvars`

    `terraform apply -var 'ssh_password=xxxxxxxx'  -var 'icppassword=xxxxxxxx' --var-file=../region-configs/prod/prod-ag-region.tfvars --var-file=../icp-config/prod/prodag-pdr-terraform.tfvars --var-file=../icp-config/icp-cluster-medium-node-config.tfvars`

    _NOTE this can take up to an hour to complete_

6. _If not already done_, install the latest `cloudctl` CLI on the jumpbox

  * This can be downloaded from an instance of ICP

7. Setup IBM Bluepages authentication in the cluster

  * Execute: `icp-cluster-config/icpscripts/ldapcertificateadd.sh`

8. Setup Platform Administrators on the ICP Cluster

  * Execute: `icp-cluster-config/icpscripts/w3entryteamibmadmin.sh`

  * This script also ensures that Platform Admins have access to admin namespaces

9. Update the Cluster Image security policy to allow download of images from approved registries.
   _Note... for the following you will need to log into the cluster you just provisioned using_ `cloudctl`
  * Execute: `kubectl create -f cluster-config-yamls/servicesplatform-repos.yaml`
  https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/blob/master/icp-cluster-post-provision-config/servicesplatform-repos.yaml
  * `kubectl create -f ibmcloud-default-cluster-image-policy.yaml`
  https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/blob/master/icp-cluster-post-provision-config/ibmcloud-default-cluster-image-policy.yaml

10. Deploy/config monitoring of the ICP Cluster
https://github.ibm.com/CtspArchitecture/Platform-Automation-scripts-templates/tree/master/monitoring-config

11. Perform Validation of the Cluster
   * Ensure that Monitoring via prometheus on Grafana dashboard is working.. verify with Felipe.
   * Ensure that VA is installed and working
