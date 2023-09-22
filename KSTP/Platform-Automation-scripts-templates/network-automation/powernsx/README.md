# Network Automation PowerNSX scripts

## Purpose:
The purpose of this folder is to hold the PowerNSX scripts used to supplement the automation and configuration of NSX.

Examples include Creating:
Distributed FW Rules
IP Sets
Security Groups
Security tags
Adding routes to existing ESXi hosts
Configuring NSX Load Balancer

Some Usages:

### Adding Routes to Edges
`Get-NsxEdge sres-esg01 | Get-NsxEdgeRouting | New-NsxEdgeStaticRoute -Network 100.120.42.0/24 -NextHop 100.120.32.9 -Vnic 0 -Description "PowerNSX Added Route to DR500 APP INTERNAL“`

### Creating Security Tags
`New-NsxSecurityTag -Name TestST`

### Assigning Security Tags to VMs
`Get-NsxSecurityTag TestST | New-NsxSecurityTagAssignment -ApplytoVM -VirtualMachine (get-VM TestVM)`

### Creating Security Groups
`New-NsxSecurityGroup -Name TestSG -Description "Test creating an NSX SecurityGroup"`

### Adding objects into Security Groups
`New-NsxSecurityGroup -Name TestSG -Description "Test creating an NSX SecurityGroup" -IncludeMember (Get-NsxSecurityTag  TestST)`

### Create a new IPSet
`New-NsxIpSet -Name HOST-DA-nl02qlt00ci00rm -IPAddress 111.22.33.444 -Description “WebReports (CustDB Replica)”`

### Adding FW Rule Sections
`$FWRule = Get-NsxFirewallSection -Name “Default Section Layer3" New-NsxFirewallSection -Name DRES500 -position before -anchorId $FWRule.id`

### Adding FW Rules
`Get-NsxFirewallSection DMZ | New-NsxFirewallRule -name “Internet Access” -source $LS -destination $ipsrfc1918 -NegateDestination -Action “allow” -AppliedTo $sgcluster -Service $httptraffic`

`New-NsxFirewallRule -Section (Get-NsxFirewallSection "SRES") -Name “Automation Control Node to Provider”-Source (Get-NsxSecurityGroup  "SG-SRES-Automation-Control-Node") -Destination (Get-NsxIpSet  “NET-WDC-CGN subnets”),(Get-NsxIpSet “NET-WDC-GSNI subnets”),(Get-NsxIpSet “NET-SL-IRES-Portable”) -Action allow -Service (Get-NsxService HTTPS -LocalOnly),(Get-NsxService SSH -LocalOnly) -ApplyToDfw -ApplyToAllEdges -EnableLogging -Comment "Automation Control Node to Provider”-Position before -anchorId $FWRule.id`

### Update existing FW Rules
`Get-NsxFirewallSection DMZ | Get-NsxFirewallRule “Internet Access” | Add-NsxFirewallRuleMember -MemberType Source -Member $DMZViewLogicalSwitch`
