#################################################
##### Create FW Rules for RPA-UP on ISPW    #####
##### (c) Yevgeniy Steblyanko               #####
##### yevgeniy.steblyanko@cz.ibm.com        #####
##### ver 1.0.8,  23.10.2020                #####
##### allign to RPA-UP-FW-Rules-ver108.xlsx #####
#################################################


### Input parameters from user ###
$modelNumber            = "1"                             # RPA deployment model - 1, 2, 3 or 4
$eidName                = "EID"                           # Environment ID
$fidName                = "FID"                           # Fracnhise ID
$dresNumber             = "00"                            # DRES number (for RPA models 3 & 4 only)
$DRESjumpHostRequired   = "no"                            # Is JumpHost in DRES required? (for model 4 only), "yes" or "no"
$LB_OrcProdSrv_required = "no"                            # Is LoadBalancer required? (for models 1, 2, 3 only), "yes" or "no"
$LB_OrcProdSrv_IP       = "100.79.244.x or 100.72.x.x"    # if LB_OrcProdSrv_required = yes -> real IP address in SRES-RPA-SRV (100.79.244.0/22) for Models 1-3 or DRES (100.72.x.x/24) for Model 4
$LB_DRES_Primary_IP     = "100.72.x.x"                    # if LB_OrcProdSrv_required = yes -> real IP address in DRES (100.72.x.x/24) for DRES-LB
### end of user defined parameters ###


$vCenterServerName = "eu1vc1.eu1.sp.ibm.local"            ### AMS ###
Write-Host -foregroundcolor "Green" "Script for _Create FW Rules for RPA-UP on ISPW_ started..."
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

