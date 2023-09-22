resource "nsxt_policy_security_policy" "policies_TF-SRES-RPA-eu_sres_wave2" {
   display_name    = "TF-SRES-RPA"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-SRES-RPA"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-7505-RPA-Madrid-to-SRES-RPA"
         notes        = "SR51127608"
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-RPA-EU1"
            }
      }
}