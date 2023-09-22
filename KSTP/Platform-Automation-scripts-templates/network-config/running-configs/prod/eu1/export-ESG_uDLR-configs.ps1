#################################################
##### Export NSX ESG & DLR configuration    #####
##### (c) Yevgeniy Steblyanko               #####
##### yevgeniy.steblyanko@cz.ibm.com        #####
##### ver 0.1.0, 23.03.2020                  #####
#################################################

$vCenterServerName = " eu1vc1.eu1.sp.ibm.local " # EU Prod

Write-Host -foregroundcolor "Green" "Script for _Export ESG & DLR configurations_ started..."
Connect-NsxServer -vCenterServer $vCenterServerName

$currentDate = Get-Date -Format "dd_MM_yyyy-HH_mm"
If (-Not (Test-Path -LiteralPath ("ESGs-DLRs-Config-Export-" + $currentDate ))){ $outputFileFolder = New-Item ("ESGs-DLRs-Config-Export-" + $currentDate) -itemtype directory}

Write-Host "Collecting information for ESGs"
$allESGs = Get-NsxEdge
Write-Host "Found" $allESGs.count "ESGs"

Write-Host "Collecting information for DLRs"
$allDLRs = Get-NsxLogicalRouter
Write-Host "Found" $allDLRs.count "DLRs"

Write-Host "Collecting the rest NSX objects"
$allLSs = Get-NsxLogicalSwitch
$VDSwitches = Get-VDSwitch
$VDPorts = $VDSwitches | Get-VDPortgroup

