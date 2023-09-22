#################################################
##### Create FW Rules for RPA-AA on ISPW    #####
##### (c) Yevgeniy Steblyanko               #####
##### yevgeniy.steblyanko@cz.ibm.com        #####
##### ver 1.0.7,  2.09.2020                 #####
##### allign to RPA-AA-FW-Rules-ver107.xlsx #####
#################################################


### Input parameters from user ###

# RPA deployment model - 1, 2, 3 or 4
$modelNumber = "3"

# Fracnhise ID
$fidName = "FID"

# DRES number (for RPA models 3 & 4 only)
$dresNumber = "00"

### end of user defined parameters ###

### AMS ###
$vCenterServerName = "eu1vc1.eu1.sp.ibm.local"

### WDC ###
#$vCenterServerName = "ag1vc1.ag1.sp.ibm.local"

### PoC ###
#$vCenterServerName = "ag1vc01.poc.ispw.ibm.local"

Write-Host -foregroundcolor "Green" "Script for _Create FW Rules for RPA-AA on ISPW_ started..."

Connect-NsxServer -vCenterServer $vCenterServerName



### Function begin
Function FWRuleCreate {
  param (
    $FWSection,
    $FWRuleName,
    $SourceList,
    $DestinationList,
    $ServiceList,
    $AppliedTo
  )
  Process {
    $AppliedToList = ""
    $AppliedToESGList = ""
    $AppliedToOther = ""

    # split all AlliedTo items by two lists: ESGs and others
    $AppliedToESGList = $AppliedTo | Where-Object {$_.type -eq "gatewayServices"}
    $AppliedToOther = $AppliedTo | Where-Object {$_.type -ne "gatewayServices"}
    If (($AppliedToESGList.ID | Get-Unique).Count -le 1) {
      $AppliedToList = $AppliedToOther
      $EnableLogging = $false
    }
    Else {
      $AppliedToList = $AppliedToESGList + $AppliedToOther
      $EnableLogging = $true
    }

    #### Check if FW rule already exists ###################################

    $SourceListName = $SourceList.name            #list of Sources for new FW rule
    $DestinationListName = $DestinationList.name  #list of Destinations for new FW rule
    $ServiceListName = $ServiceList.name          #list of Services for new FW rule

    #Write-Host "SourceListName="$SourceListName
    $FWRuleExists = 0                             #reset FW rule existance
    $DuplicatedFWRuleName = ""

    ForEach ($FWRule in $FWRuleFullList) {
      $FWSourceName = $FWRule.sources.source.name                 #list of Sources in FW rule
      $FWDestinationName = $FWRule.destinations.destination.name  #list of Destinations in FW rule
      $FWServiceName = $FWRule.services.service.name              #list of Services in FW rule

      If (-Not ($SourceListName | Where-Object {$FWSourceName -notcontains $_}) ) {
        # For the FW rules which contain all sources - Check & compare destinations
        If (-Not ($DestinationListName | Where-Object {$FWDestinationName -notcontains $_})) {
          #For the FW rules which contain all sources & destinations - Check & compare Services
          If (-Not ($ServiceListName | Where-Object {$FWServiceName -notcontains $_})) {
            $FWRuleExists += 1                                    #increase count if rule exists already
            If ($FWRule.Disabled -eq "true") { $FWRuleDisabledStatus = "Disabled" }
            Else { $FWRuleDisabledStatus = "Enabled" }
            $DuplicatedFWRuleName += $FWRule.Name + "("+$FWRuleDisabledStatus+"), "
          }
        }
      }
    }

    #create FW rule
    If ($FWRuleExists -eq 0) {                                  #create FW rule if no existent FW rules found
      If ($EnableLogging) {
        $newRule = Get-NsxFirewallSection $FWSection | New-NsxFirewallRule -Name $FWRuleName -Source $SourceList -Destination $DestinationList -Service $ServiceList -Action allow -AppliedTo $AppliedToList -Disabled -Position bottom -EnableLogging
        Write-Host -foregroundcolor "Yellow" "FW rule created ->" $newRule.Name
      }
      Else {
        $newRule = Get-NsxFirewallSection $FWSection | New-NsxFirewallRule -Name $FWRuleName -Source $SourceList -Destination $DestinationList -Service $ServiceList -Action allow -AppliedTo $AppliedToList -Disabled -Position bottom
        Write-Host -foregroundcolor "Yellow" "FW rule created ->" $newRule.Name
      }
    }
    Else {
      Write-Host "Skipping FW rule creation, at least one duplicate FW rule found: " $DuplicatedFWRuleName
    }
  }
}
### Function end ###


