#####################################
# SGEM GROUPS
#
# Migration date: 05/18/2023 14:15
# Geography.....: AP1 
# Wave..........: DRES103
#####################################
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AP1-SG-CISO-Tools-KSTP"
   nsx_id = "TF-AP1-SG-CISO-Tools-KSTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "splnkfwd"
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
         value       = "splunkfwd"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IRES-QRADAR-NAT-IP"
]
      }
   }
}
