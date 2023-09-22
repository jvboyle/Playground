resource "nsxt_policy_security_policy" "policies_TF-eu_sres_wave2-eu_sres_wave2" {
  display_name    = "TF-eu_sres_wave2"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-eu_sres_wave2"
  comments        = ""
  sequence_number = 0
  rule {
    display_name = "TF-5125-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d104lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d104lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d104lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d104lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5610-DRES-<->-SRES-Flows"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5611-DRES-<->-SRES-Flows"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpstw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5612-DRES-<->-SRES-Flows"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpstw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5613-DRES-<->-SRES-Flows"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5614-DRES-<->-SRES-Flows"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104lpskl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104lpfm",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104lpocum",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104lpstl"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104lpskl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104lpfm",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104lpocum",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104lpstl"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5621-DRES-->-Internet-Flows"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5622-DRES-->-Internet-Flows"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5798-SRES-to-DRES"
    notes        = "SR50850988 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5869-DRES-to-SRES"
    notes        = "SR50850988 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6402-Ansible"
    notes        = "SR50953044 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpdc2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpdc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5985"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpdc2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpdc1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8185-Ansible-"
    notes        = "CH50101611"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpsrs"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr104wpsrs"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5196-BDS-CACF-Proxy"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5057-BDS-from-CACF-Proxy"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d113lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d113lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8524-BSD-Flow"
    notes        = "CHGEU0148802"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5358-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d126lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d126lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d126lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d126lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-1147-Wbshepree,-Rest,-Key-management"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-1148-Arxview"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-3729",
      "/infra/services/HTTPS",
      "/infra/services/TCP-2233"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-1149-AD/DNS/NTP"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-2769-StaaS-General-Services-and-Access"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP",
      "/infra/services/SSH",
      "/infra/services/HTTP",
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS",
      "/infra/services/UDP-161-162",
      "/infra/services/TCP-8080",
      "/infra/services/FTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4522-DRES-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4523-SRES-to-DRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4994-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d13lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d13lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d13lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d13lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6701-Ansible"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d13lpocum"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d13lpocum"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5483-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d131lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d131lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d131lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d131lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5403-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d132lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d132lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d132lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d132lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5832-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d134lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d134lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d134lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d134lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5981-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "SR50864091"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d135lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d135lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d135lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d135lpcacprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6270-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "SR50807420"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d136lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d136lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d136lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d136lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6248-CACF-Proxy-to-SRES-BDS"
    notes        = "CH50074859"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d137lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d137lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d137lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d137lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6377-CACF-Proxy-to-SRES-BDS"
    notes        = "CH50076226 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d138lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d138lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d138lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d138lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6729-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d139lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d139lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d139lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d139lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6927-CACF-Proxy-to-SRES-BDS"
    notes        = "CH50080949 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d140lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d140lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d140lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d140lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5505-Microsoft-Active-Directory"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5506-Microsoft-Active-Directory"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5507-Websphere,-Rest,-Key-management"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142wphbstw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142wphbstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5508-DNS,-DNS-UDP,-LDAP,-Kerberos,-LDAP-Global-Catalog,-NTP"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142wphbstw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142wphbstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5515-Microstrategy"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5516-Microstrategy"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6148-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d142lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d142lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d142lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d142lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5554-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d143lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d143lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5689-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d145lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d145lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7851-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50096982"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d146lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d146lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5761-DNS,-DNS-UDP,-LDAP,-Kerberos,-LDAP-Global-Catalog,-NTP"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149wpstw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149wpstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5762-Websphere,-Rest,-Key-management"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149wpstw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149wpstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5765-Ansible"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lpstl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lpskl"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lpstl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lpskl"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5770-AD,-Win-2008"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR149-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR149-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5771-AD,-Win-2008"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR149-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR149-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5772-Microstrategy-Desktop"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5773-Microstrategy-Desktop"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5774-Microstrategy"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5775-Microstrategy"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5790-SRES-to-DRES"
    notes        = "SR50852579 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR149-STaaS-AD-Clients"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-445"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
      "/infra/domains/default/groups/TF-EU1-SG-DR149-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5791-DRES-to-SRES"
    notes        = "SR50852579 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR149-STaaS-AD-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
      "/infra/domains/default/groups/TF-EU1-SG-DR149-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6042-eu1srlpabcmstr-SSH"
    notes        = "SR50880396 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6043-eu1srlpabcmstr-HTTPS"
    notes        = "SR50880396 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149lparx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6403-Ansible-"
    notes        = "SR50953044 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149wpdc2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149wpstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149wpdc1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5985"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149wpdc1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149wpstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr149wpdc2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4888-CACF-Proxy-to-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5794-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d152lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d152lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5806-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d153lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d153lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6258-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d161lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d161lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8845-CACF-Proxy-to-SRES-BDS"
    notes        = "CHGEU0184375"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d173lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d173lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d173lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d173lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6766-SRES-to-LB-VIP"
    notes        = "SR50967845"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcetl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt5"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-dr176-LB-VIP1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-dr176-LB-VIP1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcetl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt5"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7256-SRES-to-LB-to-CPREM"
    notes        = "SR51013896 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-dr176-LB-VIP1",
      "57.56.58.153"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-dr176-LB-VIP1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7568-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50090779"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d177lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d177lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d177lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d177lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6678-AD/DNS/NTP"
    notes        = "CH50077721 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6679-AD/DNS/NTP"
    notes        = "CH50077721 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-Clients"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6680-SKLM"
    notes        = "CH50077721 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpstw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6681-SKLM-"
    notes        = "CH50077721 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpstw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6684-Ansible"
    notes        = "CH50077721 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6685-Ansible"
    notes        = "CH50077721 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas15",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas15",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6686-Ansible"
    notes        = "CH50077721 Will be updated with new WIN VM CH50088110"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179lparx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpfm",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179lpstl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179lpskl"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179lpskl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179lpstl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179lparx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpfm"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6687-SMB"
    notes        = "CH50077721 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-Clients"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMB"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6688-MS_RPC_TCP-Win-2008-RPC,DCOM"
    notes        = "CH50077721 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/MS_RPC_TCP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
      "/infra/domains/default/groups/TF-EU1-SG-DR179-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6691-Microstrategy"
    notes        = "CH50077721 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179lparx"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179lparx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6692-Microstrategy-"
    notes        = "CH50077721 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179lparx"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179lparx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7585-Ansible"
    notes        = "SR51216347"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpdc1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpdc2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5985"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpdc1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr179wpdc2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5380-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6785-AD/DNS/NTP"
    notes        = "CH50078990 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6786-AD/DNS/NTP"
    notes        = "CH50078990 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-Clients"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6787-DRES181"
    notes        = "CH50078990 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsstw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6788-DRES181-"
    notes        = "CH50078990 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsstw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6791-Ansible"
    notes        = "CH50078990 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsdc1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsdc2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5986",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsdc1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsdc2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6792-Ansible"
    notes        = "CH50078990 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lPefsskl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lPefsfm",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lPefsipq02",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lpefsarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lPefsstl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lPefsipq01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lPefsskl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lpefsarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lPefsfm",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lPefsipq02",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lPefsstl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lPefsipq01"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6793-Microstrategy"
    notes        = "CH50078990 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lpefsarx"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lpefsarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6795-Microstrategy-"
    notes        = "CH50078990 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lpefsarx"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181lpefsarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6798-SMB"
    notes        = "CH50078990 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-Clients"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMB"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6799-MS_RPC_TCP-Win-2008-RPC,DCOM"
    notes        = "CH50078990 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/MS_RPC_TCP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
      "/infra/domains/default/groups/TF-EU1-SG-DR181-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7586-Ansible-"
    notes        = "SR51216347"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsdc1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsdc2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5985"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsstw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsdc1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d181wPefsdc2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7621-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "SR51215132"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d185lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d185lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d185lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d185lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6873-CACF-Proxy-to-SRES-BDS-"
    notes        = "SR50979820"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d190lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d190lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8480-Obtain-certificates-from-certification-authority"
    notes        = "CHGEU0135456"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR195-STaaS-AD-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-135",
      "/infra/services/TCP-49152-65535"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR195-STaaS-AD-Clients",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8483-DNS,-DNS-UDP,-LDAP,-Kerberos,-LDAP-Global-Catalog,-NTP"
    notes        = "CHGEU0135456"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195wpSLstw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195wpSLstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8484-DNS,-DNS-UDP,-LDAP,-Kerberos,-LDAP-Global-Catalog,-NTP"
    notes        = "CHGEU0135456"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195wpSLstw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195wpSLstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8486-DRES->SRES-DC-Internal"
    notes        = "CHGEU0135456"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR195-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR195-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR195-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8487-SRES-->DRES-DC-Internal"
    notes        = "CHGEU0135456"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR195-STaaS-AD-Clients",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR195-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR195-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR195-STaaS-AD-Clients",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8489-Microstrategy-Desktop"
    notes        = "CHGEU0135456"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLarx"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLarx"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLarx"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8490-Microstrategy"
    notes        = "CHGEU0135456"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8713-SRES-to-DRES"
    notes        = "RITM0122619"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLskl"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLskl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8714-SRES-to-DRES"
    notes        = "RITM0122619"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLarx"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8715-DRES-to-SRES"
    notes        = "RITM0122619"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLarx"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr195lpSLarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5498-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR20-SSH-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR20-SSH-Proxy",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7179-CACF-Proxy-to-SRES-BDS"
    notes        = "CH50083657 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d200lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d200lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d200lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d200lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7419-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7297-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "SR51086881"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpcacprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7141-Dres-to-Sres-8080"
    notes        = "CH50084090"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DRES206-CACF_Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-SG-DRES206-CACF_Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7110-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d207lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d207lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d207lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d207lpcacprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7183-CACF-Proxy-to-SRES-BDS"
    notes        = "CH50083143 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d208lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d208lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7224-CACF-Proxy-to-SRES-BDS-"
    notes        = "CH50084007"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d210lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d210lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7896-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50097003"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7236-CACF-Proxy-to-SRES-BDS"
    notes        = "CH50084165"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d214lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d214lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d214lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d214lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7828-BDS-backend"
    notes        = "CH50096870"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d225lpisiams1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d225lpisiams1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7469-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50088475"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7521-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50089604"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d229lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d229lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d229lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d229lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7980-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50097667"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d235lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d235lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d235lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d235lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7763-BDS-flow"
    notes        = "CH50095414"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d240lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d240lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7873-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50096998"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d241lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d241lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d241lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d241lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7839-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50096698"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d245lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d245lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d245lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d245lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7881-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50096977"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d246lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d246lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d246lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d246lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7916-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50097363"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d248lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d248lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d248lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d248lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8011-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50098049"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d249lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d249lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d249lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d249lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8349-DRES-ESG-to-SRES-BDS"
    notes        = "SCTASK0012692"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR250-ESG-LB-Source"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-SG-DR250-ESG-LB-Source"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8136-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50100055"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d260lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d260lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d260lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d260lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8462-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CHGEU0135222"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d262lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d262lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d262lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d262lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8272-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50102503"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d263lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d263lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d263lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d263lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8399-DRES-to-SRES-BDS-Flow"
    notes        = "RITM0073748"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8319-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "SR51408332"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d266lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d266lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d266lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d266lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8309-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50102830"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d267lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d267lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8667-Client-DRES-CACF-Proxy"
    notes        = "CHGEU0175960"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d276lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d276lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d276lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d276lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8988-STaaS-AD-to-Reverse-Proxy"
    notes        = "RITM0140603"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d276lprevpxy"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d276lprevpxy",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8989-CLS-PAM-DDE-and-reverse-proxy-to-STaaS-AD"
    notes        = "RITM0140603"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d276lprevpxy",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d276wpDDE"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d276lprevpxy",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d276wpDDE"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-9012-DRES-ESG-to-SRES-STaaS-AD"
    notes        = "RITM0140825"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR276-ESG-LB-Source"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-123",
      "/infra/services/DNS-C7hECM7oS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR276-ESG-LB-Source"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-9013-SRES-STaaS-AD-to-NSX-LB-VIP"
    notes        = "RITM0140825"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP3",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP5",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP2",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP4"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-123",
      "/infra/services/DNS-C7hECM7oS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP4",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP5",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP2",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP3"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-9015-Microstrategy-to-NSX-LB-VIP"
    notes        = "RITM0140825"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP3",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP5",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP2",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP4"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP4",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP5",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP2",
      "/infra/domains/default/groups/TF-EU1-IPSET-DR276-LB-VIP3"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-9020-DRES-ESG-to-CACF-BDS"
    notes        = "RITM0140825"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR276-ESG-LB-Source"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-SG-DR276-ESG-LB-Source"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8736-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CHGEU0178119"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8801-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CHGEU0182446"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d287lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d287lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8813-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CHGEU0183426"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d289lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d289lpcacprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8896-CACF-Proxy-to-SRES-BDS"
    notes        = "RITM0127505"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d291lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d291lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-9074-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CHGEU0199310"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d296lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d296lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d296lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d296lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8934-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "RITM0134368"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d297lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d297lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d297lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d297lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-8950-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CHGEU0191751"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d301lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d301lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d301lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d301lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-9036-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "RITM0138773"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d305lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d305lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d305lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d305lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-9030-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CHGEU0197050"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d306lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d306lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d306lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d306lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7050-CACF-Proxy-to-SRES-BDS"
    notes        = "CH50079967 SR50976910 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5975-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "SR50857960"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d33lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d33lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d33lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d33lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7123-Websphere,-Rest,-Key-management"
    notes        = "CH50083565 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33wpaslstw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33wpaslstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7124-DNS,-DNS-UDP,-LDAP,-Kerberos,-LDAP-Global-Catalog,-NTP"
    notes        = "CH50083565 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33wpaslstw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33wpaslstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7125-DRES->SRES-DC-Internal"
    notes        = "CH50083565 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-Clients"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7126-SRES-->DRES-DC-Internal"
    notes        = "CH50083565 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-Clients"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7127-Ansible"
    notes        = "CH50083565 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33wpasldc2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33wpasldc1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33wpaslstw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-5985",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33wpasldc2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33wpasldc1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33wpaslstw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7128-Ansible"
    notes        = "CH50083565 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33lpaslarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33lpaslskl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33lpaslstl"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33lpaslarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33lpaslskl",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33lpaslstl"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7134-Microstrategy"
    notes        = "CH50083565 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33lpaslarx"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33lpaslarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7135-Microstrategy"
    notes        = "CH50083565 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33lpaslarx"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8443",
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr33lpaslarx",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5250-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d34lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d34lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d34lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d34lpcacprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-2056-Websphere,-Rest,-Key-management"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr35stw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr35stw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-2057-Websphere,-Rest,-Key-management"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr35stw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr35stw",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-2058-SRES-to-DR35"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-2059-DR35-AD-to-SRES-STaaS-AD"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-2060-SRES-STaaS-AD-to-DR35-AD"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3403-DR35-ARX-to-SRES-SRL"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3404-SRES-SRL-to-DR35-ARX"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4525-DR35-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6572-Ansible"
    notes        = "SR50958919 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d35lpocum"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d35lpocum",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3153-SRES->-DRES-DC-Internal"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3154-DRES->-SRES-DC-Internal"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3155-Websphere,-Rest,-Key-management"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stw",
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stw",
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3156-Stl-to-SRES-AD"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stl"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/DNS-UDP",
      "/infra/services/LDAP",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/DNS-C7hECM7oS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stl",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3159-Websphere,-Rest,-Key-management"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stw",
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stw",
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3405-DR48-STL-to-SRES-SRL"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stl"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stl",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3406-SRES-SRL-to-DR48-STL"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stl"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stl",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3925-DR48-ARX-to-SRES-SRL"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3926-SRES-SRL-to-DR48-ARX"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443",
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6581-Ansible"
    notes        = "SR50958919 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d48lpocum"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d48lpocum"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6751-CACF-Proxy-to-SRES-BDS"
    notes        = "CH50077591 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d51lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d51lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7325-BDS-Flow-DRES-to-SRES"
    notes        = "SR51104513"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-CACF-eu1d57lpjfecac1-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-CACF-eu1d57lpjfecac1-vip",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-7615-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "CH50090896"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4136-DRES-proxies->-SRES-Binary-repository-server"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR63-SSH-Proxy"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-EU-CACF-BDS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-DR63-SSH-Proxy",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-EU-CACF-BDS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3890-To-DRES64-DNS"
    notes        = "CH50101301"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-dr64-STaaS-AD-Clients",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-dr64-STaaS-AD-Clients",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3891-DRES64-to-SRES-DNS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64stl"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/DNS-UDP",
      "/infra/services/LDAP",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/DNS-C7hECM7oS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64stl"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3892-DRES64-AD/DNS-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-dr64-STaaS-AD-Clients",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-dr64-STaaS-AD-Clients",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3894-DRES64-Websphere-man"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64stw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64stw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3895-DRES64-Websphere-man-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64stw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64stw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4085-SRES-to-ARX"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-Clients",
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4086-ARX-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-Clients"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-Clients",
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4157-ARX-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4158-SRES-to-ARX"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6399-CACF-Proxy-to-SRES-BDS"
    notes        = "CH50076483"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-6832-Ansible"
    notes        = "SR50981438 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpocum"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpocum"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3910-DRES-STL-TO-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr66stl"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr66stl"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3913-SRES-to-DRES-STW"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3914-DRES-STW-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr66stw"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr66stw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3915-DRES66-AD-to-SRES"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-3916-SRES-to-DRES66-AD"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-AD-DNS"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
      "/infra/services/LDAP-over-SSL",
      "/infra/services/NBSS",
      "/infra/services/LDAP",
      "/infra/services/WINS",
      "/infra/services/KERBEROS-UDP",
      "/infra/services/MS_RPC_TCP",
      "/infra/services/SMTP",
      "/infra/services/LDAP-UDP",
      "/infra/services/NBDG-Broadcast",
      "/infra/services/NBNS-Unicast",
      "/infra/services/NBNS-Broadcast",
      "/infra/services/Windows-Global-Catalog",
      "/infra/services/NBDG-Unicast",
      "/infra/services/DHCP-Server",
      "/infra/services/SOAP",
      "/infra/services/KERBEROS",
      "/infra/services/Active_Directory_Server_UDP",
      "/infra/services/DNS-C7hECM7oS",
      "/infra/services/DNS-UDP",
      "/infra/services/MS-DS-UDP",
      "/infra/services/MS-DS-TCP",
      "/infra/services/WINS-UDP",
      "/infra/services/NTP_Time_Server",
      "/infra/services/Active_Directory_Server",
      "/infra/services/Windows-Global-Catalog-over-SSL"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
      "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-AD-DNS"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4949-Microstrategy"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-Arxview"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-Arxview"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/TCP-8443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
      "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-Arxview"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4950-Copy-of-SRES-to-DRES-STW-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr66stw"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-9083",
      "/infra/services/HTTPS",
      "/infra/services/TCP-5696"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1dr66stw"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5708-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4581-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d68lpwppssh2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d68lpwppssh1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d68lpwppssh2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d68lpwppssh1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4720-cacf-proxy-to-BDS-Master-Repo"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-CACF-eu1d69lpeawprx-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-CACF-eu1d69lpeawprx-vip",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4786-SRES-to-CACF-Proxy-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d73lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d73lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d73lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d73lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4860-CACF-Proxy-to-SRES-BDS-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d80lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d80lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d80lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d80lpcacprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4881-CACF-Proxy-to-SRES-BDS-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d81lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d81lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d81lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d81lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-4915-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = "SR50860068"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d82lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d82lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d82lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d82lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5029-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d83lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d83lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d83lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d83lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5041-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d84lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d84lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d84lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d84lpcacprx1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5067-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d85lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d85lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d85lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d85lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5095-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d86lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d86lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d86lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d86lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5179-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d87lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d87lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d87lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d87lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5185-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d88lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d88lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d88lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d88lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5190-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d89lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d89lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d89lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d89lpcacprx2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5207-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d90lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d90lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d90lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d90lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5212-CACF-Proxy-to-SRES-BDS-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d91lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d91lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d91lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d91lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5244-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d92lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d92lpcacprx1"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d92lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d92lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5546-CACF-Proxy-VIP-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d93lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d93lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d93lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d93lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
  rule {
    display_name = "TF-5601-CACF-Proxy-to-SRES-BDS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d94lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d94lpcacprx2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d94lpcacprx1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1d94lpcacprx2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-eu_sres_wave2-EU1"
    }
  }
}
