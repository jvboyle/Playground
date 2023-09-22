resource "nsxt_policy_gateway_policy" "policies_TF-DRES107-DRES107" {
   display_name    = "TF-GW-DRES107"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES107"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1202-OCP-Cluster01-to-CACF-Proxy-VIP-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d107lpcacpr-vip"
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
               tag = "TF-DRES107-AP1"
            }
      }
   rule {
         display_name = "TF-1204-CACF-Proxy1-to-CPREM-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr1"
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
               tag = "TF-DRES107-AP1"
            }
      }
   rule {
         display_name = "TF-1205--CACF-Proxy1-to-BDS-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr1"
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
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES107-AP1"
            }
      }
   rule {
         display_name = "TF-1206-CPREM-to-CACF-Proxy-VIP-"
         notes        = ""
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d107lpcacpr-vip"
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
               tag = "TF-DRES107-AP1"
            }
      }
   rule {
         display_name = "TF-1207-CACF-Proxy-Communication-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr2"
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
               tag = "TF-DRES107-AP1"
            }
      }
   rule {
         display_name = "TF-1208-SRES-Jumpservers-to-CACF-Proxy-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AP1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d107lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
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
               tag = "TF-DRES107-AP1"
            }
      }
}