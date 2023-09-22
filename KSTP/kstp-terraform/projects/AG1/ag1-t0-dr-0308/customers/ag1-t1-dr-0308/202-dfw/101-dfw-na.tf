
resource "nsxt_policy_security_policy" "policies_TF-AG1-DRES308" {
  display_name    = "TF-AG1--${local.dres}"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-AG1-${local.dres}"
  comments        = local.change
  sequence_number = 0

# RADIUS  
  rule {
    display_name = "TF-AG1-${local.dres}-RADIUS"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Windows-Clients",
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Windows-Clients",
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-1812"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Windows-Clients",
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

#TACACS
rule {
    display_name = "TF-AG1-${local.dres}-TACACS"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-49",
      "/infra/services/UDP-1812"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

  #ISE Admin Communication
rule {
    display_name = "TF-AG1-${local.dres}-ISE"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-NMSAMS-EU-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-NMSAMS-EU-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1468",
      "/infra/services/TCP-6514",
      "/infra/services/TCP-12001",
      "/infra/services/TCP-8671",
      "/infra/services/HTTPS",
      "/infra/services/TCP-15672",
      "/infra/services/TCP-6379",
      "/infra/services/ICMP-ALL",
      "/infra/services/UDP-20514",
      "/infra/services/UDP-1700",
      "/infra/services/UDP-3799"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-ISE1"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-7800",
      "/infra/services/TCP-7802",
      "/infra/services/TCP-8671",
      "/infra/services/TCP-12001",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-ISE-DNS-NTP"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/NTP",
      "/infra/services/DNS-UDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

#Admin Access
rule {
    display_name = "TF-AG1-${local.dres}-SSH"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Jumphost-NTP"
    ]
    destination_groups = [
       "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Jumphost-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-RDP"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Jumphost-NTP"
    ]
    destination_groups = [
       "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Windows-Clients"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Jumphost-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Windows-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-JH-ISE-ICMP"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Jumphost-NTP"
    ]
    destination_groups = [
       "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/ICMP-ALL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-Jumphost-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-ISE-SRES-SNMP"
    notes        = "RITM0152472"
    source_groups = [
       "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    destination_groups = [
       "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SNMP",
      "/infra/services/SNMP-Send"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

#DNS-NTP
rule {
    display_name = "TF-AG1-${local.dres}-DNS-NTP"
    notes        = "RITM0149324"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES308-AD-DNS",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"    ]
    action = "ALLOW"
    services = [
      "/infra/services/NTP",
      "/infra/services/DNS-UDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES308-AD-DNS",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

#JH-SSH
rule {
    display_name = "TF-AG1-${local.dres}-JH-SSH"
    notes        = "RITM0149324"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES308-AD-DNS",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-DRES308-AD-DNS",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

#SL1-WEB-CONFIG
rule {
    display_name = "TF-AG1-${local.dres}-SL1-WEB-CONFIG"
    notes        = "RITM0149324"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES308-AD-DNS",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-7700"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-DRES308-AD-DNS",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

# PDR-Proxy
rule {
    display_name = "TF-AG1-${local.dres}-PDR-Proxy"
    notes        = "RITM0149324"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES308-AD-DNS",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Squid-Proxy-8080"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES308-AD-DNS",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1",
      "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

# SRES-AD
rule {
    display_name = "TF-AG1-${local.dres}-SRES-AD"
    notes        = "RITM0148619"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308wprkorp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308wprkorp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Microsoft_Active_Directory_V1",
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308wprkorp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308wprkorp2",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

# SNMP
rule {
    display_name = "TF-AG1-${local.dres}-SNMP"
    notes        = "RITM0149339"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES308-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SNMP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES308-AD-DNS",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

# SNMP-SYSLOG
rule {
    display_name = "TF-AG1-${local.dres}-SNMP-SYSLOG"
    notes        = "RITM0149339"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SNMP",
      "/infra/services/Syslog_(UDP)"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

# WSUS
rule {
    display_name = "TF-AG1-${local.dres}-WSUS"
    notes        = "RITM0151436"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308wprkorp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308wprkorp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wsus01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTP",
      "/infra/services/HTTPS",
      "/infra/services/TCP-8530",
      "/infra/services/TCP-8531"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308wprkorp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308wprkorp2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wsus01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

  #IRES DNS-NTP
rule {
    display_name = "TF-AG1-${local.dres}-IRES-DNS-NTP"
    notes        = local.change
    source_groups = [
       "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    destination_groups = [
       "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/DNS-UDP",
      "/infra/services/NTP"
    ]
    scope = [
       "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE",
       "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

# RP Communication
rule {
    display_name = "TF-AG1-${local.dres}-RP_AGENT-to-RP_MASTER"
    notes        = "RITM0152392"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-RP-MASTER"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

# ICMP SNMP
rule {
    display_name = "TF-AG1-${local.dres}-DC-to-ENDPOINTS-SNMP"
    notes        = "RITM0153403"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc2",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc3"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-US",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-CALA",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"            
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SNMP-Recieve",
      "/infra/services/ICMP_Echo_Request"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc2",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc3"
    ]  
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-ENDPOINTS-SNMP-to-ag1d308lpecnsmc1"
    notes        = "RITM0153403"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-US",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-CALA",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"            
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SNMP-Send",
      "/infra/services/Syslog_(TCP)",
      "/infra/services/Syslog_(UDP)"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsmc1"
    ]  
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

# RADIUS-NA
  rule {
    display_name = "TF-AG1-${local.dres}-RADIUS-NA"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-1812"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

#TACACS-NA
rule {
    display_name = "TF-AG1-${local.dres}-TACACS-NA"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-49"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-PSN-ISE"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

#CIO DNS
rule {
    display_name = "TF-AG1-${local.dres}-CIO-DNS-BDS"
    notes        = "RITM0154468"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES${local.dres}-CIO-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-53",
      "/infra/services/UDP-53"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-BDS-CIO-DNS"
    notes        = "RITM0154468"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES${local.dres}-CIO-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-53",
      "/infra/services/UDP-53"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-DNS-DHCP-BDS"
    notes        = "RITM0154468"
    source_groups = [
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-53",
      "/infra/services/UDP-53",
      "/infra/services/TCP-67",
      "/infra/services/DHCP-Server",
      "/infra/services/TCP-547",
      "/infra/services/DHCPv6_Server"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-BDS-DHCP"
    notes        = "RITM0154468"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    destination_groups = [
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-68",
      "/infra/services/DHCP-Client",
      "/infra/services/TCP-546",
      "/infra/services/DHCPv6_Client"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-AD-DNS-BDS-ICMP"
    notes        = "RITM0154468"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/ICMP_Echo_Request"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DRES${local.dres}-AD-DNS",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-BDS-IRES-DC"
    notes        = "RITM0154468"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/NTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-amcomd01-BDS"
    notes        = "RITM0154468"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-ie3-ibv-amcomd01-kyn",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-k5q-ibv-amcomd01-kyn",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-l3n-ibv-amcomd01-kyn",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-l4a-ibv-amcomd01-kyn"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-53",
      "/infra/services/UDP-53"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-IRES-DNS"
    notes        = "RITM0152473"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-53"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-RP_AGENTS-NA_ENDPOINTS"
    notes        = "RITM0152473"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-NA_ENDPOINTS-RP_AGENTS"
    notes        = "RITM0152473"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-PING-REQUEST-DCS-RESTORE_POINT_AGENT"
    notes        = "RITM0152473"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc2",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc3"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/ICMP_Echo_Request"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc2",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc3",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-PING-REPLY-RESTORE_POINT_AGENT-DCS"
    notes        = "RITM0152473"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc2",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc3"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/ICMP_Echo_Reply"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc2",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc3",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-APPRKRP-APPRKBDS-DNS"
    notes        = "RITM0152473"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-53"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkbds2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }
  
rule {
    display_name = "TF-AG1-${local.dres}-SSH-DRES_JH-RESTORE_POINT_AGENT"
    notes        = "RITM0152473"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp2",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-SSH-HTTPS-DRES_JH-NA_ENDPOINTS"
    notes        = "RITM0152474"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp2",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

rule {
    display_name = "TF-AG1-${local.dres}-NTP-DRES_JH-NA_ENDPOINTS"
    notes        = "RITM0152474"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/NTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-DRES${local.dres}"
    }
  }

}
