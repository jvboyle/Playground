#INPUTS



### AMS ###
#Connect-NsxServer -vCenterServer eu1vc1.eu1.sp.ibm.local

### WDC ###
#Connect-NsxServer -vCenterServer ag1vc1.ag1.sp.ibm.local

### PoC ###
#Connect-NsxServer -vCenterServer ag1vc01.poc.ispw.ibm.local


#DRES number and Customer prefix name
$drNumber = "xx"
$customerPrefixName = "xxx"
$customerRegionPrefixName = "nld"

#Region
$Region = "eu1" # AMS
#$Region = "ag1" # WDC
#$Region = "ag1" # PoC

#NSX Edges


#PoC
#$sres_esg1 = Get-NsxEdge -Name "sres-esg01"
#$agg_esg1 = Get-NsxEdge -Name "agg-esg01"
#$drxx_esg1 = Get-NsxEdge -Name "dr" + $drNumber + "-esg01"
#$drxx_esg1 = Get-NsxEdge -Name "dres01-esg01"

#EU1 & AG1
$sres_esg1 = Get-NsxEdge -Name ($Region + "-sres1-esg1")
$agg_esg1 = Get-NsxEdge -Name ($Region + "-agg-esg1")
$drxxName = $Region + "-dr" + $drNumber + "-esg1"
$drxx_esg1 = Get-NsxEdge -Name $drxxName

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

#Check and create Security Groups
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Pool_Images_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Pool_Images_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Pool_Images_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_GTS_Jump_Servers_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_GTS_Jump_Servers_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_GTS_Jump_Servers_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_Horizon_Servers_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_Horizon_Servers_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_Horizon_Servers_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_FileServers_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_FileServers_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_FileServers_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_AD_DNS_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_AD_DNS_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_AD_DNS_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_AppVol_Manager_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_AppVol_Manager_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_AppVol_Manager_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_AA_Controlroom_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_AA_Controlroom_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_AA_Controlroom_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_PDR_SMTP_Relay_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_PDR_SMTP_Relay_Name; New-NsxSecurityGroup -Name $SG_PDR_SMTP_Relay_Name }
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

