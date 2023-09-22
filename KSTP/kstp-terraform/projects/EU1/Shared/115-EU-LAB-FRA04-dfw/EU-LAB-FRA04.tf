resource "nsxt_policy_security_policy" "policies_TF-EU-LAB-FRA04" {
  display_name    = "TF-EU-LAB-FRA04"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-EU-LAB-FRA04"
  comments        = ""
  sequence_number = 0
######################################################
# migration: eu_sres_wave5
######################################################
   rule {
         display_name = "TF-7663-EU-Prod-JH-to-Lab-AD"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "10.240.127.194",
               "10.240.127.195"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-EU-LAB-FRA04-EU1"
            }
      }
   rule {
         display_name = "TF-7664-EU-Prod-JH-to-Lab-VC-NSX-mgr"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "10.240.127.196",
               "10.240.127.200",
               "10.240.127.199",
               "10.240.127.198",
               "10.240.127.197"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-EU-LAB-FRA04-EU1"
            }
      }
   rule {
         display_name = "TF-7796-EU-Prod-JH-to-Lab-vSRX"
         notes        = ""
         source_groups = [

            ]
         destination_groups = [
               "10.21.25.27"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [

            ]
         disabled              = true
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-EU-LAB-FRA04-EU1"
            }
      }
}
