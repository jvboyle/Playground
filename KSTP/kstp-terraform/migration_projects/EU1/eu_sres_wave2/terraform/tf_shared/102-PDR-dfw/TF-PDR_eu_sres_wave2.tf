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
}