### other parameters ###
Write-Host -foregroundcolor "Green" "Defining variables..."

$errorCode = "0"
$dresName = "DR" + $dresNumber

If (-Not ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3" -Or $modelNumber -eq "4")) {"Wrong model number!"; Exit}

If ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3") {$appServerSegmentName = "SRES-RPA"}
  ElseIf ($modelNumber -eq "4") {$appServerSegmentName = $dresName + "-RPA"}

If ($modelNumber -eq "1") {$botsSegmentName = "SRES-RPA"}
  ElseIf ($modelNumber -eq "2") {$botsSegmentName = "PDR-RPA"}
  ElseIf ($modelNumber -eq "3" -Or $modelNumber -eq "4") {$botsSegmentName = $dresName + "-RPA"}

If ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3") {$FWSec_appServers_Name = "SRES-RPA"}
  ElseIf ($modelNumber -eq "4") {$FWSec_appServers_Name = "DRES" + $dresNumber}

If ($modelNumber -eq "1") {$FWSec_bots_Name = "SRES-RPA"}
  ElseIf ($modelNumber -eq "2") {$FWSec_bots_Name = "PDR-RPA"}
  ElseIf ($modelNumber -eq "3" -Or $modelNumber -eq "4") {$FWSec_bots_Name = "DRES" + $dresNumber}

### Bot VM names ###
If ($modelNumber -eq "1") {$botSrvPrefix = "nls"}
  ElseIf ($modelNumber -eq "2") {$botSrvPrefix = "nlpdr"}
  ElseIf ($modelNumber -eq "3" -And $dresNumber -lt 100) {$botSrvPrefix = "nld"}
  ElseIf ($modelNumber -eq "3" -And $dresNumber -ge 100) {$botSrvPrefix = "nl"}
  ElseIf ($modelNumber -eq "4" -And $dresNumber -lt 100) {$botSrvPrefix = "nld"}
  ElseIf ($modelNumber -eq "4" -And $dresNumber -ge 100) {$botSrvPrefix = "nl"}

  If ($modelNumber -eq "1") {$botSrvDrSuffix = "01"}
    ElseIf ($modelNumber -eq "2") {$botSrvDrSuffix = ""}
    ElseIf ($modelNumber -eq "3" -Or $modelNumber -eq "4") {$botSrvDrSuffix = $dresNumber}

$VM_botProd1_Name = $botSrvPrefix + $botSrvDrSuffix + $fidName + "aapbb"
$VM_botProd2_Name = $botSrvPrefix + $botSrvDrSuffix + $fidName + "aapsb"
$VM_botProd3_Name = $botSrvPrefix + $botSrvDrSuffix + $fidName + "aapgb"
$VM_botUat1_Name  = $botSrvPrefix + $botSrvDrSuffix + $fidName + "aaubb"
$VM_botUat2_Name  = $botSrvPrefix + $botSrvDrSuffix + $fidName + "aausb"
$VM_botUat3_Name  = $botSrvPrefix + $botSrvDrSuffix + $fidName + "aaugb"
$VM_botDev1_Name  = $botSrvPrefix + $botSrvDrSuffix + $fidName + "aadbb"
$VM_botDev2_Name  = $botSrvPrefix + $botSrvDrSuffix + $fidName + "aadsb"
$VM_botDev3_Name  = $botSrvPrefix + $botSrvDrSuffix + $fidName + "aadgb"
$VM_PoolImg_Name  = $botSrvPrefix + $botSrvDrSuffix + $fidName + "aagld"

$VM_jumpServer_Name = "nls01rpards"

### IpSet names
$HOST_wssportal_in_ibm_com_Name = "HOST-wssportal.in.ibm.com"

### Security Group Names ###
$SG_Empty_Name = "SG-Empty"
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_Name = "SG-" + $botsSegmentName + "-AA-" + $fidName + "-Desktop-Pool_PROD"
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_Name = "SG-" + $botsSegmentName + "-AA-" + $fidName + "-Desktop-Pool_UAT"
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_Name = "SG-" + $botsSegmentName + "-AA-" + $fidName + "-Desktop-Pool_DEV"
$SG_bots_xRxx_RPA_AA_FID_Pool_Images_Name = "SG-" + $botsSegmentName + "-AA-" + $fidName + "-Pool-Images"
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_Name = "SG-" + $botsSegmentName + "-AA-" + $fidName + "-Desktop-Pool"
$SG_SRES_RPA_Jump_Servers_Name = "SG-SRES-RPA-Jump-Servers"
$SG_SRES_RPA_FileServers_Name = "SG-SRES-RPA-FileServers"
$SG_SRES_RPA_AD_DNS_Name = "SG-SRES-RPA-AD-DNS"
$SG_SRES_RPA_Horizon_Servers_Name = "SG-SRES-RPA-Horizon-Servers"
$SG_SRES_RPA_AppVol_Manager_Name = "SG-SRES-RPA-AppVol-Manager"
$SG_SRES_RPA_KMSServers_Name = "SG-SRES-RPA-KMSServers"
$SG_PDR_SMTP_Relay_Name = "SG-PDR-SMTP-Relay"
$SG_xRxx_RPA_AA_FID_ControlRoom_Name = "SG-SRES-RPA-AA-ControlRoom"
$SG_xRxx_RPA_AA_FID_UAT_ControlRoom_Name = "SG-SRES-RPA-AA-UAT-ControlRoom"


### Edge Names ###
#EU (AMS) Prod
If ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3") {$ESG_app_Name = "eu1-sres1-esg1"}
  ElseIf ($modelNumber -eq "4") {$ESG_app_Name = "eu1-dr"+$dresNumber+"-esg1"}

If ($modelNumber -eq "1") {$ESG_bots_Name = "eu1-sres1-esg1"}
  ElseIf ($modelNumber -eq "2") {$ESG_bots_Name = "eu1-pdr-esg1"}
  ElseIf ($modelNumber -eq "3" -Or $modelNumber -eq "4") {$ESG_bots_Name = "eu1-dr"+$dresNumber+"-esg1"}

$ESG_SRES_Name = "eu1-sres1-esg1"
$ESG_PDR_Name = "eu1-pdr-esg1"
$ESG_AGG_Name = "eu1-agg-esg1"

#PoC
#$ESG_app_Name = "sres-esg01" #for RPA model 3
#$ESG_bots_Name = "DR88-sn" #for RPA model 3
#$ESG_SRES_Name = "sres-esg01"
#$ESG_PDR_Name = "pdr-esg01"

#Check and create Security Groups
Write-Host -foregroundcolor "Green" "Checking & Creating Security Groups..."
If ( -Not ($SG_Empty                                      = Get-NsxSecurityGroup -Name 	$SG_Empty_Name	) )                                     { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_Empty_Name ; $SG_Empty = New-NsxSecurityGroup -Name 	$SG_Empty_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD = Get-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_Name	) ) { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_Name	; $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD = New-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_Name } Else { Write-Host  -NoNewline "."}
If ( -Not ($SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT  = Get-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_Name	) ) { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_Name	; $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT = New-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV  = Get-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_Name	) ) { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_Name	; $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV = New-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_bots_xRxx_RPA_AA_FID_Pool_Images       = Get-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_AA_FID_Pool_Images_Name	) )       { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_bots_xRxx_RPA_AA_FID_Pool_Images_Name	; $SG_bots_xRxx_RPA_AA_FID_Pool_Images = New-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_AA_FID_Pool_Images_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_bots_xRxx_RPA_AA_FID_Desktop_Pool      = Get-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_Name	) )     { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_Name	; $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool = New-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_Jump_Servers                  = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_Jump_Servers_Name	) )                 { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_Jump_Servers_Name	; $SG_SRES_RPA_Jump_Servers = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_Jump_Servers_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_FileServers                       = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_FileServers_Name	) )                       { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_FileServers_Name	; $SG_SRES_RPA_FileServers = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_FileServers_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_AD_DNS                            = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_AD_DNS_Name	) )                           { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_AD_DNS_Name	; $SG_SRES_RPA_AD_DNS = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_AD_DNS_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_Horizon_Servers                   = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_Horizon_Servers_Name	) )                   { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_Horizon_Servers_Name	; $SG_SRES_RPA_Horizon_Servers = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_Horizon_Servers_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_AppVol_Manager                    = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_AppVol_Manager_Name	) )                   { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_AppVol_Manager_Name	; $SG_SRES_RPA_AppVol_Manager = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_AppVol_Manager_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_KMSServers                        = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_KMSServers_Name	) )                       { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_KMSServers_Name	; $SG_SRES_RPA_KMSServers = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_KMSServers_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_PDR_SMTP_Relay                             = Get-NsxSecurityGroup -Name 	$SG_PDR_SMTP_Relay_Name	) )                             { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_PDR_SMTP_Relay_Name	; $SG_PDR_SMTP_Relay = New-NsxSecurityGroup -Name 	$SG_PDR_SMTP_Relay_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_xRxx_RPA_AA_FID_ControlRoom            = Get-NsxSecurityGroup -Name 	$SG_xRxx_RPA_AA_FID_ControlRoom_Name	) )           { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_xRxx_RPA_AA_FID_ControlRoom_Name	; $SG_xRxx_RPA_AA_FID_ControlRoom = New-NsxSecurityGroup -Name 	$SG_xRxx_RPA_AA_FID_ControlRoom_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_xRxx_RPA_AA_FID_UAT_ControlRoom        = Get-NsxSecurityGroup -Name 	$SG_xRxx_RPA_AA_FID_UAT_ControlRoom_Name	) )       { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_xRxx_RPA_AA_FID_UAT_ControlRoom_Name	; $SG_xRxx_RPA_AA_FID_UAT_ControlRoom = New-NsxSecurityGroup -Name $SG_xRxx_RPA_AA_FID_UAT_ControlRoom_Name } Else { Write-Host -NoNewline "."}


