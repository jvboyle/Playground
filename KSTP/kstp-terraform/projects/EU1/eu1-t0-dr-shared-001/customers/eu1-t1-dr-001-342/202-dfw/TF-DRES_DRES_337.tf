resource "nsxt_policy_security_policy" "policies_TF-DRES_342-DRES_342" {
   display_name    = "TF-DRES_342"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES_342"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-Ansible-SSH-to-CACF-proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/EU1-SG-SRES-OCP9-Cluster-EU3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-Client-DRES342-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/SG-SRES-OCP7-Cluster-EU2",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d342lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d342lpcacprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_342-EU1"
            }
      }
	  
	     rule {
         display_name = "TF-Ansible-SSH-Flow"
         notes        = "CHGEU0208271"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d342lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d342lpcacprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-Client-premise-DRES342-JH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d342lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d342lpcacprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_342-EU1"
            }
      }
   rule {
         display_name = "TF-Backend-Flow-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES342-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES342-CACF-Proxy"
            ]
         action = "ALLOW"
         services = [
               
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES342-CACF-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_342-EU1"
            }
      }
}