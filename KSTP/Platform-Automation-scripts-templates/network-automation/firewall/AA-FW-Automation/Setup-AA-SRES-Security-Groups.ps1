## Only needs to be executed once per RPA install in a Region


Connect-NsxServer -vCenterServer $Args[1]

#
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_GTS_Jump_Servers_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_GTS_Jump_Servers_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_GTS_Jump_Servers_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_Horizon_Servers_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_Horizon_Servers_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_Horizon_Servers_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_FileServers_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_FileServers_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_FileServers_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_AD_DNS_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_AD_DNS_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_AD_DNS_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_AppVol_Manager_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_AppVol_Manager_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_AppVol_Manager_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_SRES_RPA_AA_Controlroom_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_SRES_RPA_AA_Controlroom_Name; New-NsxSecurityGroup -Name $SG_SRES_RPA_AA_Controlroom_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_PDR_SMTP_Relay_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_PDR_SMTP_Relay_Name; New-NsxSecurityGroup -Name $SG_PDR_SMTP_Relay_Name }
#If ( -Not (Get-NsxSecurityGroup -Name $_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $_Name; New-NsxSecurityGroup -Name $_Name }
