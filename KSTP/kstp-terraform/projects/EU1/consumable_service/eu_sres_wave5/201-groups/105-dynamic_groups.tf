#####################################
# DYNAMIC GROUPS
#
# Migration date: 08/09/2023 15:24
# Geography.....: EU1 
# Wave..........: eu_sres_wave5
#####################################
resource "nsxt_policy_group" "grp_199" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm70"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm70"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm70"
      }
   }
}
resource "nsxt_policy_group" "grp_200" {
   display_name = "TF-EU1-SG-SRES-nlasabuildm1e00p"
   nsx_id = "TF-EU1-SG-SRES-nlasabuildm1e00p"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlasabuildm1e00p"
      }
   }
}
