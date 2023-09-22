#####################################
# VM GROUPS
#
# Migration date: 07/18/2023 14:12
# Geography.....: EU1 
# Wave..........: eu_sres_wave4
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-EU1-HOST-replica-d4629f94-6867-420c-a95d-345562e0f3c3"
   nsx_id = "TF-EU1-HOST-replica-d4629f94-6867-420c-a95d-345562e0f3c3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-d4629f94-6867-420c-a95d-345562e0f3c3"
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
   display_name = "TF-EU1-HOST-vCLS-4f129860-1c03-4209-b285-bc2daab16094"
   nsx_id = "TF-EU1-HOST-vCLS-4f129860-1c03-4209-b285-bc2daab16094"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-4f129860-1c03-4209-b285-bc2daab16094"
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
   display_name = "TF-EU1-HOST-vCLS-c3eb8fcd-0fa8-4724-a2aa-2da247274f24"
   nsx_id = "TF-EU1-HOST-vCLS-c3eb8fcd-0fa8-4724-a2aa-2da247274f24"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-c3eb8fcd-0fa8-4724-a2aa-2da247274f24"
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
   display_name = "TF-EU1-HOST-eu1dr13lpskl_old"
   nsx_id = "TF-EU1-HOST-eu1dr13lpskl_old"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1dr13lpskl_old"
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
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-EU1-HOST-eu1d218lpscasap"
   nsx_id = "TF-EU1-HOST-eu1d218lpscasap"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d218lpscasap"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.106.2"]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-EU1-HOST-vCLS-7b13572f-f0c4-42a3-9ed7-b7442ed26b25"
   nsx_id = "TF-EU1-HOST-vCLS-7b13572f-f0c4-42a3-9ed7-b7442ed26b25"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-7b13572f-f0c4-42a3-9ed7-b7442ed26b25"
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
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-EU1-HOST-vCLS-0185fa0a-8ee3-405f-b5f6-d0b902ef5d8d"
   nsx_id = "TF-EU1-HOST-vCLS-0185fa0a-8ee3-405f-b5f6-d0b902ef5d8d"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-0185fa0a-8ee3-405f-b5f6-d0b902ef5d8d"
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
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-EU1-HOST-vCLS-afff54c4-e21e-462c-ac89-adfb80dc2835"
   nsx_id = "TF-EU1-HOST-vCLS-afff54c4-e21e-462c-ac89-adfb80dc2835"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-afff54c4-e21e-462c-ac89-adfb80dc2835"
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
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-EU1-HOST-vCLS-f53662c4-e050-4d8e-8b82-69dc9cdb4f95"
   nsx_id = "TF-EU1-HOST-vCLS-f53662c4-e050-4d8e-8b82-69dc9cdb4f95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-f53662c4-e050-4d8e-8b82-69dc9cdb4f95"
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
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-EU1-HOST-stefan-vmotion-test"
   nsx_id = "TF-EU1-HOST-stefan-vmotion-test"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "stefan-vmotion-test"
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
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-EU1-HOST-vCLS-0ead8681-2aa6-49b2-bad4-1d16078593bf"
   nsx_id = "TF-EU1-HOST-vCLS-0ead8681-2aa6-49b2-bad4-1d16078593bf"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-0ead8681-2aa6-49b2-bad4-1d16078593bf"
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
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-EU1-HOST-vCLS-4a91f5b3-5328-4630-b115-527b7f60dd8f"
   nsx_id = "TF-EU1-HOST-vCLS-4a91f5b3-5328-4630-b115-527b7f60dd8f"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-4a91f5b3-5328-4630-b115-527b7f60dd8f"
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
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-EU1-HOST-vCLS-e32a2573-ca27-415f-9c99-f4db45fe0165"
   nsx_id = "TF-EU1-HOST-vCLS-e32a2573-ca27-415f-9c99-f4db45fe0165"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-e32a2573-ca27-415f-9c99-f4db45fe0165"
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
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-EU1-HOST-vCLS-8e1c07b9-ad7b-462a-b614-0dbce770d6a2"
   nsx_id = "TF-EU1-HOST-vCLS-8e1c07b9-ad7b-462a-b614-0dbce770d6a2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-8e1c07b9-ad7b-462a-b614-0dbce770d6a2"
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
   display_name = "TF-EU1-HOST-vCLS-abea8b86-15ac-45fb-a8ab-10c61f52b758"
   nsx_id = "TF-EU1-HOST-vCLS-abea8b86-15ac-45fb-a8ab-10c61f52b758"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-abea8b86-15ac-45fb-a8ab-10c61f52b758"
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
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-EU1-HOST-vCLS-cc7c41dd-04da-47ee-b060-9d09145b3354"
   nsx_id = "TF-EU1-HOST-vCLS-cc7c41dd-04da-47ee-b060-9d09145b3354"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-cc7c41dd-04da-47ee-b060-9d09145b3354"
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
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-EU1-HOST-replica-f71100ee-38a6-458b-af6e-0c776dd7616c"
   nsx_id = "TF-EU1-HOST-replica-f71100ee-38a6-458b-af6e-0c776dd7616c"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-f71100ee-38a6-458b-af6e-0c776dd7616c"
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
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-EU1-HOST-vCLS-03124aa7-a2fa-483f-8667-da0564d6a2c0"
   nsx_id = "TF-EU1-HOST-vCLS-03124aa7-a2fa-483f-8667-da0564d6a2c0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-03124aa7-a2fa-483f-8667-da0564d6a2c0"
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
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-EU1-HOST-vCLS-f09a9575-6abd-4fee-940a-e5824ccda758"
   nsx_id = "TF-EU1-HOST-vCLS-f09a9575-6abd-4fee-940a-e5824ccda758"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-f09a9575-6abd-4fee-940a-e5824ccda758"
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
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-EU1-HOST-NLS01GTSBPGLD23"
   nsx_id = "TF-EU1-HOST-NLS01GTSBPGLD23"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01GTSBPGLD23"
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
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-EU1-HOST-vCLS-6b32ebb2-a6c8-4aed-99bb-c33030d6b26d"
   nsx_id = "TF-EU1-HOST-vCLS-6b32ebb2-a6c8-4aed-99bb-c33030d6b26d"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-6b32ebb2-a6c8-4aed-99bb-c33030d6b26d"
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
