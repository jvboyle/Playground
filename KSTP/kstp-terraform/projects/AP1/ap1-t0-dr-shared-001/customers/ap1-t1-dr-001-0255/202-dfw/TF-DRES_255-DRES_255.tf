resource "nsxt_policy_security_policy" "policies_TF-DRES_255-DRES_255" {
   display_name    = "TF-DRES_255"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES_255"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1602-To-esldc"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr1",
			   "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc02",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc02",
               "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr1",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1irlpm1esldc01",
			   "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_255-AP1"
            }
      }
      rule {
         display_name = "TF-OCP-to-Proxy"
         notes        = "RITM0156110"
         source_groups = [
             "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
                 "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr1",
			   "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               
            ]
         scope = [
              "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr1",
			   "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr2",
                     "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_255-AP1"
            }
      }
       rule {
         display_name = "TF-Proxy_Inter"
         notes        = "RITM0156110"
         source_groups = [
                     "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr1",
			   "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr2"
            ]
         destination_groups = [
                 "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr1",
			   "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr2"
            ]
         action = "ALLOW"
         services = [
               
               
            ]
         scope = [
                      "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr1",
			   "/infra/domains/default/groups/TF-AP1-HOST-ap1dr255lpcacpr2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_255-AP1"
            }
      }
}