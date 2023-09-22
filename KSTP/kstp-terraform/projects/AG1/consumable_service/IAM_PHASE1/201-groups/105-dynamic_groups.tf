#####################################
# DYNAMIC GROUPS
#
# Migration date: 04/20/2023 08:46
# Geography.....: AG1 
# Wave..........: IAM_PHASE1
#####################################
resource "nsxt_policy_group" "grp_214" {
   display_name = "TF-AG1-PDR-Servers"
   nsx_id = "TF-AG1-PDR-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1pdr"
      }
   }
}
resource "nsxt_policy_group" "grp_215" {
   display_name = "TF-AG1-ALL-driamaas2-Servers"
   nsx_id = "TF-AG1-ALL-driamaas2-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1dlniam"
      }
   }
}
resource "nsxt_policy_group" "grp_216" {
   display_name = "TF-AG1-ALL-driamaasthy-Servers"
   nsx_id = "TF-AG1-ALL-driamaasthy-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1dlniam"
      }
   }
}
