resource "nsxt_policy_gateway_policy" "policies_TF-HRES-eu_sres_wave2" {
   display_name    = "TF-GW-HRES104-eu_sres_wave2"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-HRES104-eu_sres_wave2"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-4537-HA-Proxy-to-Master-BDS-Repo"
         notes        = "RITM0139187"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-IN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-HRES-HOST-eu1hr1lpcacfbds",
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
               tag = "TF-HRES-EU1"
            }
      }
}