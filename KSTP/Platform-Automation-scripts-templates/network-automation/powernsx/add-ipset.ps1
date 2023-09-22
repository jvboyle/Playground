
#psuedo powershell code for adding new IP Set

Write-Host "USAGE: add-ipset  <vCenter Server> <DR number> "

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $Args[1]
dr_number=$Args[2]

New-NsxIpSet -Name HOST-DA-nl02qlt00ci00rm -IPAddress 10.9.8.76 -Description “WebReports (CustDB Replica)”

---
$newipsetcsv = import-csv .\bulkipsets.csv

foreach($ipset in $newipsetcsv)

  {

  $Name = $ipset.Name
  $Members = $ipset.Members
  $Description = $ipset.Description

  New-NsxIpSet -Name "$Name" -IPAddress "$Members" -Description "$Description"

  }