If (-Not ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3" -Or $modelNumber -eq "4")) {Write-Host -foregroundcolor "Red" "Wrong model number!"; Exit}

If ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3") {$orcServerSegmentName = "SRES-RPA-SRV"}
  ElseIf ($modelNumber -eq "4") {$orcServerSegmentName = $dresName + "-RPA"}

If ($modelNumber -eq "1") {$botsSegmentName = "SRES-RPA"}
  ElseIf ($modelNumber -eq "2") {$botsSegmentName = "PDR-RPA"}
  ElseIf ($modelNumber -eq "3" -Or $modelNumber -eq "4") {$botsSegmentName = $dresName + "-RPA"}

If ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3") {$FWSec_orcServers_Name = "SRES-RPA-SRV"}
  ElseIf ($modelNumber -eq "4") {$FWSec_orcServers_Name = "DRES" + $dresNumber}

If ($modelNumber -eq "1") {$FWSec_bots_Name = "SRES-RPA"}
  ElseIf ($modelNumber -eq "2") {$FWSec_bots_Name = "PDR-RPA"}
  ElseIf ($modelNumber -eq "3" -Or $modelNumber -eq "4") {$FWSec_bots_Name = "DRES" + $dresNumber}

### Orc VM names ###
If ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3") {$orcSrvPrefix = "nls"}
ElseIf ($modelNumber -eq "4" -And $dresNumber -lt 100) {$orcSrvPrefix = "nld"}
ElseIf ($modelNumber -eq "4" -And $dresNumber -ge 100) {$orcSrvPrefix = "nl"}

If ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3") {$orcSrvDrSuffix = "01"}
  ElseIf ($modelNumber -eq "4") {$orcSrvDrSuffix = $dresNumber}

If ($modelNumber -eq "4")
{
  If (-Not ($DRESjumpHostRequired -eq "yes" -Or $DRESjumpHostRequired -eq "no"))
  {
    Write-Host -foregroundcolor "Red" "Wrong DRESjumpHostRequired parameter value!"; Exit
  }
}


$VM_orcDev_Name = $orcSrvPrefix + $orcSrvDrSuffix + $eidName + "updor01"
$VM_orcUat_Name = $orcSrvPrefix + $orcSrvDrSuffix + $eidName + "upuor01"
$VM_orcProd_Name = $orcSrvPrefix + $orcSrvDrSuffix + $eidName + "uppor01"

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

$VM_botProd1_Name       = $botSrvPrefix + $botSrvDrSuffix + $fidName + "uppbb"
$VM_botProd2_Name       = $botSrvPrefix + $botSrvDrSuffix + $fidName + "uppsb"
$VM_botProd3_Name       = $botSrvPrefix + $botSrvDrSuffix + $fidName + "uppgb"
$VM_botUat1_Name        = $botSrvPrefix + $botSrvDrSuffix + $fidName + "upubb"
$VM_botUat2_Name        = $botSrvPrefix + $botSrvDrSuffix + $fidName + "upusb"
$VM_botUat3_Name        = $botSrvPrefix + $botSrvDrSuffix + $fidName + "upugb"
$VM_botDev1_Name        = $botSrvPrefix + $botSrvDrSuffix + $fidName + "updbb"
$VM_botDev2_Name        = $botSrvPrefix + $botSrvDrSuffix + $fidName + "updsb"
$VM_botDev3_Name        = $botSrvPrefix + $botSrvDrSuffix + $fidName + "updgb"
$VM_PoolImg_Name        = $botSrvPrefix + $botSrvDrSuffix + $fidName + "upgld"
$VM_DRES_JumpHosts_Name = "nld" + $botSrvDrSuffix + $eidName + "upjmp"

### IpSet names ###
$HOST_SRES_RPA_APPVOL_HA_VIP_Name = "HOST-SRES-RPA-APPVOL-HA-VIP"
$HOST_SRES_RPA_CONSRV_HA_VIP_Name = "HOST-SRES-RPA-CONSRV-HA-VIP"
$HOST_xRES_RPA_LB1_PrimaryIP_Name = "HOST-" + $orcServerSegmentName + "-LB1-PrimaryIP"
If ($LB_OrcProdSrv_required -eq "yes") {$HOST_xRES_RPA_OrcSrv_EID_HA_VIP_Name = "HOST-" + $orcServerSegmentName + "-OrcSrv-" + $eidName + "-HA-VIP"}
$HOST_SRES_RPA_WPAD_LB_VIP_Name = "HOST-SRES-RPA-WPAD-LB-VIP"


### Security Group Names ###
$SG_Empty_Name = "SG-Empty"
$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD_Name = "SG-" + $botsSegmentName + "-UP-"+ $eidName + "-" + $fidName + "-Desktop-Pool_PROD"
$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT_Name = "SG-" + $botsSegmentName + "-UP-"+ $eidName + "-" + $fidName + "-Desktop-Pool_UAT"
$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV_Name = "SG-" + $botsSegmentName + "-UP-"+ $eidName + "-" + $fidName + "-Desktop-Pool_DEV"
$SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images_Name = "SG-" + $botsSegmentName + "-UP-"+ $eidName + "-" + $fidName + "-Pool-Images"
$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_Name = "SG-" + $botsSegmentName + "-UP-"+ $eidName + "-" + $fidName + "-Desktop-Pool"
$SG_orc_xDxx_RPA_UP_EID_OrcServers_Name = "SG-" + $orcServerSegmentName + "-UP-"+ $eidName + "-OrcServers"
$SG_orcDevSrv_Name = "SG-" + $orcServerSegmentName + "-UP-"+ $eidName + "-OrcDevSrv"
$SG_orcUatSrv_Name = "SG-" + $orcServerSegmentName + "-UP-"+ $eidName + "-OrcUatSrv"
$SG_orcProdSrv_Name = "SG-" + $orcServerSegmentName + "-UP-"+ $eidName + "-OrcProdSrv"
$SG_DRxx_RPA_EID_Jump_Servers_Name = "SG-" + $dresName + "-RPA-UP-"+ $eidName + "-Jump-Servers"
$SG_SRES_RPA_Jump_Servers_Name = "SG-SRES-RPA-Jump-Servers"
$SG_SRES_RPA_FileServers_Name = "SG-SRES-RPA-FileServers"
$SG_SRES_RPA_SQL_Name = "SG-SRES-RPA-SQL"
$SG_SRES_RPA_AD_DNS_Name = "SG-SRES-RPA-AD-DNS"
$SG_SRES_RPA_Horizon_Servers_Name = "SG-SRES-RPA-Horizon-Servers"
$SG_SRES_RPA_AppVol_Manager_Name = "SG-SRES-RPA-AppVol-Manager"
$SG_SRES_RPA_KMSServers_Name = "SG-SRES-RPA-KMSServers"
$SG_PDR_SMTP_Relay_Name = "SG-PDR-SMTP-Relay"
$SG_SRES_RPA_WPAD_Servers_Name = "SG-SRES-RPA-WPAD-Servers"

### Edge Names ###
#EU (AMS) Prod
If ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3") {$ESG_orc_Name = "eu1-sres1-esg1"}
  ElseIf ($modelNumber -eq "4") {$ESG_orc_Name = "eu1-dr"+$dresNumber+"-esg1"}

If ($modelNumber -eq "1") {$ESG_bots_Name = "eu1-sres1-esg1"}
  ElseIf ($modelNumber -eq "2") {$ESG_bots_Name = "eu1-pdr-esg1"}
  ElseIf ($modelNumber -eq "3" -Or $modelNumber -eq "4") {$ESG_bots_Name = "eu1-dr"+$dresNumber+"-esg1"}

$ESG_SRES_Name              = "eu1-sres1-esg1"
$ESG_SRES_LB_Name           = "eu1-sres1-lb1"
$ESG_PDR_Name               = "eu1-pdr-esg1"

If ($LB_OrcProdSrv_required -eq "yes") {
  If ($modelNumber -eq "1" -Or $modelNumber -eq "2" -Or $modelNumber -eq "3") {$ESG_xRES_RPA_SRV_LB_Name = "eu1-sres-rpa-srv-lb1"}
    ElseIf ($modelNumber -eq "4") {$ESG_xRES_RPA_SRV_LB_Name = "eu1-dr"+$dresNumber+"-lb1"}
}



#Check and create Security Groups
Write-Host -foregroundcolor "Green" "Checking & Creating Security Groups..."
#If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name) ) { Write-Host -foregroundcolor "Yellow" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name }
If ( -Not ($SG_Empty                                      = Get-NsxSecurityGroup -Name 	$SG_Empty_Name	) )                                     { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_Empty_Name ; $SG_Empty = New-NsxSecurityGroup -Name 	$SG_Empty_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD = Get-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD_Name	) ) { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD_Name	; $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD = New-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD_Name } Else { Write-Host  -NoNewline "."}
If ( -Not ($SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT  = Get-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT_Name	) ) { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT_Name	; $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT = New-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV  = Get-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV_Name	) ) { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV_Name	; $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV = New-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images       = Get-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images_Name	) )       { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images_Name	; $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images = New-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool      = Get-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_Name	) )     { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_Name	; $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool = New-NsxSecurityGroup -Name 	$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_orc_xDxx_RPA_UP_EID_OrcServers             = Get-NsxSecurityGroup -Name 	$SG_orc_xDxx_RPA_UP_EID_OrcServers_Name	) )             { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_orc_xDxx_RPA_UP_EID_OrcServers_Name	; $SG_orc_xDxx_RPA_UP_EID_OrcServers = New-NsxSecurityGroup -Name 	$SG_orc_xDxx_RPA_UP_EID_OrcServers_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_orcDevSrv                                  = Get-NsxSecurityGroup -Name 	$SG_orcDevSrv_Name	) )                                 { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_orcDevSrv_Name	; $SG_orcDevSrv = New-NsxSecurityGroup -Name 	$SG_orcDevSrv_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_orcUatSrv                                  = Get-NsxSecurityGroup -Name 	$SG_orcUatSrv_Name	) )                                 { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_orcUatSrv_Name	; $SG_orcUatSrv = New-NsxSecurityGroup -Name 	$SG_orcUatSrv_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_orcProdSrv                                 = Get-NsxSecurityGroup -Name 	$SG_orcProdSrv_Name	) )                                 { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_orcProdSrv_Name	; $SG_orcProdSrv = New-NsxSecurityGroup -Name 	$SG_orcProdSrv_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_Jump_Servers                      = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_Jump_Servers_Name	) )                     { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_Jump_Servers_Name	; $SG_SRES_RPA_Jump_Servers = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_Jump_Servers_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_FileServers                       = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_FileServers_Name	) )                       { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_FileServers_Name	; $SG_SRES_RPA_FileServers = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_FileServers_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_SQL                               = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_SQL_Name	) )                               { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_SQL_Name	; $SG_SRES_RPA_SQL = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_SQL_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_AD_DNS                            = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_AD_DNS_Name	) )                           { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_AD_DNS_Name	; $SG_SRES_RPA_AD_DNS = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_AD_DNS_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_Horizon_Servers                   = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_Horizon_Servers_Name	) )                   { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_Horizon_Servers_Name	; $SG_SRES_RPA_Horizon_Servers = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_Horizon_Servers_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_AppVol_Manager                    = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_AppVol_Manager_Name	) )                   { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_AppVol_Manager_Name	; $SG_SRES_RPA_AppVol_Manager = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_AppVol_Manager_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_KMSServers                        = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_KMSServers_Name	) )                       { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_KMSServers_Name	; $SG_SRES_RPA_KMSServers = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_KMSServers_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_PDR_SMTP_Relay                             = Get-NsxSecurityGroup -Name 	$SG_PDR_SMTP_Relay_Name	) )                             { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_PDR_SMTP_Relay_Name	; $SG_PDR_SMTP_Relay = New-NsxSecurityGroup -Name 	$SG_PDR_SMTP_Relay_Name } Else { Write-Host -NoNewline "."}
If ( -Not ($SG_SRES_RPA_WPAD_Servers                      = Get-NsxSecurityGroup -Name 	$SG_SRES_RPA_WPAD_Servers_Name	) )                     { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_SRES_RPA_WPAD_Servers_Name	; $SG_SRES_RPA_WPAD_Servers = New-NsxSecurityGroup -Name 	$SG_SRES_RPA_WPAD_Servers_Name } Else { Write-Host -NoNewline "."}

