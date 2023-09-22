#####################################
# DYNAMIC GROUPS
#
# Migration date: 05/16/2023 13:49
# Geography.....: EU1 
# Wave..........: eu_sres_wave2
#####################################
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-EU1-SG-CISO-TOOLS-KSTP"
   nsx_id = "TF-EU1-SG-CISO-TOOLS-KSTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "splunkfwd"
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
         value       = "splnkfwd"
      }
   }
}
