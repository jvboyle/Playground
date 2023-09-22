resource "nsxt_policy_gateway_policy" "policies_TF-DRES114-DRES114" {
   display_name    = "TF-GW-DRES114"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES114"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1255-BDS_CPREM_to_DRES114"
         notes        = ""
         source_groups = [
               "10.47.122.198",
               "10.47.122.200",
               "10.47.156.139",
               "10.47.156.138"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d114lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES114-AP1"
            }
      }
}