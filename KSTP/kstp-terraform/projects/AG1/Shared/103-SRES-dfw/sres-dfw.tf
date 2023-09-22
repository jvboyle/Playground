resource "nsxt_policy_security_policy" "policies_TF-SRES-json_2_tf" {
  display_name    = "TF-SRES"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-SRES"
  comments        = ""
  sequence_number = 0
  rule {
    display_name = "TF-1159-BF-Relay-to-BF-Client"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay1-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay2-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-52311"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay1-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay2-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1160-BF-Client-to-BF-Relay"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay1-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay2-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-52311"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay1-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay2-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1161-BF-Server-to-Relay"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-BigFix-Server"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-52311"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-BigFix-Server",
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1162-BF-Relay-to-Server"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-BigFix-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-52311"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-BigFix-Server",
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1240-EU-BigFix-to-AG-BigFix"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AMS-BigFix-Relay"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-20000-30000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay",
      "/infra/domains/default/groups/TF-AG1-IPSET-AMS-BigFix-Relay"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1241-AG-BigFix-to-all-end-points"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay1-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay2-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-SRES-GSNI-subnets"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay1-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-SRES-GSNI-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay2-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1245-BF-top-relay->-BF-lower-relay"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-52311"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1248-BigFix"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10890"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1249-BigFix"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay1-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay2-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10890"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay1-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1bfrelay2-IRES-NAT",
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1504-ISIM-to-SRES-BigFix-relay-to-DRES/SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDC-SRES-Standalone",
      "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDC-GRES-Standalone",
      "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDC-DRES-Standalone"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-45580"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-BigFix-Relay",
      "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDC-GRES-Standalone",
      "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDC-DRES-Standalone",
      "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDC-SRES-Standalone"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1651-9-x-to-DVAA-Web-–-Test"
    notes        = "CH50083284 and SR51034634 - agnsrlndvadeva1 added in the destination "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadeva1",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlndvadeva1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadeva1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlndvadeva1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1653-DVAA-App01-to-DB---Test--"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlndvadb01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50000",
      "/infra/services/TCP-5432"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlndvadb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1654-DVAA-Test-to-Public-Internet"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlndvaweb01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8080"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlndvaweb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1655-DVAA-App01-to-Web--–-Test-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlndvaweb01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlndvaweb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1656-DVAA-Web-to-App01-–-Test"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlndvaweb01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlndvaweb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1669-DVAA-App02-Test-to-IBM-Domino-Server"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1670-DVAA-App01,Web01-Test-to-COS-Test"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadb01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-snat-to-SL-SVC"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-snat-to-SL-SVC",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1671-DVAA-App02-Test-to-MongoDB,RabbitMQ-Test"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp",
      "/infra/domains/default/groups/TF-AG1-IPSET-snat-to-SL-SVC"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-30017",
      "/infra/services/TCP-32337",
      "/infra/services/TCP-30327",
      "/infra/services/TCP-32062"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints",
      "/infra/domains/default/groups/TF-AG1-IPSET-snat-to-SL-SVC"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1672-DVAA-App02-Test-to-PDR-SMTP-Server"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1774--DVAA-to-eToc-in-CMS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlndvaapp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-w3-gdportal-am-extnet-ibm-com",
      "/infra/domains/default/groups/TF-AG1-IPSET-w3-gdportal-am2-extnet-ibm-com"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-w3-gdportal-am2-extnet-ibm-com",
      "/infra/domains/default/groups/TF-AG1-IPSET-w3-gdportal-am-extnet-ibm-com",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlndvaapp01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1822-DVAA-App01-Test-to-RabbitMQ-Test"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrwndvaapp02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-30489"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrwndvaapp02"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2291-ALL-Win-Servers-to-Staas2-&-DNS02"
    notes        = "SR50942226"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/LDAP-over-SSL",
      "/infra/services/DNS",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2294-agnsrlndvaapp01-->-ag1srlnetocwas1021"
    notes        = "SR50942996 CH50083284 and SR51034634 -agnsrwndvadeva1 added to the source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadeva1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlndvadeva1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadeva1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlndvadeva1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2475-BF-relay-to-IRES"
    notes        = "SR50980587"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1bfrelay1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vc1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1bfrelay1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3134-Test-server-to-AD-DNS"
    notes        = "SR51249324"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1win19test"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1win19test"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3190-DVAA-DEV-APPLICATION-TO-DEV-DB-servers"
    notes        = "SR51284908"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrwndvadeva2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadevdb"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5432"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrwndvadeva2",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadevdb"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3202-SRES-to-ICP"
    notes        = "SR51306624"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-16351"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3262-ICP-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3263-SRES-to-ICP"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3270-PenTest-VM-for-ChatOps"
    notes        = "CH50099191"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01",
      "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3276-SRES-to-ICP"
    notes        = "SR51357166"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3333-SRES-Web-server-to-App-server"
    notes        = "SR51391951"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-3000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3352-agnsrlndvaweb01-to-agnsrlndvaapp01"
    notes        = "SR51414133"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3483-NA-to-EU-Chatops-integration"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3526-CHATOPS-to-ICD"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3527-ICD-to-CHATOPS"
    notes        = "RITM0118985"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3655-DEV-APP-to-DEV-DB"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadeva1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadevdb"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50000",
      "/infra/services/TCP-5432"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadeva1",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadevdb"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3656-QA-APP-to-QA-DB"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadb01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50000",
      "/infra/services/TCP-5432"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1022-SRES-Jump-from-Provider"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Services",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1wjmp01-dnat",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Win-Jump-Servers-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1ljmp01-dnat",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Services",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1wjmp01-dnat",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Win-Jump-Servers-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1ljmp01-dnat",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1025-SRES-Jump-to-Provider-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-snat-to-SL-SVC",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTP",
      "/infra/services/RDP",
      "/infra/services/HTTPS",
      "/infra/services/TCP-6443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-snat-to-SL-SVC",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1030-AD-Clients-to-IRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/NTP_Time_Server",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/DHCP-Server",
      "/infra/services/Windows-Global-Catalog-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/Active_Directory_Server",
      "/infra/services/LDAP-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/LDAP",
      "/infra/services/NBNS-Unicast",
      "/infra/services/SOAP",
      "/infra/services/WINS",
      "/infra/services/WINS-UDP",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/DNS",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/NBDG-Unicast",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/KERBEROS",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1071-ITaaS-Jenkins-to-SRES-Linux-Jump-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-EITaaS-Jenkins"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-IPSET-EITaaS-Jenkins"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1072-ITaaS-UCD-from-SRES-Linux-Jump"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-EITaaS-UCD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-7918",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-IPSET-EITaaS-UCD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1094-SRES-Jump-to-Blue-API-Connect"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1095-SRES-Jump-to-TaaS-UCD"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-TaaS-UCD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-7918",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-IPSET-TaaS-UCD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1209-ICp-from-SRES-Jump"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/ICP-Kubernetes-NodePort",
      "/infra/services/ICP-Kubernetes-API-Server",
      "/infra/services/ICP-WebSphere-Application-Server-Liberty",
      "/infra/services/ICP-Management-Console",
      "/infra/services/ICP-Docker-Registry",
      "/infra/services/ICP-Ingress-Service"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1215-ALL-VMs-to-SEPM-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-2967",
      "/infra/services/TCP-445",
      "/infra/services/TCP-8014",
      "/infra/services/HTTPS",
      "/infra/services/TCP-2968"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1230-for-SEPM(WDC)-SEPM(AMS)->-replication-+-file-share"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AMS-eu1sr1sepm1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AMS-eu1sr1sepm1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1231-for-SEPM(AMS)-SEPM(WDC)->-replication-+-file-share"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AMS-eu1sr1sepm1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AMS-eu1sr1sepm1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1239-Automation-Control-Node-to-Provider"
    notes        = "Automation Control Node to Provider"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Automation-Control-Node"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-Pod-Network"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-8001",
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Automation-Control-Node",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-Pod-Network"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1242-RHEL-Licensing-servers-to-VC"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1rhellic01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vc1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1rhellic01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1325-Icp-to-IBM-Blue"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-Sendmail",
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP",
      "/infra/services/HTTPS",
      "/infra/services/LDAP-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-Sendmail",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1326-SRES-JH-to-Icp"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/ICP-Kubernetes-NodePort",
      "/infra/services/ICP-Kubernetes-API-Server",
      "/infra/services/ICP-WebSphere-Application-Server-Liberty",
      "/infra/services/ICP-Management-Console",
      "/infra/services/ICP-Docker-Registry",
      "/infra/services/ICP-Ingress-Service"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1356-SG-Sres-Jump-to-OCP-Cluster"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster01_46_TEMP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10250",
      "/infra/services/TCP-8053",
      "/infra/services/TCP-30000-32767",
      "/infra/services/TCP-9000",
      "/infra/services/TCP-8080",
      "/infra/services/TCP-53",
      "/infra/services/TCP-18080",
      "/infra/services/TCP-4789",
      "/infra/services/TCP-22",
      "/infra/services/TCP-8443",
      "/infra/services/TCP-6443",
      "/infra/services/TCP-8181",
      "/infra/services/TCP-443",
      "/infra/services/TCP-22623",
      "/infra/services/TCP-8500",
      "/infra/services/TCP-8001",
      "/infra/services/TCP-80"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster01_46_TEMP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1457-SRES-SQL-to-SEPM"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-2638"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1458-SRES-SEPM-to-SQL"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1433"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1467-<NOT-DEFINED>"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-BaaS-TSM"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1500-1510"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-BaaS-TSM",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1468-<NOT-DEFINED>"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-BaaS-TSM"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1500-1510"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-BaaS-TSM",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1498-SRES-Jump-Servers-to-OCP-Cluster02"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster02_46_TEMP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10250",
      "/infra/services/SSH",
      "/infra/services/TCP-8053",
      "/infra/services/DNS-UDP",
      "/infra/services/TCP-9000",
      "/infra/services/TCP-30000-32767",
      "/infra/services/TCP-8080",
      "/infra/services/HTTP",
      "/infra/services/TCP-18080",
      "/infra/services/DNS",
      "/infra/services/TCP-4789",
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS",
      "/infra/services/TCP-8181",
      "/infra/services/TCP-8500",
      "/infra/services/TCP-8001"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster02_46_TEMP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1505-AD-to-ISIM"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCISPW-IRES-Members",
      "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCISPW-SRES-Members"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCISPW-IRES-Members",
      "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCISPW-SRES-Members",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1560-SG-SRES-CACF-JumpHost-Test-Servers-communication"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1574-WSUS-ALL-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-CGN-Subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-GSNI-routable"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8530",
      "/infra/services/TCP-8531"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-CGN-Subnets",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-GSNI-routable"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1575-WSUS-SRES-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1433"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1576-WSUS-SRES-to-IERES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/NTP_Time_Server",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/DHCP-Server",
      "/infra/services/Windows-Global-Catalog-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/Active_Directory_Server",
      "/infra/services/LDAP-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/LDAP",
      "/infra/services/NBNS-Unicast",
      "/infra/services/SOAP",
      "/infra/services/WINS",
      "/infra/services/WINS-UDP",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/DNS",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/NBDG-Unicast",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/KERBEROS",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1645-ISPW-SRES-Linux-Jump-to-BDS-Master"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTP",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1657-SRES-Jump-to-DVAA-Servers-Test"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-DVAA-Test-Servers-All"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/RDP",
      "/infra/services/HTTP",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-DVAA-Test-Servers-All",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1674-ISPW-SRES-Jump-servers-to-BDS-Master-Repo-VM"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-8081",
      "/infra/services/HTTP",
      "/infra/services/RDP",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1726-Powershell-remote-allow-from-WSUS-server-to-all"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5985",
      "/infra/services/TCP-5986"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1741-SRES-Jump-Servers-to-OCP-Cluster03"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster03-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10250",
      "/infra/services/SSH",
      "/infra/services/TCP-8053",
      "/infra/services/TCP-30000-32767",
      "/infra/services/TCP-9000",
      "/infra/services/TCP-8080",
      "/infra/services/HTTP",
      "/infra/services/TCP-18080",
      "/infra/services/DNS",
      "/infra/services/TCP-4789",
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS",
      "/infra/services/TCP-6443",
      "/infra/services/TCP-8181",
      "/infra/services/TCP-22623",
      "/infra/services/TCP-8500",
      "/infra/services/TCP-8001"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster03-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1885-DVAA-App01-to-Web-Prod"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1886-DVAA-App01-to-DB-Prod"
    notes        = "SR51405039"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvadb01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50000",
      "/infra/services/TCP-5432"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvadb01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1887-DVAA-App01-to-App02--Prod"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp02"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1891-DVAA-Prod-to-IBM-Cloud-Services"
    notes        = "RITM0074958 - 31844 32212"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvadb01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp02"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-30805",
      "/infra/services/TCP-31844",
      "/infra/services/TCP-32494",
      "/infra/services/TCP-32212",
      "/infra/services/HTTPS",
      "/infra/services/TCP-32143",
      "/infra/services/TCP-31355",
      "/infra/services/TCP-32391"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvadb01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp02",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1894-DVAA-Prod-VMs-to-PDR-SMTP-Server-SR50790165"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvadb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP",
      "/infra/services/SMTP_TLS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvadb01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1899-DVAA-Prod-VMs-to-PDR-SMTP-Server-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvadb01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp02"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvadb01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1srwpdvaapp02"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1947-ETOC-to-IBM-Bluepages"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/LDAP-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1948-Backend-Flow"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1949-Backend-Flow"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1975-Mail-Notification-Relay-Service"
    notes        = "SR51171499 - SG-SRES-Linux-Jump-Servers"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lniamprxy-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamigi",
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lniamprxy-vip",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamigi2",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1994-Jump-servers-to-Thycotic-VM"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9343",
      "/infra/services/TCP-9000",
      "/infra/services/TCP-8080"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamigi",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamigi2",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2007-SRES-Jumpserver-to-CAR-DB"
    notes        = "SR51002160"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01n",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcardb1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01n",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcardb1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2008-SRES-Jumpserver-to-CAR-WAS"
    notes        = "SR51002160"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01n",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcarwas1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9043",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcarwas1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01n",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2024-eToc-WAS-to-DB"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50000",
      "/infra/services/TCP-60000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2025-Jumpserver-to-eToc-DB"
    notes        = "SR51002321"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-60000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2026-Jumpservers-to-eToc-WAS"
    notes        = "SR51002321"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9043"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2065-ISPW-SSH-Proxies"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2066-ISPW-SSH-Proxies-to-BDS-Master"
    notes        = "SR50968197"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2068-ISPW-SSH-Proxies-to-All-ISPW"
    notes        = "SR50875765 - NET-SL-IRES-Portable"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IRES-NSX-T",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-5985-5986"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IRES-NSX-T",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2069-ISPW-SSH-Proxy-VIP-to-Proxies"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081",
      "/infra/services/TCP-5985-5986",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2070-Tower-to-ISPW-SSH-Proxy-VIP"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-5985-5986"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2082-IAMAAS-Jump-Servers-SSH"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-2222"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2111-SRES-Linux-Jump-to-IKS-Private-Endpoints"
    notes        = "R51244418 - port 31220 SR50933939 - port 30270 SR51000571 - port 32469 SR51088576 - remove port 32469 SR51088576 - port 30079 SR51321231 - port 31702 SR51327173 - REMOVE 31702 SR51327173 - TCP 30263 SR51328585 - TCP 32527 SR51331318 - TCP 32422"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-30270",
      "/infra/services/TCP-30263",
      "/infra/services/TCP-30183",
      "/infra/services/TCP-32527",
      "/infra/services/TCP-30079",
      "/infra/services/TCP-32422",
      "/infra/services/TCP-31220",
      "/infra/services/TCP-31480"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2126-IBM-9-x-to-CPREM"
    notes        = ""
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9043",
      "/infra/services/TCP-443",
      "/infra/services/TCP-60000",
      "/infra/services/TCP-50000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2145-Etoc-to-IRES-Domain-Controller"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/NTP_Time_Server",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/DHCP-Server",
      "/infra/services/Windows-Global-Catalog-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/Active_Directory_Server",
      "/infra/services/LDAP-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/LDAP",
      "/infra/services/NBNS-Unicast",
      "/infra/services/SOAP",
      "/infra/services/WINS",
      "/infra/services/WINS-UDP",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/DNS",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/NBDG-Unicast",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/KERBEROS",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2160-CAR-&-ETOC-DB-to-BaaS-TSM"
    notes        = "SR50868778 SR50938797 - ag1srlpetocdb1011 ag1srlnetocdb1021 SR50963983 ag1srwpetpd1000 ag1srwpetpp1000 added to the existing source RITM0119985----the rule is already exist for the destination and port just added the source VM ag1srwphwcdb01"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcardb1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-BaaS-TSM"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1500"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-BaaS-TSM",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcardb1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2174-IAMaaS-SSH"
    notes        = "SR50875672"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01n",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01n",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-2222"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01n",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2183-SRES-to-eToc"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50214",
      "/infra/services/TCP-50314",
      "/infra/services/TCP-50714",
      "/infra/services/TCP-50514",
      "/infra/services/TCP-51014",
      "/infra/services/TCP-50414",
      "/infra/services/TCP-51114",
      "/infra/services/TCP-50914"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2184-SRES-to-eToc-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2220-eToc-ISPW-<->-CMS"
    notes        = ""
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-50001",
      "/infra/services/TCP-50214",
      "/infra/services/TCP-60000-60011",
      "/infra/services/TCP-50114",
      "/infra/services/TCP-50714",
      "/infra/services/TCP-51014",
      "/infra/services/TCP-50000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2247-eToc-Server-to-Server"
    notes        = "SR50854517"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-60000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2248-eToc"
    notes        = "SR50854517"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50034",
      "/infra/services/TCP-50001",
      "/infra/services/TCP-50004",
      "/infra/services/TCP-50214",
      "/infra/services/TCP-50414",
      "/infra/services/TCP-50114",
      "/infra/services/TCP-50314",
      "/infra/services/TCP-50514",
      "/infra/services/TCP-50714",
      "/infra/services/TCP-50005",
      "/infra/services/TCP-51014",
      "/infra/services/TCP-50010",
      "/infra/services/TCP-50000",
      "/infra/services/TCP-51114",
      "/infra/services/TCP-50914"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2249-CMS-<->-eToc-ISPW-"
    notes        = "SR50920843"
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-50001",
      "/infra/services/TCP-60000-60011",
      "/infra/services/TCP-50114",
      "/infra/services/TCP-50000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2250-CMS-<->-eToc-ISPW"
    notes        = "SR50920843"
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-50001",
      "/infra/services/TCP-60000-60011",
      "/infra/services/TCP-50214",
      "/infra/services/TCP-50000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2268-SRES-to-eToc-recent"
    notes        = "SR50929048"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2269-SRES-to-eToc-recent-"
    notes        = "SR50929048"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50004",
      "/infra/services/TCP-50001"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2293-ag1srlpdvaapp01->-ag1srlpetocwas1011-"
    notes        = "SR50942996"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2300-OCP-Cluster-3-to-CACF-Test"
    notes        = "SR50941189"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2312-Certification-Authority"
    notes        = "SR50945469 SR50963446 - SG-SRES-IAM-WINDOWS-PEN SR50971783 SG-SRES-IAM-WINDOWS-SIDT added to existing source CH50078675 and SR50970216 SG-SRES-IAM-WINDOWS-UAT added to existing source CH50079731 and SR50980015 SG-SRES-IAM-WINDOWS-PROD added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wsus01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/MS_RPC_TCP",
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wsus01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2320-OCP-Cluster-2-&-3-to-CACF-Test"
    notes        = "SR50941189"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2332-Sres-to-eToc"
    notes        = "SR50940538"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2333-SRES-to-eToc"
    notes        = "SR50940538"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50004",
      "/infra/services/TCP-50001"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2366-SRES1_Cluster-VIP-to-ISPW-SSH-Proxy-VIP-"
    notes        = "SR50968197"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2443-CAR-&-ETOC-DB-to-TSM-"
    notes        = "SR50963983"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-IUS-TSM"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1500"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-IUS-TSM",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2631-SRES-to-GSE-Network-Lab"
    notes        = "SR51004624 - First SR SR51044697 - Updated SR"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2675-DB-to-ETOC"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50000",
      "/infra/services/TCP-60000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2676-Jump-to-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-443",
      "/infra/services/TCP-50000",
      "/infra/services/TCP-9043",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-60000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2689-Blue-to-ETOC"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2709-eToc-WAS-to-Bluepages"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-443",
      "/infra/services/TCP-636"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas",
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2951-MoM-Jump-server-EU-to-NA"
    notes        = "SR51185464"
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2992-SRES-JH-servers-to-hcs"
    notes        = "CH50090359"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9043"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2999-Proxy-to-Vinm-Conections"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IRES-NSX-T"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-5985",
      "/infra/services/TCP-5986"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IRES-NSX-T"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3176-Licensing-server-AD-integration"
    notes        = "CH50096630 SR51365221 - ag1srwpenaPOK1 SR51365221 - ag1srwpenaPOK2 RITM0116949 ----add the below server ag1sr1wpiamsbq1 158 87 49 196 ag1sr1wpiamsbt1 158 87 49 197 ag1sr1wpiamsbr1 158 87 49 198 ag1sr1wpiamsbe1 158 87 49 199"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1w19lic01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-88_135_139_389_445_53_49152-65535",
      "/infra/services/UDP-53",
      "/infra/services/UDP-389"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1w19lic01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3191-SRES-to-ag1sr1w19lic01"
    notes        = "SR51304914"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1w19lic01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-139",
      "/infra/services/TCP-445",
      "/infra/services/UDP-137",
      "/infra/services/TCP-135",
      "/infra/services/UDP-138",
      "/infra/services/TCP-49152-65535"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1w19lic01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3204-CACF-Proxy-to-NFS-Mounts"
    notes        = "SR51312691 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AG-SRES-NFS01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-AG-SRES-NFS01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3213-SRES-to-eToc-"
    notes        = "SR51303897"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50114"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3214-SRES-to-eToc-"
    notes        = "SR51303897"
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50114"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3215-SRES-to-eToc--"
    notes        = "SR51303897"
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50034",
      "/infra/services/TCP-50004"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3216-SRES-to-eToc-"
    notes        = "SR51303897"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50034",
      "/infra/services/TCP-50004"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3289-PENTEST-to-Certificate-server"
    notes        = "ag1srlpchatixf1 na-vm0643-pt evilmog ibm com SCTASK0013658 - agnsrlnmnepen1"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnmnepen1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpchatixf1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-atl-prod-vault-proxy-virt-x-force-red-com"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8200"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnmnepen1",
      "/infra/domains/default/groups/TF-AG1-IPSET-atl-prod-vault-proxy-virt-x-force-red-com",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpchatixf1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3290-PENTEST"
    notes        = "ag1srlpchatixf1 na-vm0643-pt evilmog ibm com SCTASK0013658 - agnsrlnmnepen1"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnmnepen1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpchatixf1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-HOSTna-rpt-atl-x-force-red-com"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-1194"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnmnepen1",
      "/infra/domains/default/groups/TF-AG1-IPSET-HOSTna-rpt-atl-x-force-red-com",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpchatixf1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3303-OCP-to-SSH-Proxy"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta1ssh1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta1ssh1",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3304-BDS-Server-access"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-CGN-Subnets",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-GSNI-routable"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-CGN-Subnets",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-GSNI-routable"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3332-SRES-Web-server-to-App-server"
    notes        = "SR51391951"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3430-KALI-to-IAM"
    notes        = "RITM0092300 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnmnepen1"
    ]
    destination_groups = [
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnmnepen1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3471-cstl1-to-tanzu-nonProd"
    notes        = "RITM0115125 RITM0116758"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-25010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3532-SREU13469554"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/PostgreSQL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3608-DB-servers-connectivity"
    notes        = "RITM0124132"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/PostgreSQL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3640-agnsrlnetocddb-to-agnsrlnetocdwas"
    notes        = " RITM0130335"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/PostgreSQL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3657-SRES-to-IRES"
    notes        = "RITM0130623"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5985"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3685-eTOC-1"
    notes        = "CHGEU0188150 RITM0131875 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-60000-60050",
      "/infra/services/UDP-5432-5482",
      "/infra/services/TCP-5432-5482",
      "/infra/services/TCP-50000-50050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3686-eTOC-2"
    notes        = "CHGEU0188150 RITM0131875"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-60000-60050",
      "/infra/services/UDP-5432-5482",
      "/infra/services/TCP-5432-5482",
      "/infra/services/TCP-50000-50050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3687-eTOC-3"
    notes        = "CHGEU0188150 RITM0131875"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-60000-60050",
      "/infra/services/UDP-5432-5482",
      "/infra/services/TCP-5432-5482",
      "/infra/services/TCP-50000-50050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3688-eTOC-6"
    notes        = "CHGEU0188150 RITM0131875"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-60000-60050",
      "/infra/services/UDP-5432-5482",
      "/infra/services/TCP-5432-5482",
      "/infra/services/TCP-50000-50050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3689-eTOC-5"
    notes        = "CHGEU0188150 RITM0131875"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-60000-60050",
      "/infra/services/UDP-5432-5482",
      "/infra/services/TCP-5432-5482",
      "/infra/services/TCP-50000-50050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3690-eTOC-4"
    notes        = "CHGEU0188150 RITM0131875"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb02"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-60000-60050",
      "/infra/services/UDP-5432-5482",
      "/infra/services/TCP-5432-5482",
      "/infra/services/TCP-50000-50050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb02"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3691-eTOC-7"
    notes        = "CHGEU0188150 RITM0131875"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-60000-60050",
      "/infra/services/UDP-5432-5482",
      "/infra/services/TCP-5432-5482",
      "/infra/services/TCP-50000-50050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3692-eTOC-8"
    notes        = "CHGEU0188150 RITM0131875"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb02"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-60000-60050",
      "/infra/services/UDP-5432-5482",
      "/infra/services/TCP-5432-5482",
      "/infra/services/TCP-50000-50050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptocdb02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3733-Anisble-workflow-for-KSTP-ESXI-Hosts"
    notes        = "RITM0135353"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vc1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3734-Anisble-workflow-for-KSTP-ESXI-Hosts"
    notes        = "RITM0135353"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1nsxt-vc"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1nsxt-vc"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2016-IAMaaS-THY-to-IRES-Domain-Controller"
    notes        = "SR50963446 - SG-SRES-IAM-WINDOWS-PEN SR50971783 -SG-SRES-IAM-WINDOWS-SIDT added to the existing source CH50078675 and SR50970216 SG-SRES-IAM-WINDOWS-UAT added to the existing source CH50079731 and SR50980015 SG-SRES-IAM-WINDOWS-PROD added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/DNS-UDP",
      "/infra/services/Windows-Global-Catalog-over-SSL",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/SMTP",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/LDAP-UDP",
      "/infra/services/DHCP-Server",
      "/infra/services/DNS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/MS-DS-UDP",
      "/infra/services/WINS",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NTP_Time_Server",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/NBDG-Unicast",
      "/infra/services/LDAP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/NBSS",
      "/infra/services/Active_Directory_Server"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2291-ALL-Win-Servers-to-Staas2-&-DNS02"
    notes        = "SR50942226"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/DNS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2312-Certification-Authority"
    notes        = "SR50945469 SR50963446 - SG-SRES-IAM-WINDOWS-PEN SR50971783 SG-SRES-IAM-WINDOWS-SIDT added to existing source CH50078675 and SR50970216 SG-SRES-IAM-WINDOWS-UAT added to existing source CH50079731 and SR50980015 SG-SRES-IAM-WINDOWS-PROD added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/MS_RPC_TCP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2351-IAM-PEN-Remote-Access-Server-to-Windows-VMs"
    notes        = "SR50954319 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Terminal_Services_(UDP)",
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2375-SRES-IAMAAS-THY-PT-Test-Dev_to_IRES_DNS"
    notes        = "SR50971663"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAMAAS-THY-PT-Test-Dev"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/DNS-UDP",
      "/infra/services/Windows-Global-Catalog-over-SSL",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/SMTP",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/LDAP-UDP",
      "/infra/services/DHCP-Server",
      "/infra/services/DNS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/MS-DS-UDP",
      "/infra/services/WINS",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NTP_Time_Server",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/NBDG-Unicast",
      "/infra/services/LDAP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/NBSS",
      "/infra/services/Active_Directory_Server"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAMAAS-THY-PT-Test-Dev"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2379-IAM-SIDT-Remote-Access-Server-to-Windows-VMs"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-3389",
      "/infra/services/TCP-3389"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2380-IAM-SIDT-Remote-Access-Server-to-Linux-VMs"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/SSH",
      "/infra/services/HTTP",
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2381-IAM-SIDT-Proxies-to-Secret"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2383-ISM-SIDT--All-but-DB-to-Proxies"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/SSH",
      "/infra/services/SNMP",
      "/infra/services/TCP-50010",
      "/infra/services/TCP-51010",
      "/infra/services/TCP-135",
      "/infra/services/TCP-139",
      "/infra/services/TCP-443",
      "/infra/services/TCP-445",
      "/infra/services/TCP-9000",
      "/infra/services/TCP-9343",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-5672",
      "/infra/services/TCP-1098",
      "/infra/services/TCP-1099",
      "/infra/services/TCP-2821",
      "/infra/services/TCP-8892",
      "/infra/services/TCP-9112",
      "/infra/services/TCP-9437",
      "/infra/services/TCP-9438",
      "/infra/services/TCP-9439",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9343",
      "/infra/services/UDP-50010",
      "/infra/services/UDP-51010",
      "/infra/services/UDP-1098",
      "/infra/services/UDP-1099",
      "/infra/services/UDP-2821"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2384-IAM-SIDT-Secret-to-MS-SQL"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135",
      "/infra/services/TCP-139",
      "/infra/services/TCP-445",
      "/infra/services/TCP-1433"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2385-IAM-SIDT-Secret-to-Rabbit-MQ"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671",
      "/infra/services/TCP-5672"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2387-IAM-SIDT-Distrib-Engine-to-Rabbit-MQ"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671",
      "/infra/services/TCP-5672"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2388-IAM-SIDT-SVG-to-SDI-and-SDI-to-SVG"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1098-1099-2821-8892-9112-9437-9438-9439-9443-9343",
      "/infra/services/SSH",
      "/infra/services/SNMP",
      "/infra/services/UDP-1098",
      "/infra/services/UDP-1099",
      "/infra/services/UDP-2821"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2391-IAM-SIDT-Secret-to-Secret"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2394-IAM-SIDT-SQL-to-SQL"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2395-IAM-SIDT-SDI-to-SDI"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2396-IAM-SIDT-Rabbit-MQ-to-Rabbit-MQ"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2440-IAM-SIDT-Secret-to-Session-Recording-File-Server"
    notes        = "CH50079174 and SR50974431"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2478--IAM-SIDT-SECRET-to-HAPROXY"
    notes        = "SR50980868"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671",
      "/infra/services/TCP-5672"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2480-IAM-SIDT-HAPROXY-to-RabbitMQ"
    notes        = "SR50980868"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671",
      "/infra/services/TCP-5672"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2482-IAM-SIDT-DE-to-proxy,Rmq-"
    notes        = "SR50980868"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671",
      "/infra/services/TCP-5672"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2509-IAMAAS-SDI-SIDT_PROXY-SIDT"
    notes        = "SR50980752"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-51010",
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2510-IAMAAS-SDI-SIDT_-DB2-SIDT"
    notes        = "SR50980752"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-51010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2531-IAM-SIDT-DE->TDI-on-port-22-"
    notes        = "SR50985477 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2533-IAM-SIDT-DE->All-TSS-components-"
    notes        = "SR50985477 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-3389",
      "/infra/services/UDP-5985-5986",
      "/infra/services/TCP-3390",
      "/infra/services/TCP-49152-65535",
      "/infra/services/TCP-3389",
      "/infra/services/UDP-3390",
      "/infra/services/UDP-49152-65535",
      "/infra/services/TCP-5985",
      "/infra/services/TCP-5986"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2535-IAM-SIDT->All-SVG-Linux-Box-"
    notes        = "SR50985477"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2537-IAM-SIDT-SVG-->TSS-Windows-port-45580-"
    notes        = "SR50985477"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-45580"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2539-IAM-SDI-SID->-DE"
    notes        = "SR50985477 SR51132852 - tcp 1100"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1100",
      "/infra/services/TCP-1098",
      "/infra/services/TCP-28210"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2541-IAM-SIDT-DE->SDI-"
    notes        = "SR50985477"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1099",
      "/infra/services/TCP-28210"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2581-IAM-SIDT"
    notes        = "SR50991602"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5672"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2694-IAMAAS_to_bluepages"
    notes        = "SR51036565"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/LDAP-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2706-Thycotic-to-UAT-LA"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-Thycotic-UAT-LA"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-Thycotic-UAT-LA"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2720-IAMAAS-sdi-sidt-to-db2-sidt"
    notes        = "SR51043485"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-51010-50010",
      "/infra/services/TCP-51010",
      "/infra/services/TCP-50010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2732-IAMAAS-sidt-sdi-to-secret-"
    notes        = "SR51044565"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2742-IAMAAS-SIDT--PROXY-to-DE,RMQ,SECRET-"
    notes        = "SR51046819"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2743-IAMAAS-SIDT-DE,RMQ,SECRET-to-PROXY"
    notes        = "SR51046819"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2759-Thycotic-IAMAAS-SDI-to-SVG-"
    notes        = "SR51054677"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1100"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2793-IAMAAS-windows-adapter-pentest"
    notes        = "SR51074869"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445",
      "/infra/services/TCP-135",
      "/infra/services/TCP-139"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2836-Thycotic-Secret-PEN-to-IAM-Windows-"
    notes        = "SR51100545"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2837-Thycotic-DE-PEN-to-IAM-Windows"
    notes        = "SR51100545"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135",
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2840-Thycotic-Secret-SIDT-to-IAM-Windows--"
    notes        = "SR51100545"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2841-Thycotic-DE-SIDT-to-IAM-Windows-"
    notes        = "SR51100545"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135",
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2844-Thycotic-RAS-Nonprod-to-Noprod-DE"
    notes        = "SR51100743 SR51115251 - port 3390"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-3390",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2877-Thycotic-SVG/SDI-to-Infra-ports--"
    notes        = "SR51119267 SR51126861 - SG-SRES-IAM-THY-DE-SIDT SG-SRES-IAM-THY-SVG-SIDT added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2881-Thycotic-SVG/SDI-to-Infra-ports---"
    notes        = "SR51119267"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2887-Thycotic-SVG/SDI-to-Infra-ports-----"
    notes        = "SR51119267 SR51126861 - SG-SRES-IAM-THY-DE-SIDT SG-SRES-IAM-THY-SDI-SIDT added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-45580",
      "/infra/services/UDP-5985",
      "/infra/services/UDP-5986",
      "/infra/services/TCP-5985",
      "/infra/services/TCP-5986"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2940-IAMAAS_Thycotic_EP_to_Domain"
    notes        = "SR51183587"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG_IAMAAS_Thycotic_Windows_EP"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/DNS-UDP",
      "/infra/services/Windows-Global-Catalog-over-SSL",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/SMTP",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/LDAP-UDP",
      "/infra/services/DHCP-Server",
      "/infra/services/DNS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/MS-DS-UDP",
      "/infra/services/WINS",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NTP_Time_Server",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/NBDG-Unicast",
      "/infra/services/LDAP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/NBSS",
      "/infra/services/Active_Directory_Server"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG_IAMAAS_Thycotic_Windows_EP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2996-IAMAAS-Secret-to-Blue"
    notes        = "SR51186649 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-2001"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3020-Thycotic-IMaas-DC-domain"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/UDP-53",
      "/infra/services/UDP-389",
      "/infra/services/TCP-88",
      "/infra/services/TCP-135",
      "/infra/services/TCP-139",
      "/infra/services/TCP-389",
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3021-Thycotic-IMaas-Domain-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/UDP-53",
      "/infra/services/UDP-389",
      "/infra/services/TCP-88",
      "/infra/services/TCP-135",
      "/infra/services/TCP-139",
      "/infra/services/TCP-389",
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3121-IAMAAS_VA_to_TSS"
    notes        = "SR51247197 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamtssvg1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/UDP-443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamtssvg1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3201-UAT-QA-IE-to-Secret-"
    notes        = "SR51311443 SR51312669 - SG-SRES-IAM-THY-PROXY-SIDT RITM0133222 RITM0135152"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IAMssS-UAT-QA-IE"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-IAMssS-UAT-QA-IE",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3202-SRES-to-ICP"
    notes        = "SR51306624"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-16351"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3262-ICP-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3263-SRES-to-ICP"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3270-PenTest-VM-for-ChatOps"
    notes        = "CH50099191"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3276-SRES-to-ICP"
    notes        = "SR51357166"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3430-KALI-to-IAM"
    notes        = "RITM0092300 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnmnepen1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnmnepen1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3478-AG-SRES-to-AG-SRES"
    notes        = "RITM0114560"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3479-AG-SRES-to-Blue"
    notes        = "RITM0114560"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-BLUE-uid-urtext-aix1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-BLUE-uid-urtext-aix1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3483-NA-to-EU-Chatops-integration"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3525-SRES-to-SRES-EP-Connectivity"
    notes        = "RITM0119630"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3526-CHATOPS-to-ICD"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3527-ICD-to-CHATOPS"
    notes        = "RITM0118985"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3564-IAM-UAT-SDI>>-test"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/TCP-5985",
      "/infra/services/TCP-389",
      "/infra/services/TCP-636",
      "/infra/services/TCP-45580",
      "/infra/services/TCP-443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3638-IAM-to-IAMAAS-ZABBIX"
    notes        = "RITM0127633"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3649-Blue-to-DSS-sitest"
    notes        = "RITM0130135"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3661-ZABBIX-to-SRES"
    notes        = "RITM0131427"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3662-THY-DE-SIDT-to-UAT-"
    notes        = "RITM0131697"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-US"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-US"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3722-iam-to-Sres-"
    notes        = "RITM0136195"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/RDP",
      "/infra/services/TCP-5986",
      "/infra/services/TCP-45580",
      "/infra/services/UDP-5986",
      "/infra/services/TCP-636",
      "/infra/services/TCP-389"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3738-IAMaaS-DSS-CISO-ep"
    notes        = "RITM0137980 RITM0138945 - 135 139 udp tcp 445 udp tcp 636 udp tcp 49152-65535 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5985",
      "/infra/services/TCP-139",
      "/infra/services/UDP-445",
      "/infra/services/LDAP-over-SSL-UDP",
      "/infra/services/TCP-135",
      "/infra/services/TCP-49152-65535",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/TCP-445",
      "/infra/services/UDP-49152-65535"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3740-Copy-of-IAMaaS-DSS-CISO-ep-"
    notes        = "RITM0138945 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-139",
      "/infra/services/UDP-445",
      "/infra/services/LDAP-over-SSL-UDP",
      "/infra/services/TCP-135",
      "/infra/services/TCP-49152-65535",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/TCP-445",
      "/infra/services/UDP-49152-65535"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3745-KSTP-2023-Pen-Test-SRES-scan"
    notes        = "RITM0139451"
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-NET-SRES-APP"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-NET-SRES-APP"
    ]
    disabled              = true
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3764-UAT-LA-to-IAMUAEP"
    notes        = "RITM0137784"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  #IAM Phase2
  rule {
    display_name = "TF-2016-IAMaaS-THY-to-IRES-Domain-Controller"
    notes        = "SR50963446 - SG-SRES-IAM-WINDOWS-PEN SR50971783 -SG-SRES-IAM-WINDOWS-SIDT added to the existing source CH50078675 and SR50970216 SG-SRES-IAM-WINDOWS-UAT added to the existing source CH50079731 and SR50980015 SG-SRES-IAM-WINDOWS-PROD added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/MS-DS-TCP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/Windows-Global-Catalog-over-SSL",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/KERBEROS",
      "/infra/services/SMTP",
      "/infra/services/DHCP-Server",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/LDAP",
      "/infra/services/DNS-UDP",
      "/infra/services/NBSS",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/WINS",
      "/infra/services/DNS-YgYUhldeX",
      "/infra/services/LDAP-UDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2291-ALL-Win-Servers-to-Staas2-&-DNS02"
    notes        = "SR50942226"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/DNS-YgYUhldeX",
      "/infra/services/HTTPS",
      "/infra/services/LDAP-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2312-Certification-Authority"
    notes        = "SR50945469 SR50963446 - SG-SRES-IAM-WINDOWS-PEN SR50971783 SG-SRES-IAM-WINDOWS-SIDT added to existing source CH50078675 and SR50970216 SG-SRES-IAM-WINDOWS-UAT added to existing source CH50079731 and SR50980015 SG-SRES-IAM-WINDOWS-PROD added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
      "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/MS_RPC_TCP",
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
      "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2336-IAM--IBM-Blue-to-nonProd-Remote-Access-Server"
    notes        = "SR50954319 SR50997001 SG-SRES-IAM-THY-RAS-PROD added to the destination"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Terminal_Services_(UDP)",
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2347-IAM-PEN-SQL-to-SQL"
    notes        = "SR50954319 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2349-IAM-PEN-Secret-to-Secret"
    notes        = "SR50954319 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2351-IAM-PEN-Remote-Access-Server-to-Windows-VMs"
    notes        = "SR50954319 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Terminal_Services_(UDP)",
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2352-IAM-PEN-SVG-to-SDI-and-SDI-to-SVG"
    notes        = "SR50954319 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-1098",
      "/infra/services/TCP-1098",
      "/infra/services/UDP-1099",
      "/infra/services/TCP-8892",
      "/infra/services/UDP-2821",
      "/infra/services/TCP-9343",
      "/infra/services/TCP-2821",
      "/infra/services/TCP-1099",
      "/infra/services/SNMP",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9437-9439",
      "/infra/services/SSH",
      "/infra/services/TCP-9112"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2355-IAM-PEN-Secret-to-MS-SQL"
    notes        = "SR50954319 SR50971394 - 1433"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1433",
      "/infra/services/TCP-135",
      "/infra/services/TCP-445",
      "/infra/services/TCP-139"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2368-IAM-PEN-Remote-Access-Server-to-linux-VMs-"
    notes        = "SR50968305 SR50979356"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/HTTP",
      "/infra/services/RDP",
      "/infra/services/Terminal_Services_(UDP)",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2378-IAM-SIDT-Remote-Access-Server-to-Proxies"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9343",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5672",
      "/infra/services/TCP-9000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2379-IAM-SIDT-Remote-Access-Server-to-Windows-VMs"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-3389",
      "/infra/services/TCP-3389"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2380-IAM-SIDT-Remote-Access-Server-to-Linux-VMs"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS",
      "/infra/services/HTTP",
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2399-IAM-Remote-Access-Server-to-SVG"
    notes        = "SR50972115 SR51043485 SG-SRES-IAM-THY-SVG-DEVOPS added to the destination"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9343",
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2401-SRES-IAMAAS-THY-UAT_to_IRES_DNS-"
    notes        = "SR50972633"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAMAAS-THY-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/MS-DS-TCP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/Windows-Global-Catalog-over-SSL",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/KERBEROS",
      "/infra/services/SMTP",
      "/infra/services/DHCP-Server",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/LDAP",
      "/infra/services/DNS-UDP",
      "/infra/services/NBSS",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/WINS",
      "/infra/services/DNS-YgYUhldeX",
      "/infra/services/LDAP-UDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAMAAS-THY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2402-IAM-UAT-Remote-Access-Server-to-Proxies"
    notes        = "CH50078675 and SR50970216 SR51043485 SG-SRES-IAM-THY-PROXY-DEVOPS added to the destination"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9343",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5672",
      "/infra/services/TCP-9000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2403-IAM-UAT-Remote-Access-Server-to-Windows-VMs"
    notes        = "CH50078675 and SR50970216 SR51043485 SG-SRES-IAM-WINDOWS-DEVOPS added to the destination"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-DevOps"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-3389",
      "/infra/services/TCP-3389"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-DevOps"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2404-IAM-UAT-Remote-Access-Server-to-Linux-VMs"
    notes        = "CH50078675 and SR50970216"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/HTTPS",
      "/infra/services/HTTP",
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2405-IAM-UAT-Proxies-to-Secret"
    notes        = "CH50078675 and SR50970216"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2408-ISM-UAT--All-but-DB-to-Proxies"
    notes        = "CH50078675 and SR50970216"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-1099",
      "/infra/services/TCP-2821",
      "/infra/services/TCP-9438",
      "/infra/services/UDP-51010",
      "/infra/services/TCP-445",
      "/infra/services/SNMP",
      "/infra/services/TCP-51010",
      "/infra/services/TCP-139",
      "/infra/services/TCP-443",
      "/infra/services/TCP-5672",
      "/infra/services/SSH",
      "/infra/services/TCP-1099",
      "/infra/services/TCP-9343",
      "/infra/services/TCP-9439",
      "/infra/services/TCP-9112",
      "/infra/services/UDP-50010",
      "/infra/services/UDP-2821",
      "/infra/services/TCP-9437",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-135",
      "/infra/services/UDP-1098",
      "/infra/services/TCP-1098",
      "/infra/services/TCP-50010",
      "/infra/services/TCP-9000",
      "/infra/services/TCP-8892"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2409-IAM-UAT-Secret-to-MS-SQL"
    notes        = "CH50078675 and SR50970216"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445",
      "/infra/services/TCP-139",
      "/infra/services/TCP-1433",
      "/infra/services/TCP-135"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2410-IAM-UAT-Secret-to-Rabbit-MQ"
    notes        = "CH50078675 and SR50970216 RITM0129358 - ag1-sres-lb1"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5672",
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2411-IAM-UAT-Distrib-Engine-to-Secret"
    notes        = "CH50078675 and SR50970216"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2412-IAM-UAT-Distrib-Engine-to-Rabbit-MQ"
    notes        = "CH50078675 and SR50970216 RITM0129358 - ag1-sres-lb1"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5672",
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2414-IAM-UAT-SVG-to-SDI-and-SDI-to-SVG"
    notes        = "CH50078675 and SR50970216"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1099",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-2821",
      "/infra/services/UDP-1098",
      "/infra/services/TCP-9439",
      "/infra/services/TCP-9343",
      "/infra/services/TCP-1098",
      "/infra/services/UDP-1099",
      "/infra/services/TCP-9112",
      "/infra/services/SNMP",
      "/infra/services/UDP-2821",
      "/infra/services/TCP-9437",
      "/infra/services/SSH",
      "/infra/services/TCP-8892",
      "/infra/services/TCP-9438"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2416-IAM-UAT-Secret-to-Secret"
    notes        = "CH50078675 and SR50970216"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2418-IAM-UAT-SDI-to-SDI"
    notes        = "CH50078675 and SR50970216"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2419-IAM-UAT-Rabbit-MQ-to-Rabbit-MQ"
    notes        = "CH50078675 and SR50970216"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2421-IAM-UAT-SQL-to-SQL"
    notes        = "CH50078675 and SR50970216"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2441-IAM-UAT-Secret-to-Session-Recording-File-Server"
    notes        = "CH50079177 and SR50974434"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuafs"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuafs",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2470-IAM-PEN-Distrib-Engine-to-Secret"
    notes        = "CH50078679 and SR50964831"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2479-IAM-UAT-SECRET-to-HAPROXY"
    notes        = "SR50980868"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5672",
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2481-IAM-UAT-HAPROXY-to-RabbitMQ-"
    notes        = "SR50980868"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5672",
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2483-IAM-UAT-DE-to-proxy,Rmq-"
    notes        = "SR50980868 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5672",
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2508-IAMAAS-SDI-UAT_DB2-UAT"
    notes        = "SR50980752"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-51010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2511-IAMAAS-SDI-UAT_PROXY-UAT"
    notes        = "SR50980752"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2512-IAMAAS-SDI-UAT_-RMQ-UAT"
    notes        = "SR50980752"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2524-IAM-PEN-DE->TDI-on-port-22"
    notes        = "SR50985477 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2525-IAM-PEN-DE->All-TSS-components-"
    notes        = "SR50985477 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    destination_groups = [
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-3390",
      "/infra/services/UDP-49152-65535",
      "/infra/services/TCP-3389",
      "/infra/services/TCP-5986",
      "/infra/services/TCP-5985",
      "/infra/services/TCP-49152-65535",
      "/infra/services/UDP-5986",
      "/infra/services/UDP-3389",
      "/infra/services/TCP-3390",
      "/infra/services/UDP-5985"
    ]
    scope = [
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2526-IAM-PEN-SID->-DE"
    notes        = "SR50985477 SR51081470 - tcp 1100"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-28210",
      "/infra/services/TCP-1098",
      "/infra/services/TCP-1100"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2527-IAM-PEN-DE->SDI"
    notes        = "SR50985477"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-28210",
      "/infra/services/TCP-1099"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2528-IAM-PEN-SVG-->TSS-Windows-port-45580"
    notes        = "SR50985477"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    destination_groups = [
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-45580"
    ]
    scope = [
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2529-IAM-DE->All-SVG-Linux-Box"
    notes        = "SR50985477"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2530-IAM-UAT-DE->TDI-on-port-22-"
    notes        = "SR50985477 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2532-IAM-UAT-DE->All-TSS-components-"
    notes        = "SR50985477 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-3390",
      "/infra/services/UDP-49152-65535",
      "/infra/services/TCP-3389",
      "/infra/services/TCP-5986",
      "/infra/services/TCP-5985",
      "/infra/services/TCP-49152-65535",
      "/infra/services/UDP-5986",
      "/infra/services/UDP-3389",
      "/infra/services/TCP-3390",
      "/infra/services/UDP-5985"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2534-IAM-UAT->All-SVG-Linux-Box-"
    notes        = "SR50985477"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2536-IAM-UAT-SVG-->TSS-Windows-port-45580-"
    notes        = "SR50985477"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-45580"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2538-IAM-UAT-SID->-DE-"
    notes        = "SR50985477 SR51132852 - tcp 1100"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-28210",
      "/infra/services/TCP-1098",
      "/infra/services/TCP-1100"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2540-IAM-UAT-DE->SDI-"
    notes        = "SR50985477 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-28210",
      "/infra/services/TCP-1099"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2582-IAM-UAT"
    notes        = "SR50991602"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5672",
      "/infra/services/TCP-5671",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2653-IBM-Blue-To-IAMAAS-proxy"
    notes        = "SR51020549"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
      #"/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9343",
      "/infra/services/TCP-9443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
      #"/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2694-IAMAAS_to_bluepages"
    notes        = "SR51036565"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/LDAP-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2706-Thycotic-to-UAT-LA"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-Thycotic-UAT-LA"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-Thycotic-UAT-LA"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2719-IAMAAS-sdi-pen-to-db2-pen"
    notes        = "SR51043485"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-51010",
      "/infra/services/TCP-50010",
      "/infra/services/TCP-51010",
      "/infra/services/UDP-50010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2721-IAMAAS-sdi-uat-to-db2-uat"
    notes        = "SR51043485"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-51010",
      "/infra/services/TCP-50010",
      "/infra/services/TCP-51010",
      "/infra/services/UDP-50010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2723-IAMAAS-nonprod-to-db2devops"
    notes        = "SR51043485"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-DevOps"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-51010",
      "/infra/services/TCP-50010",
      "/infra/services/TCP-51010",
      "/infra/services/UDP-50010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-DevOps"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2724-IAMAAS-nonprod-to-linuxdevops"
    notes        = "SR51043485"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-DevOps"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-DevOps"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2733-IAMAAS-pen-sdi-to-secret-"
    notes        = "SR51044565"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2735-IAMAAS-uat-sdi-to-secret"
    notes        = "SR51044565 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2736-IAMAAS-UAT--Proxy-to-DE,RMQ,SECRET-"
    notes        = "SR51046819"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2737-IAMAAS-UAT-DE,RMQ,SECRET-to-PROXY"
    notes        = "SR51046819"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2760-Thycotic-IAMAAS-SDI-to-SVG-"
    notes        = "SR51054677"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1100"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2762-Thycotic-IAMAAS-SDI-to-SVG"
    notes        = "SR51054677"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-1100",
      "/infra/services/TCP-1100"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2793-IAMAAS-windows-adapter-pentest"
    notes        = "SR51074869"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-139",
      "/infra/services/TCP-445",
      "/infra/services/TCP-135"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2810-IAM-SDI-PEN-Remote-Access-Server-to-linux-VMs-"
    notes        = "R51082529"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2836-Thycotic-Secret-PEN-to-IAM-Windows-"
    notes        = "SR51100545"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2837-Thycotic-DE-PEN-to-IAM-Windows"
    notes        = "SR51100545"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135",
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2838-Thycotic-Secret-UAT-to-IAM-Windows-"
    notes        = "SR51100545"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2839-Thycotic-DE-UAT-to-IAM-Windows-"
    notes        = "SR51100545"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135",
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2844-Thycotic-RAS-Nonprod-to-Noprod-DE"
    notes        = "SR51100743 SR51115251 - port 3390"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/TCP-3390"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2883-Thycotic-SVG/SDI-to-Infra-ports----"
    notes        = "SR51119267"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2885-Thycotic-SVG/SDI-to-Infra-ports---"
    notes        = "SR51119267"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2886-Thycotic-SVG/SDI-to-Infra-ports------"
    notes        = "SR51119267"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-45580"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2996-IAMAAS-Secret-to-Blue"
    notes        = "SR51186649 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-2001"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3024-Thycotic-IAMAAS-JH-to-DB"
    notes        = "SR51228207"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-51010",
      "/infra/services/UDP-51010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3202-SRES-to-ICP"
    notes        = "SR51306624"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-16351"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3262-ICP-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3263-SRES-to-ICP"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3270-PenTest-VM-for-ChatOps"
    notes        = "CH50099191"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip",
      "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip",
      "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3276-SRES-to-ICP"
    notes        = "SR51357166"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3386-SRES-ag1sr1lniamuasdi-to-Blue"
    notes        = "RITM0073612"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Blue-dev-aiops-elk"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Blue-dev-aiops-elk"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3430-KALI-to-IAM"
    notes        = "RITM0092300 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnmnepen1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnmnepen1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3437-UAT-Shared-to-DSS-NA"
    notes        = "RITM0122210"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-HOST-UAT-Shared"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
      #"/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-HOST-UAT-Shared",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
     #"/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3477-AG-SRES-to-AG-SRES"
    notes        = "RITM0114560"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3478-AG-SRES-to-AG-SRES"
    notes        = "RITM0114560"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3483-NA-to-EU-Chatops-integration"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3526-CHATOPS-to-ICD"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3527-ICD-to-CHATOPS"
    notes        = "RITM0118985"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3564-IAM-UAT-SDI>>-test"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-636",
      "/infra/services/TCP-5986",
      "/infra/services/TCP-389",
      "/infra/services/TCP-5985",
      "/infra/services/TCP-443",
      "/infra/services/TCP-45580"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3617-IAM-nonPROD--RAS-to-Sandbox-all-VMs"
    notes        = "RITM0125257"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3638-IAM-to-IAMAAS-ZABBIX"
    notes        = "RITM0127633"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3661-ZABBIX-to-SRES"
    notes        = "RITM0131427"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3705-iam-sres-test"
    notes        = "RITM0129358 - UAT RITM0140521 - PEN"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3706-iam-sres-test"
    notes        = "RITM0140521"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1",
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1",
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3707-SRES-LB-to-IAMaaS-Backend-Pools"
    notes        = "RITM0129358 - UAT RITM0140521 - PEN"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
    ]
    destination_groups = [
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671"
    ]
    scope = [
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3745-KSTP-2023-Pen-Test-SRES-scan"
    notes        = "RITM0139451"
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-NET-SRES-APP"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-NET-SRES-APP"
    ]
    disabled              = true
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3800-AG-SRES-to-UAT-LA"
    notes        = "RITM0143380"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1",
      #"/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1",
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-DVAA-Web01-to-App01"
    notes        = "RITM0145729"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-3000",
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-DVAA-Web01-to-App01-AGN"
    notes        = "RITM0145729"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-3000",
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
      "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2291-ALL-Win-Servers-to-Staas2-&-DNS02"
    notes        = "SR50942226"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/DNS-YgYUhldeX"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2382-IAM-SIDT-Proxies-to-SVG"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10444",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-11443",
      "/infra/services/TCP-9343"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2388-IAM-SIDT-SVG-to-SDI-and-SDI-to-SVG"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH",
      "/infra/services/UDP-2821",
      "/infra/services/TCP-8892",
      "/infra/services/TCP-1099",
      "/infra/services/TCP-9112",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9343",
      "/infra/services/TCP-2821",
      "/infra/services/TCP-9437",
      "/infra/services/TCP-9438",
      "/infra/services/TCP-9439",
      "/infra/services/SNMP",
      "/infra/services/UDP-1098",
      "/infra/services/TCP-1098",
      "/infra/services/UDP-1099"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2389-IAM-SIDT-SVG-to-DB2"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-50010",
      "/infra/services/UDP-50010",
      "/infra/services/TCP-51010",
      "/infra/services/UDP-51010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2390-IAM-SIDT-SVG-to-SVG"
    notes        = "SR50971783"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2399-IAM-Remote-Access-Server-to-SVG"
    notes        = "SR50972115 SR51043485 SG-SRES-IAM-THY-SVG-DEVOPS added to the destination"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9343",
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2537-IAM-SIDT-SVG-->TSS-Windows-port-45580-"
    notes        = "SR50985477"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-45580"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2539-IAM-SDI-SID->-DE"
    notes        = "SR50985477 SR51132852 - tcp 1100"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1100",
      "/infra/services/TCP-1098",
      "/infra/services/TCP-28210"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2541-IAM-SIDT-DE->SDI-"
    notes        = "SR50985477"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1099",
      "/infra/services/TCP-28210"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2694-IAMAAS_to_bluepages"
    notes        = "SR51036565"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/LDAP-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2759-Thycotic-IAMAAS-SDI-to-SVG-"
    notes        = "SR51054677"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1100"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2831-IMaas-SVG-to-IBMID"
    notes        = "SR51089515 SR51101879"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-Akamai-IBMID"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-Akamai-IBMID",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2848-IAMaaS-appliance-to-DNS"
    notes        = "SR51089515"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/DNS-UDP",
      "/infra/services/DNS-YgYUhldeX"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2877-Thycotic-SVG/SDI-to-Infra-ports--"
    notes        = "SR51119267 SR51126861 - SG-SRES-IAM-THY-DE-SIDT SG-SRES-IAM-THY-SVG-SIDT added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2881-Thycotic-SVG/SDI-to-Infra-ports---"
    notes        = "SR51119267"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2887-Thycotic-SVG/SDI-to-Infra-ports-----"
    notes        = "SR51119267 SR51126861 - SG-SRES-IAM-THY-DE-SIDT SG-SRES-IAM-THY-SDI-SIDT added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/UDP-5985",
      "/infra/services/TCP-5985",
      "/infra/services/TCP-45580",
      "/infra/services/UDP-5986"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3121-IAMAAS_VA_to_TSS"
    notes        = "SR51247197 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamtssvg1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wniamtst1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/UDP-443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamtssvg1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wniamtst1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3132-IAMAAS-SVG-to-Proxy"
    notes        = "SR51248514"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3176-Licensing-server-AD-integration"
    notes        = "CH50096630 SR51365221 - ag1srwpenaPOK1 SR51365221 - ag1srwpenaPOK2 RITM0116949 ----add the below server ag1sr1wpiamsbq1 158 87 49 196 ag1sr1wpiamsbt1 158 87 49 197 ag1sr1wpiamsbr1 158 87 49 198 ag1sr1wpiamsbe1 158 87 49 199"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok2",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1w19lic01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-88",
      "/infra/services/TCP-53",
      "/infra/services/TCP-49152-65535",
      "/infra/services/UDP-53",
      "/infra/services/TCP-135",
      "/infra/services/UDP-389",
      "/infra/services/TCP-389",
      "/infra/services/TCP-139",
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1w19lic01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3202-SRES-to-ICP"
    notes        = "SR51306624"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-16351"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3262-ICP-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3263-SRES-to-ICP"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3270-PenTest-VM-for-ChatOps"
    notes        = "CH50099191"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01",
      "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3276-SRES-to-ICP"
    notes        = "SR51357166"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3477-AG-SRES-to-AG-SRES"
    notes        = "RITM0114560"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3483-NA-to-EU-Chatops-integration"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3493-NA-SRES-servers-to-IRES-JH"
    notes        = "RITM0117063"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-CIO-WIN-LIN-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/LDAP-UDP",
      "/infra/services/DNS-YgYUhldeX",
      "/infra/services/LDAP",
      "/infra/services/TCP-139",
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/KERBEROS-TCP",
      "/infra/services/TCP-135",
      "/infra/services/DNS-UDP",
      "/infra/services/SMB"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-CIO-WIN-LIN-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3526-CHATOPS-to-ICD"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3527-ICD-to-CHATOPS"
    notes        = "RITM0118985"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3536-IAM-CIO-PROD--Proxy-to-Proxy"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3537-IAM-CIO-PROD--Proxies-to-Secret"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3538-IAM-CIO-PROD--Rabbit-MQ-"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3539-IAM-CIO-PROD--Rabbit-MQ"
    notes        = "RITM0120061 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3541-IAM-CIO-PROD--Remote-Server"
    notes        = "RITM0120061 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-9000"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3546-IAM-CIO-PROD--Secret-to-Secret"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP",
      "/infra/services/HTTPS",
      "/infra/services/HTTP",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3547-IAM-CIO-PROD--Linux-VMs"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-LINUX-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP",
      "/infra/services/HTTPS",
      "/infra/services/HTTP",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-LINUX-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3548-IAM-CIO-PROD--WIN-(RDP)"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-WINDOWS-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3549-IAM-CIO-PROD--Secret-to-MS-SQL"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMB",
      "/infra/services/APP_MSSQL_TCP",
      "/infra/services/SAP_Exchange_Groupware_Connector_(DCOM)",
      "/infra/services/NetBios_Session_Service_(TCP)"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3550-IAM-CIO-PROD--Secret-to-Session-Server"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1wpiamcifs"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1wpiamcifs",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcifs"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3551-IAM-CIO-PROD--SQL-to-SQL"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3552-IAM-CIO-PROD--Bulkloader-to-Proxies"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-BLKLD-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-BLKLD-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3553-IAM-CIO-PROD--ALL-VMs-to-Splunk"
    notes        = "RITM0121201"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-All-VMs"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-IRES-Qradar"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Syslog_(UDP)",
      "/infra/services/Syslog_(TCP)"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-All-VMs",
      "/infra/domains/default/groups/TF-AG1-SG-IRES-Qradar"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3560-IAM-CIO-PROD--Bulkloader-to-BluePages"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-BLKLD-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-EXT-BLUEPAGES"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/LDAP-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-BLKLD-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-EXT-BLUEPAGES"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3561-IAM-CIO-PROD--Distribution-Engine-to-Secret"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3562-IAM-CIO-PROD--IBM-Blue-to-Remote-Access-Server"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3563-IAM-CIO-PROD--Secret-to-SMTP"
    notes        = "RITM0120061"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3565-IAM-CIO-PROD--All-WINDOWS-to-Domain-Controllers"
    notes        = "RITM0120061 RITM0120062"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-WINDOWS",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-WINDOWS-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/NBNS-Unicast",
      "/infra/services/LDAP-UDP",
      "/infra/services/DHCP-Server",
      "/infra/services/WINS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/KERBEROS",
      "/infra/services/DNS-UDP",
      "/infra/services/NBSS",
      "/infra/services/DNS-YgYUhldeX",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/SMTP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/SOAP",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/MS-DS-UDP",
      "/infra/services/Windows-Global-Catalog-over-SSL",
      "/infra/services/Active_Directory_Server",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBDG-Unicast"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-WINDOWS",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-WINDOWS-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3566-IAM-SandBox-nonPROD--All-but-DB-to-Proxy"
    notes        = "RITM0120062"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-NODB"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/NBSS",
      "/infra/services/HTTPS",
      "/infra/services/TCP-9000",
      "/infra/services/TCP-8892",
      "/infra/services/TCP-9112",
      "/infra/services/TCP-135",
      "/infra/services/TCP-9437-9439",
      "/infra/services/SNMP-Recieve",
      "/infra/services/SMB",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-NODB",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3574-SRES-to-IRES"
    notes        = "RITM0121921"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135",
      "/infra/services/TCP-88"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3587-ag1sr1wpiamcira-to-sandbox"
    notes        = "RITM0122558"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcifs",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcifs",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3588-IAM-SandBox-nonPROD--Secret-to-SMTP"
    notes        = "RITM0120062"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3589-IAM-SandBox-nonPROD--Secret-to-Session-Server"
    notes        = "RITM0120062"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3590-IAM-SandBox-nonPROD--Secret-to-MS-SQL"
    notes        = "RITM0120062"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135",
      "/infra/services/TCP-1433",
      "/infra/services/TCP-139",
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3591-IAM-SandBox-nonPROD--Rabbit-MQ"
    notes        = "RITM0120062"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3592-IAM-SandBox-nonPROD--Proxy-to-Secret"
    notes        = "RITM0120062"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3593-IAM-SandBox-nonPROD--Distribution-Engine-to-Secret"
    notes        = "RITM0120062"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3594-IAM-SandBox-nonPROD--Bulkloader-to-BluePages"
    notes        = "RITM0120062"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-EXT-BLUEPAGES"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/LDAP-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-IPSET-EXT-BLUEPAGES"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3595-IAM-SandBox-nonPROD--Bulkloader-to-Proxy"
    notes        = "RITM0120062"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3610-IAM-SandBox-nonPROD--All-but-DB-to-Proxy"
    notes        = "RITM0124652"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-NODB",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-NODB",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-NODB",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3612-IAM-CIO-PROD--Secret-to-Proxy-VIP"
    notes        = "RITM0125238"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-PROXY-PROD-VIP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-PROXY-PROD-VIP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3617-IAM-nonPROD--RAS-to-Sandbox-all-VMs"
    notes        = "RITM0125257"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3623-IAM-CIO-PROD--VPN-to-Kyndryl-net-URL"
    notes        = "RITM0126230"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3624-IAM-CIO-PROD--VPN-to-Kyndryl-net-URL"
    notes        = "RITM0126419 RITM0129951"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-PROXY-PROD-VIP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-PROXY-PROD-VIP",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3638-IAM-to-IAMAAS-ZABBIX"
    notes        = "RITM0127633"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3661-ZABBIX-to-SRES"
    notes        = "RITM0131427"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3722-iam-to-Sres-"
    notes        = "RITM0136195"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/RDP",
      "/infra/services/HTTPS",
      "/infra/services/TCP-45580",
      "/infra/services/TCP-636",
      "/infra/services/TCP-389",
      "/infra/services/UDP-5986"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3723-iam-to-sres"
    notes        = "RITM0136195"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3738-IAMaaS-DSS-CISO-ep"
    notes        = "RITM0137980 RITM0138945 - 135 139 udp tcp 445 udp tcp 636 udp tcp 49152-65535 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/LDAP-over-SSL-UDP",
      "/infra/services/TCP-445",
      "/infra/services/TCP-49152-65535",
      "/infra/services/TCP-139",
      "/infra/services/TCP-5985",
      "/infra/services/UDP-49152-65535",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/TCP-135",
      "/infra/services/UDP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3739-IAMaaS-CIO-DE-PROD"
    notes        = "RITM0137980"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-3390",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3740-Copy-of-IAMaaS-DSS-CISO-ep-"
    notes        = "RITM0138945 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/LDAP-over-SSL-UDP",
      "/infra/services/TCP-445",
      "/infra/services/TCP-49152-65535",
      "/infra/services/TCP-139",
      "/infra/services/UDP-49152-65535",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/TCP-135",
      "/infra/services/UDP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3742-Blue-to-IAM-CIO-DE-PROD"
    notes        = "RITM0138889"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/RDP",
      "/infra/services/TCP-5985",
      "/infra/services/TCP-3390",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3743-Blue-to-IAM-CIO-DE-PROD"
    notes        = "RITM0138889"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/RDP",
      "/infra/services/TCP-5985",
      "/infra/services/TCP-3390",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3745-KSTP-2023-Pen-Test-SRES-scan"
    notes        = "RITM0139451"
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-NET-SRES-APP"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-NET-SRES-APP"
    ]
    disabled              = true
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3758-SRES-to-Azure-INfra-VNET"
    notes        = "RITM0136763"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Azure-Infra-VNET"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Azure-Infra-VNET",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3759-SRES-to-Azure-Infra-Res-VNET"
    notes        = "RITM0136763"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-azure-infra-res-vnet"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/RDP",
      "/infra/services/TCP-5985"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-IPSET-azure-infra-res-vnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3760-SRES-to-Eastern-Creek-DC"
    notes        = "RITM0136763"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Eastern-Creek-DC"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Eastern-Creek-DC",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3764-UAT-LA-to-IAMUAEP"
    notes        = "RITM0137784"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3825-UAT-to-DSS-CIO"
    notes        = "RITM0143742"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-Shared"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpiamciprx1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpiamciprx1",
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-Shared",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-1976-User-Web-Access"
    notes        = "SR50880868 SR51140346 - added SG-SRES-IAM-THY-PROXY-PROD"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9343"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2016-IAMaaS-THY-to-IRES-Domain-Controller"
    notes        = "SR50963446 - SG-SRES-IAM-WINDOWS-PEN SR50971783 -SG-SRES-IAM-WINDOWS-SIDT added to the existing source CH50078675 and SR50970216 SG-SRES-IAM-WINDOWS-UAT added to the existing source CH50079731 and SR50980015 SG-SRES-IAM-WINDOWS-PROD added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/KERBEROS",
      "/infra/services/NBDG-Unicast",
      "/infra/services/WINS",
      "/infra/services/LDAP",
      "/infra/services/LDAP-UDP",
      "/infra/services/WINS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/Active_Directory_Server",
      "/infra/services/NBNS-Unicast",
      "/infra/services/Windows-Global-Catalog-over-SSL",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/SMTP",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/NBSS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/DNS-UDP",
      "/infra/services/DHCP-Server",
      "/infra/services/DNS-YgYUhldeX",
      "/infra/services/MS-DS-TCP",
      "/infra/services/SOAP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2291-ALL-Win-Servers-to-Staas2-&-DNS02"
    notes        = "SR50942226"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/DNS-YgYUhldeX"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2312-Certification-Authority"
    notes        = "SR50945469 SR50963446 - SG-SRES-IAM-WINDOWS-PEN SR50971783 SG-SRES-IAM-WINDOWS-SIDT added to existing source CH50078675 and SR50970216 SG-SRES-IAM-WINDOWS-UAT added to existing source CH50079731 and SR50980015 SG-SRES-IAM-WINDOWS-PROD added to source"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/MS_RPC_TCP",
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
      "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2336-IAM--IBM-Blue-to-nonProd-Remote-Access-Server"
    notes        = "SR50954319 SR50997001 SG-SRES-IAM-THY-RAS-PROD added to the destination"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP",
      "/infra/services/Terminal_Services_(UDP)"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2484-IAM-PROD-Remote-Access-Server-to-Proxies"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-9000",
      "/infra/services/TCP-5672",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-5671",
      "/infra/services/TCP-9343"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2485-IAM-PROD-Remote-Access-Server-to-Windows-VMs"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-3389",
      "/infra/services/TCP-3389"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2486-IAM-PROD-Remote-Access-Server-to-SVG"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9343"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2487-IAM-PROD-Proxies-to-SVG"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-11443",
      "/infra/services/TCP-9343",
      "/infra/services/TCP-10444",
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2488-IAM-PROD-Proxies-to-Secret"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2489-IAM-PROD-Remote-Access-Server-to-Linux-VMs"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/RDP",
      "/infra/services/SSH",
      "/infra/services/HTTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2490-ISM-PROD--All-but-DB-to-Proxies"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8892",
      "/infra/services/TCP-1098",
      "/infra/services/TCP-445",
      "/infra/services/UDP-51010",
      "/infra/services/TCP-1099",
      "/infra/services/UDP-50010",
      "/infra/services/TCP-9343",
      "/infra/services/HTTPS",
      "/infra/services/SSH",
      "/infra/services/TCP-139",
      "/infra/services/TCP-9000",
      "/infra/services/TCP-51010",
      "/infra/services/TCP-50010",
      "/infra/services/TCP-2821",
      "/infra/services/TCP-5672",
      "/infra/services/UDP-2821",
      "/infra/services/SNMP",
      "/infra/services/TCP-9112",
      "/infra/services/TCP-135",
      "/infra/services/UDP-1098",
      "/infra/services/TCP-9443",
      "/infra/services/UDP-1099"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2491-IAM-PROD-Secret-to-Session-Server"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprfs"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-137",
      "/infra/services/TCP-139",
      "/infra/services/TCP-445",
      "/infra/services/UDP-138"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprfs",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2492-IAM-PROD-Secret-to-Rabbit-MQ"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671",
      "/infra/services/TCP-5672"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2493-IAM-PROD-Secret-to-MS-SQL"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-139",
      "/infra/services/TCP-445",
      "/infra/services/TCP-1433",
      "/infra/services/TCP-135"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2494-IAM-PROD-SVG-to-SDI-and-SDI-to-SVG"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SNMP",
      "/infra/services/TCP-8892",
      "/infra/services/TCP-1098",
      "/infra/services/TCP-9112",
      "/infra/services/TCP-2821",
      "/infra/services/UDP-1098",
      "/infra/services/TCP-1099",
      "/infra/services/SSH",
      "/infra/services/TCP-9437-9439",
      "/infra/services/UDP-2821",
      "/infra/services/TCP-9443",
      "/infra/services/TCP-9343",
      "/infra/services/UDP-1099"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2496-IAM-PROD-Distrib-Engine-to-Rabbit-MQ"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671",
      "/infra/services/TCP-5672"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2497-IAM-PROD-Distrib-Engine-to-Secret"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2498-IAM-PROD-SDI-to-SDI"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2499-IAM-PROD-Rabbit-MQ-to-Rabbit-MQ"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2501-IAM-PROD-SQL-to-SQL"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2503-IAM-PROD-Secret-to-Secret"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2504-IAM-PROD-Proxies-to-Proxies"
    notes        = "CH50079731 and SR50980015"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2694-IAMAAS_to_bluepages"
    notes        = "SR51036565"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/LDAP-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2706-Thycotic-to-UAT-LA"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-Thycotic-UAT-LA"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-Thycotic-UAT-LA"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2707-IAMAAS_Thy_secret_prod_to_SMTP"
    notes        = "SR51043256 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2722-IAMAAS-sdi-prod-to-db2prod"
    notes        = "SR51043485"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/UDP-51010",
      "/infra/services/TCP-51010",
      "/infra/services/TCP-50010",
      "/infra/services/UDP-50010"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2734-IAMAAS-prod-sdi-to-secret-"
    notes        = "SR51044565"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-HOST",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-HOST",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2738-IAMAAS-PROD--Proxy-to-DE,RMQ,SECRET-"
    notes        = "SR51046819"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2739-IAMAAS-PROD-DE,RMQ,SECRET-to-PROXY"
    notes        = "SR51046819"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2761-Thycotic-IAMAAS-SDI-to-SVG-"
    notes        = "SR51054677"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1100"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2842-Thycotic-Secret-PROD-to-IAM-Windows--"
    notes        = "SR51100545"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2843-Thycotic-DE-PROD-to-IAM-Windows--"
    notes        = "SR51100545"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445",
      "/infra/services/TCP-135"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2878-Thycotic-SVG/SDI-to-Infra-ports-"
    notes        = "SR51119267"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2880-Thycotic-SVG/SDI-to-Infra-ports"
    notes        = "SR51119267"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2888-Thycotic-SVG/SDI-to-Infra-ports-----"
    notes        = "SR51119267"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-45580"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2890-IAM-PROD-SID->-DE-"
    notes        = "SR51132852 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1100"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-2996-IAMAAS-Secret-to-Blue"
    notes        = "SR51186649 "
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-2001"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3202-SRES-to-ICP"
    notes        = "SR51306624"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-16351"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3262-ICP-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
      "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3263-SRES-to-ICP"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
      "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
      "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
      "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3270-PenTest-VM-for-ChatOps"
    notes        = "CH50099191"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01",
      "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3276-SRES-to-ICP"
    notes        = "SR51357166"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3437-UAT-Shared-to-DSS-NA"
    notes        = "RITM0122210"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-HOST-UAT-Shared"
    ]
    destination_groups = [
      #"/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      #"/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP",
      "/infra/domains/default/groups/TF-AG1-SG-HOST-UAT-Shared"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3482-IBM-CLOUD-to-THY"
    notes        = "RITM0116065"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-icdalpamhapxy01-cloudprivate-local",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-icamspamhapxy01-cloudprivate"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-5671-5672"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-icdalpamhapxy01-cloudprivate-local",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-icamspamhapxy01-cloudprivate",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3483-NA-to-EU-Chatops-integration"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3526-CHATOPS-to-ICD"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3527-ICD-to-CHATOPS"
    notes        = "RITM0118985"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
      "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
      "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3530-EU-to-NA-SRES"
    notes        = "RITM0118704"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES-LB"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-5671",
      "/infra/services/TCP-5672"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES-LB",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3585-MCMS-EU-to-PAM"
    notes        = "RITM0121602"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-icamspamhapxy01-cloudprivate"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-5672",
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-icamspamhapxy01-cloudprivate"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3638-IAM-to-IAMAAS-ZABBIX"
    notes        = "RITM0127633"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3661-ZABBIX-to-SRES"
    notes        = "RITM0131427"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wniamsb-All",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-10050"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lniamsbbkl1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wniamsb-All",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lniamsbprx1",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3745-KSTP-2023-Pen-Test-SRES-scan"
    notes        = "RITM0139451"
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-NET-SRES-APP"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-IPSET-Host-NET-SRES-APP"
    ]
    disabled              = true
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3768-IAM-dedicated-RAS-to-DDE"
    notes        = "RITM0140602"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprra"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1d276wpDDE"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/RDP",
      "/infra/services/TCP-3390"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprra",
      "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1d276wpDDE"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3769-Reverse-proxyto-KSTP-NA-PAM-RMQ"
    notes        = "RITM0140602"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1d276lprevpxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5672",
      "/infra/services/TCP-5671"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1d276lprevpxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3770-Reverse-proxy-to-KSTP-NA-PAM-Proxy"
    notes        = "RITM0140602"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1d276lprevpxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
      "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1d276lprevpxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  rule {
    display_name = "TF-3801-AG-SRES-to-UAT-LA"
    notes        = "RITM0143380"
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre1",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre1",
      "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-SRES-AG1"
    }
  }
  ######################################################
