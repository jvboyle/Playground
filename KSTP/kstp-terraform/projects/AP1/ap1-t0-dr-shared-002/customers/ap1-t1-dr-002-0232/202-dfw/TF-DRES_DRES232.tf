resource "nsxt_policy_security_policy" "policies_TF-DRES232-DRES232" {
   display_name    = "TF-DRES232"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES232"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1546-CPREM-to-PROXY-VIP"
         notes        = "SR1432515"
         source_groups = [
               "202.7.36.176/29"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d232lpwnzpr1-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d232lpwnzpr1-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES232-AP1"
            }
      }
   rule {
         display_name = "TF-1575-WNZ-Proxy-to-CPREM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-DR232-CPREM"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-DR232-CPREM"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES232-AP1"
            }
      }
   rule {
         display_name = "TF-1576-CPREM-to-WNZ-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-DR232-CPREM"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-DR232-CPREM"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES232-AP1"
            }
      }
   rule {
         display_name = "TF-1585-OCP-4-to-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1",
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/AP1-SG-AVI-SEs"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES232-AP1"
            }
      }
         rule {
         display_name = "TF-1585-OCP-to-Proxy"
         notes        = ""
         source_groups = [
		        "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1"
                          ]
         destination_groups = [
		  "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"	                
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1",
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES232-AP1"
            }
      }
}