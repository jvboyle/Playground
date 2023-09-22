$newipsetcsv = import-csv .\bulkipsets.csv

## vCenter ###
$vCenterServerName = "vcenter.home.local"

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $vCenterServerName


 foreach($ipset in $newipsetcsv)

   {

   $Name = $ipset.Name
   $Members = $ipset.Members
   $Description = $ipset.Description

   echo "$Name, $Members, $Description"

   }
