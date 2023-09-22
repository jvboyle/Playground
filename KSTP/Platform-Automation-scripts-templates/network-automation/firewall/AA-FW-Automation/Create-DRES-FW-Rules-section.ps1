
Write-Host "USAGE: Create-DRES-FW-Rules-section  <vCenter Server> <DR number> "

Connect-NsxServer -vCenterServer $Args[1]
dr_number=$Args[2]

#Check and create DRESxx FW rule section
$dresSectionName = "DRES" + $drNumber
If ( -Not (Get-NsxFirewallSection -Name $dresSectionName) ) { Write-Host -foregroundcolor "Green" "Creating DRES FW Section: "; Write-Host -foregroundcolor "Yellow" $dresSectionName; New-NsxFirewallSection -Name $dresSectionName -Position bottom }
