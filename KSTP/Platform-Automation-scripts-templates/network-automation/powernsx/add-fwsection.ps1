
#psuedo powershell code for adding FW Section

Write-Host "USAGE: add-fwsection  <vCenter Server> <DR number> "

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $Args[1]
dr_number=$Args[2]

$FWSection = Get-NsxFirewallSection -Name “Default Section Layer3"
New-NsxFirewallSection -Name DRES500 -position before -anchorId $FWSection.id
