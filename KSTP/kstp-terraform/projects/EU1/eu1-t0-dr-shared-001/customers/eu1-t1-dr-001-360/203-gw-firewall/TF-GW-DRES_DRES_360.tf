resource "nsxt_policy_gateway_policy" "policies_TF-DRES_360-DRES_360" {
   display_name    = "TF-GW-DRES_360"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES_360"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-Ansible-SSH-to-CACF-proxy"
         notes        = "RITM0152809"
         source_groups = [
               "/infra/domains/default/groups/EU1-SG-SRES-OCP9-Cluster-EU3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-Client-DRES360-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_360-EU1"
            }
      }
	  
	     rule {
         display_name = "TF-Ansible-SSH-Flow"
         notes        = "RITM0152809"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d360lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d360lpcacprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-Client-premise-DRES360-JH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_360-EU1"
            }
      }
   rule {
         display_name = "TF-Backend-Flow-Proxy"
         notes        = "RITM0152809"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES360-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES360-CACF-Proxy"
            ]
         action = "ALLOW"
         services = [
               
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_360-EU1"
            }
      }
}