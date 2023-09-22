resource "nsxt_policy_security_policy" "policies_TF-DRES_268-DRES_268" {
   display_name    = "TF-DRES_268"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES_268"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1766-BDS-Flow-CP-to-Proxy"
         notes        = "RITM0126464"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-Myer-CPREM-JH"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-Dres268-cacf-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-Dres268-cacf-Proxy-VIP",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range",
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-Myer-CPREM-JH"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_268-AP1"
            }
      }
   rule {
         display_name = "TF-1767-BDS-Flow"
         notes        = "RITM0126464"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2"
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
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_268-AP1"
            }
      }
   rule {
         display_name = "TF-1768-Ansible-SSH-Flow"
         notes        = "RITM0126464"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-Myer-CPREM-JH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-Myer-CPREM-JH",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_268-AP1"
            }
      }
   rule {
         display_name = "TF-1769-Inteternal-DRES-comm"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_268-AP1"
            }
      }
   rule {
         display_name = "TF-1774-OCP-Cluster1-to-CACF-Proxy"
         notes        = "RITM0127427"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-Dres268-cacf-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d268lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-Host-Dres268-cacf-Proxy-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_268-AP1"
            }
      }
}