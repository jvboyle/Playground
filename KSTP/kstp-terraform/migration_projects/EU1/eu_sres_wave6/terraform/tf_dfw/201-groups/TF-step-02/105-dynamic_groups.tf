#####################################
# DYNAMIC GROUPS
#
# Migration date: 09/06/2023 13:49
# Geography.....: EU1 
# Wave..........: eu_sres_wave6
#####################################
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1licpres"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1licpres"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1licpres"
      }
   }
}
