#####################################
# DYNAMIC GROUPS
#
# Migration date: 06/08/2023 20:04
# Geography.....: AG1 
# Wave..........: IAM_PHASE4
#####################################
resource "nsxt_policy_group" "grp_30" {
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
