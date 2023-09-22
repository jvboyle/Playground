#INPUTS

Write-Host "USAGE: Create-FW-Rules-for-CACF-DRES <vCenter> <region> <segmentNumber>"

# Example Create-FW-Rules-for-CACF-DRES eu1 33 .50 3
#Connect-NsxServer -vCenterServer $Args[0]  -Credential $cred
$region = $Args[0]            #### WDC ( ag1 ) ; AMS ( eu1 )
$segmentName = "DRES"         # DRES
$segmentNumber = $Args[1]     #"xx"
$segmentIdentifier = "dr"     ## or gr1, sr1, etc....
$vipip = $Args[2]             ## CACF Proxy VIP Position (.50)
$ocp_no = $Args[3]            ## For OCP 3 (3), For OCP 1 (1)

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

Write-Host -foregroundcolor "Green" "CACF Proxy IP: " $proxyVIPIP 
$ProxyVIP = "HOST-"+$segmentName + $segmentNumber + "-CACF-" + "Proxy-VIP"
If ( -Not (Get-NsxIpSet -Name $ProxyVIP) ) { Write-Host -foregroundcolor "Green" "Creating " $ProxyVIP; New-NsxIpSet -Name $ProxyVIP -IPAddress $ProxyVIPIP -Description "CACF Proxy VIP"}


### Define ESG
Write-Host -foregroundcolor "Green" "Looking for Edges..."
$sres_esg1  =   Get-NsxEdge -Name ($region + "-sres1" + "-esg1")
$sres_lb1   =   Get-NsxEdge -Name ($region + "-sres1" + "-lb1")
$dres_esg1  =   Get-NsxEdge -Name ($region + "-" + $segmentIdentifier + $segmentNumber +"-esg1")
$dres_vpn1  =   Get-NsxEdge -Name ($region + "-" + $segmentIdentifier + $segmentNumber +"-vpn1")

Write-Host -foregroundcolor "Green" "Looking for IPSets..."
# Get IPSets
$CACF_ProxyVIP = Get-nsxipset -Name $ProxyVIP
$CPREM_NAT  = Get-nsxipset -Name "NET-CPREM-GSNI NAT Range"
$OCP_VIP   = Get-nsxipset -Name ("HOST-SRES-LB-OCP-Cluster" + $ocp_no + "-VIP")

Write-Host -foregroundcolor "Green" "Looking for SGs..."
#Get SG Group
$OCP       =  Get-NsxSecurityGroup -Name ("SG-SRES01-OCP-Cluster0" + $ocp_no)

# Get services
$HTTPS      = Get-NsxService -Name "HTTPS" -LocalOnly
$SSH        = Get-NsxService -Name "SSH" -LocalOnly
$BDS        = Get-NsxService -Name "BDS-8081" -LocalOnly
$Netcool    = Get-NsxService -Name "Netcool_16443" -LocalOnly

#VMs 
$bds_vm     =   Get-VM eu1srlpcacfbds1
$proxy1_vm  =   Get-VM $proxyVM1
$proxy2_vm  =   Get-VM $proxyVM2

### Create FW rules
Write-Host -foregroundcolor "Green" "Creating Firewall rules..."
$ruleName = "===== Automaticly created CACF FW rules - start (" + (Get-Date -Format g) + ") ====="
Get-NsxFirewallSection $DRESSectionName | New-NsxFirewallRule -Name $ruleName -Action allow -Disabled -Position bottom

# Netcool Flow

Get-NsxFirewallSection $DRESSectionName | New-NsxFirewallRule -Name "CACF Proxy to SRES OCP VIP - Netcool" -Action allow -Source $proxy1_vm,$proxy2_vm -Destination $OCP_VIP -Service $HTTPS -AppliedTo $proxy1_vm,$proxy2_vm,$OCP,$sres_esg1,$dres_esg1,$sres_lb1 -Disabled -Position bottom -EnableLogging

Get-NsxFirewallSection $DRESSectionName | New-NsxFirewallRule -Name "CAFCF Proxy to CPREM JH - Netcool" -Action allow -Source $proxy1_vm,$proxy2_vm,$CPREM_NAT -Service $Netcool -AppliedTo $proxy1_vm,$proxy2_vm,$dres_esg1,$dres_vpn1 -Disabled -Position bottom -EnableLogging

Get-NsxFirewallSection $DRESSectionName | New-NsxFirewallRule -Name "CPREM JH to CAFCF Proxy- Netcool" -Action allow -Destination $CACF_ProxyVIP,$CPREM_NAT -Service $HTTPS -AppliedTo $proxy1_vm,$proxy2_vm,$dres_esg1,$dres_vpn1 -Disabled -Position bottom -EnableLogging

# Ansible SSH
Get-NsxFirewallSection $DRESSectionName | New-NsxFirewallRule -Name "SRES OCP to CACF Proxy VIP SSH" -Action allow -Source $OCP -Destination $CACF_ProxyVIP -Service $SSH,$Netcool -AppliedTo $proxy1_vm,$proxy2_vm,$OCP,$sres_esg1,$dres_esg1 -Disabled -Position bottom -EnableLogging
  
  
Get-NsxFirewallSection $DRESSectionName | New-NsxFirewallRule -Name "CAFCF Proxy to CPREM JH SSH" -Action allow -Source $proxy1_vm,$proxy2_vm,$CPREM_NAT -Service $SSH -AppliedTo $proxy1_vm,$proxy2_vm,$dres_esg1,$dres_vpn1 -Disabled -Position bottom -EnableLogging
 
 
 
# BDS Flow
Get-NsxFirewallSection $DRESSectionName | New-NsxFirewallRule -Name "CACF Proxy VIP to SRES BDS" -Source $proxy1_vm,$proxy2_vm -Destination $bds_vm -Action allow -Service $BDS -AppliedTo $proxy1_vm,$proxy2_vm,$bds_vm,$sres_esg1,$dres_esg1 -Disabled -Position bottom -EnableLogging
 
Get-NsxFirewallSection $DRESSectionName | New-NsxFirewallRule -Name "CPREM JH to CAFCF Proxy BDS" -Action allow -Destination $CACF_ProxyVIP,$CPREM_NAT -Service $BDS -AppliedTo $proxy1_vm,$proxy2_vm,$dres_esg1,$dres_vpn1 -Disabled -Position bottom -EnableLogging
 
# Backend Flow
Get-NsxFirewallSection $DRESSectionName | New-NsxFirewallRule -Name "Inter CACF Proxy" -Source $proxy1_vm,$proxy2_vm -Destination $proxy1_vm,$proxy2_vm -Action allow -AppliedTo $proxy1_vm,$proxy2_vm,$dres_esg1  -Disabled -Position bottom
 
Write-Host -foregroundcolor "Green" "Creating NAT rules..."

./Create-NAT-fpr-CACF-DRES-draft.ps1 $region $segmentNumber $vipip 

Write-Host -foregroundcolor "Green" "END OF SCRIPT"
