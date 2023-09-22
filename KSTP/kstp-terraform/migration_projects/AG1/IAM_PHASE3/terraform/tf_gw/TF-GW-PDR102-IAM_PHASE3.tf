resource "nsxt_policy_gateway_policy" "policies_TF-PDR-IAM_PHASE3" {
   display_name    = "TF-GW-PDR102-IAM_PHASE3"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-PDR102-IAM_PHASE3"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1192-ICP-clusters-to-SMTP-relay"
         notes        = ""
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP",
               "/infra/services/SMTP_TLS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-AG1"
            }
      }
}