$newipsetcsv = import-csv .\bulkipsets.csv

## vCenter ###
$vCenterServerName = "ispwap1-vc.sp.ibm.local"

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $vCenterServerName


foreach($ipset in $newipsetcsv)

  {

  $Name = $ipset.Name
  $Members = $ipset.Members
  $Description = $ipset.Description

  New-NsxIpSet -Name "$Name" -IPAddress "$Members" -Description "$Description"

  }
