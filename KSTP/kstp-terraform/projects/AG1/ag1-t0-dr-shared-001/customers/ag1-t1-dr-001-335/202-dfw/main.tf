
locals {
  change   = "RITM0151221"
  consumable_service = "CACF"
  dres     = "334"
}

resource "nsxt_policy_security_policy" "policies_TF-AG1-CACF-DRES334" {
  display_name    = "TF-${var.environment}-${local.consumable_service}-DRES${local.dres}"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-${var.environment}-${local.consumable_service}-DRES${local.dres}"
  comments        = local.change
  sequence_number = 0
# Tower to DRES Proxy VIP 
  rule {
    display_name = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}-Tower-Proxy"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/AG1-SG-SRES-OCP-Cluster05"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DR334-CACF-Proxy-Vip"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/AG1-SG-SRES-OCP-Cluster05",
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy"
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
# DRES Proxy to CPREM JHosts  
  rule {
    display_name = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}-Proxy-JHOSTS"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DR334-CACF-CPREM-JHOSTS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy"
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
# Proxy to BDS
  rule {
    display_name = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}-Proxy-BDS"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy"
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
# CPREM JHosts to Proxy VIP
  rule {
    display_name = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}-JHOSTS-Proxy"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DR334-CACF-CPREM-JHOSTS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-DR334-CACF-Proxy-Vip",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-CPREM-GSNI-NAT-Range"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy"
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
# Proxy to Proxy
  rule {
    display_name = "TF-${var.environment}-${local.consumable_service}-DR${local.dres}-Proxy-Proxy"
    notes        = local.change
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy"
    ]
    action = "ALLOW"
    services = []
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy"
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
  # DRES to IRES DNS
  rule {
    display_name = "TF-AG-${local.consumable_service}-${local.dres}-IRES-DNS"
    notes        = "RITM0152775"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Microsoft_Active_Directory_V1",
      "/infra/services/TCP-139"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-DR334-CACF-Proxy",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
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