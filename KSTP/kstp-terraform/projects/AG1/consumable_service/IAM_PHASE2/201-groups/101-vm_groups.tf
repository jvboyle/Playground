#####################################
# VM GROUPS
#
# Migration date: 05/09/2023 09:30
# Geography.....: AG1 
# Wave..........: IAM_PHASE2
#####################################
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-AG1-HOST-ag1srlncacfxfr_old"
   nsx_id = "TF-AG1-HOST-ag1srlncacfxfr_old"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlncacfxfr_old"
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
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-AG1-HOST-ag1sr1nfs01n"
   nsx_id = "TF-AG1-HOST-ag1sr1nfs01n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1nfs01n"
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
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-AG1-HOST-ag1sr1qualy1"
   nsx_id = "TF-AG1-HOST-ag1sr1qualy1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1qualy1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.40"]
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-AG1-HOST-ag1sr1nfs01"
   nsx_id = "TF-AG1-HOST-ag1sr1nfs01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1nfs01"
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
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-AG1-HOST-ag1sr1nfs02n"
   nsx_id = "TF-AG1-HOST-ag1sr1nfs02n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1nfs02n"
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