# Only for "Model = 4" and $DRESjumpHostRequired = "yes"
If ($modelNumber -eq "4" -And $DRESjumpHostRequired -eq "yes")
{
  If ( -Not ($SG_DRxx_RPA_EID_Jump_Servers                = Get-NsxSecurityGroup -Name 	$SG_DRxx_RPA_EID_Jump_Servers_Name	) )                 { Write-Host -foregroundcolor "Yellow" "Creating " 	$SG_DRxx_RPA_EID_Jump_Servers_Name	; $SG_DRxx_RPA_EID_Jump_Servers = New-NsxSecurityGroup -Name 	$SG_DRxx_RPA_EID_Jump_Servers_Name } Else { Write-Host -NoNewline "."}
}


### Get information about VMs ###
Write-Host -foregroundcolor "Green" "`nGetting VMs..."
If ( -Not ($VM_orcDev = Get-VM -Name $VM_orcDev_Name -ErrorAction SilentlyContinue) )         { Write-Host -foregroundcolor "Red" "VM " $VM_orcDev_Name " does not exist, please add VM to SG manually after VM deployment." } Else { Write-Host -NoNewline "."}
If ( -Not ($VM_orcUat = Get-VM -Name $VM_orcUat_Name -ErrorAction SilentlyContinue) )         { Write-Host -foregroundcolor "Red" "VM " $VM_orcUat_Name " does not exist, please add VM to SG manually after VM deployment." } Else { Write-Host -NoNewline "."}
If ( -Not ($VM_orcProd = Get-VM -Name $VM_orcProd_Name -ErrorAction SilentlyContinue) )       { Write-Host -foregroundcolor "Red" "VM " $VM_orcProd_Name " does not exist, please add VM to SG manually after VM deployment." } Else { Write-Host -NoNewline "."}

### Get information about IpSets ###
Write-Host -foregroundcolor "Green" "`nGetting IpSets..."
If ( -Not ($HOST_SRES_RPA_APPVOL_HA_VIP         = Get-NsxIpSet -Name 	$HOST_SRES_RPA_APPVOL_HA_VIP_Name	) )           { Write-Host -foregroundcolor "Yellow" "Creating " 	$HOST_SRES_RPA_APPVOL_HA_VIP_Name	; $HOST_SRES_RPA_APPVOL_HA_VIP = New-NsxIpSet -Name $HOST_SRES_RPA_APPVOL_HA_VIP_Name -IPAddress "158.87.52.138" } Else { Write-Host -NoNewline "."}
If ( -Not ($HOST_SRES_RPA_CONSRV_HA_VIP         = Get-NsxIpSet -Name 	$HOST_SRES_RPA_CONSRV_HA_VIP_Name	) )           { Write-Host -foregroundcolor "Yellow" "Creating " 	$HOST_SRES_RPA_CONSRV_HA_VIP_Name	; $HOST_SRES_RPA_CONSRV_HA_VIP = New-NsxIpSet -Name $HOST_SRES_RPA_CONSRV_HA_VIP_Name -IPAddress "158.87.52.137" } Else { Write-Host -NoNewline "."}
If ($LB_OrcProdSrv_required -eq "yes") {
  If ( -Not ($HOST_xRES_RPA_LB1_PrimaryIP       = Get-NsxIpSet -Name 	$HOST_xRES_RPA_LB1_PrimaryIP_Name	) )           { Write-Host -foregroundcolor "Yellow" "Creating " 	$HOST_xRES_RPA_LB1_PrimaryIP_Name	; $HOST_xRES_RPA_LB1_PrimaryIP = New-NsxIpSet -Name $HOST_xRES_RPA_LB1_PrimaryIP_Name -IPAddress $LB_DRES_Primary_IP } Else { Write-Host -NoNewline "."}
}
If ($LB_OrcProdSrv_required -eq "yes") {
  If ( -Not ($HOST_xRES_RPA_OrcSrv_EID_HA_VIP   = Get-NsxIpSet -Name 	$HOST_xRES_RPA_OrcSrv_EID_HA_VIP_Name	) )       { Write-Host -foregroundcolor "Yellow" "Creating " 	$HOST_xRES_RPA_OrcSrv_EID_HA_VIP_Name	; $HOST_xRES_RPA_OrcSrv_EID_HA_VIP = New-NsxIpSet -Name $HOST_xRES_RPA_OrcSrv_EID_HA_VIP_Name -IPAddress $LB_OrcProdSrv_IP } Else { Write-Host -NoNewline "."}
}
If ( -Not ($HOST_SRES_RPA_WPAD_LB_VIP         = Get-NsxIpSet -Name 	$HOST_SRES_RPA_WPAD_LB_VIP_Name	) )           { Write-Host -foregroundcolor "Yellow" "Creating " 	$HOST_SRES_RPA_WPAD_LB_VIP_Name	; $HOST_SRES_RPA_WPAD_LB_VIP = New-NsxIpSet -Name $HOST_SRES_RPA_WPAD_LB_VIP_Name -IPAddress "158.87.52.109" } Else { Write-Host -NoNewline "."}


