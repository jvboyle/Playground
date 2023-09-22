#####################################
# DYNAMIC GROUPS
#
# Migration date: 06/19/2023 17:07
# Geography.....: AG1 
# Wave..........: IAM_PHASE5
#####################################
resource "nsxt_policy_group" "grp_23" {
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
