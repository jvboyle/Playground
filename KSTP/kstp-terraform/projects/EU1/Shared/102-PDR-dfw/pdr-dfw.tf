resource "nsxt_policy_security_policy" "policies_TF-PDR-eu_sres_wave2" {
   display_name    = "TF-PDR"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-PDR"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-5063-INTERNET-IN-to-BDS-master"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-pdr-esg01-inside"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/BDS-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-pdr-esg01-inside",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-EU1"
            }
      }
      ######################################################
# migration: eu_sres_wave3
######################################################
   rule {
         display_name = "TF-8859-NewRelic-Pre-Prod-"
         notes        = "SR50855491 RITM0129564"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-pdr-esg01-inside"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS_9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms",
               "/infra/domains/default/groups/TF-EU1-IPSET-pdr-esg01-inside"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-EU1"
            }
      }
   rule {
         display_name = "TF-8925-M-EaaS-Frontier-LogicMonitor"
         notes        = "RITM0137141"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-pdr-esg01-inside"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-IPSET-pdr-esg01-inside"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-EU1"
            }
      }
######################################################
# migration: eu_sres_wave5
######################################################
   rule {
         display_name = "TF-9179-ASA-GW-to-Linux-JH"
         notes        = "RITM0150241"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-OKTA-ASA-GW"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4421",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-PDR-OKTA-ASA-GW"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-EU1"
            }
      }
######################################################
# migration: eu_sres_wave6
######################################################
   rule {
         display_name = "TF-9180-ASA-GW-to-Windows-JH"
         notes        = "RITM0150241 RITM0157024"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-OKTA-ASA-GW"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-Win-Jump-Servers-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1wpiamprra",
               "/infra/domains/default/groups/TF-EU1-IPSET-sres-esg1-rpards-lb-vip-2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-Win-Jump-Servers-VIP",
               "/infra/domains/default/groups/TF-EU1-SG-PDR-OKTA-ASA-GW",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1wpiamprra",
               "/infra/domains/default/groups/TF-EU1-IPSET-sres-esg1-rpards-lb-vip-2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-EU1"
            }
      }
}