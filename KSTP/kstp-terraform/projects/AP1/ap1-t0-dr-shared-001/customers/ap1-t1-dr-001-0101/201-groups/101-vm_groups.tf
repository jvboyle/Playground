#####################################
# VM GROUPS
#
# Migration date: 05/12/2023 12:24
# Geography.....: AP1 
# Wave..........: DRES101
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AP1-HOST-ap1d101lpmmasl1"
   nsx_id = "TF-AP1-HOST-ap1d101lpmmasl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d101lpmmasl1"
      }
   }

}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AP1-HOST-ap1d101lpmmasl2"
   nsx_id = "TF-AP1-HOST-ap1d101lpmmasl2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d101lpmmasl2"
      }
   }

}