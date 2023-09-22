resource "nsxt_policy_security_policy" "policies_TF-DRES340-DRES340" {
   display_name    = "TF-DRES340"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES340"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-SRES-OCP9-EU3-to-CACF-Proxy-SSH-VIP"
         notes        = "RITM0158429"
         source_groups = [
               "/infra/domains/default/groups/EU1-SG-SRES-OCP9-Cluster-EU3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-DRES340-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CACF-Proxy",
               "/infra/domains/default/groups/EU1-SG-SRES-OCP9-Cluster-EU3"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES340-EU1"
            }
      }
   rule {
         display_name = "TF-CACF-Proxy-to-CPREM"
         notes        = "RITM0158429"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CPREM-JH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CACF-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES340-EU1"
            }
      }
   rule {
         display_name = "TF-CACF-Proxy-to-BDS"
         notes        = "RITM0158429"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CACF-Proxy",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES340-EU1"
            }
      }
   rule {
         display_name = "TF-CPREM-to-CACF-Proxy-VIP"
         notes        = "RITM0158429"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CPREM-JH"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-DRES340-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-CPREM-GSNI-NAT-Range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CACF-Proxy"                             
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES340-EU1"
            }
      }
   rule {
         display_name = "TF-CACF-Proxy-Communication"
         notes        = "RITM0158429"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CACF-Proxy"
                ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CACF-Proxy"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES340-CACF-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES340-EU1"
            }
      }
   }