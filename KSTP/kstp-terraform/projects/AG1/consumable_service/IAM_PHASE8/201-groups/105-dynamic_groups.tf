#####################################
# DYNAMIC GROUPS
#
# Migration date: 07/26/2023 14:28
# Geography.....: AG1 
# Wave..........: IAM_PHASE8
#####################################
resource "nsxt_policy_group" "grp_19" {
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
         value       = "ag1pdr1lpasagw1"
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
         value       = "ag1pdr1lpasagw2"
      }
   }
}
