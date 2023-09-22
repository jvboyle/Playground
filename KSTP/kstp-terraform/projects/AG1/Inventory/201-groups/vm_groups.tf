#####################################
# VM GROUPS
#
# Date: 05/15/2023 13:00
# Geography.....: AG1 
# Wave..........: RITM0145729
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AG1-HOST-AG1SRLPDVAWEB01"
   nsx_id = "TF-AG1-HOST-AG1SRLPDVAWEB01"
   description        = "RITM0145729"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1SRLPDVAWEB01"
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AG1-HOST-AGNSRLNDVAWEB01"
   nsx_id = "TF-AG1-HOST-AGNSRLNDVAWEB01"
   description        = "RITM0145729"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AGNSRLNDVAWEB01"
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AG1-HOST-AG1SRLPDVAAPP01"
   nsx_id = "TF-AG1-HOST-AG1SRLPDVAAPP01"
   description        = "RITM0145729"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1SRLPDVAAPP01"
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AG1-HOST-AGNSRLNDVAAPP01"
   nsx_id = "TF-AG1-HOST-AGNSRLNDVAAPP01"
   description        = "RITM0145729"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AGNSRLNDVAAPP01"
      }
   }
}