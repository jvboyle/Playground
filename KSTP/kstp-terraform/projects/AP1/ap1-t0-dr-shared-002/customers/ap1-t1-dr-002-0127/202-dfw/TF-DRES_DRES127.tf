resource "nsxt_policy_security_policy" "policies_TF-DRES127-DRES127" {
   display_name    = "TF-DRES127"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES127"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1227-OCP-Cluster01-to-CACF-Proxy-VIP-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d127lpcacpr-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16443-u2UXhjXLg",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d127lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES127-AP1"
            }
      }
   rule {
         display_name = "TF-1228-CACF-Proxy1-to-CPREM-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16443-u2UXhjXLg"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES127-AP1"
            }
      }
   rule {
         display_name = "TF-1229-CPREM-to-CACF-PROXY-VIP"
         notes        = ""
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d127lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d127lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES127-AP1"
            }
      }
   rule {
         display_name = "TF-1230-CACF-proxy-to-SRES-cluster-vip"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-SRES1-LB-OCP-Cluster1-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-SRES1-LB-OCP-Cluster1-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES127-AP1"
            }
      }
   rule {
         display_name = "TF-1231-CPREM-to-Ansible_CPREM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES127-AP1"
            }
      }
   rule {
         display_name = "TF-1232-CACF-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES127-AP1"
            }
      }
   rule {
         display_name = "TF-1233-BDS_JH-to-CACF-proxyvip"
         notes        = ""
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d127lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d127lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES127-AP1"
            }
      }
   rule {
         display_name = "TF-1234-SRES-Jumpservers-to-cacf-proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AP1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d127lpcacpr-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d127lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES127-AP1"
            }
      }
}