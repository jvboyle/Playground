Playbook for provisioning Windows Server 2016 Virtual machine from VM Template
================================================================================
<br>
Playbook will check if VM with same name already exists on vCenter and if not, it will deploy new VM from defined template.<br>
<br>
Must be run with all variables filled:<br>
'--extra-vars "vmName= region_type= region= vmNetwork= vmIp= vmNetmask= vmGw= vmDomain="'<br>
<br>
vmName - Name of VM<br>
region_type - prod/non-prod<br>
region - ag1/eu1<br>
vmNetwork - Name of portgroup to be used<br>
vmIp - IP address of VM<br>
vmNetmask - Network mask of VM<br>
vmGw - Network gateway of VM<br>
vmDomain - Domain suffix of VM<br>
<br>
region-answerfile.yml must contain following variables:<br>
region_dns_servers
region_template_win2016
