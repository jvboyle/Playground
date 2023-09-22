# To-Do List

The following is a list of additional automation tasks in the pipeline:

- Create Master playbook that will run provision-DRES, fixup-DRES, and transit-edge-add-route-DRES playbooks in succession
- Create uri module based playbooks for DLR and Edges.  This will replace the current DLR-creation, RES-ESG-creation, and VPN-ESG-creation roles which are based on unmaintained VMware NSX-V Ansible python modules based on python 2.
- Create URI module based playbooks for Logical Switch/VXLAN to replace create-logical-switches role which is based on unmaintained VMware NSX-V Ansible python modules based on python 2.
-  Day 2 automations
-  Migrate playbooks into Ansible Tower
