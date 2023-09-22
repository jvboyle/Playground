resource "nsxt_policy_security_policy" "policies_TF-DRES108-DRES108" {
   display_name    = "TF-DRES108"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES108"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1155-CPREM-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-MHjumphost",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1",
               "10.178.194.140"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d108lpcacpr-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/ICMP_Echo",
               "/infra/services/TCP-8081",
               "/infra/services/ICMP_Echo_Reply"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-MHjumphost",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d108lpcacpr-vip",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES108-AP1"
            }
      }
   rule {
         display_name = "TF-1156-CACF-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1"
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
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES108-AP1"
            }
      }
   rule {
         display_name = "TF-1157-DRES-to-CPREM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d108lpcacpr-vip"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-MHjumphost",
               "10.178.194.140"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-IPSET-MHjumphost",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d108lpcacpr-vip"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES108-AP1"
            }
      }
   rule {
         display_name = "TF-1158-OCP-Cluster1-to-CACF-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-MHjumphost",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d108lpcacpr-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AP1-IPSET-MHjumphost",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d108lpcacpr-vip"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES108-AP1"
            }
      }
   rule {
         display_name = "TF-1760-Backend-Flow"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES108-AP1"
            }
      }
}