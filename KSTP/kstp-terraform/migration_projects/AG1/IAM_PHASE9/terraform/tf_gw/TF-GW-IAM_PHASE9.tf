resource "nsxt_policy_gateway_policy" "policies_TF-IAM_PHASE9-IAM_PHASE9" {
   display_name    = "TF-GW-IAM_PHASE9"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-IAM_PHASE9"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1761-SRES-STaaS-to-ARX"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR100-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR100-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1762-SRES-MTR-ARX"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR100-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR100-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1770-SRES-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1772-DRES-to-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR100-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1773-SRES-to-DRES-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR100-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3578-ag1dr100lpskl-to-LDAP"
         notes        = "RITM0121957"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr100lpskl"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1547-Staas-to-DRES11"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-SG-DR11-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR11-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1552-DRES11-to-Staas"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR11-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1783-MicroStrategy-DRES11-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR11-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1784-MicroStrategy-DRES11"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR11-STaaS-Arxview"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3575-ag1dr11lpskl-to-LDAP"
         notes        = "RITM0121957"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11lpskl"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1863-DRES-to-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR112-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1864-SRES-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR112-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1866-SRES-STaaS-ARX-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR112-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR112-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1867-SRES-MTR-ARX"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR112-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR112-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1875-SRES-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2599-SRES-to-DRES"
         notes        = "SR50984355"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d112fm"
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3579-ag1dr112lpskl-to-LDAP"
         notes        = "RITM0121957"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr112lpskl"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1143-Wbshepree-Rest-Key-management"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1144-Arxview"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR12-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3729",
               "/infra/services/TCP-2233",
               "/infra/services/TCP-27000-27009",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1145-SRES-DRES-STaaS-AD-DNS-NTP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-SG-DR12-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-SG-DR12-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1302-StaaS-General-Services-and-Access-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR12-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR12-STaaS-Arxview",
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1619-Microstrategy-Desktop"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR12-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR12-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2037-SRES-to-DRES"
         notes        = "SR50825052 CH50068965 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2038-DRES-to-SRES"
         notes        = "SR50825052 CH50068965 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2039-SRES-to-DRES"
         notes        = "SR50825052 CH50068965 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR144-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-SG-DR144-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2040-DRES-to-SRES"
         notes        = "SR50825052 CH50068965 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR144-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2043-DRES-to-SRES"
         notes        = "SR50825052 CH50068965 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR144-STaaS-Arxview"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2044-SRES-to-DRES"
         notes        = "SR50825052 CH50068965 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR144-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2053-SRES-to-DRES"
         notes        = "SR50834555 CH50069747 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2054-DRES-to-SRES"
         notes        = "SR50834555 CH50069747 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2055-DRES-to-SRES"
         notes        = "SR50834555 CH50069747 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR147-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR147-STaaS-AD-DNS",
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2056-SRES-to-DRES"
         notes        = "SR50834555 CH50069747 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR147-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2058-SRES-to-DRES"
         notes        = "SR50834555 CH50069747 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2064-SRES-to-DRES"
         notes        = "SR50834555 CH50069747 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lparx"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2107-DRES-to-SRES"
         notes        = "SR50828453 CH50070937 SR50943448 - ag1dr151lpstl"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2108-DRES-to-SRES"
         notes        = "SR50828453 CH50070937"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR151-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2109-SRES-to-DRES"
         notes        = "SR50828453 CH50070937 SR50945469"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-SG-DR151-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR151-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2114-DRES-to-SRES"
         notes        = "SR50828453 CH50070937"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lparx"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2115-SRES-to-DRES"
         notes        = "SR50828453 CH50070937"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2121-SRES-to-DRES"
         notes        = "SR50828453 CH50070937 SR50943448 - ag1dr151lpstl"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2400-SRES_TO_DRES151"
         notes        = "SR50971337 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpskl"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2147-SRES-to-DRES"
         notes        = "SR50859636 CH50072219"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2148-DRES-to-SRES"
         notes        = "SR50859636 CH50072219"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2149-DRES-to-SRES"
         notes        = "SR50859636 CH50072219"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR156-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-SG-DR156-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2150-SRES-to-DRES"
         notes        = "SR50859636 CH50072219"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR156-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2153-DRES-to-SRES"
         notes        = "SR50859636 CH50072219"
         source_groups = [

            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2154-SRES-to-DRES"
         notes        = "SR50859636 CH50072219"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2156-SRES-to-DRES"
         notes        = "SR50859636 CH50072219"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lpskl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lpfm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2273-SRES-to-DRES"
         notes        = "SR50912638 CH50074648"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR162-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2276-SRES-to-DRES"
         notes        = "SR50912638 CH50074648"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2277-DRES-to-SRES"
         notes        = "SR50912638 CH50074648"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2278-DRES-to-SRES"
         notes        = "SR50912638 CH50074648"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR162-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-SG-DR162-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2282-SRES-to-DRES"
         notes        = "SR50912638 CH50074648"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2285-DRES-to-SRES"
         notes        = "SR50912638 CH50074648"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lparx"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3877-DRES-to-sr1staas"
         notes        = "RITM0150465"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpfm"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-139",
               "/infra/services/TCP-3268",
               "/infra/services/TCP-445",
               "/infra/services/UDP-445",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/LDAP",
               "/infra/services/TCP-88",
               "/infra/services/TCP-636",
               "/infra/services/TCP-3269",
               "/infra/services/TCP-464"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1179-DR19-AD-STaaS-SRES-AD-STaaS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR19-STaaS-AD"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1182-Wbshepree-Rest-Key-management"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1183-Arxview"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR19-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3729",
               "/infra/services/TCP-2233",
               "/infra/services/TCP-27000-27009",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1188-SRES-AD-STaaS-DR19-AD-STaaS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR19-STaaS-AD"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1222-STaaS-SRES-AD-to-DR19-AD"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR19-STaaS-AD"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1301-StaaS-General-Services-and-Access-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR19-STaaS-Arxview"
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1620-Microstrategy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR19-STaaS-Arxview"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1621-Microstrategy-Desktop"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR19-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR19-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3577-ag1dr19lpskl-to-LDAP"
         notes        = "RITM0121957"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19lpskl"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2639-SKLM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9083",
               "/infra/services/TCP-443",
               "/infra/services/TCP-5696"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2640-SRES-AD-DNS-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR197-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2643-MicroStrategy-Desktop"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2644-MicroStrategy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2651-DRES-to-SRES-AD-DNS-"
         notes        = "SR51023175"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197stw",
               "/infra/domains/default/groups/TF-AG1-SG-DR197-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = true
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2677-DNS-to-CPREM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR197-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-STaaS-DR197-Storage-All"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-53",
               "/infra/services/UDP-123",
               "/infra/services/TCP-53",
               "/infra/services/TCP-123"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2688-CPREM-o-DNS"
         notes        = "SR51026013"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-STaaS-DR197-Storage-All"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR197-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-CPREM-GSNI-NAT-Range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-53",
               "/infra/services/UDP-123",
               "/infra/services/TCP-53",
               "/infra/services/TCP-123"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2700-DRES-AD-DNS-to-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR197-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2701-SKLM-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9083",
               "/infra/services/TCP-443",
               "/infra/services/TCP-5696"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2702-MicroStrategy-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lparx"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2794-Ansible"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lpskl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lparx",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lpocum",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lpstl"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-22",
               "/infra/services/TCP-5985"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2663-Tools-to-STaas"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9083",
               "/infra/services/TCP-443",
               "/infra/services/TCP-5696"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2664-STaas-DNS-to-dres198"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR198-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2668-MicroStrategy-Desktop"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2669-MicroStrategy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2673-DomainJoin_toSRES"
         notes        = "SR51029211"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR198-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-2893-SRES-to-DR198_AD"
         notes        = "SR51133943"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR198-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-SG-DR198-STaaS-AD-Clients"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/SSH"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3007-SRES-to-DR234-AD-DNS"
         notes        = "CH50090927"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR234-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NTP",
               "/infra/services/DNS-UDP",
               "/infra/services/Active_Directory_Server"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3008-DR234-to-SRES-AD-DNS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR234-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NTP",
               "/infra/services/DNS-UDP",
               "/infra/services/Active_Directory_Server"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3009-DR234-STW-to-SRES-SKLM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3013-HOST-ag1sr1lpansb-to-STW"
         notes        = "CH50090927"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3014-HOST-ag1sr1lpansb-to-DR234-server"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lparx",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lpfm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lpskl"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3016-HOST-ag1srlpdefmstr-to-DR234-ARX"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3017-DR234ARX-to-HOST-ag1sr1staas4"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lparx"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3018-HOST-ag1sr1staas4-to-DR234ARX"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3019-DR234-ARX-to-HOST-ag1srlpdefmstr"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lparx"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3022-Staas-Domain"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR234-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-139",
               "/infra/services/TCP-445",
               "/infra/services/TCP-135",
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/TCP-389",
               "/infra/services/TCP-53",
               "/infra/services/TCP-88",
               "/infra/services/UDP-53",
               "/infra/services/UDP-389"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3818-DRES-SRES"
         notes        = "RITM0142309"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lparx"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3819-SRES-DRES"
         notes        = "RITM0142309"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lparx"
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3030-DR237-to-Staas-Domain-"
         notes        = "SR51233464"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR237-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237stw"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3031-STaaS-DNS-to-DR237-DNS"
         notes        = "CH50091320"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR237-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3032-Websphere-Rest-Key-management"
         notes        = "CH50091320"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3033-Websphere-Rest-Key-management"
         notes        = "CH50091320"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3038-Ansible"
         notes        = "CH50091320"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237lpstl",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237lparx",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237lpfm",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3042-MicroStrategy"
         notes        = "CH50091320"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237lparx"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3043-MicroStrategy"
         notes        = "CH50091320"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237lparx"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1418-Key-Replication-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR53-PSIS-SKLM"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080",
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1419-Key-Replication"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR53-PSIS-SKLM"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080",
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1424-SKLM-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGASTW1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1425-SKLM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGASTW1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1426-Arxview-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGATPC1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1427-Arxview"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR53-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1428-AD-DNS-NTP-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR53-PSIS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1429-AD-DNS-NTP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR53-PSIS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1530-SRES-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR53-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1531-DRES-to-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR53-STaaS-Arxview"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1390-SRES-to-DR59-ARX"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR59-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080",
               "/infra/services/HTTP",
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1396-Websphere-Rest-Key-management"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1397-Websphere-Rest-Key-management"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1400-AD-DNS-NTP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR59-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1401-AD-DNS-NTP-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR59-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1623-Microstrategy-Desktop"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR59-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1624-Microstrategy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR59-STaaS-Arxview"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1471-SRES-to-DR65-DNS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR65-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1472-DR65-to-SRES-DNS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR65-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1474-Local-SSH_HTTPS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR65-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1475-DRES65-Local"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1477-DRES65-Local-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1625-Microstrategy-Desktop"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-SG-DR65-STaaS-Arxview"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-SG-DR65-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1626-Microstrategy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR65-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR65-STaaS-Arxview",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1715-HTTPS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR65-STaaS-Arxview"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1716-SSH"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR65-STaaS-Arxview"
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
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3576-ag1dr65lpskl2-to-LDAP"
         notes        = "RITM0121957"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65lpskl2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1590-SRES-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR77-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1601-DRES-to-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR77-STaaS-AD-DNS"
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1608-DRES-to-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stw"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1609-DRES-to-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5696",
               "/infra/services/TCP-9083",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1610-SRES-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR77-STaaS-Arxview"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-1611-SRES-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR77-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
   rule {
         display_name = "TF-3580-ag1dr77lpskl-to-LDAP"
         notes        = "RITM0121957"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77lpskl"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
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
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE9-AG1"
            }
      }
}