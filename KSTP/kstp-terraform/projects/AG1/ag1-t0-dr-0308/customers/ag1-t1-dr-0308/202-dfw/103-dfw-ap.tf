
resource "nsxt_policy_security_policy" "policies_TF-AG1-DRES308-AP" {
  display_name    = "TF-AG1--${local.dres}-AP"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-AG1-${local.dres}-AP"
  comments        = "RITM0152472"
  sequence_number = 0

#TACACS
rule {
    display_name = "TF-AG1-${local.dres}-TACACS"
    notes        = "RITM0152472"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
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

rule {
    display_name = "TF-AG1-${local.dres}-RP_AGENTS-APAC_ENDPOINTS"
    notes        = "RITM0152473"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308apprkrp2",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
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
    display_name = "TF-AG1-${local.dres}-RP_AGENTS-APAC_ENDPOINTS"
    notes        = "RITM0152473"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
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
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC",
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
    display_name = "TF-AG1-${local.dres}-SSH-HTTPS-DRES_JH-ASPAC_ENDPOINTS"
    notes        = "RITM0152474"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpprkjmp2",
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
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
    display_name = "TF-AG1-${local.dres}-NTP-ASPAC_ENDPOINTS-DRES_JH"
    notes        = "RITM0152474"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
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
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC",
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

# ICMP SNMP
rule {
    display_name = "TF-AG1-${local.dres}-DC-to-ASPAC_ENDPOINTS-SNMP"
    notes        = "RITM0153403"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc1",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc2",
      "/infra/domains/default/groups/TF-AG1-VM-ag1d308lpecnsdc3"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
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
    display_name = "TF-AG1-${local.dres}-ASPAC_ENDPOINTS-SNMP-to-ag1d308lpecnsmc1"
    notes        = "RITM0153403"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
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


}