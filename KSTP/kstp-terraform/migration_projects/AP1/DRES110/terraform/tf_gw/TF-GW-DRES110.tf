resource "nsxt_policy_gateway_policy" "policies_TF-DRES110-DRES110" {
   display_name    = "TF-GW-DRES110"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES110"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1173-CPREM-to-CACF-Proxy-VIP"
         notes        = ""
         source_groups = [
               "172.20.0.32",
               "172.20.0.31"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr2"
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
               tag = "TF-DRES110-AP1"
            }
      }
   rule {
         display_name = "TF-1174-CACF-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr2"
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
               tag = "TF-DRES110-AP1"
            }
      }
   rule {
         display_name = "TF-1175-CACF-Proxy-to-CPREM-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr2"
            ]
         destination_groups = [
               "172.20.0.32",
               "172.20.0.31"
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
               tag = "TF-DRES110-AP1"
            }
      }
   rule {
         display_name = "TF-1176-CACF-Proxy-to-OCP-Cluster1-VIP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-SRES1-LB-OCP-Cluster1-VIP"
            ]
         action = "ALLOW"
         services = [
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
               tag = "TF-DRES110-AP1"
            }
      }
   rule {
         display_name = "TF-1177-CPREM-to-CACF-Proxy"
         notes        = ""
         source_groups = [
               "172.20.0.101",
               "172.20.0.102"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d110lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES110-AP1"
            }
      }
   rule {
         display_name = "TF-1178-CACF-Proxy-to-CPREM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr2"
            ]
         destination_groups = [
               "172.20.0.101",
               "172.20.0.102"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16443-u2UXhjXLg"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES110-AP1"
            }
      }
   rule {
         display_name = "TF-1179-OCP-Cluster01-to-CACF-Proxy-VIP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d110lpcacpr-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16443-u2UXhjXLg",
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
               tag = "TF-DRES110-AP1"
            }
      }
   rule {
         display_name = "TF-1267-BDS_CPREM_to_DRES110"
         notes        = ""
         source_groups = [
               "172.20.0.112",
               "172.20.0.111"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d110lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
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
               tag = "TF-DRES110-AP1"
            }
      }
   rule {
         display_name = "TF-1487-BPI-VRA-to-DRES"
         notes        = ""
         source_groups = [
               "172.20.0.111"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d110lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-SG-DRES110-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES110-AP1"
            }
      }
   rule {
         display_name = "TF-1812-CPREM-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-CPREM-DR110"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr2"
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
               tag = "TF-DRES110-AP1"
            }
      }
}