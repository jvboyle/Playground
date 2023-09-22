
locals {
  change   = "CHGEU0212520/CTASKEU0413064"
  consumable_service = "AIOPS"
  dres     = "302"
}

resource "nsxt_policy_security_policy" "policies_TF-AG1-AIOPS-DRES302" {
  display_name    = "TF-${var.environment}-${local.consumable_service}-DRES${local.dres}"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-${var.environment}-${local.consumable_service}-DRES${local.dres}"
  comments        = local.change
  sequence_number = 0

# CPREM-SFS-RELAY to DRES Proxy VIP 
  rule {
    display_name = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}-CPREM-SFS-RELAY-SCOPE-PROXY-VIP"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DR302-AIOPS-CPREM-SFS-RELAY-SCOPE"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DR302-AIOPS-Proxy-Vip"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DR302-AIOPS-Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}"
    }
  }

# DRES Proxy to CPREM-SFS-RELAY  
  rule {
    display_name = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}-PROXY-VIP-CPREM-SFS-RELAY-SCOPE"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DR302-AIOPS-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DR302-AIOPS-CPREM-SFS-RELAY-SCOPE"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DR302-AIOPS-Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}"
    }
  }

# DRES Proxy to IRES DNS  
  rule {
    display_name = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}-PROXY-IRES-DNS"
    notes        = "RITM0161572"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DR302-AIOPS-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Microsoft_Active_Directory_V1"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DR302-AIOPS-Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}"
    }
  }

}