#####################################
# DYNAMIC GROUPS
#
# Migration date: 05/23/2023 12:54
# Geography.....: AG1 
# Wave..........: IAM_PHASE3
#####################################
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-AG1-SG-LPW-TEST"
   nsx_id = "TF-AG1-SG-LPW-TEST"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "prx"
      }
   }
}