### Get information about Edges ###
Write-Host -foregroundcolor "Green" "`nGetting info for NSX ESGs..."
If ( -Not ($ESG_orc               = Get-NsxEdge -Name $ESG_orc_Name) )                { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_orc_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ( -Not ($ESG_bots              = Get-NsxEdge -Name $ESG_bots_Name) )               { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_bots_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ( -Not ($ESG_SRES              = Get-NsxEdge -Name $ESG_SRES_Name) )               { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_SRES_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ( -Not ($ESG_SRES_LB           = Get-NsxEdge -Name $ESG_SRES_LB_Name) )            { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_SRES_LB_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ( -Not ($ESG_PDR               = Get-NsxEdge -Name $ESG_PDR_Name) )                { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_PDR_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ( -Not ($ESG_xRES_RPA_SRV_LB   = Get-NsxEdge -Name $ESG_xRES_RPA_SRV_LB_Name) )    { Write-Host -foregroundcolor "Red" "NSX Edge " $ESG_xRES_RPA_SRV_LB_Name " does not exist, can not continue."; $errorCode = "1" } Else { Write-Host -NoNewline "."}
If ($errorCode -ne "0") { Write-Host -foregroundcolor "Red" "Stopping the script."; Exit }


#Check and create custom services
Write-Host -foregroundcolor "Green" "`nChecking & Creating services/service groups..."
#If (-Not (Get-NsxService -Name "tcp-")) { Write-Host -foregroundcolor "Green" "Creating " "tcp-"; New-NsxService -Name "tcp-" -Protocol tcp -port "" -Description "tcp/" }
If (-Not ($serviceTcp135          = Get-NsxService -Name "tcp-135"))          { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-135";         $serviceTcp135          = New-NsxService -Name "tcp-135"          -Protocol tcp -port "135"          -Description "tcp/135" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp137          = Get-NsxService -Name "tcp-137"))          { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-137";         $serviceTcp137          = New-NsxService -Name "tcp-137"          -Protocol tcp -port "137"          -Description "tcp/137" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp138          = Get-NsxService -Name "tcp-138"))          { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-138";         $serviceTcp138          = New-NsxService -Name "tcp-138"          -Protocol tcp -port "138"          -Description "tcp/138" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp139          = Get-NsxService -Name "tcp-139"))          { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-139";         $serviceTcp139          = New-NsxService -Name "tcp-139"          -Protocol tcp -port "139"          -Description "tcp/139" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp445          = Get-NsxService -Name "tcp-445"))          { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-445";         $serviceTcp445          = New-NsxService -Name "tcp-445"          -Protocol tcp -port "445"          -Description "tcp/445" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp465          = Get-NsxService -Name "tcp-465"))          { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-465";         $serviceTcp465          = New-NsxService -Name "tcp-465"          -Protocol tcp -port "465"          -Description "tcp/465" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp587          = Get-NsxService -Name "tcp-587"))          { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-587";         $serviceTcp587          = New-NsxService -Name "tcp-587"          -Protocol tcp -port "587"          -Description "tcp/587" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp593          = Get-NsxService -Name "tcp-593"))          { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-593";         $serviceTcp593          = New-NsxService -Name "tcp-593"          -Protocol tcp -port "593"          -Description "tcp/593" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp1688         = Get-NsxService -Name "tcp-1688"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-1688";        $serviceTcp1688         = New-NsxService -Name "tcp-1688"         -Protocol tcp -port "1688"         -Description "tcp/1688" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp4001         = Get-NsxService -Name "tcp-4001"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-4001";        $serviceTcp4001         = New-NsxService -Name "tcp-4001"         -Protocol tcp -port "4001"         -Description "tcp/4001" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp4002         = Get-NsxService -Name "tcp-4002"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-4002";        $serviceTcp4002         = New-NsxService -Name "tcp-4002"         -Protocol tcp -port "4002"         -Description "tcp/4002" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp5433         = Get-NsxService -Name "tcp-5433"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-5433";        $serviceTcp5433         = New-NsxService -Name "tcp-5433"         -Protocol tcp -port "5433"         -Description "tcp/5433" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp5900         = Get-NsxService -Name "tcp-5900"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-5900";        $serviceTcp5900         = New-NsxService -Name "tcp-5900"         -Protocol tcp -port "5900"         -Description "tcp/5900" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp5985         = Get-NsxService -Name "tcp-5985"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-5985";        $serviceTcp5985         = New-NsxService -Name "tcp-5985"         -Protocol tcp -port "5985"         -Description "tcp/5985" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp5986         = Get-NsxService -Name "tcp-5986"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-5986";        $serviceTcp5986         = New-NsxService -Name "tcp-5986"         -Protocol tcp -port "5986"         -Description "tcp/5986" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp7433         = Get-NsxService -Name "tcp-7433"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-7433";        $serviceTcp7433         = New-NsxService -Name "tcp-7433"         -Protocol tcp -port "7433"         -Description "tcp/7433" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp8181         = Get-NsxService -Name "tcp-8181"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-8181";        $serviceTcp8181         = New-NsxService -Name "tcp-8181"         -Protocol tcp -port "8181"         -Description "tcp/8181" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp8199         = Get-NsxService -Name "tcp-8199"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-8199";        $serviceTcp8199         = New-NsxService -Name "tcp-8199"         -Protocol tcp -port "8199"         -Description "tcp/8199" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp8200         = Get-NsxService -Name "tcp-8200"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-8200";        $serviceTcp8200         = New-NsxService -Name "tcp-8200"         -Protocol tcp -port "8200"         -Description "tcp/8200" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp8201         = Get-NsxService -Name "tcp-8201"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-8201";        $serviceTcp8201         = New-NsxService -Name "tcp-8201"         -Protocol tcp -port "8201"         -Description "tcp/8201" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp8443         = Get-NsxService -Name "tcp-8443"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-8433";        $serviceTcp8443         = New-NsxService -Name "tcp-8443"         -Protocol tcp -port "8443"         -Description "tcp/8443" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp9427         = Get-NsxService -Name "tcp-9427"))         { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-9427";        $serviceTcp9427         = New-NsxService -Name "tcp-9427"         -Protocol tcp -port "9427"         -Description "tcp/9427" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp22443        = Get-NsxService -Name "tcp-22443"))        { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-22443";       $serviceTcp22443        = New-NsxService -Name "tcp-22443"        -Protocol tcp -port "22443"        -Description "tcp/22443" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceTcp49152_65535  = Get-NsxService -Name "tcp-49152-65535"))  { Write-Host -foregroundcolor "Yellow" "Creating " "tcp-49152-65535"; $serviceTcp49152_65535  = New-NsxService -Name "tcp-49152-65535"  -Protocol tcp -port "49152-65535"  -Description "tcp/49152-65535" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceUdp137          = Get-NsxService -Name "udp-137"))          { Write-Host -foregroundcolor "Yellow" "Creating " "udp-137";         $serviceUdp137          = New-NsxService -Name "udp-137"          -Protocol udp -port "137"          -Description "udp/137" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceUdp138          = Get-NsxService -Name "udp-138"))          { Write-Host -foregroundcolor "Yellow" "Creating " "udp-138";         $serviceUdp138          = New-NsxService -Name "udp-138"          -Protocol udp -port "138"          -Description "udp/138" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceUdp445          = Get-NsxService -Name "udp-445"))          { Write-Host -foregroundcolor "Yellow" "Creating " "udp-445";         $serviceUdp445          = New-NsxService -Name "udp-445"          -Protocol udp -port "445"          -Description "udp/445" } Else { Write-Host -NoNewline "."}
If (-Not ($serviceUdp22443        = Get-NsxService -Name "udp-22443"))        { Write-Host -foregroundcolor "Yellow" "Creating " "udp-22443";       $serviceUdp22443        = New-NsxService -Name "udp-22443"        -Protocol udp -port "22443"        -Description "udp/22443" } Else { Write-Host -NoNewline "."}


#Use existent services
$serviceRDP     = Get-NsxService -Name "RDP" -LocalOnly; Write-Host -NoNewline "."
$serviceHTTP   = Get-NsxService -Name "HTTP" -LocalOnly; Write-Host -NoNewline "."
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
#Check and create xRES FW rule section for orcServers
If ( -Not (Get-NsxFirewallSection -Name $FWSec_orcServers_Name) ) { Write-Host -foregroundcolor "Yellow" "Creating xRES FW Section (Orc servers): " $FWSec_orcServers_Name; $newRule = New-NsxFirewallSection -Name $FWSec_orcServers_Name -Position bottom }

#Create OrcServers FW rules
$newRule = Get-NsxFirewallSection $FWSec_orcServers_Name | New-NsxFirewallRule -Name ("===== Automaticly created FW rules (Orc servers) - start (" + (Get-Date -Format g) + ") =====") -Source $SG_Empty -Destination $SG_Empty -AppliedTo $SG_Empty -Action allow -Disabled -Position bottom
Write-Host "FW rule created ("$FWSec_orcServers_Name" )->" $newRule.Name

### example ###
#$FWRuleName1 =
#$Src1 =
#$Dest1 =
#$Service1 =
#$AppliedTo1 =
#$AppliedTo1 += $Src1 + $Dest1
#FWRuleCreate -FWSection $FWSec_appServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1


$FWRuleName1 = "BP SRES Jumpservers -> UP xRES OrcServers for RDS service"
$Src1 = $SG_SRES_RPA_Jump_Servers
$Dest1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Service1 = $serviceRDP, $serviceTcp135, $serviceTcp445, $serviceTcp49152_65535
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_SRES_RPA_Jump_Servers, $SG_orc_xDxx_RPA_UP_EID_OrcServers
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "BP SRES Jumpservers -> UP xRES OrcServers Prod"
$Src1 = $SG_SRES_RPA_Jump_Servers
If ( $LB_OrcProdSrv_required -eq "yes" )
{
  $Dest1 = $SG_orcProdSrv, $HOST_xRES_RPA_OrcSrv_EID_HA_VIP
  $AppliedTo1 = $ESG_SRES, $ESG_orc, $ESG_xRES_RPA_SRV_LB, $SG_SRES_RPA_Jump_Servers, $SG_orcProdSrv
}
Else
{
  $Dest1 = $SG_orcProdSrv
  $AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_SRES_RPA_Jump_Servers, $SG_orcProdSrv
}
$Service1 = $serviceHTTPS
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

If ( $LB_OrcProdSrv_required -eq "yes" )
{
  $FWRuleName1 = "BP SRES-RPA-SRV LB Primary IP -> UP xRES OrcServers Prod"
  $Src1 = $HOST_xRES_RPA_LB1_PrimaryIP
  $Dest1 = $SG_orcProdSrv
  $AppliedTo1 = $SG_orcProdSrv
  $Service1 = $serviceHTTPS
  FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1
}

$FWRuleName1 = "BP SRES Jumpservers -> UP xRES OrcServers UAT"
$Src1 = $SG_SRES_RPA_Jump_Servers
$Dest1 = $SG_orcUatSrv
$Service1 = $serviceHTTPS
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_SRES_RPA_Jump_Servers, $SG_orcUatSrv
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "BP SRES Jumpservers -> UP xRES OrcServers DEV"
$Src1 = $SG_SRES_RPA_Jump_Servers
$Dest1 = $SG_orcDevSrv
$Service1 = $serviceHTTPS
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_SRES_RPA_Jump_Servers, $SG_orcDevSrv
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES OrcServers -> RPA SRES FileServer"
$Src1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Dest1 = $SG_SRES_RPA_FileServers
$Service1 = $serviceTcp445, $serviceUdp445
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_orc_xDxx_RPA_UP_EID_OrcServers, $SG_SRES_RPA_FileServers
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES OrcServers -> RPA SRES SQL Server"
$Src1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Dest1 = $SG_SRES_RPA_SQL
$Service1 = $serviceTcp7433
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_orc_xDxx_RPA_UP_EID_OrcServers, $SG_SRES_RPA_SQL
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES OrcServers -> RPA SRES AD"
$Src1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Dest1 = $SG_SRES_RPA_AD_DNS
$Service1 = $serviceGrpMSAD, $serviceWin2008
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_orc_xDxx_RPA_UP_EID_OrcServers, $SG_SRES_RPA_AD_DNS
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES OrcServers -> RPA SRES Jump Servers"
$Src1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Dest1 = $SG_SRES_RPA_Jump_Servers
$Service1 = $serviceHTTPS, $serviceTcp49152_65535
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_orc_xDxx_RPA_UP_EID_OrcServers, $SG_SRES_RPA_Jump_Servers
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "RPA SRES AD -> UP xRES OrcServers"
$Src1 = $SG_SRES_RPA_AD_DNS
$Dest1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Service1 = $serviceGrpMSAD, $serviceWin2008
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_SRES_RPA_AD_DNS, $SG_orc_xDxx_RPA_UP_EID_OrcServers
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "RPA SRES FileServer-> UP SRES OrcServers"
$Src1 = $SG_SRES_RPA_FileServers
$Dest1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Service1 = $serviceTcp445, $serviceUdp445
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_SRES_RPA_FileServers, $SG_orc_xDxx_RPA_UP_EID_OrcServers
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "BP SRES DNS, SRES Horizon -> RPA-UP xRES OrcServers"
$Src1 = $SG_SRES_RPA_AD_DNS, $SG_SRES_RPA_Horizon_Servers
$Dest1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Service1 = $serviceTcp5985, $serviceTcp5986
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_SRES_RPA_AD_DNS, $SG_SRES_RPA_Horizon_Servers, $SG_orc_xDxx_RPA_UP_EID_OrcServers
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "BP SRES Jumpservers -> RPA-UP xRES OrcServers"
$Src1 = $SG_SRES_RPA_Jump_Servers
$Dest1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Service1 = $serviceTcp135, $serviceTcp137, $serviceTcp138, $serviceTcp139, $serviceTcp593, $serviceTcp5985, $serviceTcp5986, $serviceTcp49152_65535
$AppliedTo1 = $ESG_SRES, $ESG_orc, $SG_SRES_RPA_Jump_Servers, $SG_orc_xDxx_RPA_UP_EID_OrcServers
FWRuleCreate -FWSection $FWSec_orcServers_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1


$newRule = Get-NsxFirewallSection $FWSec_orcServers_Name | New-NsxFirewallRule -Name ("===== Automaticly created FW rules (Orc servers) - end (" + (Get-Date -Format g) + ") =====") -Source $SG_Empty -Destination $SG_Empty -AppliedTo $SG_Empty -Action allow -Disabled -Position bottom
Write-Host "FW rule created ("$FWSec_orcServers_Name" )->" $newRule.Name

#Check and create xRES FW rule section for botsServers
If ( -Not (Get-NsxFirewallSection -Name $FWSec_bots_Name) ) { Write-Host -foregroundcolor "Yellow" "Creating xRES FW Section (Bots): " $FWSec_bots_Name; $newRule = New-NsxFirewallSection -Name $FWSec_bots_Name -Position bottom }

#Create Bots FW rules
$newRule = Get-NsxFirewallSection $FWSec_bots_Name | New-NsxFirewallRule -Name ("===== Automaticly created FW rules (Bots) - start (" + (Get-Date -Format g) + ") =====") -Source $SG_Empty -Destination $SG_Empty -AppliedTo $SG_Empty -Action allow -Disabled -Position bottom
Write-Host "FW rule created ("$FWSec_bots_Name" )->" $newRule.Name

### example ###
#$FWRuleName1 =
#$Src1 =
#$Dest1 =
#$Service1 =
#$AppliedTo1 =
#$AppliedTo1 += $Src1 + $Dest1
#FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "BP SRES Jumpservers -> UP xRES robots"
$Src1 = $SG_SRES_RPA_Jump_Servers
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Service1 = $serviceRDP, $serviceTcp135, $serviceTcp445, $serviceTcp9427, $serviceTcp22443, $serviceUdp22443
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_Jump_Servers, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "BP SRES Horizon server -> UP xRES robots"
$Src1 = $SG_SRES_RPA_Horizon_Servers
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Service1 = $serviceRDP, $serviceTcp22443
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_Horizon_Servers, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "BP SRES Horizon Server -> UP xRES GoldenImages"
$Src1 = $SG_SRES_RPA_Horizon_Servers
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
$Service1 = $serviceRDP
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_Horizon_Servers, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP SRES OrcServers -> UP xRES robots, UP xRES GoldenImages"
$Src1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
$Service1 = $serviceHTTPS, $serviceTcp49152_65535
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_orc_xDxx_RPA_UP_EID_OrcServers, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES GoldenImages, UP xRES robots -> RPA SRES FileServer"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Dest1 = $SG_SRES_RPA_FileServers
$Service1 = $serviceTcp445, $serviceUdp445
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_SRES_RPA_FileServers
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES GoldenImages, UP xRES robots -> RPA SRES AD"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Dest1 = $SG_SRES_RPA_AD_DNS
$Service1 = $serviceGrpMSAD, $serviceWin2008
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_SRES_RPA_AD_DNS
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "RPA SRES AD -> UP xRES GoldenImages, UP xRES robots"
$Src1 = $SG_SRES_RPA_AD_DNS
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Service1 = $serviceGrpMSAD, $serviceWin2008
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_AD_DNS, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES GoldenImages, UP xRES Robots -> RPA SRES AppVol Manager"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Dest1 = $SG_SRES_RPA_AppVol_Manager, $HOST_SRES_RPA_APPVOL_HA_VIP
$Service1 = $serviceTcp5985, $serviceTcp5986, $serviceHTTPS
$AppliedTo1 = $ESG_SRES, $ESG_bots, $ESG_SRES_LB, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_SRES_RPA_AppVol_Manager
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES GoldenImages, UP xRES Robots -> RPA SRES Horizon Server"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Dest1 = $SG_SRES_RPA_Horizon_Servers, $HOST_SRES_RPA_CONSRV_HA_VIP
$Service1 = $serviceTcp4001, $serviceTcp4002
$AppliedTo1 = $ESG_SRES, $ESG_bots, $ESG_SRES_LB, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_SRES_RPA_Horizon_Servers
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES GoldenImages, UP xRES Robots -> RPA SRES KMS server"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Dest1 = $SG_SRES_RPA_KMSServers
$Service1 = $serviceTcp1688
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_SRES_RPA_KMSServers
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES robots -> smtprelay"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Dest1 = $SG_PDR_SMTP_Relay
$Service1 = $serviceSMTP, $serviceTcp465, $serviceTcp587
$AppliedTo1 = $ESG_PDR, $ESG_bots, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_PDR_SMTP_Relay
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES robots -> UP SRES OrcServers"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Dest1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Service1 = $serviceHTTPS, $serviceTcp49152_65535
$AppliedTo1 = $ESG_orc, $ESG_bots, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_orc_xDxx_RPA_UP_EID_OrcServers
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES robots PROD -> UP xRES Prod OrcServers"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD
If ( $LB_OrcProdSrv_required -eq "yes" )
{
  $Dest1 = $SG_orcProdSrv, $HOST_xRES_RPA_OrcSrv_EID_HA_VIP
  $AppliedTo1 = $ESG_orc, $ESG_bots, $ESG_xRES_RPA_SRV_LB, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD, $SG_orcProdSrv
}
Else
{
  $Dest1 = $SG_orcProdSrv
  $AppliedTo1 = $ESG_orc, $ESG_bots, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD, $SG_orcProdSrv
}
$Service1 = $serviceHTTPS
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES robots UAT -> UP xRES UAT OrcServers"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT
$Dest1 = $SG_orcUatSrv
$Service1 = $serviceHTTPS
$AppliedTo1 = $ESG_orc, $ESG_bots, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT, $SG_orcUatSrv
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES robots DEV -> UP xRES DEV OrcServers"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV
$Dest1 = $SG_orcDevSrv
$Service1 = $serviceHTTPS
$AppliedTo1 = $ESG_orc, $ESG_bots, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV, $SG_orcDevSrv
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES GoldenImages -> UP xRES OrcServers"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
$Dest1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
$Service1 = $serviceHTTPS, $serviceTcp49152_65535
$AppliedTo1 = $ESG_orc, $ESG_bots, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_orc_xDxx_RPA_UP_EID_OrcServers
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "BP SRES DNS, SRES Horizon -> RPA-UP xRES Components"
$Src1 = $SG_SRES_RPA_AD_DNS, $SG_SRES_RPA_Horizon_Servers
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
$Service1 = $serviceTcp5985, $serviceTcp5986
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_AD_DNS, $SG_SRES_RPA_Horizon_Servers, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "BP SRES Jumpservers -> xRES RPA UP Components"
$Src1 = $SG_SRES_RPA_Jump_Servers
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
$Service1 = $serviceTcp135, $serviceTcp139, $serviceTcp593, $serviceTcp5985, $serviceTcp5986, $serviceTcp49152_65535, $serviceUdp137, $serviceUdp138
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_Jump_Servers, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "SRES KMSServers -> xRES UP Robots"
$Src1 = $SG_SRES_RPA_KMSServers
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
$Service1 = $serviceTcp135, $serviceTcp593, $serviceTcp49152_65535
$AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_KMSServers, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES robots -> WPAD Servers"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
$Dest1 = $SG_SRES_RPA_WPAD_Servers, $HOST_SRES_RPA_WPAD_LB_VIP
$Service1 = $serviceHTTP
$AppliedTo1 = $ESG_SRES, $ESG_bots, $ESG_SRES_LB, $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool, $SG_SRES_RPA_WPAD_Servers
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES Desktop-Pool_Prod -> Desktop-Pool_Prod"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD
$Service1 = $serviceTcp445
$AppliedTo1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES Desktop-Pool_UAT -> Desktop-Pool_UAT"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT
$Service1 = $serviceTcp445
$AppliedTo1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

$FWRuleName1 = "UP xRES Desktop-Pool_DEV -> Desktop-Pool_DEV"
$Src1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV
$Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV
$Service1 = $serviceTcp445
$AppliedTo1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV
FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1


### Create following rules only in case:
# "Model = 4" and $DRESjumpHostRequired = "yes"
If ($modelNumber -eq "4" -And $DRESjumpHostRequired -eq "yes")
{
  Write-Host -foregroundcolor "Green" "Creating additional Firewall rules for DRES Jump Host..."

  $FWRuleName1 = "RPA SRES Jumpservers -> RPA DRES Jump Servers"
  $Src1 = $SG_SRES_RPA_Jump_Servers
  $Dest1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Service1 = $serviceTcp135, $serviceTcp139, $serviceTcp593, $serviceTcp5985, $serviceTcp5986, $serviceTcp49152_65535, $serviceUdp137, $serviceUdp138
  $AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_Jump_Servers, $SG_DRxx_RPA_EID_Jump_Servers
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1


  $FWRuleName1 = "RPA SRES DNS, SRES Horizon -> RPA DRES JumpServers"
  $Src1 = $SG_SRES_RPA_AD_DNS, $SG_SRES_RPA_Horizon_Servers
  $Dest1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Service1 = $serviceTcp5985, $serviceTcp5986
  $AppliedTo1 = $ESG_SRES, $ESG_bots, $SG_SRES_RPA_AD_DNS, $SG_SRES_RPA_Horizon_Servers, $SG_DRxx_RPA_EID_Jump_Servers
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA DRES Jumpserver -> UP DRES OrcServers for RDS service"
  $Src1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Dest1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
  $Service1 = $serviceRDP, $serviceTcp135, $serviceTcp445
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_orc_xDxx_RPA_UP_EID_OrcServers
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA DRES Jumpservers -> UP DRES OrcServers Prod"
  $Src1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Dest1 = $SG_orcProdSrv
  $Service1 = $serviceHTTPS, $serviceTcp49152_65535
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_orcProdSrv
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA DRES Jumpservers -> UP DRES OrcServers UAT"
  $Src1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Dest1 = $SG_orcUatSrv
  $Service1 = $serviceHTTPS, $serviceTcp49152_65535
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_orcUatSrv
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA DRES Jumpservers -> UP DRES OrcServers DEV"
  $Src1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Dest1 = $SG_orcDevSrv
  $Service1 = $serviceHTTPS, $serviceTcp49152_65535
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_orcDevSrv
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA DRES Jumpservers -> UP DRES Robots"
  $Src1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Dest1 = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
  $Service1 = $serviceRDP, $serviceTcp135, $serviceTcp445, $serviceTcp5900, $serviceTcp9427, $serviceTcp22443, $serviceUdp22443
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "UP DRES OrcServers -> RPA DRES Jumpservers"
  $Src1 = $SG_orc_xDxx_RPA_UP_EID_OrcServers
  $Dest1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Service1 = $serviceTcp49152_65535
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_orc_xDxx_RPA_UP_EID_OrcServers
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA DRES Jumpserver -> SRES AD DNS"
  $Src1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Dest1 = $SG_SRES_RPA_AD_DNS
  $Service1 = $serviceGrpMSAD, $serviceWin2008
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_SRES_RPA_AD_DNS
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "SRES AD DNS -> UP DRES Jumpserver"
  $Src1 = $SG_SRES_RPA_AD_DNS
  $Dest1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Service1 = $serviceGrpMSAD, $serviceWin2008
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_SRES_RPA_AD_DNS
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA DRES Jumpserver -> RPA SRES Fileserver"
  $Src1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Dest1 = $SG_SRES_RPA_FileServers
  $Service1 = $serviceTcp445, $serviceUdp445
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_SRES_RPA_FileServers
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA SRES Fileserver -> RPA DRES Jumpserver"
  $Src1 = $SG_SRES_RPA_FileServers
  $Dest1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Service1 = $serviceTcp445, $serviceUdp445
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_SRES_RPA_FileServers
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA SRES SQL -> RPA DRES Jumpservers "
  $Src1 = $SG_SRES_RPA_SQL
  $Dest1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Service1 = $serviceTcp5985, $serviceTcp5986
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_SRES_RPA_SQL
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA DRES Jumpservers -> RPA SRES WPAD"
  $Src1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Dest1 = $SG_SRES_RPA_WPAD_Servers, $HOST_SRES_RPA_WPAD_LB_VIP
  $Service1 = $serviceHTTP
  $AppliedTo1 = $ESG_SRES_LB, $SG_DRxx_RPA_EID_Jump_Servers, $SG_SRES_RPA_WPAD_Servers
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA DRES Jumpservers -> RPA SRES KMSServers"
  $Src1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Dest1 = $SG_SRES_RPA_KMSServers
  $Service1 = $serviceTcp135, $serviceTcp593, $serviceTcp1688, $serviceTcp49152_65535
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_SRES_RPA_KMSServers
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA SRES KMSServers -> RPA DRES Jumpservers"
  $Src1 = $SG_SRES_RPA_KMSServers
  $Dest1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Service1 = $serviceTcp135, $serviceTcp593, $serviceTcp49152_65535
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_SRES_RPA_KMSServers
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1

  $FWRuleName1 = "RPA DRES Jumpservers -> RPA SRES Horizon"
  $Src1 = $SG_DRxx_RPA_EID_Jump_Servers
  $Dest1 = $SG_SRES_RPA_Horizon_Servers
  $Service1 = $serviceHTTPS, $serviceTcp8443
  $AppliedTo1 = $SG_DRxx_RPA_EID_Jump_Servers, $SG_SRES_RPA_Horizon_Servers
  FWRuleCreate -FWSection $FWSec_bots_Name -FWRuleName $FWRuleName1 -SourceList $Src1 -DestinationList $Dest1 -ServiceList $Service1 -AppliedTo $AppliedTo1
}


$newRule = Get-NsxFirewallSection $FWSec_bots_Name | New-NsxFirewallRule -Name ("===== Automaticly created FW rules (Bots) - end (" + (Get-Date -Format g) + ") =====") -Source $SG_Empty -Destination $SG_Empty -AppliedTo $SG_Empty -Action allow -Disabled -Position bottom
Write-Host "FW rule created ("$FWSec_bots_Name" )->" $newRule.Name

### Adding members to Security Groups
Write-Host -foregroundcolor "Yellow" "Adding members to Security Groups..."
$SG_DynamicMemberList = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD.dynamicMemberDefinition.dynamicSet.dynamicCriteria.value
If ( ($SG_DynamicMemberList -like $VM_botProd1_Name) -And ($SG_DynamicMemberList -like $VM_botProd2_Name) -And ($SG_DynamicMemberList -like $VM_botProd3_Name) ) {Write-Host  -NoNewline "."}
Else {
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD_ListName1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botProd1_Name)
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD_ListName2 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botProd2_Name)
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD_ListName3 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botProd3_Name)
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD_ListName1,$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD_ListName2,$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD_ListName3
}

