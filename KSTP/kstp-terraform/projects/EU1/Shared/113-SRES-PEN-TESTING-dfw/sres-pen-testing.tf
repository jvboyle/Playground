resource "nsxt_policy_security_policy" "policies_TF-SRES-PEN-TESTING" {
  display_name    = "TF-SRES-PEN-TESTING"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-SRES-PEN-TESTING"
  comments        = ""
  sequence_number = 0
# rules
######################################################
# migration: eu_sres_wave3
######################################################
   rule {
         display_name = "TF-1090-Pentesters-to-TestedVM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Pen-Testing"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp",
               "158.87.52.31"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16351"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Pen-Testing",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-Pen-Testing-EU1"
            }
      }
}