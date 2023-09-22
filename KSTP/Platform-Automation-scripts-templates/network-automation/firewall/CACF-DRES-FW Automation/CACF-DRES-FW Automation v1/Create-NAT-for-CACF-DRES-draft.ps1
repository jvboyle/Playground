
# Example Create-FW-Rules-for-CACF-DRES eu1 33 .50
#Connect-NsxServer -vCenterServer $Args[0]  -Credential $cred
$region = $Args[0]            #### WDC ( ag1 ) ; AMS ( eu1 )
$segmentName = "DRES"         # DRES
$segmentNumber = $Args[1]     #"xx"
$segmentIdentifier = "dr"     ## or gr1, sr1, etc....
$vipip = $Args[2]             ## CACF Proxy VIP Position (.50)
           ## For OCP 3 (3), For OCP 1 (1)

Write-Host -foregroundcolor "Green" $region + $segmentNumber

#$Cred = Get-Credential
# Setup names

$DRESSectionName=$segmentName + $segmentNumber

$proxyVM1=$region + "d" + $segmentNumber + "lpcacprx1"
$proxyVM2=$region + "d" + $segmentNumber + "lpcacprx2"

### Find DRES Subnet and Make VIP IPSet

$proxyVMIP=@((Get-VM -Name $proxyVM1).Guest.IPAddress)
$proxyVMIP |ForEach-Object {
	if ($_.LastIndexOf('.'+$vipip))
	{
		$proxyVIPIP = $_ 
	}
}
$DRESsubnet = $proxyVIPIP.Remove($proxyVIPIP.LastIndexOf('.')) 


$dres_vpn1  =   Get-NsxEdge -Name ($region + "-" + $segmentIdentifier + $segmentNumber +"-vpn1")

Write-Host -foregroundcolor "Green" "Creating NAT rules..."
$dres_vpn1 | get-nsxedgenat | New-NsxEdgeNatRule -Vnic 0 -OriginalAddress $proxyVIPIP -TranslatedAddress 158.87.104.50 -action snat -Description "CACF Proxy" -LoggingEnabled -Enabled -AboveRuleId 196609

$dres_vpn1 | get-nsxedgenat | New-NsxEdgeNatRule -Vnic 0 -OriginalAddress  158.87.104.50 -TranslatedAddress $proxyVIPIP -action dnat -Description "CACF Proxy" -LoggingEnabled -Enabled -AboveRuleId 196609

$dres_vpn1 | get-nsxedgenat | New-NsxEdgeNatRule -Vnic 0 -OriginalAddress ($DRESsubnet + ".51") -TranslatedAddress 158.87.104.51 -action snat -Description "CACF Proxy" -LoggingEnabled -Enabled -AboveRuleId 196609

$dres_vpn1 | get-nsxedgenat | New-NsxEdgeNatRule -Vnic 0 -OriginalAddress  158.87.104.51 -TranslatedAddress ($DRESsubnet + ".51") -action dnat -Description "CACF Proxy" -LoggingEnabled -Enabled -AboveRuleId 196609

$dres_vpn1 | get-nsxedgenat | New-NsxEdgeNatRule -Vnic 0 -OriginalAddress ($DRESsubnet + ".52") -TranslatedAddress 158.87.104.52 -action snat -Description "CACF Proxy" -LoggingEnabled -Enabled -AboveRuleId 196609

$dres_vpn1 | get-nsxedgenat | New-NsxEdgeNatRule -Vnic 0 -OriginalAddress  158.87.104.52 -TranslatedAddress ($DRESsubnet + ".52") -action dnat -Description "CACF Proxy" -LoggingEnabled -Enabled -AboveRuleId 196609