### Get information about VMs ###
#Write-Host -foregroundcolor "Green" "`nGetting VMs..."
#If ( -Not ($VM_jumpServer = Get-VM -Name $VM_jumpServer_Name -ErrorAction SilentlyContinue) ) { Write-Host -foregroundcolor "Red" "VM " $VM_jumpServer_Name " does not exist, please add VM to SG manually after VM deployment." } Else { Write-Host -NoNewline "."}

### Get information about IpSets
Write-Host -foregroundcolor "Green" "`nGetting IpSets..."
If ( -Not ($HOST_wssportal_in_ibm_com        = Get-NsxIpSet -Name 	$HOST_wssportal_in_ibm_com_Name	) )       { Write-Host -foregroundcolor "Yellow" "Creating " 	$HOST_wssportal_in_ibm_com_Name	; $HOST_wssportal_in_ibm_com = New-NsxIpSet -Name $HOST_wssportal_in_ibm_com_Name } Else { Write-Host -NoNewline "."}

### Get information about Edges ###
Write-Host -foregroundcolor "Green" "`nGetting info for NSX ESGs..."
If ( -Not ($ESG_app = Get-NsxEdge -Name $ESG_app_Name) )    { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_app_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ( -Not ($ESG_bots = Get-NsxEdge -Name $ESG_bots_Name) )  { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_bots_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ( -Not ($ESG_SRES = Get-NsxEdge -Name $ESG_SRES_Name) )  { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_SRES_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ( -Not ($ESG_PDR = Get-NsxEdge -Name $ESG_PDR_Name) )    { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_PDR_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ( -Not ($ESG_AGG = Get-NsxEdge -Name $ESG_AGG_Name) )    { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_AGG_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ($errorCode -ne "0") { Write-Host -foregroundcolor "Red" "Stopping the script."; Exit }


#Check and create custom services
Write-Host -foregroundcolor "Green" "`nChecking & Creating services/service groups..."
#If (-Not (Get-NsxService -Name "tcp-")) { Write-Host -foregroundcolor "Green" "Creating " "tcp-"; New-NsxService -Name "tcp-" -Protocol tcp -port "" -Description "tcp/" }
If (-Not ($serviceTcp135          = Get-NsxService -Name "tcp-135"))          { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-135";         $serviceTcp135          = New-NsxService -Name "tcp-135"          -Protocol tcp -port "135"          -Description "tcp/135" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp445          = Get-NsxService -Name "tcp-445"))          { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-445";         $serviceTcp445          = New-NsxService -Name "tcp-445"          -Protocol tcp -port "445"          -Description "tcp/445" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp1688         = Get-NsxService -Name "tcp-1688"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-1688";        $serviceTcp1688         = New-NsxService -Name "tcp-1688"         -Protocol tcp -port "1688"         -Description "tcp/1688" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp4001         = Get-NsxService -Name "tcp-4001"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-4001";        $serviceTcp4001         = New-NsxService -Name "tcp-4001"         -Protocol tcp -port "4001"         -Description "tcp/4001" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp4002         = Get-NsxService -Name "tcp-4002"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-4002";        $serviceTcp4002         = New-NsxService -Name "tcp-4002"         -Protocol tcp -port "4002"         -Description "tcp/4002" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp5985         = Get-NsxService -Name "tcp-5985"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-5985";        $serviceTcp5985         = New-NsxService -Name "tcp-5985"         -Protocol tcp -port "5985"         -Description "tcp/5985" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp8181         = Get-NsxService -Name "tcp-8181"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-8181";        $serviceTcp8181         = New-NsxService -Name "tcp-8181"         -Protocol tcp -port "8181"         -Description "tcp/8181" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp9427         = Get-NsxService -Name "tcp-9427"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-9427";        $serviceTcp9427         = New-NsxService -Name "tcp-9427"         -Protocol tcp -port "9427"         -Description "tcp/9427" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp22443        = Get-NsxService -Name "tcp-22443"))        { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-22443";       $serviceTcp22443        = New-NsxService -Name "tcp-22443"        -Protocol tcp -port "22443"        -Description "tcp/22443" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceUdp445          = Get-NsxService -Name "udp-445"))          { Write-Host -foregroundcolor "Yellow" "Creating " "udp-445";         $serviceUdp445          = New-NsxService -Name "udp-445"          -Protocol udp -port "445"          -Description "udp/445" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceUdp22443        = Get-NsxService -Name "udp-22443"))        { Write-Host -foregroundcolor "Yellow" "Creating " "udp-22443";       $serviceUdp22443        = New-NsxService -Name "udp-22443"        -Protocol udp -port "22443"        -Description "udp/22443" } Else { Write-Host -NoNewline "."}


#Use existent services
$serviceRDP     = Get-NsxService -Name "RDP" -LocalOnly; Write-Host -NoNewline "."
$serviceHTTPS   = Get-NsxService -Name "HTTPS" -LocalOnly; Write-Host -NoNewline "."
$serviceSMTP    = Get-NsxService -Name "SMTP" -LocalOnly; Write-Host -NoNewline "."
$serviceWin2008 = Get-NsxService -Name "Win 2008 - RPC, DCOM, EPM, DRSUAPI, NetLogonR, SamR, FRS" -LocalOnly; Write-Host -NoNewline "."

#Use existent service groups
$serviceGrpMSAD = Get-NsxServiceGroup -Name "Microsoft Active Directory" -LocalOnly; Write-Host -NoNewline "."

### Get All FW rules
Write-Host -foregroundcolor "Green" "`nReading all Firewall rules..."
$FWRuleFullList = Get-NsxFirewallRule


### FW rules ###
Write-Host -foregroundcolor "Green" "Creating Firewall rules..."
#Check and create xRES FW rule section for appServers
If ( -Not (Get-NsxFirewallSection -Name $FWSec_appServers_Name) ) { Write-Host -foregroundcolor "Yellow" "Creating xRES FW Section (App servers): " $FWSec_appServers_Name; $newRule = New-NsxFirewallSection -Name $FWSec_appServers_Name -Position bottom }

#Create AppServers FW rules
$newRule = Get-NsxFirewallSection $FWSec_appServers_Name | New-NsxFirewallRule -Name ("===== Automaticly created FW rules (App servers) - start (" + (Get-Date -Format g) + ") =====") -Source $SG_Empty -Destination $SG_Empty -AppliedTo $SG_Empty -Action allow -Disabled -Position bottom
Write-Host "FW rule created ("$FWSec_appServers_Name" )->" $newRule.Name

### example ###
#$FWRuleName1 =
#$Src1 =
#$Dest1 =
#$Service1 =
#$AppliedTo1 =
#$AppliedTo1 += $Src1 + $Dest1
#FWRuleCreate -FWSection $FWSec_appServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "RPA Controlroom-> AA xRES robots"
$Src1 = $SG_xRxx_RPA_AA_FID_ControlRoom, $SG_xRxx_RPA_AA_FID_UAT_ControlRoom
$Dest1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
$Service1 = $serviceHTTPS
$AppliedTo1 = $ESG_app, $ESG_bots, $SG_xRxx_RPA_AA_FID_ControlRoom, $SG_xRxx_RPA_AA_FID_UAT_ControlRoom, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
FWRuleCreate -FWSection $FWSec_appServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "AA xRES GoldenImages, AA xRES robot -> RPA Controlroom"
$Src1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images
$Dest1 = $SG_xRxx_RPA_AA_FID_ControlRoom, $SG_xRxx_RPA_AA_FID_UAT_ControlRoom
$Service1 = $serviceHTTPS
$AppliedTo1 = $ESG_app, $ESG_bots, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images, $SG_xRxx_RPA_AA_FID_ControlRoom, $SG_xRxx_RPA_AA_FID_UAT_ControlRoom
FWRuleCreate -FWSection $FWSec_appServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1


$newRule = Get-NsxFirewallSection $FWSec_appServers_Name | New-NsxFirewallRule -Name ("===== Automaticly created FW rules (App servers) - end (" + (Get-Date -Format g) + ") =====") -Source $SG_Empty -Destination $SG_Empty -AppliedTo $SG_Empty -Action allow -Disabled -Position bottom
Write-Host "FW rule created ("$FWSec_appServers_Name" )->" $newRule.Name

#Check and create xRES FW rule section for botsServers
If ( -Not (Get-NsxFirewallSection -Name $FWSec_bots_Name) ) { Write-Host -foregroundcolor "Yellow" "Creating xRES FW Section (Bots): " $FWSec_bots_Name; $newRule = New-NsxFirewallSection -Name $FWSec_bots_Name -Position bottom }

#Create Bots FW rules
$newRule = Get-NsxFirewallSection $FWSec_bots_Name | New-NsxFirewallRule -Name ("===== Automaticly created FW rules (Bots) - start (" + (Get-Date -Format g) + ") =====") -Source $SG_Empty -Destination $SG_Empty -AppliedTo $SG_Empty -Action allow -Disabled -Position bottom
Write-Host "FW rule created ("$FWSec_bots_Name" )->" $newRule.Name

### example ###
#$FWRuleName1 = ""
#$Src1 =
#$Dest1 =
#$Service1 =
#$AppliedTo1 =
#FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "RPA SRES Jumpserver -> AA xRES robots"
$Src1 = $SG_SRES_RPA_Jump_Servers
$Dest1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
$Service1 = $serviceRDP, $serviceTcp135, $serviceTcp445, $serviceTcp8181, $serviceTcp9427, $serviceTcp22443, $serviceUdp22443
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_Jump_Servers, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

#$FWRuleName1 = "RPA SRES Horizon server -> AA xRES robots"
#$Src1 = $SG_SRES_RPA_Horizon_Servers
#$Dest1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
#$Service1 = $serviceRDP, $serviceTcp22443
#$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_Horizon_Servers, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
#FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

#$FWRuleName1 = "RPA SRES Horizon Server -> AA xRES GoldenImages"
#$Src1 = $SG_SRES_RPA_Horizon_Servers
#$Dest1 = $SG_bots_xRxx_RPA_AA_FID_Pool_Images
#$Service1 = $serviceRDP
#$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_Horizon_Servers, $SG_bots_xRxx_RPA_AA_FID_Pool_Images
#FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "AA xRES GoldenImages, robots -> RPA SRES FileServer"
$Src1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images
$Dest1 = $SG_SRES_RPA_FileServers
$Service1 = $serviceTcp445, $serviceUdp445
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images, $SG_SRES_RPA_FileServers
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "AA xRES GoldenImages, robots -> RPA SRES AD"
$Src1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images
$Dest1 = $SG_SRES_RPA_AD_DNS
$Service1 = $serviceGrpMSAD, $serviceWin2008
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images, $SG_SRES_RPA_AD_DNS
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "RPA SRES AD -> AA xRES GoldenImages, robots"
$Src1 = $SG_SRES_RPA_AD_DNS
$Dest1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images
$Service1 = $serviceGrpMSAD, $serviceWin2008
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_AD_DNS, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

#$FWRuleName1 = "AA xRES GoldenImages, robots -> RPA SRES AppVol Manager"
#$Src1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images
#$Dest1 = $SG_SRES_RPA_AppVol_Manager
#$Service1 = $serviceHTTPS, $serviceTcp5985
#$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images, $SG_SRES_RPA_AppVol_Manager
#FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

#$FWRuleName1 = "AA xRES GoldenImages, robots -> RPA SRES Horizon Server"
#$Src1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images
#$Dest1 = $SG_SRES_RPA_Horizon_Servers
#$Service1 = $serviceTcp4001, $serviceTcp4002
#$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images, $SG_SRES_RPA_Horizon_Servers
#FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "AA xRES GoldenImages, robot -> RPA SRES KMS server"
$Src1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images
$Dest1 = $SG_SRES_RPA_KMSServers
$Service1 = $serviceTcp1688
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_bots_xRxx_RPA_AA_FID_Pool_Images, $SG_SRES_RPA_KMSServers
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "AA xRES robots -> SMTP Relay"
$Src1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
$Dest1 = $SG_PDR_SMTP_Relay
$Service1 = $serviceSMTP
$AppliedTo1 = $ESG_PDR, $ESG_bots, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool, $SG_PDR_SMTP_Relay
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "AA xRES robots -> AA xRES robots"
$Src1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
$Dest1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
$Service1 = $serviceTcp445
$AppliedTo1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "Bots to AA Central Analytics Server"
$Src1 = $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
$Dest1 = $HOST_wssportal_in_ibm_com
$Service1 = $serviceHTTPS
$AppliedTo1 = $ESG_bots, $ESG_AGG, $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$newRule = Get-NsxFirewallSection $FWSec_bots_Name | New-NsxFirewallRule -Name ("===== Automaticly created FW rules (Bots) - end (" + (Get-Date -Format g) + ") =====") -Source $SG_Empty -Destination $SG_Empty -AppliedTo $SG_Empty -Action allow -Disabled -Position bottom
Write-Host "FW rule created ("$FWSec_bots_Name" )->" $newRule.Name

### Adding members to Security Groups
Write-Host -foregroundcolor "Yellow" "Adding members to Security Groups..."
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_ListName1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botProd1_Name)
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_ListName2 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botProd2_Name)
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_ListName3 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botProd3_Name)
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_ListName1,$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_ListName2,$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_ListName3

$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_ListName1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botUat1_Name)
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_ListName2 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botUat2_Name)
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_ListName3 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botUat3_Name)
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_ListName1,$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_ListName2,$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_ListName3

