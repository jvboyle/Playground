# Deploy Platform Hosting Service Control Node VM with Ansible

## Description
Outbound

#
1. Edit the ```vms-to-deploy``` file to define the number of virtual machines you want to deploy, as well as their names, datastore, IP and notes.
2. Edit the answerfile's' file to set the correct parameter for
    * the infrastructure (where to deploy)
    * the common options for the virtual machines

## Execution
```
ansible-playbook -i vms-to-deploy setup-control-node.yml --extra-vars requested_state='absent'
```
