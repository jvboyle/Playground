#####################################
# VM GROUPS
#
# Migration date: 09/06/2023 13:49
# Geography.....: EU1 
# Wave..........: eu_sres_wave6
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-EU1-HOST-eu1d296wpmcmjh1"
   nsx_id = "TF-EU1-HOST-eu1d296wpmcmjh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d296wpmcmjh1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.208.35"]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-EU1-HOST-eu1d92lpfnaslcl"
   nsx_id = "TF-EU1-HOST-eu1d92lpfnaslcl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d92lpfnaslcl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.208.17"]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-EU1-HOST-vCLS-44ec57e8-ae88-4c39-938b-cfa1c0bca5e2"
   nsx_id = "TF-EU1-HOST-vCLS-44ec57e8-ae88-4c39-938b-cfa1c0bca5e2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-44ec57e8-ae88-4c39-938b-cfa1c0bca5e2"
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
   display_name = "TF-EU1-HOST-eu1d296wpmcmjh2"
   nsx_id = "TF-EU1-HOST-eu1d296wpmcmjh2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d296wpmcmjh2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.208.36"]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-EU1-HOST-eu1d296wpmcmsus"
   nsx_id = "TF-EU1-HOST-eu1d296wpmcmsus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d296wpmcmsus"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.208.34"]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-EU1-HOST-eu1d294lpcacprx1"
   nsx_id = "TF-EU1-HOST-eu1d294lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d294lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.204.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-EU1-HOST-vCLS-af791e37-2377-4f05-9395-de3b87e7a55f"
   nsx_id = "TF-EU1-HOST-vCLS-af791e37-2377-4f05-9395-de3b87e7a55f"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-af791e37-2377-4f05-9395-de3b87e7a55f"
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
   display_name = "TF-EU1-HOST-eu1d92lpfnasdbc"
   nsx_id = "TF-EU1-HOST-eu1d92lpfnasdbc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d92lpfnasdbc"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.208.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-EU1-HOST-eu1d92lpfnaslap"
   nsx_id = "TF-EU1-HOST-eu1d92lpfnaslap"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d92lpfnaslap"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.208.18"]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-EU1-HOST-eu1d92lpfnasdbk"
   nsx_id = "TF-EU1-HOST-eu1d92lpfnasdbk"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d92lpfnasdbk"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.208.19"]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-EU1-HOST-vCLS-05478bb9-592a-4afd-b490-a370602d124d"
   nsx_id = "TF-EU1-HOST-vCLS-05478bb9-592a-4afd-b490-a370602d124d"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-05478bb9-592a-4afd-b490-a370602d124d"
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
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-EU1-HOST-eu1d62lpgs9nse01"
   nsx_id = "TF-EU1-HOST-eu1d62lpgs9nse01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62lpgs9nse01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.2"]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-EU1-HOST-eu1d92lpfnasdbp"
   nsx_id = "TF-EU1-HOST-eu1d92lpfnasdbp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d92lpfnasdbp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.208.15"]
      }
   }
}
