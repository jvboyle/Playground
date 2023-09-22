resource "nsxt_policy_security_policy" "policies_TF-DRES_359-DRES_359" {
   display_name    = "TF-DRES_359"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES_359"
   comments        = ""
   sequence_number = 0
     rule {
         display_name = "TF-BDS-Flow-CP-to-Proxy"
         notes        = "CHGEU0208804"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-DRES359-CPREM-JH"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-DRES359-CACF-Proxy"
                 ]
         action = "ALLOW"
         services = [
                              "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-SG-DRES359-CACF-Proxy"
                           
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_359-AP1"
            }
     }
	  
	     rule {
         display_name = "TF-Ansible-SSH-Flow"
         notes        = "CHGEU0208804"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-DRES359-CACF-Proxy"
               
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-DRES359-CPREM-JH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-SG-DRES359-CACF-Proxy"
              
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_359-AP1"
            }
      }


        rule {
         display_name = "TF-OCP-Cluster01-to-CACF-Proxy-VIP"
         notes        = "CHGEU0208804"
         source_groups = [
               "/infra/domains/default/groups/AP1-SG-SRES-OCP-Cluster05"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-DRES359-CACF-Proxy"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/AP1-SG-SRES-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AP1-SG-DRES359-CACF-Proxy"
                           ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES359-AP1"
            }
      }

      	     rule {
         display_name = "TF-Proxy_Inter"
         notes        = "CHGEU0208804"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-DRES359-CACF-Proxy"
               
            ]
         destination_groups = [
                "/infra/domains/default/groups/TF-AP1-SG-DRES359-CACF-Proxy"
               
            ]
         action = "ALLOW"
         services = [
              
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-SG-DRES359-CACF-Proxy"
                           ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_359-AP1"
            }
      }
}