#Check and create custom services
#If (-Not (Get-NsxService -Name "tcp-")) { Write-Host -foregroundcolor "Green" "Creating " "tcp-"; New-NsxService -Name "tcp-" -Protocol tcp -port "" -Description "tcp/" }
If (-Not (Get-NsxService -Name "tcp-135"))   { Write-Host -foregroundcolor "Green" "Creating " "tcp-135";   New-NsxService -Name "tcp-135"   -Protocol tcp -port "135"   -Description "tcp/135" }
If (-Not (Get-NsxService -Name "tcp-445"))   { Write-Host -foregroundcolor "Green" "Creating " "tcp-445";   New-NsxService -Name "tcp-445"   -Protocol tcp -port "445"   -Description "tcp/445" }
If (-Not (Get-NsxService -Name "tcp-465"))   { Write-Host -foregroundcolor "Green" "Creating " "tcp-465";   New-NsxService -Name "tcp-465"   -Protocol tcp -port "465"   -Description "tcp/465" }
If (-Not (Get-NsxService -Name "tcp-578"))   { Write-Host -foregroundcolor "Green" "Creating " "tcp-578";   New-NsxService -Name "tcp-578"   -Protocol tcp -port "578"   -Description "tcp/578" }
If (-Not (Get-NsxService -Name "tcp-1688"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-1688";  New-NsxService -Name "tcp-1688"  -Protocol tcp -port "1688"  -Description "tcp/1688" }
If (-Not (Get-NsxService -Name "tcp-4001"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-4001";  New-NsxService -Name "tcp-4001"  -Protocol tcp -port "4001"  -Description "tcp/4001" }
If (-Not (Get-NsxService -Name "tcp-4002"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-4002";  New-NsxService -Name "tcp-4002"  -Protocol tcp -port "4002"  -Description "tcp/4002" }
If (-Not (Get-NsxService -Name "tcp-5985"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-5985";  New-NsxService -Name "tcp-5985"  -Protocol tcp -port "5985"  -Description "tcp/5985" }
If (-Not (Get-NsxService -Name "tcp-8181"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-8181";  New-NsxService -Name "tcp-8181"  -Protocol tcp -port "8181"  -Description "tcp/8181" }
If (-Not (Get-NsxService -Name "tcp-9427"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-9427";  New-NsxService -Name "tcp-9427"  -Protocol tcp -port "9427"  -Description "tcp/9427" }
If (-Not (Get-NsxService -Name "tcp-22443")) { Write-Host -foregroundcolor "Green" "Creating " "tcp-22443"; New-NsxService -Name "tcp-22443" -Protocol tcp -port "22443" -Description "tcp/22443" }
If (-Not (Get-NsxService -Name "udp-445"))   { Write-Host -foregroundcolor "Green" "Creating " "udp-445";   New-NsxService -Name "udp-445"   -Protocol udp -port "445"   -Description "udp/445" }
If (-Not (Get-NsxService -Name "udp-22443")) { Write-Host -foregroundcolor "Green" "Creating " "udp-22443"; New-NsxService -Name "udp-22443" -Protocol udp -port "22443" -Description "udp/22443" }

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


#Create FW rules
Write-Host -foregroundcolor "Green" "Creating Firewall rules..."
$ruleName = "===== Automaticly created FW rules - start (" + (Get-Date -Format g) + ") ====="
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name $ruleName -Action allow -Disabled -Position bottom

Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "AA DRES robots ->  AA DRES robots" -Source $SG_DRxx_RPA_AA_Desktop_Pool -Destination $SG_DRxx_RPA_AA_Desktop_Pool -Action allow -Service $serviceTcp445 -AppliedTo $SG_DRxx_RPA_AA_Desktop_Pool -Disabled -Position bottom
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "BP SRES GTS Jumpserver -> BP DRES GTS robots" -Source $SG_SRES_RPA_GTS_Jump_Servers -Destination $SG_DRxx_RPA_AA_Desktop_Pool -Action allow -Service $serviceRDP,$serviceTcp135,$serviceTcp445,$serviceTcp8181,$serviceTcp9427,$serviceTcp22443,$serviceUdp22443 -AppliedTo $sres_esg1,$drxx_esg1,$SG_SRES_RPA_GTS_Jump_Servers,$SG_DRxx_RPA_AA_Desktop_Pool -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "BP SRES GTS Horizon server -> BP DRES GTS robots" -Source $SG_SRES_RPA_Horizon_Servers -Destination $SG_DRxx_RPA_AA_Desktop_Pool -Action allow -Service $serviceRDP,$serviceTcp22443 -AppliedTo $sres_esg1,$drxx_esg1,$SG_SRES_RPA_Horizon_Servers,$SG_DRxx_RPA_AA_Desktop_Pool -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "RPA SRES Horizon Server -> BP DRES GTS GoldenImages" -Source $SG_SRES_RPA_Horizon_Servers -Destination $SG_DRxx_RPA_AA_Pool_Images -Action allow -Service $serviceRDP -AppliedTo $sres_esg1,$drxx_esg1,$SG_SRES_RPA_Horizon_Servers,$SG_DRxx_RPA_AA_Pool_Images -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "BP DRES GTS GoldenImages,BP DRES GTS robots -> RPA SRES FileServer" -Source $SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool -Destination $SG_SRES_RPA_FileServers -Action allow -Service $serviceTcp445,$serviceUdp445 -AppliedTo $sres_esg1,$drxx_esg1,$SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool,$SG_SRES_RPA_FileServers -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "BP DRES GTS GoldenImages,BP DRES GTS robots -> RPA SRES AD" -Source $SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool -Destination $SG_SRES_RPA_AD_DNS -Action allow -Service $serviceGrpMSAD,$serviceWin2008 -AppliedTo $sres_esg1,$drxx_esg1,$SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool,$SG_SRES_RPA_AD_DNS -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "RPA SRES AD -> BP DRES GTS GoldenImages,BP DRES GTS robots" -Source $SG_SRES_RPA_AD_DNS -Destination $SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool -Action allow -Service $serviceGrpMSAD,$serviceWin2008 -AppliedTo $sres_esg1,$drxx_esg1,$SG_SRES_RPA_AD_DNS,$SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "BP DRES GTS GoldenImages,BP DRES GTS robots -> RPA SRES AppVol Manager" -Source $SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool -Destination $SG_SRES_RPA_AppVol_Manager -Action allow -Service $serviceHTTPS,$serviceTcp5985 -AppliedTo $sres_esg1,$drxx_esg1,$SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool,$SG_SRES_RPA_AppVol_Manager -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "BP DRES GTS GoldenImages,BP DRES GTS robots -> RPA SRES Horizon Server" -Source $SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool -Destination $SG_SRES_RPA_Horizon_Servers -Action allow -Service $serviceTcp4001,$serviceTcp4002 -AppliedTo $sres_esg1,$drxx_esg1,$SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool,$SG_SRES_RPA_Horizon_Servers -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "BP DRES GTS GoldenImages,BP DRES GTS robot -> RPA SRES KMS server" -Source $SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool -Destination $VM_regsr1rpakms -Action allow -Service $serviceTcp1688 -AppliedTo $sres_esg1,$drxx_esg1,$SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool,$VM_regsr1rpakms -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "BP DRES robots -> Smtp Relay" -Source $SG_DRxx_RPA_AA_Desktop_Pool -Destination $SG_PDR_SMTP_Relay -Action allow -Service $serviceTcp465,$serviceTcp578 -AppliedTo $sres_esg1,$drxx_esg1,$SG_DRxx_RPA_AA_Desktop_Pool,$SG_PDR_SMTP_Relay -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "RPA Controlroom -> BP DRES GTS robots" -Source $SG_SRES_RPA_AA_Controlroom -Destination $SG_DRxx_RPA_AA_Desktop_Pool -Action allow -Service $serviceHTTPS -AppliedTo $sres_esg1,$drxx_esg1,$SG_SRES_RPA_AA_Controlroom,$SG_DRxx_RPA_AA_Desktop_Pool -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "BP DRES GTS GoldenImages,BP DRES GTS robot -> RPA Controlroom" -Source $SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool -Destination $SG_SRES_RPA_AA_Controlroom -Action allow -Service $serviceHTTPS -AppliedTo $sres_esg1,$drxx_esg1,$SG_DRxx_RPA_AA_Pool_Images,$SG_DRxx_RPA_AA_Desktop_Pool,$SG_SRES_RPA_AA_Controlroom -Disabled -Position bottom -EnableLogging
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "Bots to AA Central Analytics Server" -Source $SG_DRxx_RPA_AA_Desktop_Pool -Destination $IpSet_HOST_wssportalinibmcom -Action allow -Service $serviceHTTPS -AppliedTo $agg_esg1,$drxx_esg1,$SG_DRxx_RPA_AA_Desktop_Pool -Disabled -Position bottom -EnableLogging
#Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name "" -Source $ -Destination $ -Action allow -Service $ -AppliedTo $sres_esg1,$drxx_esg1 -Disabled -Position bottom -EnableLogging

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
