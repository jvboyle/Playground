resource "nsxt_policy_security_policy" "policies_TF-DRES103-DRES103" {
   display_name    = "TF-DRES103"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES103"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1143-CPREM-to-DRES"
         notes        = ""
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d103lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d103lpcacprx1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d103lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES103-AP1"
            }
      }
   rule {
         display_name = "TF-1144-CACF-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d103lpcacprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d103lpcacprx1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES103-AP1"
            }
      }
   rule {
         display_name = "TF-1145-DRES-to-CPREM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d103lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d103lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES103-AP1"
            }
      }
   rule {
         display_name = "TF-1146-OCP-Cluster1-to-CACF-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d103lpcacprx1-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d103lpcacprx1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d103lpcacprx1-vip"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES103-AP1"
            }
      }
   rule {
         display_name = "TF-1716-Collecters-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc01-secondary-IP",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc02-secondary-IP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d103lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc01-secondary-IP",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc02-secondary-IP",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d103lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES103-AP1"
            }
      }
}