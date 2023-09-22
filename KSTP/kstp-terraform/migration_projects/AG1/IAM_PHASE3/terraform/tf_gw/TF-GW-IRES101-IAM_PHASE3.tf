resource "nsxt_policy_gateway_policy" "policies_TF-IRES-IAM_PHASE3" {
   display_name    = "TF-GW-IRES101-IAM_PHASE3"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-IRES101-IAM_PHASE3"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-2331-IAMaas--Thycotic-Pentest"
         notes        = "SR50955390"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-AG1"
            }
      }
}