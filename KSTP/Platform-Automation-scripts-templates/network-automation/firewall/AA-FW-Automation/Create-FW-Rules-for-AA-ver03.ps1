#INPUTS

Write-Host "USAGE: process FW rules request   <environment> <regionName> <DR number> <customer Prefix name> < customer region prefix name>"

$PlatformEnv = $Args[0]  #  "non-prod"  OR "prod"
$Region=$Args[1]   # eu1"  AMS;  "ag1"  WDC ; "ag1"  PoC
$drNumber = $Args[2]
$customerPrefixName = $Args[3]
$customerRegionPrefixName = $Args[4]

If ($PlatformEnv -eq "prod") {
  if ($Region -eq "ag1") {
    $vCenter=ag1vc1.ag1.sp.ibm.local
    $sres_esg1 = Get-NsxEdge -Name ($Region + "-sres1-esg1")
    $agg_esg1 = Get-NsxEdge -Name ($Region + "-agg-esg1")
    $drxxName = $Region + "-dr" + $drNumber + "-esg1"
    $drxx_esg1 = Get-NsxEdge -Name $drxxName

  } ElseIF ($Region -eq "eu1") {
    $vCenter=eu1vc1.eu1.sp.ibm.local
    $sres_esg1 = Get-NsxEdge -Name ($Region + "-sres1-esg1")
    $agg_esg1 = Get-NsxEdge -Name ($Region + "-agg-esg1")
    $drxxName = $Region + "-dr" + $drNumber + "-esg1"
    $drxx_esg1 = Get-NsxEdge -Name $drxxName

  } Else {
  echo "Region not found"
  }
  Else {
  $vCenter=ag1vc01.poc.ispw.ibm.local
  $sres_esg1 = Get-NsxEdge -Name "sres-esg01"
  $agg_esg1 = Get-NsxEdge -Name "agg-esg01"
  $drxx_esg1 = Get-NsxEdge -Name "dr" + $drNumber + "-esg01"
  $drxx_esg1 = Get-NsxEdge -Name "dres01-esg01"
  }
}

#Connect to NSX service
Connect-NsxServer -vCenterServer $vCenter


#Security Group names
$SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name = "SG-DR" + $drNumber + "-RPA-AA-Desktop-Pool_PROD"
$SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name = "SG-DR" + $drNumber + "-RPA-AA-Desktop-Pool_UAT"
$SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name = "SG-DR" + $drNumber + "-RPA-AA-Desktop-Pool_DEV"
$SG_DRxx_RPA_AA_Pool_Images_Name = "SG-DR" + $drNumber + "-RPA-AA-Pool-Images"
$SG_DRxx_RPA_AA_Desktop_Pool_Name = "SG-DR" + $drNumber + "-RPA-AA-Desktop-Pool"
$SG_SRES_RPA_GTS_Jump_Servers_Name = "SG-SRES-RPA-GTS-Jump-Servers"
$SG_SRES_RPA_Horizon_Servers_Name = "SG-SRES-RPA-Horizon-Servers"
$SG_SRES_RPA_FileServers_Name = "SG-SRES-RPA-FileServers"
$SG_SRES_RPA_AD_DNS_Name = "SG-SRES-RPA-AD-DNS"
$SG_SRES_RPA_AppVol_Manager_Name = "SG-SRES-RPA-AppVol-Manager"
$SG_SRES_RPA_AA_Controlroom_Name = "SG-SRES-RPA-AA-Controlroom"
$SG_PDR_SMTP_Relay_Name = "SG-PDR-SMTP-Relay"
$VM_regsr1rpakms_Name = $Region + "sr1rpakms"
#$VM_regsr1rpakms_Name = $Region + "jump01" #temporary used another existent VM for the tests
$IpSet_HOST_wssportalinibmcom_Name = "HOST-wssportal.in.ibm.com" #must be created manually in advance

#Check and create Security Groups for this DRES
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Pool_Images_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Pool_Images_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Pool_Images_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_Name }
#If ( -Not (Get-NsxSecurityGroup -Name $_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $_Name; New-NsxSecurityGroup -Name $_Name }

#Check and create IpSet [...]


#Check if VM exists [...]

#Get Security Groups
$SG_DRxx_RPA_AA_Desktop_Pool_PROD = Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name
$SG_DRxx_RPA_AA_Desktop_Pool_UAT = Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name
$SG_DRxx_RPA_AA_Desktop_Pool_DEV = Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name
$SG_DRxx_RPA_AA_Pool_Images = Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Pool_Images_Name
$SG_DRxx_RPA_AA_Desktop_Pool = Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_Name
$SG_SRES_RPA_GTS_Jump_Servers = Get-NsxSecurityGroup -Name $SG_SRES_RPA_GTS_Jump_Servers_Name
$SG_SRES_RPA_Horizon_Servers = Get-NsxSecurityGroup -Name $SG_SRES_RPA_Horizon_Servers_Name
$SG_SRES_RPA_FileServers = Get-NsxSecurityGroup -Name $SG_SRES_RPA_FileServers_Name
$SG_SRES_RPA_AD_DNS = Get-NsxSecurityGroup -Name $SG_SRES_RPA_AD_DNS_Name
$SG_SRES_RPA_AppVol_Manager = Get-NsxSecurityGroup -Name $SG_SRES_RPA_AppVol_Manager_Name
$SG_SRES_RPA_AA_Controlroom = Get-NsxSecurityGroup -Name $SG_SRES_RPA_AA_Controlroom_Name
$SG_PDR_SMTP_Relay = Get-NsxSecurityGroup -Name $SG_PDR_SMTP_Relay_Name