$SG_DynamicMemberList = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT.dynamicMemberDefinition.dynamicSet.dynamicCriteria.value
If ( ($SG_DynamicMemberList -like $VM_botUat1_Name) -And ($SG_DynamicMemberList -like $VM_botUat2_Name) -And ($SG_DynamicMemberList -like $VM_botUat3_Name) ) {Write-Host  -NoNewline "."}
Else {
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT_ListName1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botUat1_Name)
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT_ListName2 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botUat2_Name)
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT_ListName3 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botUat3_Name)
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT_ListName1,$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT_ListName2,$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT_ListName3
}

$SG_DynamicMemberList = $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV.dynamicMemberDefinition.dynamicSet.dynamicCriteria.value
If ( ($SG_DynamicMemberList -like $VM_botDev1_Name) -And ($SG_DynamicMemberList -like $VM_botDev2_Name) -And ($SG_DynamicMemberList -like $VM_botDev3_Name) ) {Write-Host  -NoNewline "."}
Else {
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV_ListName1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botDev1_Name)
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV_ListName2 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botDev2_Name)
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV_ListName3 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_botDev3_Name)
  $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV_ListName1,$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV_ListName2,$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV_ListName3
}

$SG_DynamicMemberList = $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images.dynamicMemberDefinition.dynamicSet.dynamicCriteria.value
If ( $SG_DynamicMemberList -like $VM_PoolImg_Name ) {Write-Host  -NoNewline "."}
Else {
  $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images_ListName1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_PoolImg_Name)
  $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $SG_bots_xRxx_RPA_UP_EID_FID_Pool_Images_ListName1
}

