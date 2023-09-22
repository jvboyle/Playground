#####################################
# DYNAMIC GROUPS
#
# Migration date: 03/30/2023 17:32
# Geography.....: AG1 
# Wave..........: DVAA-ETOC-INFRA
#####################################
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-AG1-SG-All-SRES-SERVERS"
   nsx_id = "TF-AG1-SG-All-SRES-SERVERS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1sr"
      }
   }
}
