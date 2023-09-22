resource "nsxt_policy_security_policy" "policies_TF-DRES105-DRES105" {
   display_name    = "TF-DRES105"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES105"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1148-CACF-Proxy-Communication"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES105-AP1"
            }
      }
   rule {
         display_name = "TF-1149-CPREM-to-CACF-Proxy-VIP"
         notes        = ""
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d105lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d105lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES105-AP1"
            }
      }
   rule {
         display_name = "TF-1150-CACF-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES105-AP1"
            }
      }
   rule {
         display_name = "TF-1151-CACF-Proxy-to-CPREM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES105-AP1"
            }
      }
   rule {
         display_name = "TF-1152-OCP-Cluster01-to-CACF-Proxy-VIP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d105lpcacpr-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d105lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES105-AP1"
            }
      }
}