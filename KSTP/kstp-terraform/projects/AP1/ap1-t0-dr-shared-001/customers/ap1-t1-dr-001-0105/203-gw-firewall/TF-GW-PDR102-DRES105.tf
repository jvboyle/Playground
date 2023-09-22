resource "nsxt_policy_gateway_policy" "policies_TF-PDR-DRES105" {
   display_name    = "TF-GW-PDR102-DRES105"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-PDR102-DRES105"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1315-SSHproxy&DRESproxy_to_SMTP_Relay"
         notes        = "SR1390555"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-HRES-TALOS-SSHProxy",
               "/infra/domains/default/groups/TF-AP1-SG-DRES-Proxy-Servers",
               "158.87.54.5"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-PDR-SMTP-Relay"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP_TLS",
               "/infra/services/SMTP"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-AP1"
            }
      }
}