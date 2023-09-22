Add disks on existing virtual machines
=========

This role is created to attach new disks to existing virtual machines.

Requirements
------------

The virtual machines should exist, otherwise the role will fail, and there should be a proper list of dictionaries reflecting the disks to be created using a variables file. (e.g in vm_settings.yml)

Role Variables
--------------

Below you can see a sample of disk variables definition:

In below case, it will attach 1 disk 10GB on scsi controller 0, on unit 1 in virtual machines named as `agnplnicp1testvm01` `agnplnicp1testvm02` `agnplnicp1testvm03`. Be extra careful with unit_number cause 0 is usually holding the OS disk. Make sure you know the template configuration before you provide unit_number for the additional disks.

```
virtual_machines_additional_disks:
        - name: 'agnplnicp1testvm01'
          disks:
                - size_gb: 10
                  state: present
                  unit_number: 1
                  scsi_type: '{{ scsi_type }}' # defaults from role
                  datastore: '{{ vsphere_datastore }}' # defaults from variables passed to master play file, master.yml
                  scsi_controller: '{{ scsi_controller }}' # defaults from role
                  type: '{{ disk_provisioning_type }}' # defaults from role
        - name: 'agnplnicp1testvm02'
          disks:
                - size_gb: 10
                  state: present
                  unit_number: 1
                  scsi_type: '{{ scsi_type }}' # defaults from role
                  datastore: '{{ vsphere_datastore }}' # defaults from variables passed to master play file, master.yml
                  scsi_controller: '{{ scsi_controller }}' # defaults from role
                  type: '{{ disk_provisioning_type }}' # defaults from role
        - name: 'agnplnicp1testvm03'
          disks:
                - size_gb: 10
                  state: present
                  unit_number: 1
                  scsi_type: '{{ scsi_type }}' # defaults from role
                  datastore: '{{ vsphere_datastore }}' # defaults from variables passed to master play file, master.yml
                  scsi_controller: '{{ scsi_controller }}' # defaults from role
                  type: '{{ disk_provisioning_type }}' # defaults from role
```

Dependencies
------------

Virtual machines should exist, there is another role for creating new virtual machines, but it's not considered as dependency.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: localhost
      roles:
         - adddisks

License
-------

BSD

Author Information
------------------

[George Anastasiou](mailto:george.anastasiou@cz.ibm.com?subject=[Github]%20Add%20disks%20on%20existing%20virtual%20machines).