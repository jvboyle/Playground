data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}
resource "nsxt_policy_gateway_policy" "policies_TF-DRES254-DRES254" {
   display_name    = "TF-GW-DRES254"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES254"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1601-To-esldc"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d254lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d254lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc01",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc02"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [data.nsxt_policy_tier1_gateway.select.path]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-GW-DRES254-AP1"
            }
      }
}