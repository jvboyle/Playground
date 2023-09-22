resource "nsxt_policy_gateway_policy" "policies_TF-DRES336-DRES336" {
   display_name    = "TF-DRES336"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES336"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-SRES-OCP6-EU1-to-CACF-Proxy-SSH"
         notes        = "RITM0150665"
         source_groups = [
               "/infra/domains/default/groups/EU1-SG-SRES-OCP9-Cluster-EU3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d336lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES336-EU3"
            }
      }
   rule {
         display_name = "TF-CACF-Proxy-to-CPREM"
         notes        = "RITM0150665"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d336lpcacprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES336-CPREM-JH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES336-EU1"
            }
      }
   rule {
         display_name = "TF-CACF-Proxy-to-BDS"
         notes        = "RITM0152458"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d336lpcacprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpcacfbds1"
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
               tag = "TF-DRES336-EU1"
            }
      }
   rule {
         display_name = "TF-CPREM-to-CACF-Proxy"
         notes        = "RITM0150665"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES336-CPREM-JH"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d336lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-CPREM-GSNI-NAT-Range"
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
               tag = "TF-DRES336-EU1"
            }
      }
   }