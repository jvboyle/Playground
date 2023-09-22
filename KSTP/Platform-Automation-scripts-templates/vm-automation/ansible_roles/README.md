Ansible Roles (Project) - Dummy Galaxy
=========

Here we can store all the different roles created for different tasks, and we could write a master.yml file to orchestrate roles and tasks together.

Directory structure
--------------

`ansible.cfg` - If it exists in your current directory it precedes the global file defaults and stores the settings for ansible(e.g inventory location, privileges escalation, roles path, etc)

`vcenter_credentials.yml` - A file which stores your credentials in an encrypted and safe way under any system, all you have to do is provide the master password to unlock the vault during the execution of the `ansible-playbook` command, passing the option `--ask-vault-pass`

`sample_inventory` - It's not necessarily needed when you interact with Vcenter just for provisioning vms, but in my case it was used in the 2nd play in `master.yml`

`group_vars` - Keeps the variables for groups you have created in inventory file. In current state encrypted file `gluster_peers`, used by `gluster_peers` hostgroup. The file you might notice is encrypted the reason is because it keeps sensitive information for sshing to the destination hosts and can only be decrypted using the master password, same one used for `vcenter_credentials.yml` 

`master.yml` - Is the master playbook which will run a set of roles, tasks and plays for our configuration changes needed.

`vm_settings.yml` - A file which stores dynamic variables for the virtual machines our roles will provision and modify their disk configuration. Keys and values provided , `vsphere_username` & `vsphere_password`

`pip_requirements.txt` - A snapshot of python packages/libraries plus their version - You should install these specific libraries prior running playbook `master.yml`. In our environment use privilege escalation through sudo, and install by running `sudo pip install -r pip_requirements.txt`.

How to run
--------------
In case you want to create the virtual machines provided in the `vm_settings.yml`

`ansible-playbook --ask-vault-pass -e '@vcenter_credentials.yml' -e '@vm_settings.yml' -e 'virtual_machine_state=poweredon' master.yml`

This will create 3 virtual machines, and attach a secondary disk of 10Gigs and then it will install the glusterfs packages in the all vms. First 2 vms will be used for replication of data, and 3rd one will be the arbiter node. More info: https://docs.gluster.org/en/latest/Administrator%20Guide/Split%20brain%20and%20ways%20to%20deal%20with%20it/

If you want to remove and permanently delete the virtual machines.

1. Power off - `ansible-playbook --ask-vault-pass -e '@vcenter_credentials.yml' -e '@vm_settings.yml' -e 'virtual_machine_state=poweredoff' master.yml`
2. Remove - `ansible-playbook --ask-vault-pass -e '@vcenter_credentials.yml' -e '@vm_settings.yml' -e 'virtual_machine_state=absent' master.yml` 

What is next
--------------
Linux team now can create volumes, similar way with creating NFS exports. This task can be further automated within the same master play using https://docs.ansible.com/ansible/latest/modules/gluster_volume_module.html 

License
-------

BSD

Author Information
------------------

[George Anastasiou](mailto:george.anastasiou@cz.ibm.com?subject=[Github]%20Ansible%20Roles%20Dummy%20Galaxy).