$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_ListName1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botDev1_Name)
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_ListName2 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botDev2_Name)
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_ListName3 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botDev3_Name)
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_ListName1,$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_ListName2,$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_ListName3

$SG_bots_xRxx_RPA_AA_FID_Pool_Images_ListName1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_PoolImg_Name)
$SG_bots_xRxx_RPA_AA_FID_Pool_Images | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $SG_bots_xRxx_RPA_AA_FID_Pool_Images_ListName1

$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool | Add-NsxSecurityGroupMember -Member $SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD,$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT,$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV
#If ($VM_jumpServer) { $SG_SRES_RPA_JHS_Jump_Servers | Add-NsxSecurityGroupMember -Member $VM_jumpServer } Else { Write-Host -foregroundcolor "Red" "Jump host VM "$VM_jumpServer_Name" was not found in environment, canot add it to "$SG_SRES_RPA_JHS_Jump_Servers_Name }


Disconnect-NsxServer -vCenterServer $vCenterServerName

Write-Host -foregroundcolor "Green" "Script completed!"





### Some debug output to the screen
Write-Host -foregroundcolor "Blue" "### Debug Info ###"

"modelNumber =            " + $modelNumber
"dresName =               " + $dresName
"appServerSegmentName =   " + $appServerSegmentName
"botsSegmentName =        " + $botsSegmentName
"FWSec_appServers_Name =  " + $FWSec_appServers_Name
"FWSec_bots_Name =        " + $FWSec_bots_Name
#"VM_jumpServer_Name =     " + $VM_jumpServer_Name

"Groups to check membership:"
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_PROD_Name
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_UAT_Name
$SG_bots_xRxx_RPA_AA_FID_Desktop_Pool_DEV_Name
$SG_bots_xRxx_RPA_AA_FID_Pool_Images_Name
"End groups to check membership"

Exit