#Get VMs
$VM_regsr1rpakms = Get-VM $VM_regsr1rpakms_Name

#Get IpSets
$IpSet_HOST_wssportalinibmcom = Get-NsxIpSet -Name $IpSet_HOST_wssportalinibmcom_Name

#Check and create DRESxx FW rule section
$dresSectionName = "DRES" + $drNumber
If ( -Not (Get-NsxFirewallSection -Name $dresSectionName) ) { Write-Host -foregroundcolor "Green" "Creating DRES FW Section: "; Write-Host -foregroundcolor "Yellow" $dresSectionName; New-NsxFirewallSection -Name $dresSectionName -Position bottom }

$serviceTcp135   = Get-NsxService -Name "tcp-135"
$serviceTcp445   = Get-NsxService -Name "tcp-445"
$serviceTcp465   = Get-NsxService -Name "tcp-465"
$serviceTcp578   = Get-NsxService -Name "tcp-578"
$serviceTcp1688  = Get-NsxService -Name "tcp-1688"
$serviceTcp4001  = Get-NsxService -Name "tcp-4001"
$serviceTcp4002  = Get-NsxService -Name "tcp-4002"
$serviceTcp5985  = Get-NsxService -Name "tcp-5985"
$serviceTcp8181  = Get-NsxService -Name "tcp-8181"
$serviceTcp9427  = Get-NsxService -Name "tcp-9427"
$serviceTcp22443 = Get-NsxService -Name "tcp-22443"
$serviceUdp445   = Get-NsxService -Name "udp-445"
$serviceUdp22443 = Get-NsxService -Name "udp-22443"

#Use existent services
$serviceRDP = Get-NsxService -Name "RDP" -LocalOnly
$serviceHTTPS = Get-NsxService -Name "HTTPS" -LocalOnly
$serviceWin2008 = Get-NsxService -Name "Win 2008 - RPC, DCOM, EPM, DRSUAPI, NetLogonR, SamR, FRS" -LocalOnly

#Use existent service groups
$serviceGrpMSAD = Get-NsxServiceGroup -Name "Microsoft Active Directory" -LocalOnly



$ruleName = "===== Automaticly created FW rules - end (" + (Get-Date -Format g) + ") ====="
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name $ruleName -Action allow -Disabled -Position bottom


### Adding members to Security Groups
Write-Host -foregroundcolor "Green" "Adding members to Security Groups..."
$VmName_DRxx_RPA_AA_Desktop_Pool_PROD_Name1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($customerRegionPrefixName + $drNumber + $customerPrefixName + "aapbb")
$VmName_DRxx_RPA_AA_Desktop_Pool_PROD_Name2 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($customerRegionPrefixName + $drNumber + $customerPrefixName + "aapsb")
$VmName_DRxx_RPA_AA_Desktop_Pool_PROD_Name3 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($customerRegionPrefixName + $drNumber + $customerPrefixName + "aapgb")
Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $VmName_DRxx_RPA_AA_Desktop_Pool_PROD_Name1,$VmName_DRxx_RPA_AA_Desktop_Pool_PROD_Name2,$VmName_DRxx_RPA_AA_Desktop_Pool_PROD_Name3

$VmName_DRxx_RPA_AA_Desktop_Pool_UAT_Name1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($customerRegionPrefixName + $drNumber + $customerPrefixName + "aaubb")
$VmName_DRxx_RPA_AA_Desktop_Pool_UAT_Name2 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($customerRegionPrefixName + $drNumber + $customerPrefixName + "aausb")
$VmName_DRxx_RPA_AA_Desktop_Pool_UAT_Name3 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($customerRegionPrefixName + $drNumber + $customerPrefixName + "aaugb")
Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $VmName_DRxx_RPA_AA_Desktop_Pool_UAT_Name1,$VmName_DRxx_RPA_AA_Desktop_Pool_UAT_Name2,$VmName_DRxx_RPA_AA_Desktop_Pool_UAT_Name3

$VmName_DRxx_RPA_AA_Desktop_Pool_DEV_Name1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($customerRegionPrefixName + $drNumber + $customerPrefixName + "aadbb")
$VmName_DRxx_RPA_AA_Desktop_Pool_DEV_Name2 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($customerRegionPrefixName + $drNumber + $customerPrefixName + "aadsb")
$VmName_DRxx_RPA_AA_Desktop_Pool_DEV_Name3 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($customerRegionPrefixName + $drNumber + $customerPrefixName + "aadgb")
Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $VmName_DRxx_RPA_AA_Desktop_Pool_DEV_Name1,$VmName_DRxx_RPA_AA_Desktop_Pool_DEV_Name2,$VmName_DRxx_RPA_AA_Desktop_Pool_DEV_Name3

$VmName_DRxx_RPA_AA_Pool_Images_Name1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($customerRegionPrefixName + $drNumber + $customerPrefixName + "aagld")
Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Pool_Images_Name | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $VmName_DRxx_RPA_AA_Pool_Images_Name1

$SG_DRxx_RPA_AA_Desktop_Pool | Add-NsxSecurityGroupMember -Member $SG_DRxx_RPA_AA_Desktop_Pool_PROD,$SG_DRxx_RPA_AA_Desktop_Pool_UAT,$SG_DRxx_RPA_AA_Desktop_Pool_DEV
