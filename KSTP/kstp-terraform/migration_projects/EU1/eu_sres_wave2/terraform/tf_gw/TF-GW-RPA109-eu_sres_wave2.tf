resource "nsxt_policy_gateway_policy" "policies_TF-SRES-RPA-eu_sres_wave2" {
   display_name    = "TF-GW-RPA109-eu_sres_wave2"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-RPA109-eu_sres_wave2"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-7505-RPA-Madrid-to-SRES-RPA"
         notes        = "SR51127608"
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-RPA-EU1"
            }
      }
}