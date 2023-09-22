#####################################
# VM GROUPS
#
# Migration date: 06/19/2023 17:07
# Geography.....: AG1 
# Wave..........: IAM_PHASE5
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AG1-HOST-ag1pdr1lpasagw1"
   nsx_id = "TF-AG1-HOST-ag1pdr1lpasagw1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1pdr1lpasagw1"
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
   display_name = "TF-AG1-HOST-RHEL9_2023"
   nsx_id = "TF-AG1-HOST-RHEL9_2023"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "RHEL9_2023"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.20"]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AG1-HOST-ag1pdr1lpasagw2"
   nsx_id = "TF-AG1-HOST-ag1pdr1lpasagw2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1pdr1lpasagw2"
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
