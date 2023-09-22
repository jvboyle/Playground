#####################################
# DYNAMIC GROUPS
#
# Migration date: 07/12/2023 13:56
# Geography.....: AG1 
# Wave..........: IAM_PHASE6
#####################################
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AG1-SG-PDR-OKTA-ASA-GW"
   nsx_id = "TF-AG1-SG-PDR-OKTA-ASA-GW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "ag1pdr1lpasagw2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "ag1pdr1lpasagw1"
      }
   }
}
