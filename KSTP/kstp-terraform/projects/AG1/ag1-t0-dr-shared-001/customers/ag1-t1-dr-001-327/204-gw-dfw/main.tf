
data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

locals {
  gw_scope = data.nsxt_policy_tier1_gateway.select.path
  change   = "CHGEU0200098-RITM0145085"
  consumable_service = "GSTaaS"
  dres     = "327"
}

resource "nsxt_policy_gateway_policy" "policies_TF-AG-GSTAAS-DRES327-INFRA" {
  display_name    = "TF-AG-${local.consumable_service}-${local.dres}-INFRA"
  category        = "LocalGatewayRules"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-AG-${local.consumable_service}-${local.dres}-INFRA"
  comments        = local.change
  sequence_number = 0
# SRES to DRES DNS  
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-DNS"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-327-GSTaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# DRES to SRES DNS
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-DNS"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-327-GSTaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# DRES AD Clients to DRES DNS  
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-DNS"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-327-GSTaaS-AD-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-327-GSTaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# DRES Mail Clients to DRES SMTP Server  
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-SMTP"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-327-GSTaaS-Mail-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafistl"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# Arxview Management  
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-Arxview_Management"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1d327wpafistw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafiarx",
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafistl",
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafifm",
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafiskl",
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafiocum"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-80-8443-443",
      "/infra/services/TCP-8080",
      "/infra/services/TCP-9443",
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# Ansible to DRES stl Server  
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-Ansible"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/AG1-SG-SRES-OCP-Cluster05"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafistl"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# DRES SMTP to PDR SMTP  
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-PDR-SMTP"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafistl"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# DRES STR to ARX MicroStrategy
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-MicroStrategy"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafiarx"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# DRES ARX to STR MicroStrategy (Reverse)
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-MicroStrategy-1"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafiarx"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# SRES to ARX MicroStrategy Desktop
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-MicroStrategy_Desktop"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafiarx"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# ARX to SRES MicroStrategy Desktop (Reverse)
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-MicroStrategy_Desktop-1"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafiarx"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# DRES AD Clients to PDR Proxy  
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-PDR-PROXY"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-327-GSTaaS-AD-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IP-PDR-Internet-Proxy-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Squid-Proxy-8080"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
# DRES STL to Netcool  
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-Netcool"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-VM-ag1dr327lpafistl"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-MEaaS-Netcool-Probe"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/IKE_(NAT_Traversal)"
    ]
    scope = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-AG-${local.consumable_service}-${local.dres}"
    }
  }
}