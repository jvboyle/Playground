
Write-Host "USAGE: Create-AA-DRES-SecurityGroup  <vCenter Server> <DR number> "

Connect-NsxServer -vCenterServer $Args[1]
dr_number=$Args[2]

## Setup variables... ....
$SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name = "SG-DR" + $drNumber + "-RPA-AA-Desktop-Pool_UAT"
$SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name = "SG-DR" + $drNumber + "-RPA-AA-Desktop-Pool_DEV"
$SG_DRxx_RPA_AA_Pool_Images_Name = "SG-DR" + $drNumber + "-RPA-AA-Pool-Images"
$SG_DRxx_RPA_AA_Desktop_Pool_Name = "SG-DR" + $drNumber + "-RPA-AA-Desktop-Pool"

## That are used in the following commands.....
#Check and create Security Groups for this DRES
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_PROD_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_UAT_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_DEV_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Pool_Images_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Pool_Images_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Pool_Images_Name }
If ( -Not (Get-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_DRxx_RPA_AA_Desktop_Pool_Name; New-NsxSecurityGroup -Name $SG_DRxx_RPA_AA_Desktop_Pool_Name }
#If ( -Not (Get-NsxSecurityGroup -Name $_Name) ) { Write-Host -foregroundcolor "Green" "Creating " $_Name; New-NsxSecurityGroup -Name $_Name }
