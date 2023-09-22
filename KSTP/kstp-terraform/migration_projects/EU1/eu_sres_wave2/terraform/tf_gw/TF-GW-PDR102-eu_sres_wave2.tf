resource "nsxt_policy_gateway_policy" "policies_TF-PDR-eu_sres_wave2" {
   display_name    = "TF-GW-PDR102-eu_sres_wave2"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-PDR102-eu_sres_wave2"
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
         scope = [local.gw_scope]
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