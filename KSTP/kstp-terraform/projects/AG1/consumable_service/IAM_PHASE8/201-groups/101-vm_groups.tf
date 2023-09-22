#####################################
# VM GROUPS
#
# Migration date: 07/26/2023 14:28
# Geography.....: AG1 
# Wave..........: IAM_PHASE8
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AG1-HOST-ag1srlpchatixf1_old"
   nsx_id = "TF-AG1-HOST-ag1srlpchatixf1_old"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpchatixf1_old"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["9.9.9.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AG1-HOST-ag1rhel8-July-2023"
   nsx_id = "TF-AG1-HOST-ag1rhel8-July-2023"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1rhel8-July-2023"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["9.9.9.9"]
      }
   }
}
