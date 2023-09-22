
#psuedo powershell code for adding Security Group

Write-Host "USAGE: add-secgroup  <vCenter Server> <DR number> "

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $Args[1]
dr_number=$Args[2]

New-NsxSecurityGroup -Name "SG-SRES-Automation-Control-Node”-Description "Automation Control Node Security Group" -IncludeMember (Get-NsxSecurityTag  "ST-SRES-Automation-Control-Node”)


---
$newsg = import-csv .\bulksg.csv


 foreach($sg in $newsg)

   {

   $Name = $sg.Name
   $Description = $sg.Description

   New-NsxSecurityGroup -Name "$Name" -Description "$Description"

   }
