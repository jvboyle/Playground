# Deploy DRES

The following contains basic guidance on deploying an ISPW DRES using Ansible automation.

## Description
The Ansible playbook named 'provision-DRES.yml' is the primary playbook for creating/deploying new ISPW DRES enviornments.

This playbook references a number of "answerfiles" where variable information is stored.  These answerfiles are broken down into variables specific to a Region and do not change all the often, as well as variables specific to a DRES' network which are custom for each DRES.

## Preparation
In order to successfully run this playbook it is mandatory that the DRES network-answerfile has been generated for the new DRES.  This file can be generated manually by copying an existing dres-network-answerfile.yml and updating with the new DRES information. Or, this file can be generated automatically by running the "dres-network-config-creator" script against the regional NSX Build Sheet and specifying the name of the DRES.

## Running the "dres-network-config-creator" script
Location: Platform-Automation-scripts-templates/network-automation/network-config/dres-network-config-creator
```
Script Name: dres-network-config-generator.py
Usage:
python dres-network-config-generator.py [ISPW-REGx-xxx-Build-Sheet.xlsx] [dres_name]
```
"ISPW-REGx-xxx-Build-Sheet.xlsx" is the NSX build sheet located in the regional Build-Deploy folder in Box.

Check the file after generation.  You may need to edit the DRES network names sometimes due to issues in formatting.
Once complete, move the generated file into the prod or non-prod network-config folder for the appropriate region.

## Running the Playbook
This playbook also contains a number of Roles.  In the most simplistic form, Roles provide a way of structuring tasks and how they are executed within a playbook.  In our example, Roles are defined for each of the major tasks needed to "build" a DRES.

What does this playbook currently do?

## Main playbook: provision-DRES.yml
- Creates DRES VM VXLAN and Transit VXLAN's
- Create DRES Edges, including both the resource segment Edge, and the VPN Edge.
- Create the DRES DLR.
- Interconnect the Edges and DLR.
- Configure static routes between the Edges and DLR, and between the Edges and the ISPW infrastructure.
- Configure Source NAT of the DRES VM VXLAN to the GSNI Routable Customer Premises network range.
- Remove default Edge configuration details like NSX's pre-defined OSPF areas.

### Execution
```
Provision DRES:
ansible-playbook provision-DRES.yml --extra-vars "requested_state=present"


```

## DRES Post Deployment Fixup: [May-2020]: fixup-DRES.yml
- Configure Edge and DLR DNS client and server (forwarder).
- Configure Edge and DLR syslog.
- Configure Edge and DLR Logging to EMERGENCY
- Redeploy, if necessary, Edge and DLR into appropriate VM's and Templates Folders
- Redeploy, if necessary, Edge and DLR with expected sizes.  DLR=compact.  RES and VPN ESG=quadlarge
- Set Edge and DLR Resource Reservations to "System Managed"

### Execution
```
Provision DRES:
ansible-playbook fixup-DRES.yml


```

## Add new DRES routes to existing transit Edges: [May-2020]: transit-edge-add-dres-route.yml
- This playbook will add the new DRES subnet as a static route to the following transit Edges:
1. agg-esg
2. svc-esg - also add's route for new new DRES’ summarized (/28) transits
3. sres-esg - also add's route for new new DRES’ summarized (/28) transits
4. pdr-esg

### Execution
```
Provision DRES:
ansible-playbook transit-edge-add-route-DRES.yml


```

## What tasks are not currently automated?
- Configure VPN Tunnels. A separate playbook will be created for this in the FUTURE.
- Configure NSX Load Balancer. A separate playbook will be create for this in the FUTURE.
- See the [To Do List](./TODO.md)

## Removing a DRES
If you no longer want the DRES you created, you can remove it.  This is described below.

### Execution
```
Provision DRES:
ansible-playbook remove-DRES.yml --extra-vars "requested_state=absent"


```
