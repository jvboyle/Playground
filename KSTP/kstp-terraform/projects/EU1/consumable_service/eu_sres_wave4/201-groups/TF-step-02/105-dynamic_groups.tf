#####################################
# DYNAMIC GROUPS
#
# Migration date: 07/18/2023 14:12
# Geography.....: EU1 
# Wave..........: eu_sres_wave4
#####################################
resource "nsxt_policy_group" "grp_369" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpmpcansb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpmpcansb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1lpmpcansb"
      }
   }
}
resource "nsxt_policy_group" "grp_370" {
   display_name = "TF-EU1-SG-PDR-OKTA-ASA-GW"
   nsx_id = "TF-EU1-SG-PDR-OKTA-ASA-GW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "eu1pdr1lpasagw"
      }
   }
}
