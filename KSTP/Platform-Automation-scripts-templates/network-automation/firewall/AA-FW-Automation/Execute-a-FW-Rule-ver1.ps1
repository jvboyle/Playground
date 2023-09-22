#INPUTS

Write-Host "USAGE: Execute FW Rule  <dresSectionName> <ruleName> <Source> < Destination> <action> <service> < applied to>"

$dresSectionName=$Args[0]
$ruleName=$Args[1]
$source=$Args[2]
$destination=$Args[3]
$action=$Args[4]
$service=$Args[5]
$appliedTo=$Args[6]

$serviceName   = Get-NsxService -Name $service

### NEEDS WORK
#####Test for one of these......
### IF so
#Use existent services
#$serviceRDP = Get-NsxService -Name "RDP" -LocalOnly
#$serviceHTTPS = Get-NsxService -Name "HTTPS" -LocalOnly
#$serviceWin2008 = Get-NsxService -Name "Win 2008 - RPC, DCOM, EPM, DRSUAPI, NetLogonR, SamR, FRS" -LocalOnly

##Use existent service groups
#$serviceGrpMSAD = Get-NsxServiceGroup -Name "Microsoft Active Directory" -LocalOnly

#Create FW rule
Write-Host -foregroundcolor "Green" "Creating Firewall rules..."
Write-Host "===== Automatically created FW rule - start (" + (Get-Date -Format g) + ") ====="

Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name $ruleName  -Source $source -Destination $destination -Action $action -Service $serviceName -AppliedTo $appliedTo -Disabled -Position bottom -EnableLogging

Write-Host"===== Automatically created FW rule - end (" + (Get-Date -Format g) + ") ====="
