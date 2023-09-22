$newsg = import-csv .\bulksg.csv

## vCenter ###
$vCenterServerName = "vcenter.home.local"

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $vCenterServerName


 foreach($sg in $newsg)

   {

   $Name = $sg.Name
   $Description = $sg.Description

   New-NsxSecurityGroup -Name "$Name" -Description "$Description"

   }