# migration: IAM_PHASE5
######################################################
   rule {
         display_name = "TF-1022-SRES-Jump-from-Provider"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Services",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1ljmp01-dnat",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Win-Jump-Servers-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1wjmp01-dnat"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1ljmp01-dnat",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Win-Jump-Servers-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Services",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1wjmp01-dnat"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1025-SRES-Jump-to-Provider-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-IPSET-snat-to-SL-SVC",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [

            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/RDP",
               "/infra/services/TCP-6443",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-IPSET-snat-to-SL-SVC",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1026-DNS-Forwarder-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1027-NTP-Server"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1028-DNS-Clients-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SRES-APP-INTERNAL"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SRES-APP-INTERNAL"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1029-NTP-Clients-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1030-AD-Clients-to-IRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/MS-DS-UDP",
               "/infra/services/SMTP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/SOAP",
               "/infra/services/DHCP-Server",
               "/infra/services/WINS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/DNS-UDP",
               "/infra/services/LDAP-UDP",
               "/infra/services/Active_Directory_Server",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBSS",
               "/infra/services/NBNS-Unicast"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1031-SL-WSUS-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-WSUS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-WSUS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1071-ITaaS-Jenkins-to-SRES-Linux-Jump-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EITaaS-Jenkins"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-IPSET-EITaaS-Jenkins",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1072-ITaaS-UCD-from-SRES-Linux-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EITaaS-UCD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-7918"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EITaaS-UCD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1093-SRES-DNS-to-IBM-Blue"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-DNS",
               "/infra/domains/default/groups/TF-AG1-IPSET-Kyndryl-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-DNS",
               "/infra/domains/default/groups/TF-AG1-IPSET-Kyndryl-DNS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-DNS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1094-SRES-Jump-to-Blue-API-Connect"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1095-SRES-Jump-to-TaaS-UCD"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-TaaS-UCD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-7918"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-IPSET-TaaS-UCD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1127-DRES-clients-to-SRES-NTP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1128-DRES-clients-to-SRES-DNS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
               "158.87.50.0/26"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1209-ICp-from-SRES-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/ICP-Kubernetes-API-Server",
               "/infra/services/ICP-Docker-Registry",
               "/infra/services/ICP-Ingress-Service",
               "/infra/services/ICP-Management-Console",
               "/infra/services/ICP-WebSphere-Application-Server-Liberty",
               "/infra/services/ICP-Kubernetes-NodePort"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1325-Icp-to-IBM-Blue"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-Sendmail",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP",
               "/infra/services/HTTPS",
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-Sendmail",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1326-SRES-JH-to-Icp"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/ICP-Kubernetes-API-Server",
               "/infra/services/ICP-Docker-Registry",
               "/infra/services/ICP-Ingress-Service",
               "/infra/services/ICP-Management-Console",
               "/infra/services/ICP-WebSphere-Application-Server-Liberty",
               "/infra/services/ICP-Kubernetes-NodePort"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1356-SG-Sres-Jump-to-OCP-Cluster"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster01_46_TEMP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-53",
               "/infra/services/TCP-22623",
               "/infra/services/TCP-8181",
               "/infra/services/TCP-22",
               "/infra/services/TCP-18080",
               "/infra/services/TCP-8080",
               "/infra/services/TCP-80",
               "/infra/services/TCP-4789",
               "/infra/services/TCP-443",
               "/infra/services/TCP-8500",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-10250",
               "/infra/services/TCP-8001",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-30000-32767",
               "/infra/services/TCP-6443",
               "/infra/services/TCP-8053"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster01_46_TEMP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1456-LB-to-Win-Jumphosts-RDP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1498-SRES-Jump-Servers-to-OCP-Cluster02"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster02_46_TEMP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-8181",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/HTTPS",
               "/infra/services/TCP-18080",
               "/infra/services/TCP-8080",
               "/infra/services/TCP-4789",
               "/infra/services/HTTP",
               "/infra/services/DNS-UDP",
               "/infra/services/TCP-8500",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-10250",
               "/infra/services/TCP-8001",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-30000-32767",
               "/infra/services/TCP-8053"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster02_46_TEMP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1505-AD-to-ISIM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCISPW-IRES-Members",
               "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCISPW-SRES-Members"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2",
               "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCISPW-IRES-Members",
               "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCISPW-SRES-Members"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1512-Jump-to-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16316",
               "/infra/services/TCP-16311"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1560-SG-SRES-CACF-JumpHost-Test-Servers-communication"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1645-ISPW-SRES-Linux-Jump-to-BDS-Master"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1657-SRES-Jump-to-DVAA-Servers-Test"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-DVAA-Test-Servers-All"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-DVAA-Test-Servers-All",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1674-ISPW-SRES-Jump-servers-to-BDS-Master-Repo-VM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/RDP",
               "/infra/services/HTTP",
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1725-File-share-between-SRES-jumps"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMB"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1741-SRES-Jump-Servers-to-OCP-Cluster03"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster03-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-22623",
               "/infra/services/TCP-8181",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/HTTPS",
               "/infra/services/TCP-18080",
               "/infra/services/TCP-8080",
               "/infra/services/TCP-4789",
               "/infra/services/HTTP",
               "/infra/services/TCP-8500",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-10250",
               "/infra/services/TCP-8001",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-30000-32767",
               "/infra/services/TCP-6443",
               "/infra/services/TCP-8053"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster03-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1742-OCP-Cluster03"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster03-Temp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster03-Temp"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster03-Temp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1780-SAT-GUI"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1850-OCP-Cluster05"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster5-VIP-1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster5-VIP-1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster5-VIP-1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1858-THCaaS-to-BlueID-ICp-Cluster02"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-BLUEID-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-BLUEID-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1975-Mail-Notification-Relay-Service"
         notes        = "SR51171499 - SG-SRES-Linux-Jump-Servers"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lniamprxy-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lniamprxy-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1994-Jump-servers-to-Thycotic-VM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443",
               "/infra/services/TCP-8080",
               "/infra/services/TCP-9343",
               "/infra/services/TCP-9000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2007-SRES-Jumpserver-to-CAR-DB"
         notes        = "SR51002160"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcardb1000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcardb1000",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2008-SRES-Jumpserver-to-CAR-WAS"
         notes        = "SR51002160"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcarwas1000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443",
               "/infra/services/HTTPS",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcarwas1000",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2025-Jumpserver-to-eToc-DB"
         notes        = "SR51002321"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlnetocdb1021",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlpetocdb1011"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlnetocdb1021",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlpetocdb1011",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2026-Jumpservers-to-eToc-WAS"
         notes        = "SR51002321"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlnetocwas1021",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlpetocwas1011"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlnetocwas1021",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlpetocwas1011",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2033-WIN-Jumpserver-to-IAM-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-11443",
               "/infra/services/TCP-10444"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2065-ISPW-SSH-Proxies"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2066-ISPW-SSH-Proxies-to-BDS-Master"
         notes        = "SR50968197"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2068-ISPW-SSH-Proxies-to-All-ISPW"
         notes        = "SR50875765 - NET-SL-IRES-Portable"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IRES-NSX-T",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-5985-5986"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IRES-NSX-T",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-GSNI-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-CGN-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2069-ISPW-SSH-Proxy-VIP-to-Proxies"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-8081",
               "/infra/services/TCP-5985-5986"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2070-Tower-to-ISPW-SSH-Proxy-VIP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-5985-5986"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2082-IAMAAS-Jump-Servers-SSH"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2222"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2111-SRES-Linux-Jump-to-IKS-Private-Endpoints"
         notes        = "R51244418 - port 31220 SR50933939 - port 30270 SR51000571 - port 32469 SR51088576 - remove port 32469 SR51088576 - port 30079 SR51321231 - port 31702 SR51327173 - REMOVE 31702 SR51327173 - TCP 30263 SR51328585 - TCP 32527 SR51331318 - TCP 32422"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-31220",
               "/infra/services/TCP-30079",
               "/infra/services/TCP-31480",
               "/infra/services/TCP-30270",
               "/infra/services/TCP-30263",
               "/infra/services/TCP-32527",
               "/infra/services/TCP-32422",
               "/infra/services/TCP-30183"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2141-AG-SRES-Secure-Gateway-Client-to-IBM-Cloud"
         notes        = "SR50862287"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpsecgw1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpsecgw1",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2174-IAMaaS-SSH"
         notes        = "SR50875672"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2222",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2248-eToc"
         notes        = "SR50854517"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlnetocdb1021",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlpetocdb1011"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50001",
               "/infra/services/TCP-50214",
               "/infra/services/TCP-50514",
               "/infra/services/TCP-51114",
               "/infra/services/TCP-50714",
               "/infra/services/TCP-50314",
               "/infra/services/TCP-50414",
               "/infra/services/TCP-50005",
               "/infra/services/TCP-50914",
               "/infra/services/TCP-50000",
               "/infra/services/TCP-50034",
               "/infra/services/TCP-50010",
               "/infra/services/TCP-50004",
               "/infra/services/TCP-51014",
               "/infra/services/TCP-50114"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlnetocdb1021",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srlpetocdb1011"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2297-DNS-Forwarding-"
         notes        = "SR50943015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2298-DNS-Forwarding"
         notes        = "SR50943015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2366-SRES1_Cluster-VIP-to-ISPW-SSH-Proxy-VIP-"
         notes        = "SR50968197"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2505-Jump-Server-OCP-VIPs"
         notes        = "SR50982457"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-6443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2521-SAT-to-SAT-Proxy"
         notes        = "JZerrich will add"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1srlpsatpxy-vip",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/SAT-range-2001-2050"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1srlpsatpxy-vip",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2544-SAT-Squid"
         notes        = "SR50987567"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1",
               "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2545-SAT-SMTP-"
         notes        = "SR50987567"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1",
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2546-Ansible"
         notes        = "SR50987567"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1",
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2547-SAT-to-DNS"
         notes        = "SR50987567"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/MS-DS-UDP",
               "/infra/services/SMTP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/SOAP",
               "/infra/services/DHCP-Server",
               "/infra/services/WINS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/DNS-UDP",
               "/infra/services/LDAP-UDP",
               "/infra/services/Active_Directory_Server",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBSS",
               "/infra/services/NBNS-Unicast"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2548-DNS-to-SAT"
         notes        = "SR50987567"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/MS-DS-UDP",
               "/infra/services/SMTP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/SOAP",
               "/infra/services/DHCP-Server",
               "/infra/services/WINS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/DNS-UDP",
               "/infra/services/LDAP-UDP",
               "/infra/services/Active_Directory_Server",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBSS",
               "/infra/services/NBNS-Unicast"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2603-SRES-JH-to-TDI"
         notes        = "SR50993704"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-DevOps"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-DevOps",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2658-NSX-T-to-SRES-NTP"
         notes        = ""
         source_groups = [
               "10.211.161.0/24"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2676-Jump-to-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnetocddb",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnetocdwas"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60000",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-50000",
               "/infra/services/TCP-9043-OPJR-VZo8",
               "/infra/services/TCP-443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnetocdwas",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnetocddb",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2712-Jump-to-OCP-cluster2"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-dummyVIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-OCP-Cluster6-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-6443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-dummyVIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2765-Jump-SMTP"
         notes        = "SR51055559"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2772-Block-Direct-Internet-access-from-SRES-JH"
         notes        = "SR51310943"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Window-Linux-JumpHost"
            ]
         destination_groups = [

            ]
         action = "DROP"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Window-Linux-JumpHost"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2773-SRES-JH-to-FortiGate-FW"
         notes        = "Fortigate 10Gig migration testing "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-JUMP02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "169.63.82.225/32",
               "150.239.66.1/32"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-JUMP02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2848-IAMaaS-appliance-to-DNS"
         notes        = "SR51089515"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2951-MoM-Jump-server-EU-to-NA"
         notes        = "SR51185464"
         source_groups = [
               "158.87.53.52",
               "158.87.53.51"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2977-OCP-Cluster-01-to-DNS-NTP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2992-SRES-JH-servers-to-hcs"
         notes        = "CH50090359"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2999-Proxy-to-Vinm-Conections"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IRES-NSX-T"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/SSH",
               "/infra/services/TCP-5986"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IRES-NSX-T",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3167-GACDW-Test"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-AP-ProxyVIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10003",
               "/infra/services/TCP-10503"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-AP-ProxyVIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3172-SG-SRES-WIN-Jump-servers-to-agnsr1lnta2vip"
         notes        = "SR51258186"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-6443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3174-SG-SRES-OCP-Cluster03-04-to-IBM-Blue-Stutvs3a"
         notes        = "SR51256470"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-stutvs3a-de-ibm-com"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-LINUX-Jump-Server-CACF",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-stutvs3a-de-ibm-com",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3203-SRES-LinuxJH-to-NFS-Mount"
         notes        = "SR51312691 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AG-SRES-NFS01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-AG-SRES-NFS01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3204-CACF-Proxy-to-NFS-Mounts"
         notes        = "SR51312691 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AG-SRES-NFS01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-AG-SRES-NFS01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3241-SRES-JH-to-DRES-"
         notes        = "SR51312595"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77lpocum"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77lpocum"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3271-NA-to-AP-Cntrl-node"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "158.87.54.8"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3304-BDS-Server-access"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-GSNI-routable",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-CGN-Subnets"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-GSNI-routable",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-All-CGN-Subnets"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3386-SRES-ag1sr1lniamuasdi-to-Blue"
         notes        = "RITM0073612"
         source_groups = [
              # "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lniamuasdi",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Blue-dev-aiops-elk"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               #"/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lniamuasdi",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Blue-dev-aiops-elk"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3452-NSXT-SRES-VM-Testing-Rules"
         notes        = "temp"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AG-1-NSXT-SRES-IP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/NTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-AG-1-NSXT-SRES-IP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3471-cstl1-to-tanzu-nonProd"
         notes        = "RITM0115125 RITM0116758"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-25010"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3657-SRES-to-IRES"
         notes        = "RITM0130623"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3733-Anisble-workflow-for-KSTP-ESXI-Hosts"
         notes        = "RITM0135353"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1vc1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1vc1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3734-Anisble-workflow-for-KSTP-ESXI-Hosts"
         notes        = "RITM0135353"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1nsxt-vc"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1nsxt-vc",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3736-dr100-esg-to-linux-jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-dr100-ESG-vNic_1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-dr100-ESG-vNic_1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3798-SRES-Windows-JH-to-ag1sr1sltestvm"
         notes        = "RITM0143527"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1sltestvm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-3000",
               "/infra/services/TCP-9090"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1sltestvm"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3833-SRES-WIN-JH-to-WAS-Admin"
         notes        = "RITM0145611"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-WAS-Admin"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-WAS-Admin",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3852-Kyndryl-DNS-to-SRES-DNS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Kyndryl-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-DNS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Kyndryl-DNS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
######################################################
# migration: IAM_PHASE6
######################################################
   rule {
         display_name = "TF-3281-File-transfer"
         notes        = "SR51364128"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-22"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3310-NA-SRES-to-EU-SRES-SSH-flow"
         notes        = "SR51385647"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "158.87.53.178",
               "158.87.52.69"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3456-DB-to-ag1srlphwcsss01-"
         notes        = "RITM0094887"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-GACDW-AG-DB"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-50000",
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-GACDW-AG-DB"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3457-ag1srlphwcsss01-to-DB"
         notes        = "RITM0094887 RITM0115048"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-IPSET-secure-file-service-ocp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-GACDW-AG-DB"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10548",
               "/infra/services/TCP-10501",
               "/infra/services/TCP-12051",
               "/infra/services/TCP-12057"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-IPSET-secure-file-service-ocp1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-GACDW-AG-DB"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3510-ANZ-SRES-to-NA-SRES"
         notes        = "RITM0118072"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-anzproductionapp-hwsw-",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ap1sr1lpcacprx1-vip"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ap1sr1lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-anzproductionapp-hwsw-"
            ]
         disabled              = true
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3621-US-Only-GRF-to-NA-GRF"
         notes        = "RITM0123640"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-US-GRF-SSS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-US-GRF-SSS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3700-GACDW-EU-To-Sres"
         notes        = "RITM0134328"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SRES-eu1srlngacdwdb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SRES-eu1srlngacdwdb"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
######################################################
# migration: IAM_PHASE7
######################################################
   rule {
         display_name = "TF-2993-HCS-to-pdr"
         notes        = "CH50090359"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2994-SRES-HCS-to-IBM-bluepages"
         notes        = "CH50090359"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2995-IBM-blue-to-hcs-"
         notes        = "CH50090359"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3133-ICP-to-to-AI-Ops-Dev-Server"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnaiodev1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-agnsrlnicp1p-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-agnsrlnicp1p-vip",
               "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnaiodev1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3179-Analytics-Dev-Server-to-TKG-nonProd-KSI-Elastic"
         notes        = "SR51272609 SR51330117 - Add to destination HOST-Tanzu-Workload-03-HOST RITM0137101-----add tanzu-05"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnaiodev1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-sres-tanzu-workload-05",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Host",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-sres-tanzu-workload-05",
               "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnaiodev1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Host",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3277-Copy-of-SRES-to-ICP-"
         notes        = "SR51339688 CH50099191"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpchatixf1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-agnsrlnicp1p-vip",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpchatixf1",
               "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-AGNSRLNICP1-ICP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3294-Chat-op-to-ICP-Cluster"
         notes        = "SR51374584"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpchatixf1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-AGNSRLNICP1-ICP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8001"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-AGNSRLNICP1-ICP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpchatixf1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3316-Blue-to-SRES-POK"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1035"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
######################################################
# migration: IAM_PHASE8
######################################################
   rule {
         display_name = "TF-1353-OCP-Cluster-to-Netcool-Probe"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-MEaaS-Netcool-Probe"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-MEaaS-Netcool-Probe",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1354-Net-IBM-Blue-to-OCP-Cluster"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster01_46_TEMP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/ICMP_Echo_Reply",
               "/infra/services/ICMP_Echo_Request"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster01_46_TEMP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1355-OCP-Cluster-to-IBM-Blue"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-Sendmail",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL",
               "/infra/services/HTTPS",
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-API-Connect",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-Sendmail"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1357-SG-SRES01-OCP-Cluster01-InternalCom"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1358-OCP-Cluster-to-SG-PDR-Internet-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1372-OCP-Cluster-to-DBaaS-in-SL"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-snat-to-SL-SVC"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-30871"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-Private-Service-Endpoints",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-snat-to-SL-SVC"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1402-OCP-to-DA20-IGA"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-TALOS-b01avi11810416",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-TALOS-b03avi11810411"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-TALOS-b01avi11810416",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-TALOS-b03avi11810411",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1454-Talos-Netcool"
         notes        = "SR51005961"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-GR-SharedNetcool1",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-GR-SharedNetcool2",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool2",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool1",
               "169.62.155.2",
               "169.62.155.1",
               "169.62.155.5"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool1",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-GR-SharedNetcool1",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool2",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-GR-SharedNetcool2",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1455-Talos-Netcool"
         notes        = "SR51005961"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-GR-SharedNetcool1",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-GR-SharedNetcool2",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool2",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool1",
               "169.62.155.2",
               "169.62.155.1",
               "169.62.155.5"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster5-VIP-1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool1",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-GR-SharedNetcool1",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool2",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-NA-GR-SharedNetcool2",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster5-VIP-1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1494-SG-SRES01-OCP-Cluster02-to-Netcool-Test-Servers"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster7-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-16443",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster7-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1501-OCP-to-DA20-IGA"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-HST-NA-Cloud"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-HST-NA-Cloud",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1507-OCP-to-IBM-Blue"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "9.56.20.93",
               "9.57.52.75",
               "9.17.131.35",
               "9.16.6.103"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-17443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1510-OCP-to-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-16443",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1511-Netcool-to-OCP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1513-CACM-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1559-SG-SRES-CACF-JumpHost-Test-Servers-communication"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-16443",
               "/infra/services/TCP-8443",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1561-SG-SRES-CACF-JumpHost-Test-Servers-communication"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1595-NA-Tower-Prod-DevTest-to-CDI-NA-Prod"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-NA-Proxy"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-13002",
               "/infra/services/TCP-13001",
               "/infra/services/TCP-13004"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-NA-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1629-OCP-Prod-to-HST-INT-Svcs"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-PROD-DAL",
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-PROD-WDC"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-PROD-DAL",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-PROD-WDC"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1630-HST-INT-Svcs-to-OCP-Prod"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-PROD-DAL",
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-PROD-WDC"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster5-VIP-1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-PROD-DAL",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster5-VIP-1",
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-PROD-WDC"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1631-OCP-nonProd-to-HST-INT-Svcs-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-NONPROD-DAL",
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-NONPROD-WDC"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-NONPROD-WDC",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-IPSET-INT-SVCS-NONPROD-DAL",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1644-BDS-Master-Repo-to-PDR-proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1678-BDS-Master-Repo-VM-to-Blue-Pages"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1756-Primary-Netcool-Impact-Next-Server"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster03-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster03-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1757-SRES-CACF-JumpHost-Test-Servers"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/TCP-16443",
               "/infra/services/TCP-8443",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1759-SRES-Netcool-Test-Servers"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-16443",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1805-CACFDevTest-VALIDATION"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/TCP-16443",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-9093-9095-wYkD0HakI",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1806-CACFDevTest-VALIDATION-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/TCP-16443",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-9093-9095-wYkD0HakI",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1893-OCP-Cluster1-CDA-NA-proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-NA-Proxy"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2222"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-NA-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2013-OCP-Cluster-to-IBM-Blue-SR50791570"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "9.56.248.20",
               "9.56.248.25",
               "9.56.248.21",
               "9.56.248.124"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2014-OCP-CL1-to-ICP-CL2-HTTPS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2015-ICP-CL2-to-OCP-CL1-HTTPs"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2048-OCP-Clusters-to-OCP-NFS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpta1str1"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpta1str1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2110-TEMP-AT-to-Elastic"
         notes        = "SR50850624"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-pdr-esg01-lb-vip-2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-pdr-esg01-lb-vip-2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2182-M-E-VPN-test-"
         notes        = "SR50946731 - 10 175 14 145 159 163 216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "10.175.14.220",
               "10.175.14.163",
               "10.175.14.216",
               "10.175.14.145",
               "10.175.14.167",
               "10.175.14.159"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2287-OCP3-Base-to-CACF-Test-JH"
         notes        = "SR50930520 RITM0127135"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP06-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster7-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9093-9095-wYkD0HakI",
               "/infra/services/TCP-16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP06-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster7-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2363-Copy-of-THCaaS-to-BlueID-agnsrlnicp1-"
         notes        = "SR50954311"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-BLUEID-PROD",
               "/infra/domains/default/groups/TF-AG1-IPSET-BLUEID-TEST"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-BLUEID-TEST",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-BLUEID-PROD"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2422-CACF-to-GADCW"
         notes        = "SR50970499"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "146.89.104.143"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10503"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2432-CACF-NA-PROD-toGACDW-NA-PROD-"
         notes        = "SR50975275"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-GACDW-NA"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-12051"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-GACDW-NA",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2446-CACF-NA-and-CAR-NA"
         notes        = "SR51089544 - HOST-IBM-Blue-CAR-DEV "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcarwas1000",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-CAR-DEV"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-CAR-DEV",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcarwas1000"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2506-OCP-Cluster-1-2-3-to-IBM-Blue"
         notes        = "SR50975182"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "9.220.6.22/32",
               "9.220.6.49/32"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2590-OCP-cluster-to-Qradar"
         notes        = "SR50994886"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1lmssqr01_migration-to-splunk_nic-removed"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-514",
               "/infra/services/TCP-514"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1lmssqr01_migration-to-splunk_nic-removed",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2779-GACDW-to-BDS-Master-"
         notes        = "SR51074911 SR51288220 - HOST-EU-SRES-nexus SR51288220 - HOST-EU-SRES-execution_node"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-prod-sdms01-gacdw-sl-ibm-com",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES-execution_node",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES-nexus"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-prod-sdms01-gacdw-sl-ibm-com",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES-execution_node",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES-nexus",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2924-OCP-Cluster05-to-OCP-Cluster01"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP05-Subnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-6443",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP05-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2925-OCP-Cluster01-to-OCP-Cluster05"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP05-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-6443",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP05-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2939-OCP-3-11-OCP-4-6-cluster"
         notes        = "SR51168659"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-6443",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2988-SRES-HRES-DRES-toLDAP"
         notes        = "SR51204131 RITM0115429 RITM0116164 - ag1h1lpta1ssh1 ag1h1lpta1ssh2"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-CACF-LDAP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/KERBEROS-TCP",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/LDAP",
               "/infra/services/LDAP_Global_Catalog",
               "/infra/services/TCP-445",
               "/infra/services/TCP-139",
               "/infra/services/UDP-389",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/TCP-464",
               "/infra/services/UDP-53",
               "/infra/services/TCP-3269",
               "/infra/services/KERBEROS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-CACF-LDAP",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3185-SRES-CACT-JH-to-SRES-agnsr1lnta2vip-"
         notes        = "SR51293217"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3186-SRES-agnsr1lnta2vip-to-SRES-CACT-JH"
         notes        = "SR51293217"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9094",
               "/infra/services/TCP-9093",
               "/infra/services/TCP-9095"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3194-SRES-agnsr1lnta2vip-to-SRES-agnsr1lnccmjmp1"
         notes        = "SR51293217"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster04-SNAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9093-9095-wYkD0HakI"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster04-SNAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3195-SRES-JH-TEST-to-SRES-agnsr1lnta2vip"
         notes        = "SR51293217"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster04-SNAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster04-SNAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3247-OPAAS-JH-to-ag1srlpcacfbds1"
         notes        = "SR51312942"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-OpaaS-JumpHosts"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-OpaaS-JumpHosts",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3248-OCP01-to-OPAAS-JH"
         notes        = "SR51312942 SR51349840 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-OpaaS-JumpHosts"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-OpaaS-JumpHosts",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3249-OPAAS-to-OCP01"
         notes        = "SR51312942"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet5",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet4",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet6",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet5",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet4",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet6",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-OpaaS-Subnet3"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3252-SRES-CACF-JH-to-SRES-3SCALE-LB"
         notes        = "SR51334865 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3253-SRES-3SCALE-LB-to-CACF-JH"
         notes        = "SR51334865 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9093-9095-wYkD0HakI"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster2-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3280-SRES01-OCP-Cluster05-to-ag1srlpSATZcld"
         notes        = "SR51363102 RITM0125131---added port 443"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3306-CACF-JumpHost-Test-Servers-to-OCP07"
         notes        = "SR51384825"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmjmp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-NAT-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmjmp1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-NAT-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3307-OCP07-CACF-JumpHost-Test-Servers-"
         notes        = "SR51384825"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP06-Subnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmjmp1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9093-9095-wYkD0HakI"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmjmp1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP06-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3308-OCP07-CACF-JumpHost-Test-Servers-"
         notes        = "SR51384825 SR51400025"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster04-SNAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP04-Subnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP04-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster04-SNAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3320-HWSW-AG1-AP1"
         notes        = "SR51392156"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-IP-AP1SRWPHWC",
               "/infra/domains/default/groups/TF-AG1-SG-AG1SRWPHWC"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-IP-AP1SRWPHWC",
               "/infra/domains/default/groups/TF-AG1-SG-AG1SRWPHWC"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/HTTPS",
               "/infra/services/TCP-50000",
               "/infra/services/RDP",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-IP-AP1SRWPHWC",
               "/infra/domains/default/groups/TF-AG1-SG-AG1SRWPHWC"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3342-azure-devlab-jumphost-to-ag1srlpcacfbds1"
         notes        = "SR51406103"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-azure-devlab-jumphost"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-azure-devlab-jumphost",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3343-new-dedicated-jumphost-AG-BDS-Server"
         notes        = "SR51392361"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpmcdjump"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpmcdjump"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3353-OCP-Tower-to-CIO-JHS"
         notes        = "SR51414708"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CIO-JHOSTS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CIO-JHOSTS",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3382-NA-OCP-Prod-to-STaaS-CACF-proxy"
         notes        = "SR51421868"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-MCMS-Dallas-Proxy"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-MCMS-Dallas-Proxy",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3387-HWSW-NA-to-HWSW-Canada-rule-1"
         notes        = "SCTASK0012735"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswetl01ra"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-50000",
               "/infra/services/RDP",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3388-HWSW-NA-to-HWSW-Canada-rule-2"
         notes        = "SCTASK0012735"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswdb01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswdb01ra"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-50000",
               "/infra/services/RDP",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswdb01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswdb01ra"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3389-HWSW-NA-to-HWSW-Canada-rule-3"
         notes        = "SCTASK0012735"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswstr01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswstr01ra"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS",
               "/infra/services/RDP",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswstr01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswstr01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3390-HWSW-Canada-to-HWSW-NA-rule-3"
         notes        = "SCTASK0012735"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswstr01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswstr01ra"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS",
               "/infra/services/RDP",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswstr01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswstr01ra"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3391-HWSW-Canada-to-HWSW-NA-rule-2"
         notes        = "SCTASK0012735"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswetl01ra"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS",
               "/infra/services/RDP",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3392-HWSW-Canada-to-HWSW-NA-rule-1"
         notes        = "SCTASK0012735"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswdb01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswdb01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswetl01ra"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS",
               "/infra/services/RDP",
               "/infra/services/TCP-9043-OPJR-VZo8"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswdb01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswdb01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswetl01ra"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3406-ARMS-ISI-to-HWSW-NA"
         notes        = "RITM0075210"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AMS-BigFix-Relay"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-AMS-BigFix-Relay"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3414-Tanz-fro-Application-access"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-HOST"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443",
               "/infra/services/TCP-22",
               "/infra/services/TCP-443",
               "/infra/services/TCP-50000",
               "/infra/services/TCP-9093"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-HOST",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3422-SAT-MT-to-Zcloud-Devices"
         notes        = "RITM0075738 RITM0093801---1751 Port added on the existing flow"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-Ag1srlpSATZcld"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-zCLD_LKD90_ASH",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-zCLD_LRM50_BLD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1719",
               "/infra/services/TCP-1718",
               "/infra/services/TCP-8451-8455",
               "/infra/services/TCP-1750",
               "/infra/services/TCP-1755",
               "/infra/services/TCP-1751"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-zCLD_LKD90_ASH",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-zCLD_LRM50_BLD",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-Ag1srlpSATZcld"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3436-OCP01-to-UAT"
         notes        = " RITM0093599"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-UAT-US"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-UAT-US"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3462-CACF-to-STaaS"
         notes        = "RITM0094837"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGASTL1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11sat",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lpstl"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stl",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGASTL1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11sat",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74stl",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lpstl"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3629-CACF-Test-JH-to-OCP3-Base"
         notes        = "RITM0127135"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster7-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster7-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3650-in1sr1wpgrfds-to-AG-DB"
         notes        = "RITM0130256"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-in1sr1wpgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-in1sr1wpgrfds",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3659-HWSW-to-OCP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3699-GACDW-EU-To-NA-Sres"
         notes        = "RITM0134328 RITM0152144"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SG-EU1-SRES-GACDW-DEV",
               "/infra/domains/default/groups/TF-AG1-IPSET-SG-EU1-SRES-GACDW-PROD",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SRES-eu1srlngacdwdb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswdb01ra"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswdb01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-SG-EU1-SRES-GACDW-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SRES-eu1srlngacdwdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-SG-EU1-SRES-GACDW-DEV"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3929-SRM-PROD-to-SFS"
         notes        = "RITM0154440"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-SRM-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM",
               "/infra/domains/default/groups/TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-SRM-PROD",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3981-DRES334-BDS"
         notes        = "INCEU16212256"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR334-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Ag1-Host-ag1srlpcacfbds1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR334-CACF-Proxy",
               "/infra/domains/default/groups/TF-AG1-IPSET-Ag1-Host-ag1srlpcacfbds1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
######################################################
# migration: IAM_PHASE9
######################################################
   rule {
         display_name = "TF-1129-SRES-STaaS-AD-clients-to-SRES-STaaS-AD-DNS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-Clients"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBSS",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/SOAP",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SMTP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/WINS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DHCP-Server",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-Clients"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1300-StaaS-General-Services-and-Access"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/SMTP",
               "/infra/services/SNMP-Send",
               "/infra/services/SNMP-Recieve",
               "/infra/services/FTP",
               "/infra/services/TCP-8080",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-34952"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1340-StaaS-General-Services-and-Access-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/HTTPS",
               "/infra/services/TCP-8080",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-34952"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1387-ag1srlpdefmstr-to-SMTP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-1503-STAAS-for-ISIM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCSTaaS-DRES-Members",
               "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCSTaaS-SRES-Members"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCSTaaS-SRES-Members",
               "/infra/domains/default/groups/TF-AG1-SG-ISIM-WDCSTaaS-DRES-Members",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2142-STaaS-SRES-DRES-rules-for-automation"
         notes        = "SR50863277 SR50851896 - SSH tcp 5986"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12sfm",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGASFM1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19sklm",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGASTW1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stw",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGATPC1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11sat",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65skl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77fm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
               "/infra/services/TCP-5985",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12sfm",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGASFM1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19sklm",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGASTW1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stw",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGATPC1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11sat",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65skl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77fm"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2143-STaaS-SRES-SRES-rules-for-automation"
         notes        = "SR50863277 SR50851896 - SSH tcp 5986"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
               "/infra/services/TCP-5985",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2175-Ansible-SSH-ag1srlpdefmstr"
         notes        = "SR50851896"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2176-SRES-ag1sr1lpansb-AD-DNS"
         notes        = "SR50851896 RITM0127983--added ag1srlpdefmstr 158 87 48 62 as a source"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBSS",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/SOAP",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SMTP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/WINS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DHCP-Server",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2177-SRES-AD-DNS-ag1sr1lpansb"
         notes        = "SR50851896"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBSS",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/SOAP",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SMTP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/WINS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DHCP-Server",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2178-Ansible-SSH-1"
         notes        = "SR50851896"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpocum",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpipq2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpskl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpipq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpfm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpskl"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpocum",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpipq2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpskl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpipq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpfm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpskl"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2179-Ansible-SSH"
         notes        = "SR50851896"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11fm",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGASTL1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d11lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11slog",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stl",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGAKLM1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d59lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGAKLM2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stl"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11fm",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGASTL1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d11lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74fm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11slog",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stl",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGAKLM1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d59lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGAKLM2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stl"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2180-Ansible-SendMail"
         notes        = "SR50851896"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2313-Certification-Authority"
         notes        = "SR50945469"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR151-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR12-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-dr65-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR53-PSIS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR112-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR59-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR77-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR71-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR74-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR52-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR147-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR144-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR162-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR100-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR156-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR11-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR19-STaaS-AD-Clients"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/MS_RPC_TCP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-DR151-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR12-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-dr65-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR53-PSIS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR112-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR59-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR77-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR71-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR74-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR52-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR147-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR144-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR162-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR100-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
               "/infra/domains/default/groups/TF-AG1-SG-DR156-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR11-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-AG1-SG-DR19-STaaS-AD-Clients"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2327-STaaS-SRES-SRES-"
         notes        = "SR50953392"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2362-STaaS-SRES-SRES-"
         notes        = "SR50964024"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3025-SRES-to-STAAS-DRES-Ansible-5985"
         notes        = "SR51216349 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-STaas-DRES-Ansible-port-5985"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-SG-STaas-DRES-Ansible-port-5985"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3026-SRES-to-STAAS-DRES-Ansible-22"
         notes        = "SR51216349 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-STaas-DRES-Ansible-port-22"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
               "/infra/domains/default/groups/TF-AG1-SG-STaas-DRES-Ansible-port-22"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3325-SRES-to-CDI-AP-Proxy"
         notes        = "SR51392372"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-AP-ProxyVIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10501"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-AP-ProxyVIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3380-SRES-to-icdalldb01"
         notes        = "RITM0073374"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-icdalldb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3306"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-icdalldb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3485-NA-SRES-to-HWSW-ILTM"
         notes        = "RITM0115949 RITM0120297"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ILTM-ag-ilmtapdapp01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ILTM-ag-ilmtapdapp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3497-HWSW-NA-to-HWSW-Canada"
         notes        = "RITM0117186"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswdb01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswdb01ra"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/TCP-50000",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswdb01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1dhwswdb01ra"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3518-HWSW-NA-to-HWSW-Canada-"
         notes        = "RITM0119264"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswstr01ra"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9093"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswstr01ra"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3519-HWSW-NA-to-HWSW-NA"
         notes        = "RITM0119264"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5000-5001",
               "/infra/services/TCP-4000-4001",
               "/infra/services/TCP-3000-3024"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3520-HWSW-NA-to-AP"
         notes        = "RITM0119264"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-IP-AP1SRWPHWC"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9093"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-IP-AP1SRWPHWC"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3545-HWSW-NA-to-HWSW-NA"
         notes        = "RITM0119264"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5000-5001",
               "/infra/services/TCP-4000-4001",
               "/infra/services/TCP-3000-3024"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = true
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3597-AP-SRES-to-AG-SRES"
         notes        = "RITM0123805 RITM0130335--add EU server"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-ap1srlphwcls"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-ap1srlphwcls",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1srlpelk1001"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9096"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-ap1srlphwcls",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1srlpelk1001"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3598-SRES-to-SRES"
         notes        = "RITM0123807"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9096"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3599-NA-SRES-to-CA-SRES"
         notes        = "RITM0123807"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CA1-CA1PHWSWLSO1RA"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9096"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-IPSET-CA1-CA1PHWSWLSO1RA"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3600-NA-SRES-to-EU-SRES"
         notes        = "RITM0123807"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1srlpelk1001"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9096"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1srlpelk1001"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3660-SRES-to-PDRSMTP"
         notes        = "RITM0131359"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-HOST",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-HOST",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3666-ag1srwphwcsrv01-to-MCMS"
         notes        = "RITM0132503"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag-bfiapdapp22"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag-bfiapdapp22",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3680-APAC-sRES"
         notes        = "RITM0123807"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-ap1srlphwcls"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9096"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-ap1srlphwcls"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3710-GACDW-HWSW-AG-to-GACDW-EU-PROD"
         notes        = "RITM0135828 RITM0155092 IP added-158 87 52 198 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwdb"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3847-DR327-DCs-to-SRES-AD-DNS"
         notes        = "CHGEU0200098"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR327-DCs"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/ICMP_Echo_Reply",
               "/infra/services/ICMP_Echo_Request",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBSS",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/SOAP",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SMTP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/WINS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DHCP-Server",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR327-DCs"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3849-SRES-to-DR327-AD-DNS-"
         notes        = "CHGEU0200098"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR327-DCs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBSS",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/SOAP",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SMTP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/WINS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DHCP-Server",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR327-DCs"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3856-AG1-308-Server-to-SRES-D"
         notes        = "RITM0148619"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1d308-Server"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBSS",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/SOAP",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SMTP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/WINS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DHCP-Server",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1d308-Server"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3862-NA-HWSW-to-BlueID-Azure"
         notes        = "RITM0148705 RITM0149835 RITM0150179"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster05-SNAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-BLUEIDP1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50001",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-BLUEIDP1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster05-SNAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3871-DR327-Clients-to-SRES-AD-DNS-"
         notes        = "RITM0149376"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR327-DCs"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/ICMP_Echo_Reply",
               "/infra/services/ICMP_Echo_Request",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBSS",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/SOAP",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SMTP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/WINS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DHCP-Server",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR327-DCs"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
}
