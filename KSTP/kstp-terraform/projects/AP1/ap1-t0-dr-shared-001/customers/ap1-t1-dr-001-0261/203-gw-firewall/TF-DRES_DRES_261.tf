data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}
resource "nsxt_policy_gateway_policy" "policies_TF-DRES_261-261" {
   display_name    = "TF-GW-DRES261"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES261"
   comments        = ""
   sequence_number = 0
     rule {
         display_name = "TF-BDS-Flow-CP-to-Proxy"
         notes        = "RITM0152875"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-Client-premise-DRES261-JH"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-Client-DRES261-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
                              "/infra/services/TCP-8081"
            ]
         scope = [
		 data.nsxt_policy_tier1_gateway.select.path                         
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_261-AP1"
            }
     }
	  
	     rule {
         display_name = "TF-Ansible-SSH-Flow"
         notes        = "RITM0152875"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-Client-premise-DRES261-JH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
            data.nsxt_policy_tier1_gateway.select.path
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_268-AP1"
            }
      }

     }