$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool | Add-NsxSecurityGroupMember -Member $SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_PROD,$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_UAT,$SG_bots_xRxx_RPA_UP_EID_FID_Desktop_Pool_DEV
$SG_orc_xDxx_RPA_UP_EID_OrcServers | Add-NsxSecurityGroupMember -Member $SG_orcDevSrv,$SG_orcUatSrv,$SG_orcProdSrv

If ( $VM_orcDev )   { $SG_orcDevSrv | Add-NsxSecurityGroupMember -Member $VM_orcDev }   Else { Write-Host -foregroundcolor "Red" "VM " $VM_orcDev_Name " does not exist, please add VM ($VM_orcDev_Name) to SG ($SG_orcDevSrv_Name) manually after VM deployment." }
If ( $VM_orcUat )   { $SG_orcUatSrv | Add-NsxSecurityGroupMember -Member $VM_orcUat }   Else { Write-Host -foregroundcolor "Red" "VM " $VM_orcUat_Name " does not exist, please add VM ($VM_orcUat_Name) to SG ($SG_orcUatSrv_Name) manually after VM deployment." }
If ( $VM_orcProd )  { $SG_orcProdSrv | Add-NsxSecurityGroupMember -Member $VM_orcProd } Else { Write-Host -foregroundcolor "Red" "VM " $VM_orcProd_Name " does not exist, please add VM ($VM_orcProd_Name) to SG ($SG_orcProdSrv_Name) manually after VM deployment." }

If ($modelNumber -eq "4" -And $DRESjumpHostRequired -eq "yes")
{
  $SG_DynamicMemberList = $SG_DRxx_RPA_EID_Jump_Servers.dynamicMemberDefinition.dynamicSet.dynamicCriteria.value
  If ( $SG_DynamicMemberList -like $VM_DRES_JumpHosts_Name ) {Write-Host  -NoNewline "."}
  Else {
    $VM_DRES_JumpHosts_ListName1 = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($VM_DRES_JumpHosts_Name)
    $SG_DRxx_RPA_EID_Jump_Servers | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $VM_DRES_JumpHosts_ListName1
  }
}


Disconnect-NsxServer -vCenterServer $vCenterServerName
Disconnect-VIServer -Server $vCenterServerName -Confirm:$False

Write-Host -foregroundcolor "Green" "`nScript completed!"
