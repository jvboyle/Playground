resource "nsxt_policy_gateway_policy" "policies_TF-DRES130-DRES130" {
   display_name    = "TF-GW-DRES130"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES130"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1268-CPREM-to-CACF-Proxy-VIP"
         notes        = ""
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d130lpcacpr-vip"
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
               tag = "TF-DRES130-AP1"
            }
      }
   rule {
         display_name = "TF-1269-CACF-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d130lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
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
               tag = "TF-DRES130-AP1"
            }
      }
   rule {
         display_name = "TF-1270-CACF-Proxy-to-CPREM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d130lpcacpr1"
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
               tag = "TF-DRES130-AP1"
            }
      }
   rule {
         display_name = "TF-1271-OCP-Cluster01-to-CACF-Proxy-VIP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d130lpcacpr-vip"
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
               tag = "TF-DRES130-AP1"
            }
      }
   rule {
         display_name = "TF-1612-JH-to-Proxy-Servers"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AP1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d258lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d130lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-DRES258-Proxy-VIP",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d258lpcacpr1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES130-AP1"
            }
      }
}