
resource "nsxt_policy_security_policy" "policies_TF-CACF-IN-DRES314" {
  display_name    = "TF-CACF-IN-DRES314"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-CACF-IN-DRES314"
  comments        = "CHGEU0201854"
  sequence_number = 0
  rule {
    display_name = "TF-CACF-IN-DRES314-OCP-to-Proxy-vip"
    notes        = "CHGEU0201854"
    source_groups = [
      "/infra/domains/default/groups/IN1-SG-SRES-OCP-Cluster01-cuCZEjETT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-DRES314-CACF-Proxy-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES314-CACF-Proxy",
      "/infra/domains/default/groups/IN1-SG-SRES-OCP-Cluster01-cuCZEjETT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES314"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES314-Proxy-to-Client-premise-JH"
    notes        = "CHGEU0201854"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES314-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-premise-DRES314-JH"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES314-CACF-Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES314"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES314-CACF-Proxy-to-BDS"
    notes        = "CHGEU0201854"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES314-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-VM-in1sr1lpcacfbds"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081",
    ]
    scope = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES314-CACF-Proxy",
      "/infra/domains/default/groups/TF-IN1-VM-in1sr1lpcacfbds"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES314"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES314-Client-Premise-to-proxy"
    notes        = "CHGEU0201854"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-premise-DRES314-JH"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-Client-DRES314-CACF-Proxy-VIP",
      "/infra/domains/default/groups/TF-IN1-NET-CPREM-GSNI-NAT-Range"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES314-CACF-Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES314"
    }
  }
  rule {
    display_name = "TF-CACF-IN-DRES314-Proxy-2-Porxy"
    notes        = "CHGEU0201854"
    source_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES314-CACF-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES314-CACF-Proxy"
    ]
    action   = "ALLOW"
    services = []
    scope = [
      "/infra/domains/default/groups/TF-IN1-SG-DRES314-CACF-Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-CACF-IN-DRES314"
    }
  }
}

/*
TF-IN1-Client-DRES314-CACF-Proxy-VIP
TF-IN1-Client-premise-DRES314-JH
TF-IN1-SG-DRES314-CACF-Proxy
TF-IN1-VM-in1sr1lpcacfbds

IN1-SG-SRES-OCP-Cluster01 = /infra/domains/default/groups/IN1-SG-SYD-GSNI-NW

*/
