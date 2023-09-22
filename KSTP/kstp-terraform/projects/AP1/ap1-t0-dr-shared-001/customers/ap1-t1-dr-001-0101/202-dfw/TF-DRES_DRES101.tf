resource "nsxt_policy_security_policy" "policies_TF-DRES101-DRES101" {
   display_name    = "TF-DRES101"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES101"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1137-CPREM-to-DRES"
         notes        = ""
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d101lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d101lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES101-AP1"
            }
      }
   rule {
         display_name = "TF-1138-CACF-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES101-AP1"
            }
      }
   rule {
         display_name = "TF-1139-DRES-to-CPREM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES101-AP1"
            }
      }
   rule {
         display_name = "TF-1140-OCP-Cluster1-to-CACF-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1",
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES101-AP1"
            }
      }
   rule {
         display_name = "TF-1257-DRES101-to-NewCPREM-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES101-AP1"
            }
      }
   rule {
         display_name = "TF-1258-New-CPREM-to-DRES-101"
         notes        = ""
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d101lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d101lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES101-AP1"
            }
      }
   rule {
         display_name = "TF-1259--SRES-Jumpservers-to-CACF-Proxy-DRES101-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AP1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d101lpcacprx1-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AP1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d101lpcacprx1-vip"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES101-AP1"
            }
      }
   rule {
         display_name = "TF-1715-Collecters-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc01-secondary-IP",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc02-secondary-IP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc01-secondary-IP",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc02-secondary-IP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES101-AP1"
            }
      }
   rule {
         display_name = "TF-1429-test"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-IRES-QRADAR-NAT-IP",
               "10.63.9.81"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Syslog_(TCP)",
               "/infra/services/Syslog_(UDP)"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1",
               "/infra/domains/default/groups/TF-AP1-IPSET-IRES-QRADAR-NAT-IP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES101-AP1"
            }
      }
}