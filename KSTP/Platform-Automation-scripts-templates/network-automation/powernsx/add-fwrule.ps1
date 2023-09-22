
#psuedo powershell code for adding FW Rule

Write-Host "USAGE: add-fwrule  <vCenter Server> <DR number> "

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $Args[1]
dr_number=$Args[2]

$FWRule = Get-NsxFirewallRule -Name "SRES Jump To Provider"
New-NsxFirewallRule -Section (Get-NsxFirewallSection "SRES") -Name “Automation Control Node to Provider”-Source (Get-NsxSecurityGroup  "SG-SRES-Automation-Control-Node") -Destination (Get-NsxIpSet  “NET-WDC-CGN subnets”),(Get-NsxIpSet “NET-WDC-GSNI subnets”),(Get-NsxIpSet “NET-SL-IRES-Portable”) -Action allow -Service (Get-NsxService HTTPS -LocalOnly),(Get-NsxService SSH -LocalOnly) -ApplyToDfw -ApplyToAllEdges -EnableLogging -Comment "Automation Control Node to Provider”-Position before -anchorId $FWRule.id

#another example
New-NsxFirewallRule -Section (Get-NsxFirewallSection DRES01) -Name “IAMaaS-SASfw from Customer” -Source (Get-NsxIpSet NET-All-RFC1918) -Destination (Get-VM dr1sasfw1) -Action allow -service (Get-NsxService IAMaaS-Clients) -AppliedTo (Get-VM dr1sasfw1),(Get-NsxEdge dres01-esg01),(Get-NsxEdge dres01-vpn01) -EnableLogging -Comment "IAMaaS-SASfw from Customer Rule” -Position before -anchorId 1077
