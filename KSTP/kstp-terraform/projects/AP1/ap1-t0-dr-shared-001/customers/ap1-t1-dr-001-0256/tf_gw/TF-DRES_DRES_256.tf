data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}
resource "nsxt_policy_gateway_policy" "policies_TF-GW-DRES_256-DRES_256" {
   display_name    = "TF-GW-DRES"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1600-To-esldc"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d256lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc02",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-8081"
            ]
         scope = [data.nsxt_policy_tier1_gateway.select.path]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_256-AP1"
            }
      }
   rule {
         display_name = "TF-1606-Jump-to-Dres-Proxy"
         notes        = "SR1436550"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AP1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-DRES256-Proxy-VIP",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d256lpcacpr1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/TCP-8081"
            ]
         scope = [data.nsxt_policy_tier1_gateway.select.path]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_256-AP1"
            }
      }
   rule {
         display_name = "TF-1607-CPREM-to-Proxy-VIP"
         notes        = "SR1436550"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-MCS-CPREM-Jump"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-DRES256-Proxy-VIP",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [data.nsxt_policy_tier1_gateway.select.path]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_256-AP1"
            }
      }
   rule {
         display_name = "TF-1608-Proxy-to-CPREM"
         notes        = "SR1436550"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d256lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-MCS-CPREM-Jump"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-8081"
            ]
         scope = [data.nsxt_policy_tier1_gateway.select.path]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_256-AP1"
            }
      }
   rule {
         display_name = "TF-1610-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d256lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [data.nsxt_policy_tier1_gateway.select.path]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_256-AP1"
            }
      }
   rule {
         display_name = "TF-1632-OCP-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d256lpcacpr1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-8081"
            ]
         scope = [data.nsxt_policy_tier1_gateway.select.path]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_256-AP1"
            }
      }
   rule {
         display_name = "TF-1666-CPREM-to-Proxy"
         notes        = "SR1436550"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-MCS-CPREM-Jump"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-DRES256-Proxy-VIP",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d256lpcacpr1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-8081"
            ]
         scope = [data.nsxt_policy_tier1_gateway.select.path]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_256-AP1"
            }
      }
}