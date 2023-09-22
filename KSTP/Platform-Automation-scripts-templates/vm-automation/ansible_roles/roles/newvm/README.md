Create new virtual machine(s) in VMware Vcenter
=========

This role is used to create a virtual machine out of a template, also it will provide network configuration and the role will finish once the virtual machine is powered on and vmware tools reflect the right network settings.

Requirements
------------

This role assumes that you already have an ESXi host or ESXi cluster and Vcenter running, plus make sure you have the required capacity both in compute and storage domain.

Role Variables
--------------

Below you can see a sample of virtual machine settings definition:

It will create 3 virtual machines, named as `agnplnicp1testvm01` `agnplnicp1testvm02` `agnplnicp1testvm03`. Below values are regarding nonProd ESXi cluster in AG for ISPW service.

```
dns_servers:
  - 158.87.48.2
  - 158.87.48.3
dns_domain: 'sr1.ag1.sp.ibm.local'
virtual_machines: 
        - name: 'agnplnicp1testvm01'
          template: 'ubuntu1604_latest'
          vswitch: 'vxw-dvs-25019-virtualwire-5-sid-5005-ag1-sres1-app-internal1'
          ip: '158.87.48.66'
          netmask: '255.255.254.0'
          gateway: '158.87.48.1'
          vcpus: '2'
          mem_mb: '8192'
        - name: 'agnplnicp1testvm02'
          template: 'ubuntu1604_latest'
          vswitch: 'vxw-dvs-25019-virtualwire-5-sid-5005-ag1-sres1-app-internal1'
          ip: '158.87.48.67'
          netmask: '255.255.254.0'
          gateway: '158.87.48.1'
          vcpus: '2'
          mem_mb: '8192'
        - name: 'agnplnicp1testvm03'
          template: 'ubuntu1604_latest'
          vswitch: 'vxw-dvs-25019-virtualwire-5-sid-5005-ag1-sres1-app-internal1'
          ip: '158.87.48.68'
          netmask: '255.255.254.0'
          gateway: '158.87.48.1'
          vcpus: '2'
          mem_mb: '8192'
```
Dependencies
------------

\-

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: localhost
      roles:
         - newvm

License
-------

BSD

Author Information
------------------

[George Anastasiou](mailto:george.anastasiou@cz.ibm.com?subject=[Github]%20Create%20new%20virtual%20machines%20in%20VMware%20Vcenter).