If ($allESGs.count -gt 0) {
  Foreach ($ESG in $allESGs)
  {
      $ESGExport = ""
      Write-Host  "Collecting info for " -NoNewLine
      Write-Host  -foregroundcolor "Yellow" $ESG.name
      $ESGExport += "Name = " + $ESG.name + "`n"
      $ESGExport += "Hostname = " + $ESG.fqdn + "`n"
      $ESGExport += "Description = " + $ESG.description + "`n"
      $ESGExport += "Edge ID = " + $ESG.id + "`n"
      $ESGExport += "Type = " + $ESG.type
          if ($ESG.type -eq "gatewayServices"){$ESGExport += " (Edge Services Gateway)"}
          $ESGExport += "`n"
      $ESGExport += "Enable High Availability = " + $ESG.features.highAvailability.enabled + "`n"
      $ESGExport += "CLI credentials (User Name) = " + $ESG.cliSettings.userName + "`n"
      $ESGExport += "Enable SSH access = " + $ESG.cliSettings.remoteAccess + "`n"
      $ESGExport += "Enable FIPS mode = " + $ESG.enableFips + "`n"
      $ESGExport += "Enable Auto rule generation = " + $ESG.autoConfiguration.enabled + "`n"
      $ESGExport += "Edge Control Level Logging = " + $ESG.vseLogLevel + "`n"
      $ESGExport += "Datacenter = " + $ESG.datacenterName + "`n"
      $ESGExport += "Appliance Size = " + $ESG.appliances.applianceSize + "`n"
      $ESGExport += "`n"

      $ESGExport += "NSX Edge Appliances: " + "`n"
          Foreach($ESGappliance in $ESG.appliances.appliance){
              $ESGExport += "  Index: " + $ESGappliance.highAvailabilityIndex + "`n"
              $ESGExport += "    Name: " + $ESGappliance.vmName + "`n"
              $ESGExport += "    Cluster/Resource Pool: " + $ESGappliance.resourcePoolName + "`n"
              $ESGExport += "    Datastore: " + $ESGappliance.datastoreName + "`n"
              $ESGExport += "    Folder: " + $ESGappliance.vmFolderName + "`n"
              $ESGExport += "    Resource Reservation: "
              $ESGExport += " CPU = " + $ESGappliance.cpuReservation.reservation
              $ESGExport += ", Memory = " + $ESGappliance.memoryReservation.reservation +  "`n"
          }
      $ESGExport += "Configure interfaces" + "`n"
          Foreach($ESGvnic in $ESG.vnics.vnic){
              $ESGExport += "  Index: " + $ESGvnic.index
              If ($ESGvnic.portgroupId){
                  $ESGExport += "`n    Name: " + $ESGvnic.name + "`n"
                  $ESGExport += "    Type: " + $ESGvnic.type + "`n"
                  $ESGExport += "    Connectivity Status: "
                      If ($ESGvnic.isConnected -eq "true") {$ESGExport += "Connected`n"}
                      Else {$ESGExport += "Disonnected`n"}
                  $ESGExport += "    Connected to: "
                  If (($ESGvnic.portgroupId -like "universalwire-*") -or ($ESGvnic.portgroupId -like "virtualwire-*")) {                              # Find LogicalSwitch name
                      $LS = $allLSs | Where-Object {$_.objectId -eq $ESGvnic.portgroupId}
                      $ESGExport += "Logical Switch -> " + $LS.name + "`n"
                  }
                  ElseIf ($ESGvnic.portgroupId -like "dvportgroup-*"){                            # Find Distributed Virtual Portgroup name
                      $VDPort = $VDPorts | Where-Object {$_.Key -eq $ESGvnic.portgroupId}
                      $ESGExport += "DistributedVirtualPortgroup -> " + $VDPort.name + "`n"
                  }
                  Else { $ESGExport += "unknown type -> " + $ESGvnic.portgroupId + "`n" }
                  Foreach ($ESGvnicAddressGroup in $ESGvnic.addressGroups.addressGroup) {         # find Primary and Secondary IP addresses for vNIC
                    $ESGExport += "      Primary IP Address: " + $ESGvnicAddressGroup.primaryAddress + "`n"
                    Foreach ($ESGvnicAddressGroupSecondaryAddress in $ESGvnicAddressGroup.secondaryAddresses.ipAddress) {
                      $ESGExport += "        Secondary IP Address: " + $ESGvnicAddressGroupSecondaryAddress + "`n"
                    }
                     $ESGExport += "        Subnet Prefix Length: " + $ESGvnicAddressGroup.subnetPrefixLength + "`n"
                  }
                  $ESGExport += "    MTU: " + $ESGvnic.mtu + "`n"
                  $ESGExport += "    Enable Proxy Arp: " + $ESGvnic.enableProxyArp + "`n"
                  $ESGExport += "    Enable Send Redirects: " + $ESGvnic.enableSendRedirects + "`n"
              }
              Else { $ESGExport += " (Not configured)`n" }                                         # Nothing configured for this NIC
          }

      $ESGRouting = $ESG | Get-NsxEdgeRouting
      If ($ESGRouting.staticRouting.defaultRoute) {
          $ESGExport += "Configure default gateway: true`n"
          $ESGdefaultRouteNIC = $ESG.vnics.vnic | Where-Object {$_.index -eq $ESGRouting.staticRouting.defaultRoute.vnic}
          $ESGExport += "  vNIC: " + $ESGdefaultRouteNIC.name + "`n"
          $ESGExport += "  Gateway IP: " + $ESGRouting.staticRouting.defaultRoute.gatewayAddress + "`n"
          $ESGExport += "  Admin distance: " + $ESGRouting.staticRouting.defaultRoute.adminDistance + "`n"
      }
      Else {$ESGExport += "Configure default gateway: false`n"}

      #Configure Firewall default policy
      $ESGDefaultFirewall = $ESG.features.firewall
      $ESGExport += "Configure Firewall default policy: " + $ESGDefaultFirewall.enabled + "`n"
      If ($ESGDefaultFirewall.enabled -eq "true") {
        $ESGExport += "  Firewall default action: " + $ESGDefaultFirewall.defaultPolicy.action + "`n"
        $ESGExport += "  Firewall default logging: " + $ESGDefaultFirewall.defaultPolicy.loggingEnabled + "`n"
      }

      #Configure HA parameters
      $ESGDefaultHA = $ESG.features.highAvailability
      $ESGExport += "Configure HA: " + $ESGDefaultHA.enabled + "`n"
      If ($ESGDefaultHA.enabled -eq "true") {
        $ESGExport += "  vNIC: " + $ESGDefaultHA.vnic + "`n"
        $ESGExport += "  Declare Dead Time: " + $ESGDefaultHA.declareDeadTime + "`n"
        $ESGExport += "  Enable logging: " + $ESGDefaultHA.logging.enable + "`n"
        $ESGExport += "  Log level: " + $ESGDefaultHA.logging.loglevel + "`n"
      }

      ### After deployment tasks
      $ESGExport += "`nAfter deployment tasks`n`n"

      # Configuration
      $ESGExport += "Configuration`n"

      # Syslog configuration
      $ESGExport += "  Syslog`n"
      $ESGExport += "    Syslog Enabled: " + $ESG.features.syslog.enabled + "`n"
      Foreach ($ESGsyslogServer in $ESG.features.syslog.serverAddresses.ipAddress) {
        $ESGExport += "    Syslog Server: " + $ESGsyslogServer + "`n"
      }
      $ESGExport += "    Protocol: " + $ESG.features.syslog.protocol + "`n"

      # DNS Configuration
      $ESGExport += "  DNS Configuration`n"
      $ESGDNS = $ESG | Get-NsxDns
      $ESGExport += "    Enable DNS service: " + $ESGDNS.enabled + "`n"
      $ESGExport += "      Interface: " + $ESGDNS.listeners.vnic + "`n"
      Foreach ($ESGDNSServer in $ESGDNS.dnsViews.dnsView.forwarders.ipAddress) {
        $ESGExport += "      DNS Server: " + $ESGDNSServer + "`n"
      }
      $ESGExport += "      Cache Size: " + $ESGDNS.cacheSize + "`n"
      $ESGExport += "    Enable Logging: " + $ESGDNS.logging.enable + "`n"
      $ESGExport += "      Log level: " + $ESGDNS.logging.logLevel + "`n"

      # Global Configuration
      $ESGExport += "Global Configuration`n"
      $ESGExport += "  ECMP: " + $ESGRouting.routingGlobalConfig.ecmp + "`n"
      # Default Gateway
      If ($ESGRouting.staticRouting.defaultRoute) {
        $ESGExport += "  Default Gateway`n"
        $ESGdgwvNic = $ESG.vnics.vnic | Where-Object {$_.index -eq $ESGRouting.staticRouting.defaultRoute.vnic}
        $ESGExport += "    vNIC: " + $ESGRouting.staticRouting.defaultRoute.vnic + " (" + $ESGdgwvNic.name + ")" + "`n"
        $ESGExport += "    Gateway IP: " + $ESGRouting.staticRouting.defaultRoute.gatewayAddress + "`n"
        $ESGExport += "    Admin distance: " + $ESGRouting.staticRouting.defaultRoute.adminDistance + "`n"
        $ESGExport += "    Description: " + $ESGRouting.staticRouting.defaultRoute.description + "`n"
      }
      Else {$ESGExport += "  Default Gateway: none`n"}

      $ESGExport += "  Dynamic Routing Configuration`n"
      # Dynamic Routing Configuration
      $ESGExport += "    Router ID: " + $ESGRouting.routingGlobalConfig.routerId + "`n"

      # Static Routes
      $ESGRoutingStaticRoutes = $ESGRouting.staticRouting.staticRoutes.route | Where {$_.type -eq "user"}
      If ($ESGRoutingStaticRoutes) {
        $ESGExport += "  Static Routes`n"
        Foreach ($ESGRoutingStaticRoute in $ESGRoutingStaticRoutes) {
          $ESGExport += "    Network: " + $ESGRoutingStaticRoute.network
          $ESGExport += ", Next Hop: " + $ESGRoutingStaticRoute.nextHop
          If ($ESGRoutingStaticRoute.vnic) {
            $ESGstaticRoutevNicName = ($ESG.vnics.vnic | Where-Object {$_.index -eq $ESGRoutingStaticRoute.vnic}).name
          }
          Else {$ESGstaticRoutevNicName = "none"}
          $ESGExport += ", Interface: " + $ESGstaticRoutevNicName
          $ESGExport += ", Admin Distance: " + $ESGRoutingStaticRoute.adminDistance
          $ESGExport += ", Description: " + $ESGRoutingStaticRoute.description
          $ESGExport += "`n"
        }
      }
      Else {$ESGExport += "  Static Routes: none`n"}

      # BGP
      # Get info for BGP if Enabled
      If ($ESGRouting.bgp.enabled -eq "true") {
        $ESGExport += "  BGP Configuration`n"
        $ESGExport += "    Enable BGP: " + $ESGRouting.bgp.enabled + "`n"
        $ESGExport += "    Enable Graceful Restart: " + $ESGRouting.bgp.gracefulRestart + "`n"
        $ESGExport += "    Enable Default Originate: " + $ESGRouting.bgp.defaultOriginate + "`n"
        $ESGExport += "    Local AS: " + $ESGRouting.bgp.localASNumber + "`n"
        $ESGExport += "  BGP Neighbours" + "`n"
        Foreach ($ESGRoutingBgpNeighbour in $ESGRouting.bgp.bgpNeighbours.bgpNeighbour) {
          $ESGExport += "    IP Address: " + $ESGRoutingBgpNeighbour.ipAddress + "`n"
          $ESGExport += "      Remote AS: " + $ESGRoutingBgpNeighbour.remoteASNumber + "`n"
          $ESGExport += "      Remove Private AS: " + $ESGRoutingBgpNeighbour.removePrivateAS + "`n"
          $ESGExport += "      Weight: " + $ESGRoutingBgpNeighbour.weight + "`n"
          $ESGExport += "      Keep Alive Time: " + $ESGRoutingBgpNeighbour.keepAliveTimer + "`n"
          $ESGExport += "      Hold Down Time: " + $ESGRoutingBgpNeighbour.holdDownTimer + "`n"
          If ($ESGRoutingBgpNeighbour.password) {
            $ESGExport += "      Password exists: true`n" }
          Else {$ESGExport += "      Password exists: false`n"}
          # collect BGP Filters
          If ($ESGRoutingBgpNeighbour.bgpFilters.bgpFilter) {
            $ESGExport += "      BGP Filters`n"
            Foreach ($ESGRoutingBgpNeighbourbgpFilter in $ESGRoutingBgpNeighbour.bgpFilters.bgpFilter) {
              $ESGExport += "        Direction: " + $ESGRoutingBgpNeighbourbgpFilter.direction + "`n"
              $ESGExport += "         Action: " + $ESGRoutingBgpNeighbourbgpFilter.action + "`n"
              $ESGExport += "         Network: " + $ESGRoutingBgpNeighbourbgpFilter.network + "`n"
              $ESGExport += "         IP Prefix GE: " + $ESGRoutingBgpNeighbourbgpFilter.ipPrefixGe + "`n"
              $ESGExport += "         IP Prefix LE: " + $ESGRoutingBgpNeighbourbgpFilter.ipPrefixLe + "`n"
            }
          }
          Else {$ESGExport += "      BGP Filters: none`n"}
        }
      }
      Else {$ESGExport += "  BGP Configuration: none`n"}
      # collect Route Redistribution
      $ESGExport += "  Route Redistribution OSPF: " + $ESGRouting.ospf.redistribution.enabled + "`n"
      If ($ESGRouting.bgp.redistribution.enabled) {$ESGExport += "  Route Redistribution BGP: " + $ESGRouting.bgp.redistribution.enabled + "`n"}
      Else {$ESGExport += "  Route Redistribution BGP: none`n"}
      # collect IP Prefixes
      If ($ESGRouting.routingGlobalConfig.ipPrefixes.ipPrefix) {
        $ESGExport += "  IP Prefixes`n"
        Foreach ($ESGroutingGlobalConfigIpPrefix in $ESGRouting.routingGlobalConfig.ipPrefixes.ipPrefix) {
          $ESGExport += "    Name: " + $ESGroutingGlobalConfigIpPrefix.name + "`n"
          $ESGExport += "      IP/Network: " + $ESGroutingGlobalConfigIpPrefix.ipAddress + "`n"
          $ESGExport += "      IP Prefix GE: " + $ESGroutingGlobalConfigIpPrefix.ge + "`n"
          $ESGExport += "      IP Prefix LE: " + $ESGroutingGlobalConfigIpPrefix.le + "`n"
        }
      }
      # Route Redistribution Table
      If ($ESGRouting.bgp.redistribution.rules.rule) {
        $ESGExport += "  Route Redistribution Table" + "`n"
        Foreach ($ESGRoutingBgpRedistributionRule in $ESGRouting.bgp.redistribution.rules.rule) {
          $ESGExport += "    ID: " + $ESGRoutingBgpRedistributionRule.id + ","
          $ESGExport += " Learner: BGP,"
          $ESGExport += " From: "
          If ($ESGRoutingBgpRedistributionRule.from.ospf -eq "true") {$ESGExport += "OSPF,"}
          If ($ESGRoutingBgpRedistributionRule.from.bgp -eq "true") {$ESGExport += "BGP,"}
          If ($ESGRoutingBgpRedistributionRule.from.static -eq "true") {$ESGExport += "Static Routes,"}
          If ($ESGRoutingBgpRedistributionRule.from.connected -eq "true") {$ESGExport += "Connected,"}
          If ($ESGRoutingBgpRedistributionRule.prefixName) {$ESGExport += " Prefix: " + $ESGRoutingBgpRedistributionRule.prefixName + ","}
          Else {$ESGExport += " Prefix: Any,"}
          $ESGExport += " Action: " + $ESGRoutingBgpRedistributionRule.action
          $ESGExport += "`n"
        }
      }

      $ESGExport += "`n"

      $outputFileName = "Config-for-ESG_" + $ESG.name + ".txt"
      $ESGExport | Out-File -filePath ($outputFileFolder.Name + "\" + $outputFileName)
  }
}

# Collecting information for DLRs
If ($allDLRs.count -gt 0) {
  Foreach ($DLR in $allDLRs)
  {
      $DLRExport = ""
      Write-Host  "Collecting info for " -NoNewLine
      Write-Host  -foregroundcolor "Yellow" $DLR.name
      $DLRExport += "Name = " + $DLR.name + "`n"
      $DLRExport += "Hostname = " + $DLR.fqdn + "`n"
      $DLRExport += "Description = " + $DLR.description + "`n"
      $DLRExport += "Router ID = " + $DLR.id + "`n"
      $DLRExport += "Type = " + $DLR.type
          if ($DLR.type -eq "distributedRouter"){$DLRExport += " (Logical Router)"}
          $DLRExport += "`n"
      $DLRExport += "Enable High Availability = " + $DLR.features.highAvailability.enabled + "`n"
      $DLRExport += "CLI credentials (User Name) = " + $DLR.cliSettings.userName + "`n"
      $DLRExport += "Enable SSH access = " + $DLR.cliSettings.remoteAccess + "`n"
      $DLRExport += "Enable FIPS mode = " + $DLR.enableFips + "`n"
      $DLRExport += "Edge Control Level Logging = " + $DLR.vseLogLevel + "`n"
      $DLRExport += "Datacenter = " + $DLR.datacenterName + "`n"
      $DLRExport += "Appliance Size = " + $DLR.appliances.applianceSize + "`n"
      $DLRExport += "`n"

      $DLRExport += "NSX Edge Appliances: " + "`n"
          Foreach($DLRappliance in $DLR.appliances.appliance){
              $DLRExport += "  Index: " + $DLRappliance.highAvailabilityIndex + "`n"
              $DLRExport += "    Name: " + $DLRappliance.vmName + "`n"
              $DLRExport += "    Cluster/Resource Pool: " + $DLRappliance.resourcePoolName + "`n"
              $DLRExport += "    Datastore: " + $DLRappliance.datastoreName + "`n"
              $DLRExport += "    Folder: " + $DLRappliance.vmFolderName + "`n"
              $DLRExport += "    Resource Reservation: "
              $DLRExport += " CPU = " + $DLRappliance.cpuReservation.reservation
              $DLRExport += ", Memory = " + $DLRappliance.memoryReservation.reservation +  "`n"
          }
      $DLRExport += "Configure interfaces" + "`n"

      $DLRExport += "  HA Interface Configuration`n"
      $DLRExport += "    Conected To: " + $DLR.mgmtInterface.connectedToName + "`n"
      $DLRExport += "  Interfaces" + "`n"
          Foreach($DLRvnic in $DLR.interfaces.interface){
              $DLRExport += "    Index: " + $DLRvnic.index
              If ($DLRvnic.connectedToId){
                  $DLRExport += "`n      Name: " + $DLRvnic.name + "`n"
                  $DLRExport += "      Type: " + $DLRvnic.type + "`n"
                  $DLRExport += "      Connectivity Status: "
                      If ($DLRvnic.isConnected -eq "true") {$DLRExport += "Connected`n"}
                      Else {$DLRExport += "Disonnected`n"}
                  $DLRExport += "      Connected to: "
                  If (($DLRvnic.connectedToId -like "universalwire-*") -or ($DLRvnic.connectedToId -like "virtualwire-*")) {                              # Find LogicalSwitch name
                      $LS = $allLSs | Where-Object {$_.objectId -eq $DLRvnic.connectedToId}
                      $DLRExport += "Logical Switch -> " + $LS.name + "`n"
                  }
                  ElseIf ($DLRvnic.connectedToId -like "dvportgroup-*"){                            # Find Distributed Virtual Portgroup name
                      $VDPort = $VDPorts | Where-Object {$_.Key -eq $DLRvnic.connectedToId}
                      $DLRExport += "DistributedVirtualPortgroup -> " + $VDPort.name + "`n"
                  }
                  Else { $DLRExport += "unknown type -> " + $DLRvnic.connectedToId + "`n" }
                  $DLRExport += "      Primary IP Address: " + $DLRvnic.addressGroups.addressGroup.primaryAddress + "`n"
                  $DLRExport += "      Subnet Prefix Length: " + $DLRvnic.addressGroups.addressGroup.subnetPrefixLength + "`n"
                  $DLRExport += "      MTU: " + $DLRvnic.mtu + "`n"
              }
              Else { $DLRExport += " (Not configured)`n" }                                         # Nothing configured for this NIC
          }

      $DLRRouting = $DLR | Get-NsxLogicalRouterRouting
      If ($DLRRouting.staticRouting.defaultRoute) {
          $DLRExport += "Configure default gateway: true`n"
          $DLRExport += "  Gateway IP: " + $DLRRouting.staticRouting.defaultRoute.gatewayAddress + "`n"
          $DLRExport += "  Admin distance: " + $DLRRouting.staticRouting.defaultRoute.adminDistance + "`n"
      }
      Else {$DLRExport += "Configure default gateway: false`n"}

      ### After deployment tasks
      $DLRExport += "`nAfter deployment tasks`n`n"

      # Configuration
      $DLRExport += "Configuration`n"

      # Syslog configuration
      $DLRExport += "  Syslog`n"
      $DLRExport += "    Syslog Enabled: " + $DLR.features.syslog.enabled + "`n"
      Foreach ($DLRsyslogServer in $DLR.features.syslog.serverAddresses.ipAddress) {
        $DLRExport += "    Syslog Server: " + $DLRsyslogServer + "`n"
      }
      $DLRExport += "    Protocol: " + $DLR.features.syslog.protocol + "`n"

      # Configure HA parameters
      $DLRDefaultHA = $DLR.features.highAvailability
      $DLRExport += "  HA Configuration`n"
      $DLRExport += "    HA Status: " + $DLRDefaultHA.enabled + "`n"
      If ($DLRDefaultHA.enabled -eq "true") {
        $DLRExport += "    Declare Dead Time: " + $DLRDefaultHA.declareDeadTime + "`n"
        $DLRExport += "    Enable logging: " + $DLRDefaultHA.logging.enable + "`n"
        $DLRExport += "    Log level: " + $DLRDefaultHA.logging.loglevel + "`n"
      }

      #Configure Firewall default policy
      $DLRDefaultFirewall = $DLR.features.firewall
      $DLRExport += "Firewall status: " + $DLRDefaultFirewall.enabled + "`n"
      If ($DLRDefaultFirewall.enabled -eq "true") {
        $DLRExport += "  Firewall default action: " + $DLRDefaultFirewall.defaultPolicy.action + "`n"
        $DLRExport += "  Firewall default logging: " + $DLRDefaultFirewall.defaultPolicy.loggingEnabled + "`n"
      }

      # Global Configuration
      $DLRExport += "Global Configuration`n"
      $DLRExport += "  ECMP: " + $DLRRouting.routingGlobalConfig.ecmp + "`n"
      # Default Gateway
      If ($DLRRouting.staticRouting.defaultRoute) {
        $DLRExport += "  Default Gateway`n"
        $DLRExport += "    Gateway IP: " + $DLRRouting.staticRouting.defaultRoute.gatewayAddress + "`n"
        $DLRExport += "    Admin distance: " + $DLRRouting.staticRouting.defaultRoute.adminDistance + "`n"
        $DLRExport += "    Description: " + $DLRRouting.staticRouting.defaultRoute.description + "`n"
      }
      Else {$DLRExport += "  Default Gateway: none`n"}

      $DLRExport += "  Dynamic Routing Configuration`n"
      # Dynamic Routing Configuration
      $DLRExport += "    Router ID: " + $DLRRouting.routingGlobalConfig.routerId + "`n"

      # Static Routes
      If ($DLRRouting.staticRouting.staticRoutes.route) {
        $DLRExport += "  Static Routes`n"
        Foreach ($DLRRoutingStaticRoute in $DLRRouting.staticRouting.staticRoutes.route) {
          $DLRExport += "    Network: " + $DLRRoutingStaticRoute.network
          $DLRExport += ", Next Hop: " + $DLRRoutingStaticRoute.nextHop
          If ($DLRRoutingStaticRoute.vnic) {
            $DLRstaticRoutevNicName = ($DLR.interfaces.interface | Where-Object {$_.index -eq $DLRRoutingStaticRoute.vnic}).name
          }
          Else {$DLRstaticRoutevNicName = "none"}
          $DLRExport += ", Interface: " + $DLRstaticRoutevNicName
          $DLRExport += ", Admin Distance: " + $DLRRoutingStaticRoute.adminDistance
          $DLRExport += ", Description: " + $DLRRoutingStaticRoute.description
          $DLRExport += "`n"
        }
      }
      Else {$DLRExport += "  Static Routes: none`n"}

      # BGP
      If ($DLRRouting.bgp.enabled -eq "true") {
        $DLRExport += "  BGP Configuration`n"
        $DLRExport += "    Enable BGP: " + $DLRRouting.bgp.enabled + "`n"
        $DLRExport += "    Enable Graceful Restart: " + $DLRRouting.bgp.gracefulRestart + "`n"
        $DLRExport += "    Local AS: " + $DLRRouting.bgp.localASNumber + "`n"
        $DLRExport += "  BGP Neighbours" + "`n"
        Foreach ($DLRRoutingBgpNeighbour in $DLRRouting.bgp.bgpNeighbours.bgpNeighbour) {
          $DLRExport += "    IP Address: " + $DLRRoutingBgpNeighbour.ipAddress + "`n"
          $DLRExport += "      Forwarding Address: " + $DLRRoutingBgpNeighbour.forwardingAddress + "`n"
          $DLRExport += "      Protocol Address: " + $DLRRoutingBgpNeighbour.protocolAddress + "`n"
          $DLRExport += "      Remote AS: " + $DLRRoutingBgpNeighbour.remoteASNumber + "`n"
          $DLRExport += "      Weight: " + $DLRRoutingBgpNeighbour.weight + "`n"
          $DLRExport += "      Keep Alive Time: " + $DLRRoutingBgpNeighbour.keepAliveTimer + "`n"
          $DLRExport += "      Hold Down Time: " + $DLRRoutingBgpNeighbour.holdDownTimer + "`n"
          If ($DLRRoutingBgpNeighbour.password) {
            $DLRExport += "      Password exists: true`n" }
          Else {$DLRExport += "      Password exists: false`n"}
          # collect BGP Filters
          If ($DLRRoutingBgpNeighbour.bgpFilters.bgpFilter) {
            $DLRExport += "      BGP Filters`n"
            Foreach ($DLRRoutingBgpNeighbourbgpFilter in $DLRRoutingBgpNeighbour.bgpFilters.bgpFilter) {
              $DLRExport += "        Direction: " + $DLRRoutingBgpNeighbourbgpFilter.direction + "`n"
              $DLRExport += "         Action: " + $DLRRoutingBgpNeighbourbgpFilter.action + "`n"
              $DLRExport += "         Network: " + $DLRRoutingBgpNeighbourbgpFilter.network + "`n"
              $DLRExport += "         IP Prefix GE: " + $DLRRoutingBgpNeighbourbgpFilter.ipPrefixGe + "`n"
              $DLRExport += "         IP Prefix LE: " + $DLRRoutingBgpNeighbourbgpFilter.ipPrefixLe + "`n"
            }
          }
          Else {$DLRExport += "      BGP Filters: none`n"}
        }
      }
      Else {$DLRExport += "  BGP Configuration: none`n"}
      # collect Route Redistribution
      $DLRExport += "  Route Redistribution OSPF: " + $DLRRouting.ospf.redistribution.enabled + "`n"
      If ($DLRRouting.bgp.redistribution.enabled -eq "true") {
        $DLRExport += "  Route Redistribution BGP: " + $DLRRouting.bgp.redistribution.enabled + "`n"
        # collect IP Prefixes
        $DLRExport += "  IP Prefixes`n"
        Foreach ($DLRroutingGlobalConfigIpPrefix in $DLRRouting.routingGlobalConfig.ipPrefixes.ipPrefix) {
          $DLRExport += "    Name: " + $DLRroutingGlobalConfigIpPrefix.name + "`n"
          $DLRExport += "      IP/Network: " + $DLRroutingGlobalConfigIpPrefix.ipAddress + "`n"
          $DLRExport += "      IP Prefix GE: " + $DLRroutingGlobalConfigIpPrefix.ge + "`n"
          $DLRExport += "      IP Prefix LE: " + $DLRroutingGlobalConfigIpPrefix.le + "`n"
        }
      }
      Else {$DLRExport += "  Route Redistribution BGP: none`n"}
      # Route Redistribution Table
      If ($DLRRouting.bgp.redistribution.rules.rule) {
        $DLRExport += "  Route Redistribution Table" + "`n"
        Foreach ($DLRRoutingBgpRedistributionRule in $DLRRouting.bgp.redistribution.rules.rule) {
          $DLRExport += "    ID: " + $DLRRoutingBgpRedistributionRule.id + ","
          $DLRExport += " Learner: BGP,"
          $DLRExport += " From: "
          If ($DLRRoutingBgpRedistributionRule.from.ospf -eq "true") {$DLRExport += "OSPF,"}
          If ($DLRRoutingBgpRedistributionRule.from.bgp -eq "true") {$DLRExport += "BGP,"}
          If ($DLRRoutingBgpRedistributionRule.from.static -eq "true") {$DLRExport += "Static Routes,"}
          If ($DLRRoutingBgpRedistributionRule.from.connected -eq "true") {$DLRExport += "Connected,"}
          If ($DLRRoutingBgpRedistributionRule.prefixName) {$DLRExport += " Prefix: " + $DLRRoutingBgpRedistributionRule.prefixName + ","}
          Else {$DLRExport += " Prefix: Any,"}
          $DLRExport += " Action: " + $DLRRoutingBgpRedistributionRule.action
          $DLRExport += "`n"
        }
      }

      $DLRExport += "`n"

      $outputFileName = "Config-for-DLR_" + $DLR.name + ".txt"
      $DLRExport | Out-File -filePath ($outputFileFolder.Name + "\" + $outputFileName)
  }
}

Disconnect-NsxServer -vCenterServer $vCenterServerName
Disconnect-VIServer -Server $vCenterServerName -Confirm:$False

Write-Host -foregroundcolor "Green" "`nScript completed!"
