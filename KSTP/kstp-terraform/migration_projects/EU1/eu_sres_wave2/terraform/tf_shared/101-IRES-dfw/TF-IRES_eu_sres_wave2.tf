resource "nsxt_policy_security_policy" "policies_TF-IRES-eu_sres_wave2" {
   display_name    = "TF-IRES"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-IRES"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-5752-Connectivity-between-SL-and-domain-controllers"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-IRES-SL1-Collectors"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SolarWinds-DC"
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
               "/infra/domains/default/groups/TF-EU1-SG-IRES-SL1-Collectors",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SolarWinds-DC"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
   rule {
         display_name = "TF-7600-JDBC-Integration-for-STaaS-Dashboard"
         notes        = "SR51201165"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-nlascno000iswrm",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspno000iswrm"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPtmmch",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPdshbrd"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3306"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-nlascno000iswrm",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspno000iswrm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPtmmch",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPdshbrd"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
}