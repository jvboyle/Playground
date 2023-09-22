resource "nsxt_policy_security_policy" "policies_TF-DRES_261-DRES_261" {
   display_name    = "TF-DRES_261"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES_261"
   comments        = ""
   sequence_number = 0
     rule {
         display_name = "TF-BDS-Flow-CP-to-Proxy"
         notes        = "RITM0152875"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-Client-premise-DRES261-JH"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2",
               "/infra/domains/default/groups/TF-AP1-Client-DRES261-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
                              "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2"
             
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_261-AP1"
            }
     }
	  
	     rule {
         display_name = "TF-Ansible-SSH-Flow"
         notes        = "RITM0152875"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-Client-premise-DRES261-JH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2"
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
         display_name = "TF-OCP-Cluster01-to-CACF-Proxy-VIP-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/AP1-SG-SRES-OCP-Cluster05"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-Client-DRES261-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/AP1-SG-SRES-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES261-AP1"
            }
      }

      	     rule {
         display_name = "TF-Proxy_Inter"
         notes        = "RITM0153376"
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2"
            ]
         destination_groups = [
                "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2"
            ]
         action = "ALLOW"
         services = [
              
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2"
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