resource "nsxt_policy_gateway_policy" "policies_TF-DRES_337-DRES_337" {
   display_name    = "TF-GW-DRES_337"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES_337"
   comments        = ""
   sequence_number = 0
     rule {
         display_name = "TF-BDS-Flow-CP-to-Proxy"
         notes        = "CHGEU0207737"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-Client-premise-DRES337-JH"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d337lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d337lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-Client-DRES337-CACF-Proxy-VIP",
               "/infra/domains/default/groups/EU1-NET-CPREM-GSNI-NAT-Range"
            ]
         action = "ALLOW"
         services = [
                              "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_337-EU1"
            }
     }
   rule {
         display_name = "TF-Ansible-SSH-to-CACF-proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/SG-SRES-OCP7-Cluster-EU2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-Client-DRES337-CACF-Proxy-VIP"
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
               tag = "TF-DRES_337-EU1"
            }
      }
	  
	     rule {
         display_name = "TF-Ansible-SSH-Flow"
         notes        = "CHGEU0207737"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d337lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d337lpcacprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-Client-premise-DRES337-JH"
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
               tag = "TF-DRES_337-EU1"
            }
      }
   rule {
         display_name = "TF-BDS-Flow-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d337lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d337lpcacprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_337-EU1"
            }
      }
   rule {
         display_name = "TF-Backend-Flow-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES337-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES337-CACF-Proxy"
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
               tag = "TF-DRES_337-EU1"
            }
      }
}