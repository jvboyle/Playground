


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
