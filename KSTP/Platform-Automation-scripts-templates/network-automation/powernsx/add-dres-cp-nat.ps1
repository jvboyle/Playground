
#psuedo powershell code for adding new NAT rules to Edges

Write-Host "USAGE: add-dres-cp-nat  <vCenter Server> <DR number> "

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $Args[1]
dr_number=$Args[2]

#DNAT
get-nsxedge eu1-dr13-vpn1 | get-nsxedgenat | New-NsxEdgeNatRule -Vnic 0 -OriginalAddress 100.72.80.14 -TranslatedAddress 158.87.104.14 -action snat -Description “SNAT for .14” -LoggingEnabled -Enabled -AboveRuleId 196609
#SNAT
get-nsxedge eu1-dr13-vpn1 | get-nsxedgenat | New-NsxEdgeNatRule -Vnic 0 -OriginalAddress 158.87.104.51 -TranslatedAddress 100.72.80.51 -action dnat -Description “test-bill-snat1” -LoggingEnabled -Enabled
