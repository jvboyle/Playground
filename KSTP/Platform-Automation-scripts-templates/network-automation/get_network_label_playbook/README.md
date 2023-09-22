# Automation:  Get_Network_Label Playbook

## Purpose

This playbook is used to get the `network_label` value required to execute the ICP Automation using Terraforms from vCenter.

The contents of this playbook are included as a role in the VM_Automations.

## Usage

`ansible-playbook  get_network_label.yml --extra-vars "region_type=<value> region=<value> segmentID=<value> target_cluster=<value>"`

Notes:
1. It is important to have the double quotes around all extra-vars.
1. In order to run this the following environment variables need to be set:
  `export vsphere_user=<username>`
  `export vsphere_password=<password>`

### Sample
`ansible-playbook  get_network_label.yml --extra-vars "region_type=non-prod region=ag1 segmentID=sr1 target_cluster=WDC04-PoC-CL1"`

## Input Parameters

| Parameter Name | Purpose | Sample Values |
| -------------- | ------- | ------------- |
| region_type | Identify non-prod or prod. Drives navigation to config files. | `non-prod` or `prod` |
| region | Drives navigation to config files. | `ag` or `eu1` |
| segmentID | This playbook requires a "network automation file" with important info. This parameter helps in the selection of that file in the set of config files | `sr1` or `dr##`  |
| target_cluster |  This is the name of the target vSPhere Compute Cluster to which network is associated with. | e.g. WDC04-PoC-CL1 |

## Output Parameter

The value of the network label is returned as part of the standard playbook output.  In order to capture this into a file or variable you can execute the command in the following manner from the Platform Automation Control Node. This will provide the value of the `network_label` in the outputfile.

`ansible-playbook  get_network_label.yml --extra-vars "region_type=non-prod region=ag1 segmentID=sr1 target_cluster=WDC04-PoC-CL1" | grep network_label.0 | awk '{print $2}' > /tmp/outputfile`
`cat /tmp/outputfile`
