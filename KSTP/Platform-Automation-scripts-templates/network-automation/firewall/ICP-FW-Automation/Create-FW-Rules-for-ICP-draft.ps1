#INPUTS

Write-Host "USAGE: Create-FW-Rules-for-ICP  <vCenter> <region> <segmentName> <segmentNumber> <segmentId> <clusterName> <clusterID>"

# Example Create-FW-Rules-for-ICP ag1vc1.ag1.sp.ibm.local, ag1, DRES, 33, dr1, cluster1, icp1

Connect-NsxServer -vCenterServer $Args[0]

$region = $Args[1] #### WDC ( ag1 ) ; AMS ( eu1 )
$segmentName = $Args[2] # SRES, GRES, DRES, PDR
$segmentNumber = $Args[3]  #"xx"
$segmentIdentifier = $Args[4]   ## or gr1, sr1, etc....
$clusterName = $Args[5]  ### The identifier of the clusterName  ( cluster1,  cluster2, ... )
$clusterIdentifier = $Args[6]    ###  icp1, icp2

# Setup Security Group names
$SG_ICP_Cluster_Group = "SG-"+$segmentName + $segmentNumber + "-ICP-" + $clusterName

$icpSectionName=$segmentName + $segmentNumber

# Check and create Security Groups
If ( -Not (Get-NsxSecurityGroup -Name $SG_ICP_Cluster_Group) ) { Write-Host -foregroundcolor "Green" "Creating " $SG_ICP_Cluster_Group; New-NsxSecurityGroup -Name $SG_ICP_Cluster_Group }

# Add Dynamic Member Sets to the Security Group
# e.g. ag1dr33icp1
$dynamicMemberID=$region + $segmentIdentifier + $segmentNumber + $clusterIdentifier

### Adding members to Security Groups
Write-Host -foregroundcolor "Green" "Adding members to Security Groups..."
$ICP_Cluster_DynamicNames = New-NsxDynamicCriteriaSpec -key VmName -condition starts_with -value ($dynamicMemberID)

Get-NsxSecurityGroup -Name $SG_ICP_Cluster_Group | Add-NsxDynamicMemberSet -SetOperator OR -CriteriaOperator ANY -DynamicCriteriaSpec $ICP_Cluster_DynamicNames

$sres_esg1 = Get-NsxEdge -Name ($region + $segmentIdentifier + $segmentNumber +"-esg1")
$agg_esg1 = Get-NsxEdge -Name ($region + "-agg-esg1")

# Get IPSets
$HOST-IBM-Blue-Sendmail= Get-nsxipset -Name "HOST-IBM-Blue-Sendmail"
$HOST-IBM-Bluepages= Get-nsxipset -Name "HOST-IBM-Bluepages"
$HOST-IBM-Blue-API-Connect= Get-nsxipset -Name "HOST-IBM-Blue-API-Connect"

# Get services
$ICP-Management Console   = Get-NsxService -Name "ICP-Management Console"
$ICP-Ingress Service   = Get-NsxService -Name "ICP-Ingress Service"
$ICP-Docker Registry   = Get-NsxService -Name "ICP-Docker Registry"
$ICP-Kubernetes NodePort   = Get-NsxService -Name "ICP-Kubernetes NodePort"
$ICP-WebSphere Application Server Liberty   = Get-NsxService -Name "ICP-WebSphere Application Server Liberty"
$ICP-Kubernetes API-Server   = Get-NsxService -Name "ICP-Kubernetes API-Server"
$LDAP-over-SSL = Get-NsxService -Name "LDAP-over-SSL"
$HTTPS = Get-NsxService -Name "HTTPS"
$SMTP = Get-NsxService -Name "SMTP"

#Create FW rules
Write-Host -foregroundcolor "Green" "Creating Firewall rules..."
$ruleName = "===== Automaticly created FW rules - start (" + (Get-Date -Format g) + ") ====="
Get-NsxFirewallSection $dresSectionName | New-NsxFirewallRule -Name $ruleName -Action allow -Disabled -Position bottom

$SG-SRES-Linux-Jump-Servers = Get-NsxSecurityGroup -Name "SG-SRES-Linux-Jump-Servers"
$SG-SRES-WIN-Jump-Servers = Get-NsxSecurityGroup -Name "SG-SRES-Win-Jump-Servers"

Get-NsxFirewallSection $icpSectionName | New-NsxFirewallRule -Name "ICP Cluster Internal" -Source $SG_ICP_Cluster_Group
-Destination $SG_ICP_Cluster_Group -Action allow
-Service "any" -AppliedTo $SG_ICP_Cluster_Group -Action allow  -Disabled -Position bottom

Get-NsxFirewallSection $icpSectionName | New-NsxFirewallRule -Name "ICP from SRES JUMP" -Source $SG-SRES-Linux-Jump-Servers,$SG-SRES-WIN-Jump-Servers
-Destination $SG_ICP_Cluster_Group -Action allow
-Service $ICP-Management Console, $ICP-Ingress Service, $ICP-Docker Registry, $ICP-Kubernetes NodePort,$ICP-WebSphere Application Server Liberty,$ICP-Kubernetes API-Server
-AppliedTo $SG-SRES-Linux-Jump-Servers,$SG-SRES-WIN-Jump-Servers,$SG_ICP_Cluster_Group, $sres_esg1,$agg_esg1
-Disabled -Position bottom -EnableLogging

Get-NsxFirewallSection $icpSectionName | New-NsxFirewallRule -Name "ICP to IBM-Blue" -Source $SG_ICP_Cluster_Group
-Destination $HOST-IBM-Blue-Sendmail,$HOST-IBM-Bluepages,$HOST-IBM-Blue-API-Connect -Action allow
-Service $LDAP-over-SSL, $HTTPS, $SMTP
-AppliedTo $SG_ICP_Cluster_Group, $sres_esg1,$agg_esg1
-Disabled -Position bottom -EnableLogging
