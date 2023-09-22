resource "nsxt_policy_security_policy" "policies_TF-DRES264-DRES264" {
   display_name    = "TF-DRES264"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES264"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1740-With-in-CACF-Proxy-"
         notes        = "RITM0118889"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-DRES264-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-DRES264-CACF-Proxy"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-DRES264-CACF-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES264-AP1"
            }
      }
   rule {
         display_name = "TF-1741-Client-JH-to-CACF-Proxy"
         notes        = "RITM0118889"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-Host_DRES264-Client-premise-JH"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-DRES264-CACF-VIP-NAT",
               "/infra/domains/default/groups/TF-AP1-DRES264-CACF-Proxy"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-DRES264-CACF-Proxy",
               "/infra/domains/default/groups/TF-AP1-IPSET-DRES264-CACF-VIP-NAT",
               "/infra/domains/default/groups/TF-AP1-IPSET-Host_DRES264-Client-premise-JH"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES264-AP1"
            }
      }
   rule {
         display_name = "TF-1742-CACF-Proxy-to-JH"
         notes        = "RITM0118889"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-DRES264-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-Host_DRES264-Client-premise-JH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-DRES264-CACF-Proxy",
               "/infra/domains/default/groups/TF-AP1-IPSET-Host_DRES264-Client-premise-JH"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES264-AP1"
            }
      }
}