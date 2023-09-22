
resource "nsxt_policy_security_policy" "policies_TF-CACF-IN-DRES311" {
  display_name    = "TF-CACF-IN-DRES311"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-CACF-IN-DRES311"
  comments        = "CHGEU0200296"
  sequence_number = 0
  rule {
    display_name = "TF-CACF-IN-DRES311-OCP-to-Proxy-vip"
    notes        = "CHGEU0200296"
    source_groups = [
      "/infra/domains/default/groups/IN1-SG-SRES-OCP-Cluster01-cuCZEjETT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-DRES311-CACF-Proxy-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES311-CACF-Proxy",
      "/infra/domains/default/groups/IN1-SG-SRES-OCP-Cluster01-cuCZEjETT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES311"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES311-Proxy-to-Client-premise-JH"
    notes        = "CHGEU0200296"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES311-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-premise-DRES311-JH"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES311-CACF-Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES311"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES311-CACF-Proxy-to-BDS"
    notes        = "CHGEU0200296"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES311-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-VM-in1sr1lpcacfbds"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081",
    ]
    scope = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES311-CACF-Proxy",
      "/infra/domains/default/groups/TF-IN1-VM-in1sr1lpcacfbds"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES311"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES311-Client-Premise-to-proxy"
    notes        = "CHGEU0200296"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-premise-DRES311-JH"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-DRES311-CACF-Proxy-VIP",
      "/infra/domains/default/groups/TF-IN1-NET-CPREM-GSNI-NAT-Range"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES311-CACF-Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES311"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES311-Proxy-2-Porxy"
    notes        = "CHGEU0200296"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES311-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES311-CACF-Proxy"
    ]
    action   = "ALLOW"
    services = []
    scope = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES311-CACF-Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES311"
    }
  }
}

/*
TF-IN1-Client-DRES311-CACF-Proxy-VIP
TF-IN1-Client-premise-DRES311-JH
TF-IN1-SG-DRES311-CACF-Proxy
TF-IN1-VM-in1sr1lpcacfbds

IN1-SG-SRES-OCP-Cluster01 = /infra/domains/default/groups/IN1-SG-SYD-GSNI-NW

*/
