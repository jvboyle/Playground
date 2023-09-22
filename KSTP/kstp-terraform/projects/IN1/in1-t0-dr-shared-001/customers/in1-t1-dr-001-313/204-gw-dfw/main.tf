

data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

locals {
  gw_scope = data.nsxt_policy_tier1_gateway.select.path
}

resource "nsxt_policy_gateway_policy" "policies_TF-CACF-IN-DRES313" {
  display_name    = "TF-CACF-IN-DRES313"
  category        = "LocalGatewayRules"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-CACF-IN-DRES313"
  comments        = "CHGEU0200296"
  sequence_number = 0
  rule {
    display_name = "TF-CACF-IN-DRES313-OCP-to-Proxy-vip"
    notes        = "CHGEU0200296"
    source_groups = [
      "/infra/domains/default/groups/IN1-SG-SRES-OCP-Cluster01-cuCZEjETT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-DRES313-CACF-Proxy-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope                 = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES313"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES313-Proxy-to-Client-premise-JH"
    notes        = "CHGEU0200296"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES313-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-premise-DRES313-JH"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope                 = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES313"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES313-CACF-Proxy-to-BDS"
    notes        = "CHGEU0200296"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES313-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-VM-in1sr1lpcacfbds"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081",
    ]
    scope                 = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES313"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES313-Client-Premise-to-proxy"
    notes        = "CHGEU0200296"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-premise-DRES313-JH"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-DRES313-CACF-Proxy-VIP",
      "/infra/domains/default/groups/TF-IN1-NET-CPREM-GSNI-NAT-Range"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope                 = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES313"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES313-Proxy-2-Porxy"
    notes        = "CHGEU0200296"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES313-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES313-CACF-Proxy"
    ]
    action                = "ALLOW"
    services              = []
    scope                 = [local.gw_scope]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES313"
    }
  }
}
