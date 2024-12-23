resource "nsxt_policy_security_policy" "policies_TF-EDR-CARBONBLACK_tf" {
  display_name    = "TF-EDR-CARBONBLACK"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-EDR-CARBONBLACK"
  comments        = ""
  sequence_number = 0
# rules
######################################################
# migration: eu_sres_wave6
######################################################
   rule {
         display_name = "TF-1126-Systems-to-CarbonBlack-servers"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-EDR-CarbonBlack"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-EDR-CarbonBlack"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-EDR-CarbonBlack",
               "/infra/domains/default/groups/TF-EU1-IPSET-EDR-CarbonBlack"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-EDR-CarbonBlack-EU1"
            }
      }
}