# Deploy a Compliant Ubuntu VM with Ansible

## Purpose


## Usage
1. Edit the ```vms-to-deploy``` file to define the number of virtual machines you want to deploy, as well as their names, datastore, IP and notes.
2. Edit the answerfile's' file to set the correct parameter for
    * the infrastructure (where to deploy)
    * the common options for the virtual machines

    `ansible-playbook -i ../inventory-files/<solution>vms-to-deploy-<region_type>-<region> setup-compliant-ubuntu-vm.yml --extra-vars ansible_ssh_pass="password" region_type=non-prod region=ag1 segmentID=sr1  requested_state='present'``

     `requested_state='absent' requested_state = [ absent, present, poweredon, poweredoff ]`
     `target_cluster= [ compute | remote ]`

### Sample

```ansible-playbook -i ../inventory-files/non-prod/test-vms-to-deploy-non-prod-ag1 setup-compliant-ubuntu-vm.yml --extra-vars "ansible_ssh_pass="password" region_type=non-prod region=ag1 segmentID=sr1  requested_state='present'"
```

## Input Parameters

| Parameter Name | Purpose | Sample Values |
| -------------- | ------- | ------------- |

## Output Parameter

#


## Execution


## Sample call
```ansible-playbook -i ../inventory-files/non-prod/test-vms-to-deploy-non-prod-ag1 setup-compliant-ubuntu-vm.yml --extra-vars ansible_ssh_pass="password" region_type=non-prod region=ag1 segmentID=sr1  requested_state='present'
```
