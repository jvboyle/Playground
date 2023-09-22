resource "nsxt_policy_gateway_policy" "policies_TF-NSX-V2T-IAM_PHASE3" {
   display_name    = "TF-GW-NSX-V2T106-IAM_PHASE3"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-NSX-V2T106-IAM_PHASE3"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-3832-CISO-AWS-to-KSTP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CISO-TOOLS-AWS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-RMQ-PROD-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpiamciprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-5671"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
}