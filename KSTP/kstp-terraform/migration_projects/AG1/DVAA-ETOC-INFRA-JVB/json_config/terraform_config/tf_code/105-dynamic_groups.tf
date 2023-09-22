#####################################
# DYNAMIC GROUPS
#
# Migration date: 04/06/2023 10:25
# Geography.....: AG1 
# Wave..........: DVAA-ETOC-INFRA-JVB
#####################################
resource "nsxt_policy_group" "grp_158" {
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
