resource "nsxt_policy_security_policy" "policies_TF-DRES193-DRES193" {
   display_name    = "TF-DRES193"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES193"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1414-CPREM-to-CACF-Proxy-VIP"
         notes        = "SR1418327 SR1418527 -removed 10 187 121 119 10 85 147 117 then added 67 228 116 82 158 177 100 109 "
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d193lpcacpr-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d193lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d193lpcacpr-vip"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES193-AP1"
            }
      }
   rule {
         display_name = "TF-1415-CACF-Proxy-to-BDS"
         notes        = "SR1418327"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d193lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d193lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES193-AP1"
            }
      }
   rule {
         display_name = "TF-1416-CACF-Proxy-to-CPREM"
         notes        = "SR1418327 SR1418527 -removed 10 187 121 119 10 85 147 117 then added 67 228 116 82 158 177 100 109 "
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d193lpcacpr1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d193lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES193-AP1"
            }
      }
   rule {
         display_name = "TF-1417-OCP-Cluster01-to-CACF-Proxy-VIP"
         notes        = "SR1418327"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d193lpcacpr-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d193lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d193lpcacpr-vip"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES193-AP1"
            }
      }
}