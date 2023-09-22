resource "nsxt_policy_gateway_policy" "policies_TF-IAM_PHASE7-IAM_PHASE7" {
   display_name    = "TF-GW-IAM_PHASE7"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-IAM_PHASE7"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-3370-SRES-EntAuto-VMs-to-DRES-LB-VIP"
         notes        = "SR51391146 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-EntAuto-VMs-POK"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR227-LB-VIP1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1027",
               "/infra/services/TCP-1024",
               "/infra/services/TCP-1026",
               "/infra/services/TCP-1025"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE7-AG1"
            }
      }
}