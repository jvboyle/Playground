#####################################
# VM GROUPS
#
# Migration date: 07/10/2023 17:13
# Geography.....: AP1 
# Wave..........: DRES264
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AP1-HOST-vCLS-f7ea9758-c0f4-4010-97e5-1333101360c8"
   nsx_id = "TF-AP1-HOST-vCLS-f7ea9758-c0f4-4010-97e5-1333101360c8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-f7ea9758-c0f4-4010-97e5-1333101360c8"
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
   display_name = "TF-AP1-HOST-vCLS-acbd15a9-7051-4d30-a77c-f649851d8702"
   nsx_id = "TF-AP1-HOST-vCLS-acbd15a9-7051-4d30-a77c-f649851d8702"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-acbd15a9-7051-4d30-a77c-f649851d8702"
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
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AP1-HOST-vCLS-9093509d-d799-419f-9567-cf61b5f4ad95"
   nsx_id = "TF-AP1-HOST-vCLS-9093509d-d799-419f-9567-cf61b5f4ad95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-9093509d-d799-419f-9567-cf61b5f4ad95"
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
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AP1-HOST-ap1pdr1lpasagw1"
   nsx_id = "TF-AP1-HOST-ap1pdr1lpasagw1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1pdr1lpasagw1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.69.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AP1-HOST-vCLS-4be34272-e180-4b60-9e89-0def2aa34541"
   nsx_id = "TF-AP1-HOST-vCLS-4be34272-e180-4b60-9e89-0def2aa34541"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-4be34272-e180-4b60-9e89-0def2aa34541"
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
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AP1-HOST-vCLS-d57fed4a-30ec-4c75-baf1-4142e5d0e224"
   nsx_id = "TF-AP1-HOST-vCLS-d57fed4a-30ec-4c75-baf1-4142e5d0e224"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-d57fed4a-30ec-4c75-baf1-4142e5d0e224"
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
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AP1-HOST-vCLS-60bcf8bc-fc42-4ef1-a8ec-b8918a24b6d3"
   nsx_id = "TF-AP1-HOST-vCLS-60bcf8bc-fc42-4ef1-a8ec-b8918a24b6d3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-60bcf8bc-fc42-4ef1-a8ec-b8918a24b6d3"
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
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AP1-HOST-ap1pdr1lpasagw2"
   nsx_id = "TF-AP1-HOST-ap1pdr1lpasagw2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1pdr1lpasagw2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.69.8"]
      }
   }
}
