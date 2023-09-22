# Deploy sample Ubuntu VM with Ansible

## Description
Outbound

#
1. Edit the ```vms-to-deploy``` file to define the number of virtual machines you want to deploy, as well as their names, datastore, IP and notes.
2. Edit the answerfile's' file to set the correct parameter for
    * the infrastructure (where to deploy)
    * the common options for the virtual machines

## Execution
```
ansible-playbook -i vms-to-deploy-non-prod setup-nfs-ubuntu.yml --extra-vars ansible_ssh_pass="password"  requested_state='present'
```
`requested_state` = [ absent, present, poweredon, poweredoff ]
