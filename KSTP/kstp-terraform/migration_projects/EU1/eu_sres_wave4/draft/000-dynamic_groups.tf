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
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-EU1-HOST-eu1d62apprkise1"
   nsx_id = "TF-EU1-HOST-eu1d62apprkise1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62apprkise1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.2.1"]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-EU1-HOST-dr328-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr328-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr328-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.182"]
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
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-EU1-HOST-dr333-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr333-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr333-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-EU1-HOST-dr330-esg1-0"
   nsx_id = "TF-EU1-HOST-dr330-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr330-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.215"]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-EU1-HOST-eu1d62lpecnsdc2"
   nsx_id = "TF-EU1-HOST-eu1d62lpecnsdc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62lpecnsdc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.44"]
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
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-EU1-HOST-eu1pdr1lpasagw1"
   nsx_id = "TF-EU1-HOST-eu1pdr1lpasagw1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1pdr1lpasagw1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.69.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-EU1-HOST-eu1irsplnkhf02"
   nsx_id = "TF-EU1-HOST-eu1irsplnkhf02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1irsplnkhf02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.175.236.126"]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-EU1-HOST-New-Virtual-Machine"
   nsx_id = "TF-EU1-HOST-New-Virtual-Machine"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "New Virtual Machine"
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
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-EU1-HOST-eu1d331lpsi7tnp2"
   nsx_id = "TF-EU1-HOST-eu1d331lpsi7tnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d331lpsi7tnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.236.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-EU1-HOST-dr333-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr333-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr333-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-EU1-HOST-eu1d62wpprkorp1"
   nsx_id = "TF-EU1-HOST-eu1d62wpprkorp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62wpprkorp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.19"]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-EU1-HOST-eu1d62lpecnsmc1"
   nsx_id = "TF-EU1-HOST-eu1d62lpecnsmc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62lpecnsmc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.47"]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-EU1-HOST-eu1pdr1lpasagw2"
   nsx_id = "TF-EU1-HOST-eu1pdr1lpasagw2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1pdr1lpasagw2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.69.14"]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-EU1-HOST-NLS01GTSBPGLD01"
   nsx_id = "TF-EU1-HOST-NLS01GTSBPGLD01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01GTSBPGLD01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.79.248.84"]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-EU1-HOST-dr332-esg1-0"
   nsx_id = "TF-EU1-HOST-dr332-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr332-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.217"]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-EU1-HOST-eu1irsplnkhf01"
   nsx_id = "TF-EU1-HOST-eu1irsplnkhf01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1irsplnkhf01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.175.236.103"]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-EU1-HOST-dr331-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr331-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr331-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.13.81"]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-EU1-HOST-eu1d62apprkrp2"
   nsx_id = "TF-EU1-HOST-eu1d62apprkrp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62apprkrp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.22"]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-EU1-HOST-dr331-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr331-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr331-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.13.90"]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-EU1-HOST-eu1d62lpprkjmp2"
   nsx_id = "TF-EU1-HOST-eu1d62lpprkjmp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62lpprkjmp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.25"]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-EU1-HOST-eu1d62lpecnsdc4"
   nsx_id = "TF-EU1-HOST-eu1d62lpecnsdc4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62lpecnsdc4"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.46"]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-EU1-HOST-dr330-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr330-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr330-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.13.74"]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-EU1-HOST-dr328-esg1-1"
   nsx_id = "TF-EU1-HOST-dr328-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr328-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.214"]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-EU1-HOST-dr328-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr328-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr328-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.13.58"]
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
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-EU1-HOST-eu1d62lpecnsmc2"
   nsx_id = "TF-EU1-HOST-eu1d62lpecnsmc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62lpecnsmc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.48"]
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
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-EU1-HOST-dr328-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr328-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr328-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.182"]
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
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-EU1-HOST-dr331-esg1-1"
   nsx_id = "TF-EU1-HOST-dr331-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr331-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.216"]
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
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-EU1-HOST-dr330-esg1-1"
   nsx_id = "TF-EU1-HOST-dr330-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr330-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.215"]
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
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-EU1-HOST-dr332-esg1-1"
   nsx_id = "TF-EU1-HOST-dr332-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr332-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.217"]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-EU1-HOST-eu1d332lpcacprx1"
   nsx_id = "TF-EU1-HOST-eu1d332lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d332lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.238.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-EU1-HOST-eu1d333lpcacprx1"
   nsx_id = "TF-EU1-HOST-eu1d333lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d333lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.240.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-EU1-HOST-eu1d62apprkise2"
   nsx_id = "TF-EU1-HOST-eu1d62apprkise2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62apprkise2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.2.1"]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-EU1-HOST-dr332-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr332-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr332-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.13.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-EU1-HOST-eu1d62wpprkorp2"
   nsx_id = "TF-EU1-HOST-eu1d62wpprkorp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62wpprkorp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.20"]
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-EU1-HOST-eu1d62apprkssm1"
   nsx_id = "TF-EU1-HOST-eu1d62apprkssm1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62apprkssm1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.23"]
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
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-EU1-HOST-eu1d62lpecnsdc1"
   nsx_id = "TF-EU1-HOST-eu1d62lpecnsdc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62lpecnsdc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.43"]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-EU1-HOST-dr333-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr333-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr333-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.13.122"]
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-EU1-HOST-dr330-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr330-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr330-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.183"]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-EU1-HOST-dr333-esg1-1"
   nsx_id = "TF-EU1-HOST-dr333-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr333-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.218"]
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
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-EU1-HOST-dr333-esg1-0"
   nsx_id = "TF-EU1-HOST-dr333-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr333-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.218"]
      }
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-EU1-HOST-eu1d62lpecnsdc3"
   nsx_id = "TF-EU1-HOST-eu1d62lpecnsdc3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62lpecnsdc3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.45"]
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
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-EU1-HOST-eu1d333lpcacprx2"
   nsx_id = "TF-EU1-HOST-eu1d333lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d333lpcacprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.240.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-EU1-HOST-dr332-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr332-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr332-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.185"]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-EU1-HOST-dr331-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr331-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr331-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.13.81"]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-EU1-HOST-dr332-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr332-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr332-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.185"]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-EU1-HOST-eu1d330lpcacprx1"
   nsx_id = "TF-EU1-HOST-eu1d330lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d330lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.234.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-EU1-HOST-dr330-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr330-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr330-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.183"]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-EU1-HOST-eu1d331lpsi7tnp1"
   nsx_id = "TF-EU1-HOST-eu1d331lpsi7tnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d331lpsi7tnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.236.32"]
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
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-EU1-HOST-eu1d62lpprkjmp1"
   nsx_id = "TF-EU1-HOST-eu1d62lpprkjmp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62lpprkjmp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.24"]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-EU1-HOST-eu1d62apprkrp1"
   nsx_id = "TF-EU1-HOST-eu1d62apprkrp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62apprkrp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.21"]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-EU1-HOST-dr328-esg1-0"
   nsx_id = "TF-EU1-HOST-dr328-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr328-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.214"]
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
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-EU1-HOST-dr331-esg1-0"
   nsx_id = "TF-EU1-HOST-dr331-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr331-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.216"]
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
#####################################
# IPSETs GROUPS
#
# Migration date: 07/18/2023 14:12
# Geography.....: EU1 
# Wave..........: eu_sres_wave4
#####################################
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-BlueCat-KPOP"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-BlueCat-KPOP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "142.88.130.104",
                         "142.88.132.106",
                         "142.88.133.104",
                         "130.103.1.30",
                         "142.88.129.104",
                         "142.88.132.104",
                         "142.88.131.104",
                         "142.88.131.106",
                         "130.103.1.31",
                         "142.88.128.106",
                         "142.88.135.104",
                         "142.88.134.104",
                         "142.88.133.106",
                         "142.88.129.106",
                         "142.88.130.106",
                         "142.88.135.106",
                         "142.88.134.106",
                         "142.88.128.104"
]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.167"
]
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcishfds2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcishfds2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.124"
]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejcno"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejcno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlptocdb01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlptocdb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.126"
]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD1001860020-100-107-10-6"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD1001860020-100-107-10-6"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1easpni"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1easpni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.237"
]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdnexus"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdnexus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.209"
]
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-EU1-IPSET-DR328-CPREM-SL1-COLLECTOR"
   nsx_id = "TF-EU1-IPSET-DR328-CPREM-SL1-COLLECTOR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.222.79.232",
                         "10.72.114.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdansdb2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdansdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.205"
]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-EU1-IPSET-SRES-nlaspnp000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspnp000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epni3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epni3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-EU1-IPSET-kdpnwans01-158-98-158-71"
   nsx_id = "TF-EU1-IPSET-kdpnwans01-158-98-158-71"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.158.71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-EU1-IPSET-SDE_Grabels_APICs"
   nsx_id = "TF-EU1-IPSET-SDE_Grabels_APICs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.100.120.68",
                         "100.100.120.70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlphsts1ncl"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlphsts1ncl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.159"
]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.228"
]
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-EU1-IPSET-SRES-nlaspno000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspno000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-EU1-IPSET-VDR2-ESG-vNic_2"
   nsx_id = "TF-EU1-IPSET-VDR2-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.0.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-EU1-IPSET-SRES-MnEaaS-PRTG-SHR"
   nsx_id = "TF-EU1-IPSET-SRES-MnEaaS-PRTG-SHR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.170",
                         "158.87.53.148",
                         "158.87.53.171",
                         "158.87.53.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-EU1-IPSET-DA-GH2-ibmpsoboxgh22-100-96-132-21"
   nsx_id = "TF-EU1-IPSET-DA-GH2-ibmpsoboxgh22-100-96-132-21"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.96.132.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdexec"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdexec"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.210"
]
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-EU1-IPSET-DRES333-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES333-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.240.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1etnp2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1etnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.156"
]
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-EU1-IPSET-SRES-nlaspnw000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspnw000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlPdshbrd"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlPdshbrd"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-EU1-IPSET-JPTestJumphost"
   nsx_id = "TF-EU1-IPSET-JPTestJumphost"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.222.209"
]
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-EU1-IPSET-AG1-SRES-ag-work01"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-ag-work01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.242.233",
                         "158.87.50.43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-EU1-IPSET-SRES-nlascdb000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlascdb000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-EU1-IPSET-DA-ACO-atllx008-100-98-8-81"
   nsx_id = "TF-EU1-IPSET-DA-ACO-atllx008-100-98-8-81"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.98.8.81"
]
      }
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-EU1-IPSET-SRES-eu1srwpsgesql01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srwpsgesql01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.42"
]
      }
   }
}
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-EU1-IPSET-DA-BCP-lpar7r7-100-105-20-60"
   nsx_id = "TF-EU1-IPSET-DA-BCP-lpar7r7-100-105-20-60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.105.20.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-EU1-IPSET-DA-BES-shnisap1-100-105-20-9"
   nsx_id = "TF-EU1-IPSET-DA-BES-shnisap1-100-105-20-9"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.105.20.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecdb2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.147"
]
      }
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejpno"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejpno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejpdb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejpdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejcni"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejcni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-EU1-IPSET-CPREM-EY-MOOGSOFT"
   nsx_id = "TF-EU1-IPSET-CPREM-EY-MOOGSOFT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.143.178.143",
                         "10.152.136.82",
                         "10.152.154.113",
                         "10.146.40.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecno2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecno2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-EU1-IPSET-DR328-ESG-vNic_0"
   nsx_id = "TF-EU1-IPSET-DR328-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.64.214"
]
      }
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-1"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.208.0/24",
                         "158.98.72.0/24",
                         "9.87.63.11",
                         "129.39.131.0/25",
                         "100.98.8.113",
                         "10.140.49.32/27",
                         "194.194.213.0/24",
                         "129.39.52.109",
                         "141.171.55.0/24",
                         "158.98.74.208/28",
                         "194.10.158.0/23",
                         "158.98.29.0/24",
                         "62.186.253.0/24",
                         "129.39.33.0/24",
                         "129.39.134.182",
                         "10.159.156.0/24",
                         "129.39.215.0/24",
                         "194.10.157.0/24",
                         "62.185.45.0/24",
                         "158.98.90.0/23",
                         "167.210.72.6",
                         "10.159.145.0/24",
                         "9.87.62.49",
                         "100.112.10.0/24",
                         "158.98.137.0/26",
                         "193.149.209.0/24",
                         "10.159.157.0/24",
                         "129.39.50.109",
                         "100.112.135.48/28",
                         "158.98.80.0/24",
                         "100.112.13.224/28",
                         "158.98.85.0/24",
                         "167.210.72.7",
                         "100.112.12.48/29",
                         "158.98.74.192/28",
                         "158.98.225.0/24",
                         "158.98.137.224/27",
                         "10.172.86.47",
                         "158.98.148.0/24",
                         "129.39.136.0/24",
                         "129.39.40.0/24",
                         "100.112.13.64/28",
                         "193.149.210.0/24",
                         "158.98.73.128/25",
                         "158.98.133.20",
                         "10.173.195.0/26",
                         "129.39.32.0/24",
                         "129.39.210.0/24",
                         "158.98.132.0/24",
                         "62.186.38.128/25",
                         "9.87.99.42",
                         "10.159.151.0/24",
                         "158.98.74.224/27",
                         "100.112.135.128/26",
                         "100.112.135.64/28",
                         "158.98.240.47",
                         "9.87.63.8",
                         "10.149.12.128/25",
                         "167.210.72.5",
                         "158.98.92.0/24",
                         "195.79.87.160/28",
                         "100.102.0.0/24",
                         "129.39.147.0/24",
                         "158.98.74.160/28",
                         "158.98.28.0/24",
                         "158.98.76.0/24",
                         "129.39.38.0/24",
                         "9.87.99.43",
                         "100.112.12.240/28",
                         "167.210.72.4",
                         "84.94.222.21",
                         "62.187.181.0/24",
                         "100.112.135.32/28",
                         "141.171.11.0/24",
                         "192.168.24.12",
                         "62.185.41.64/27",
                         "195.79.87.152/29",
                         "84.94.222.17",
                         "158.98.89.0/24",
                         "141.171.30.0/24",
                         "141.171.252.0/24",
                         "141.171.10.0/24",
                         "194.194.26.0/24",
                         "62.186.40.0/22",
                         "62.185.44.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esbk8"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esbk8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.215"
]
      }
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-ASPAC"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-ASPAC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.104.0/24",
                         "100.84.137.16/29",
                         "130.103.183.0/24",
                         "129.39.118.0/27",
                         "167.210.56.0/24",
                         "129.39.126.152/29",
                         "10.190.34.139",
                         "158.98.24.0/24",
                         "158.98.101.0/24",
                         "158.98.249.0/24",
                         "158.99.123.0/24",
                         "158.98.99.0/24",
                         "158.98.112.0/24",
                         "158.98.248.0/24",
                         "158.98.103.0/24",
                         "10.197.113.119",
                         "129.39.100.0/25",
                         "158.98.226.0/24",
                         "9.190.232.22",
                         "158.98.22.0/24",
                         "146.89.241.0/24",
                         "129.39.110.0/25",
                         "158.98.19.0/24",
                         "158.98.21.0/24",
                         "100.87.130.16/29",
                         "129.39.112.0/24",
                         "158.98.119.0/24",
                         "129.39.109.0/24",
                         "130.103.160.62",
                         "100.84.145.16/29",
                         "10.0.148.12",
                         "129.42.151.0/24",
                         "158.98.106.0/24",
                         "202.81.23.146",
                         "158.98.97.0/24",
                         "100.84.129.16/29",
                         "202.81.24.112",
                         "158.98.102.0/24",
                         "129.39.125.0/24",
                         "129.39.126.192/27",
                         "129.39.122.64/27",
                         "129.39.111.0/25",
                         "9.182.116.205",
                         "158.98.104.0/24",
                         "158.98.98.0/24",
                         "158.98.229.0/24",
                         "158.99.40.115",
                         "158.98.18.0/24",
                         "158.98.122.0/24",
                         "129.39.115.0/24",
                         "129.39.124.0/24",
                         "129.39.103.0/24",
                         "158.98.100.0/24",
                         "130.103.181.0/25",
                         "130.103.180.0/24",
                         "9.190.232.34",
                         "158.99.124.0/24",
                         "100.90.41.16/29",
                         "129.42.147.0/24",
                         "158.98.230.0/24",
                         "202.81.17.129",
                         "158.98.250.0/24",
                         "100.87.98.16/29",
                         "10.191.48.151",
                         "130.103.160.61",
                         "158.98.251.0/24",
                         "158.98.20.0/24",
                         "100.84.153.16/29",
                         "9.182.116.206",
                         "129.39.117.0/24",
                         "158.98.252.0/24",
                         "158.98.113.237",
                         "158.98.25.0/24",
                         "158.98.23.0/24",
                         "100.80.8.134",
                         "129.39.127.0/24",
                         "129.39.120.0/26",
                         "9.182.116.207"
]
      }
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1eascdb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1eascdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-EU1-IPSET-SRES-eu1srwnbassql"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srwnbassql"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.41"
]
      }
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-NA"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-NA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.52.0/25",
                         "129.39.208.0/24",
                         "10.21.198.139",
                         "206.75.101.64/28",
                         "167.210.8.0/25",
                         "10.23.95.231",
                         "129.39.196.160/28",
                         "129.39.193.192/26",
                         "206.75.96.0/24",
                         "10.28.170.139",
                         "129.39.248.0/24",
                         "129.39.210.0/24",
                         "129.39.205.128/25",
                         "129.39.207.224/27",
                         "206.75.100.0/24",
                         "129.39.196.128/28",
                         "10.29.188.229",
                         "129.39.214.128/25",
                         "10.23.95.13",
                         "192.91.193.240/28",
                         "192.91.193.0/27",
                         "129.39.215.0/24",
                         "10.28.170.140",
                         "129.39.204.0/26",
                         "129.39.198.0/24",
                         "10.21.38.53",
                         "206.75.97.240/28",
                         "10.23.140.88",
                         "167.210.53.128/28",
                         "167.210.9.128/28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-EU1-IPSET-CPREM-DRES280-EY-SL1-Collectors"
   nsx_id = "TF-EU1-IPSET-CPREM-DRES280-EY-SL1-Collectors"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.152.138.61-10.152.138.62",
                         "10.146.214.91-10.146.214.92",
                         "10.151.139.191-10.151.139.193",
                         "10.174.104.51-10.174.104.53",
                         "10.226.100.61-10.226.100.63"
]
      }
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-EU1-IPSET-DA-JP-MEI-jbp11h-100-87-2-92-"
   nsx_id = "TF-EU1-IPSET-DA-JP-MEI-jbp11h-100-87-2-92-"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.2.92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esc2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.208"
]
      }
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-87-130-195"
   nsx_id = "TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-87-130-195"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.130.195"
]
      }
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1eascno"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1eascno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.236"
]
      }
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpabcmstr"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpabcmstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.115"
]
      }
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdhapxy2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdhapxy2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.207"
]
      }
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-EU1-IPSET-IN1-SRES-POC"
   nsx_id = "TF-EU1-IPSET-IN1-SRES-POC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.157"
]
      }
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1eascni"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1eascni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.238"
]
      }
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-EU1-IPSET-DA-JP-FNL-KAJMPAPP01-158-98-100-133"
   nsx_id = "TF-EU1-IPSET-DA-JP-FNL-KAJMPAPP01-158-98-100-133"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.100.133"
]
      }
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt5"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.49"
]
      }
   }
}
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epwg2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epwg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.144"
]
      }
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecni3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecni3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.165"
]
      }
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpgacdwut01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpgacdwut01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-EU1-IPSET-ICD-MAXIMO-ESLSX"
   nsx_id = "TF-EU1-IPSET-ICD-MAXIMO-ESLSX"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.218",
                         "146.89.184.103",
                         "146.89.187.197",
                         "146.89.184.82",
                         "146.89.151.235"
]
      }
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-EU1-IPSET-DR20-BGE-Datacenter-CPREM-Networks"
   nsx_id = "TF-EU1-IPSET-DR20-BGE-Datacenter-CPREM-Networks"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.67.86.0/23",
                         "10.67.108.0/22",
                         "10.66.84.0/22",
                         "10.66.202.0/23",
                         "10.66.88.0/22",
                         "10.67.112.0/22",
                         "10.67.222.0/23",
                         "10.67.228.0/22",
                         "10.67.232.0/22",
                         "10.66.124.0/23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epnp3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epnp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.170"
]
      }
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-EU1-IPSET-DA-JP-FNS-mmsjmp02-100-87-34-190"
   nsx_id = "TF-EU1-IPSET-DA-JP-FNS-mmsjmp02-100-87-34-190"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.34.190"
]
      }
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-EU1-IPSET-DRES332-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES332-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.238.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1staas17"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1staas17"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.48"
]
      }
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-EU1-IPSET-DR62-CACF-VIP"
   nsx_id = "TF-EU1-IPSET-DR62-CACF-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.162.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-EU1-IPSET-DR240-ESG-vNic_2"
   nsx_id = "TF-EU1-IPSET-DR240-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.9.217"
]
      }
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-EU1-IPSET-SRES-nlaspdb000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspdb000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejtnp2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejtnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-CALA"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-CALA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.223.4.3",
                         "129.39.175.32/29",
                         "9.7.2.55",
                         "129.39.177.0/24",
                         "129.39.172.0/24",
                         "9.8.68.12",
                         "158.98.58.0/24",
                         "167.210.80.0/24",
                         "129.39.170.0/23",
                         "158.98.50.0/24",
                         "129.39.82.0/24",
                         "129.39.168.0/24",
                         "158.98.15.0/24",
                         "129.39.180.0/24",
                         "129.39.175.200/31",
                         "129.39.87.0/24",
                         "129.39.166.0/24",
                         "129.39.175.0/24",
                         "9.8.68.11",
                         "192.168.254.249",
                         "129.39.55.0/24",
                         "158.98.5.0/24",
                         "129.39.176.0/24",
                         "158.98.54.0/24",
                         "129.39.174.0/24",
                         "129.39.81.0/24",
                         "129.39.181.0/24",
                         "158.98.14.0/24",
                         "9.8.131.128/26",
                         "149.131.150.0/24",
                         "129.39.164.0/24",
                         "158.98.51.0/24",
                         "158.98.57.0/24",
                         "129.39.165.0/24",
                         "129.39.183.0/24",
                         "129.39.80.0/24",
                         "158.98.52.0/24",
                         "129.39.167.0/24",
                         "158.98.48.0/24",
                         "158.98.53.0/24",
                         "167.210.81.0/24",
                         "129.39.73.0/24",
                         "149.131.151.0/24",
                         "149.131.148.0/24",
                         "149.131.156.0/23",
                         "129.39.83.0/24",
                         "158.98.7.0/24",
                         "192.168.254.252",
                         "158.98.59.0/24",
                         "158.98.4.0/24",
                         "149.131.149.0/24",
                         "129.39.86.0/24",
                         "158.98.60.0/24",
                         "158.98.55.0/24",
                         "158.98.56.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdjenkns"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdjenkns"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.208"
]
      }
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-EU1-IPSET-DR328-LB-VIP1-NAT"
   nsx_id = "TF-EU1-IPSET-DR328-LB-VIP1-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-EU1-IPSET-SRES-eu1srltm1eslc"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srltm1eslc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdansdb1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdansdb1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.204"
]
      }
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcacfbds1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcacfbds1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.225"
]
      }
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-EU1-IPSET-DA-JP-TDS-SSORJH01-100-87-130-226"
   nsx_id = "TF-EU1-IPSET-DA-JP-TDS-SSORJH01-100-87-130-226"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.130.226"
]
      }
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-EU1-IPSET-IRES-SPLUNK-HF-VIP-NAT"
   nsx_id = "TF-EU1-IPSET-IRES-SPLUNK-HF-VIP-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.68.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-EU1-IPSET-AG1-DR217-LB-VIPs-NAT"
   nsx_id = "TF-EU1-IPSET-AG1-DR217-LB-VIPs-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.185.243",
                         "100.64.185.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-EU1-IPSET-SRES-nlaspni000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspni000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.53"
]
      }
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-EU1-IPSET-AG1-SRES-SRM-PROD"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-SRM-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.221",
                         "158.87.49.220",
                         "158.87.49.230",
                         "158.87.49.217",
                         "158.87.49.224",
                         "158.87.49.227",
                         "158.87.49.226",
                         "158.87.49.219",
                         "158.87.49.228",
                         "158.87.49.215",
                         "158.87.49.229",
                         "158.87.49.225",
                         "158.87.49.222",
                         "158.87.49.218",
                         "158.87.49.223",
                         "158.87.49.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1easpno"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1easpno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.235"
]
      }
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdhapxy1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdhapxy1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.206"
]
      }
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejcdb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejcdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-EU1-IPSET-DR240-LB-VIP1-NAT"
   nsx_id = "TF-EU1-IPSET-DR240-LB-VIP1-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-EU1-IPSET-DA-BES-shnisap1-100-105-20-9n"
   nsx_id = "TF-EU1-IPSET-DA-BES-shnisap1-100-105-20-9n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.105.20.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-EU1-IPSET-DA-JP-NRK-rmnansa1-100-87-2-240-100-87-2-240"
   nsx_id = "TF-EU1-IPSET-DA-JP-NRK-rmnansa1-100-87-2-240-100-87-2-240"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.2.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-EU1-IPSET-SDE_Milano_APICs"
   nsx_id = "TF-EU1-IPSET-SDE_Milano_APICs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.102.14.129",
                         "100.102.14.193",
                         "100.102.14.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD10018D3013-100-107-10-4"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD10018D3013-100-107-10-4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esldc1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esldc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-EU1-IPSET-DR328-LB-VIP1"
   nsx_id = "TF-EU1-IPSET-DR328-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.233.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-EU1-IPSET-SRES-nlascni000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlascni000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.54"
]
      }
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpmpcansb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpmpcansb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.34"
]
      }
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-EU1-IPSET-SRES-nlaspno000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspno000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-EU1-IPSET-GNPP-CIO_DNS_KPOP"
   nsx_id = "TF-EU1-IPSET-GNPP-CIO_DNS_KPOP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "142.88.130.104",
                         "142.88.132.106",
                         "142.88.133.104",
                         "130.103.1.30",
                         "142.88.129.104",
                         "142.88.132.104",
                         "142.88.131.106",
                         "142.88.131.104",
                         "130.103.1.31",
                         "142.88.135.104",
                         "142.88.128.106",
                         "142.88.134.104",
                         "142.88.129.106",
                         "142.88.133.106",
                         "142.88.130.106",
                         "142.88.135.106",
                         "142.88.134.106",
                         "142.88.128.104"
]
      }
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecni2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecni2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.143"
]
      }
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-EU1-IPSET-GNPP-SATHC-EU"
   nsx_id = "TF-EU1-IPSET-GNPP-SATHC-EU"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.208.0/24",
                         "129.39.147.0/24",
                         "129.39.210.0/24",
                         "158.98.106.0/24",
                         "158.98.226.0/24",
                         "194.194.213.0/24",
                         "158.98.124.0/24",
                         "194.194.26.0/24",
                         "129.39.126.0/24",
                         "158.98.122.0/24",
                         "129.39.122.0/24",
                         "129.39.215.0/24",
                         "129.39.127.0/24",
                         "158.98.92.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1easbcp"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1easbcp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-US-2"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-US-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.44.58.141",
                         "167.210.249.160/27",
                         "9.56.252.103",
                         "9.45.76.13",
                         "167.210.243.224/27",
                         "9.45.114.25",
                         "129.42.64.0/19",
                         "167.210.252.128/28",
                         "167.210.244.128/27",
                         "9.51.106.75",
                         "167.210.237.96/27",
                         "167.210.245.128/26",
                         "167.210.218.0/28",
                         "167.210.250.24/29",
                         "9.252.0.0/16",
                         "100.124.120.128/28",
                         "100.124.74.128/28",
                         "167.210.241.32/28",
                         "167.210.241.0/28",
                         "100.124.7.128/28",
                         "167.210.241.240/28",
                         "9.17.137.23",
                         "9.58.132.186",
                         "9.45.75.11",
                         "167.210.216.72/29",
                         "167.210.219.0/24",
                         "167.210.249.240/28",
                         "167.210.241.192/28",
                         "167.210.242.32/27",
                         "129.42.104.0/21",
                         "129.42.128.0/19",
                         "167.210.248.192/28",
                         "129.42.112.0/20",
                         "167.210.240.62/26",
                         "167.210.248.224/28",
                         "167.210.216.96/27",
                         "167.210.216.160/27",
                         "9.253.0.0/16",
                         "167.210.234.0/23",
                         "100.124.0.128/28",
                         "167.210.204.64/28",
                         "170.225.28.32/27",
                         "167.210.244.32/27",
                         "167.210.240.192/26",
                         "167.210.249.0/28",
                         "170.225.28.192/26",
                         "9.255.0.0/16",
                         "167.210.249.64/28",
                         "167.210.242.64/27",
                         "167.210.249.48/28",
                         "167.210.252.0/25",
                         "9.254.0.0/16",
                         "167.210.246.80/29",
                         "167.210.237.64/27",
                         "167.210.237.32/27",
                         "167.210.250.0/29",
                         "167.210.230.0/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-EU1-IPSET-BLUEIDP1-zkpw3uspriv-app-kyndryl-net-138-95-240-6"
   nsx_id = "TF-EU1-IPSET-BLUEIDP1-zkpw3uspriv-app-kyndryl-net-138-95-240-6"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.240.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-EU1-IPSET-SRES-nlascni000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlascni000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-107-10-7"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-107-10-7"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD1001860002-100-107-10-3"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD1001860002-100-107-10-3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-EU1-IPSET-SRES-lmt-wizard"
   nsx_id = "TF-EU1-IPSET-SRES-lmt-wizard"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.226"
]
      }
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecdb3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecdb3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.169"
]
      }
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-EU1-IPSET-DA-JP-NRK-hmnansa1-100-87-2-241-100-87-2-241"
   nsx_id = "TF-EU1-IPSET-DA-JP-NRK-hmnansa1-100-87-2-241-100-87-2-241"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.2.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-EU1-IPSET-DR276-CPREM-BDS"
   nsx_id = "TF-EU1-IPSET-DR276-CPREM-BDS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.231.142.22-10.231.142.23",
                         "10.221.142.22-10.221.142.23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_184" {
   display_name = "TF-EU1-IPSET-SRES-eu1srljmp02"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srljmp02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_185" {
   display_name = "TF-EU1-IPSET-VDR2-LB-VIP1"
   nsx_id = "TF-EU1-IPSET-VDR2-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.70.14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_186" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlptocdb03"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlptocdb03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.128"
]
      }
   }
}
resource "nsxt_policy_group" "grp_187" {
   display_name = "TF-EU1-IPSET-SDE_Montpellier_APICs"
   nsx_id = "TF-EU1-IPSET-SDE_Montpellier_APICs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.100.120.6",
                         "100.100.120.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_188" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1etnp1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1etnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.155"
]
      }
   }
}
resource "nsxt_policy_group" "grp_189" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1staas15"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1staas15"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.46"
]
      }
   }
}
resource "nsxt_policy_group" "grp_190" {
   display_name = "TF-EU1-IPSET-DA-JP-SBN-ttsojh01-100-87-130-192"
   nsx_id = "TF-EU1-IPSET-DA-JP-SBN-ttsojh01-100-87-130-192"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.130.192"
]
      }
   }
}
resource "nsxt_policy_group" "grp_191" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-US-1"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-US-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.224.216/29",
                         "129.39.17.80/29",
                         "129.39.59.88/29",
                         "167.210.160.64/29",
                         "129.39.240.192/29",
                         "129.39.94.160/27",
                         "10.11.7.16",
                         "129.39.233.64/27",
                         "167.210.161.0/26",
                         "129.39.254.0/24",
                         "167.210.169.0/26",
                         "167.210.153.96/28",
                         "167.210.203.160/28",
                         "129.39.227.224/27",
                         "129.39.8.64/28",
                         "129.39.27.64/28",
                         "167.210.167.64/28",
                         "167.210.123.112/28",
                         "167.210.123.48/28",
                         "167.210.152.0/27",
                         "167.210.153.0/27",
                         "149.131.26.0/25",
                         "167.210.152.112/28",
                         "129.39.56.0/25",
                         "167.210.115.80/28",
                         "129.39.59.48/28",
                         "129.39.14.0/26",
                         "167.210.179.224/28",
                         "167.210.0.0/23",
                         "129.39.224.40/29",
                         "167.210.200.0/24",
                         "10.6.36.106",
                         "158.98.9.128/25",
                         "158.87.6.0/24",
                         "129.33.203.0/28",
                         "167.210.152.192/28",
                         "129.39.57.224/29",
                         "167.210.167.160/28",
                         "167.210.167.16/29",
                         "129.39.12.128/25",
                         "129.39.237.0/27",
                         "129.39.240.80/28",
                         "167.210.175.192/26",
                         "129.39.241.48/29",
                         "129.39.8.192/27",
                         "129.39.11.0/28",
                         "129.39.235.64/29",
                         "167.210.160.192/27",
                         "129.39.57.32/27",
                         "129.39.16.0/24",
                         "129.39.22.136/29",
                         "129.39.29.96/28",
                         "129.39.23.0/25",
                         "129.39.252.0/23",
                         "167.210.157.160/27",
                         "167.210.203.208/28",
                         "10.34.37.22",
                         "167.210.157.144/28",
                         "129.39.22.168/29",
                         "129.39.235.120/29",
                         "167.210.152.64/28",
                         "167.210.114.0/25",
                         "167.210.157.96/28",
                         "167.210.199.0/25",
                         "167.210.153.192/26",
                         "167.210.175.128/26",
                         "129.39.92.112/28",
                         "129.39.231.64/27",
                         "129.39.93.0/26",
                         "167.210.203.0/29",
                         "167.210.123.16/29",
                         "129.39.237.160/27",
                         "167.210.123.144/29",
                         "149.131.26.192/28",
                         "167.210.156.0/24",
                         "167.210.123.128/28",
                         "129.39.250.0/24",
                         "167.210.153.64/27",
                         "129.39.95.0/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_192" {
   display_name = "TF-EU1-IPSET-DR240-LB-VIP1"
   nsx_id = "TF-EU1-IPSET-DR240-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.127.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_193" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcishfds1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcishfds1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.123"
]
      }
   }
}
resource "nsxt_policy_group" "grp_194" {
   display_name = "TF-EU1-IPSET-VDR2-ESG-vNic_0"
   nsx_id = "TF-EU1-IPSET-VDR2-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.64.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_195" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.160"
]
      }
   }
}
resource "nsxt_policy_group" "grp_196" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_197" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejpni"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejpni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_198" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.202"
]
      }
   }
}
resource "nsxt_policy_group" "grp_199" {
   display_name = "TF-EU1-IPSET-IRES-eu1irsplnkhf01-NAT"
   nsx_id = "TF-EU1-IPSET-IRES-eu1irsplnkhf01-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.68.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_200" {
   display_name = "TF-EU1-IPSET-SRES-nlascdb000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlascdb000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.56"
]
      }
   }
}
resource "nsxt_policy_group" "grp_201" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.171"
]
      }
   }
}
resource "nsxt_policy_group" "grp_202" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpdefmstr"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpdefmstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.119"
]
      }
   }
}
resource "nsxt_policy_group" "grp_203" {
   display_name = "TF-EU1-IPSET-DR240-ESG-vNic_0"
   nsx_id = "TF-EU1-IPSET-DR240-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.64.160"
]
      }
   }
}
resource "nsxt_policy_group" "grp_204" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epni2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epni2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_205" {
   display_name = "TF-EU1-IPSET-AG1-SRES-PSRMVMs"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-PSRMVMs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.215-158.87.49.230"
]
      }
   }
}
resource "nsxt_policy_group" "grp_206" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epwg3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epwg3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.166"
]
      }
   }
}
resource "nsxt_policy_group" "grp_207" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1easpdb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1easpdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_208" {
   display_name = "TF-EU1-IPSET-DA-JP-NXI-100-87-2-221-100-87-162-60-100-87-162-61-100-87-162-62"
   nsx_id = "TF-EU1-IPSET-DA-JP-NXI-100-87-2-221-100-87-162-60-100-87-162-61-100-87-162-62"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.162.60",
                         "100.87.162.60-100.87.162.62",
                         "100.87.162.62",
                         "100.87.162.61",
                         "100.87.2.221"
]
      }
   }
}
resource "nsxt_policy_group" "grp_209" {
   display_name = "TF-EU1-IPSET-SRES-eu1srltm1esdp"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srltm1esdp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.35"
]
      }
   }
}
resource "nsxt_policy_group" "grp_210" {
   display_name = "TF-EU1-IPSET-DA-JP-FNS-mmsjmp01-100-87-34-189"
   nsx_id = "TF-EU1-IPSET-DA-JP-FNS-mmsjmp01-100-87-34-189"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.34.189"
]
      }
   }
}
resource "nsxt_policy_group" "grp_211" {
   display_name = "TF-EU1-IPSET-VDR2-LB-VIP2"
   nsx_id = "TF-EU1-IPSET-VDR2-LB-VIP2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.70.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_212" {
   display_name = "TF-EU1-IPSET-SRES-eu1srltm1eslc2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srltm1eslc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_213" {
   display_name = "TF-EU1-IPSET-SRES-nlascno000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlascno000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_214" {
   display_name = "TF-EU1-IPSET-DA-JP-REA-H031S3448-100-87-98-195"
   nsx_id = "TF-EU1-IPSET-DA-JP-REA-H031S3448-100-87-98-195"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.98.195"
]
      }
   }
}
resource "nsxt_policy_group" "grp_215" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epnp2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.148"
]
      }
   }
}
resource "nsxt_policy_group" "grp_216" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejpwg"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejpwg"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_217" {
   display_name = "TF-EU1-IPSET-IRES-eu1irsplnkhf02-NAT"
   nsx_id = "TF-EU1-IPSET-IRES-eu1irsplnkhf02-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.68.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_218" {
   display_name = "TF-EU1-IPSET-SRES-nlaspni000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspni000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_219" {
   display_name = "TF-EU1-IPSET-DR240-CPREM-SL1-COLLECTOR"
   nsx_id = "TF-EU1-IPSET-DR240-CPREM-SL1-COLLECTOR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.31.1.146-172.31.1.148"
]
      }
   }
}
resource "nsxt_policy_group" "grp_220" {
   display_name = "TF-EU1-IPSET-SRES-nlaspnw000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspnw000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_221" {
   display_name = "TF-EU1-IPSET-HOSTS-GACDW-ISIM-France-tools"
   nsx_id = "TF-EU1-IPSET-HOSTS-GACDW-ISIM-France-tools"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.74.13-129.39.74.14",
                         "129.39.133.227-129.39.133.228",
                         "129.39.74.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_222" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlphstp1ncl"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlphstp1ncl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_223" {
   display_name = "TF-EU1-IPSET-SRES-nlaspnp000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspnp000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_224" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epdb2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.146"
]
      }
   }
}
resource "nsxt_policy_group" "grp_225" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.145"
]
      }
   }
}
resource "nsxt_policy_group" "grp_226" {
   display_name = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-87-98-240"
   nsx_id = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-87-98-240"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.98.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_227" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejcwg"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejcwg"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_228" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.203"
]
      }
   }
}
resource "nsxt_policy_group" "grp_229" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlptena1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlptena1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.231"
]
      }
   }
}
resource "nsxt_policy_group" "grp_230" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlPtmmch"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlPtmmch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_231" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epno2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epno2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_232" {
   display_name = "TF-EU1-IPSET-DR328-ESG-vNic_1"
   nsx_id = "TF-EU1-IPSET-DR328-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.13.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_233" {
   display_name = "TF-EU1-IPSET-DA-JP-FNS-bmsjmp01-100-87-98-213"
   nsx_id = "TF-EU1-IPSET-DA-JP-FNS-bmsjmp01-100-87-98-213"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.98.213"
]
      }
   }
}
resource "nsxt_policy_group" "grp_234" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt0"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_235" {
   display_name = "TF-EU1-IPSET-EU-DR62-eu1d62prkebcdm-VIP"
   nsx_id = "TF-EU1-IPSET-EU-DR62-eu1d62prkebcdm-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.162.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_236" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-107-10-7n"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-107-10-7n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_237" {
   display_name = "TF-EU1-IPSET-DA-ShJH-FSS-ilp-j100-66-50-30"
   nsx_id = "TF-EU1-IPSET-DA-ShJH-FSS-ilp-j100-66-50-30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.66.50.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_238" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlptocdb02"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlptocdb02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.127"
]
      }
   }
}
resource "nsxt_policy_group" "grp_239" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-2"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.156.108.115",
                         "129.39.51.0/24",
                         "194.194.213.0/24",
                         "9.156.112.0/24",
                         "109.236.185.0/24",
                         "129.39.148.0/24",
                         "158.87.185.225",
                         "129.39.143.144/28",
                         "158.98.232.176/29",
                         "158.98.77.0/24",
                         "158.98.233.224/27",
                         "85.89.244.112/29",
                         "158.98.226.0/24",
                         "85.89.226.112/29",
                         "100.96.128.95",
                         "158.87.144.0/24",
                         "158.98.146.0/24",
                         "100.98.249.0/24",
                         "10.212.194.12",
                         "129.39.79.48/28",
                         "109.236.184.0/24",
                         "9.165.152.20",
                         "85.89.236.0/24",
                         "193.27.75.0/24",
                         "129.39.53.0/24",
                         "100.98.252.0/24",
                         "85.89.228.0/24",
                         "100.98.246.0/24",
                         "129.39.50.0/24",
                         "100.124.74.120",
                         "158.98.106.0/24",
                         "100.98.248.0/24",
                         "129.39.141.128/26",
                         "100.96.128.96",
                         "149.131.228.0/24",
                         "85.89.247.0/24",
                         "129.39.52.0/24",
                         "129.39.79.0/27",
                         "158.98.224.0/24",
                         "9.156.107.115",
                         "100.96.188.0/24",
                         "100.98.14.233",
                         "129.39.54.7",
                         "158.98.124.0/24",
                         "192.168.255.2",
                         "158.98.247.0/25",
                         "129.39.141.32/27",
                         "158.98.122.0/24",
                         "158.98.31.0/24",
                         "100.98.253.0/24",
                         "158.98.92.0/24",
                         "158.98.247.128/25",
                         "109.236.183.0/27",
                         "158.98.158.0/24",
                         "85.89.225.0/24",
                         "85.89.245.0/24",
                         "100.98.243.0/24",
                         "129.39.79.32/28",
                         "158.98.68.0/24",
                         "158.98.82.0/24",
                         "9.165.152.21",
                         "129.39.142.32/28",
                         "109.236.183.96/28",
                         "158.98.143.0/24",
                         "158.98.47.0/24",
                         "129.39.149.0/24",
                         "129.39.76.0/24",
                         "158.98.130.0/24",
                         "85.89.231.48/29",
                         "129.39.126.0/24",
                         "100.124.74.121",
                         "129.39.122.0/24",
                         "10.212.193.11",
                         "129.39.39.0/24",
                         "158.98.156.0/24",
                         "158.98.149.0/24",
                         "193.24.115.92",
                         "194.194.26.0/24",
                         "129.39.127.0/24",
                         "9.165.153.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_240" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1staas16"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1staas16"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.47"
]
      }
   }
}
resource "nsxt_policy_group" "grp_241" {
   display_name = "TF-EU1-IPSET-DR328-ESG-vNic_2"
   nsx_id = "TF-EU1-IPSET-DR328-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.13.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_242" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.230"
]
      }
   }
}
resource "nsxt_policy_group" "grp_243" {
   display_name = "TF-EU1-IPSET-DA-JP-MRT-m0iainfra01-100-87-98-161"
   nsx_id = "TF-EU1-IPSET-DA-JP-MRT-m0iainfra01-100-87-98-161"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.98.161"
]
      }
   }
}
resource "nsxt_policy_group" "grp_244" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-SDDC"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-SDDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.100.120.0/22",
                         "100.107.248.0/21",
                         "100.109.128.0/21",
                         "100.108.128.0/21",
                         "100.113.128.0/21",
                         "100.96.192.0/23",
                         "100.102.14.0/23",
                         "100.107.240.0/21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_245" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdjump"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdjump"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_246" {
   display_name = "TF-EU1-IPSET-DR240-ESG-vNic_1"
   nsx_id = "TF-EU1-IPSET-DR240-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.9.210"
]
      }
   }
}
resource "nsxt_policy_group" "grp_247" {
   display_name = "TF-EU1-IPSET-DA-BVP-lppbfx301-100-105-20-106"
   nsx_id = "TF-EU1-IPSET-DA-BVP-lppbfx301-100-105-20-106"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.105.20.106"
]
      }
   }
}
resource "nsxt_policy_group" "grp_248" {
   display_name = "TF-EU1-IPSET-SRES-nlascno000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlascno000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_249" {
   display_name = "TF-EU1-IPSET-DA-JP-MEI-jbp21h-100-87-2-99-"
   nsx_id = "TF-EU1-IPSET-DA-JP-MEI-jbp21h-100-87-2-99-"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.2.99"
]
      }
   }
}
resource "nsxt_policy_group" "grp_250" {
   display_name = "TF-EU1-IPSET-SRES-eu1srltm1esdc"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srltm1esdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.36"
]
      }
   }
}
resource "nsxt_policy_group" "grp_251" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1staas14"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1staas14"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.45"
]
      }
   }
}
resource "nsxt_policy_group" "grp_252" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejtnp1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejtnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_253" {
   display_name = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-87-130-164"
   nsx_id = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-87-130-164"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.130.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_254" {
   display_name = "TF-EU1-IPSET-DA-BCP-lpar7r7-100-105-20-60n"
   nsx_id = "TF-EU1-IPSET-DA-BCP-lpar7r7-100-105-20-60n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.105.20.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_255" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epdb3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epdb3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.168"
]
      }
   }
}
resource "nsxt_policy_group" "grp_256" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD10018E0007-100-107-10-5"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD10018E0007-100-107-10-5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_257" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1easweb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1easweb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.239"
]
      }
   }
}
#####################################
# EMPTY GROUPS
#
# Migration date: 07/18/2023 14:12
# Geography.....: EU1 
# Wave..........: eu_sres_wave4
#####################################


# Nothing to migrate#####################################
# SGEM GROUPS
#
# Migration date: 07/18/2023 14:12
# Geography.....: EU1 
# Wave..........: eu_sres_wave4
#####################################
resource "nsxt_policy_group" "grp_258" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascni000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascni000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascni000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascni000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_259" {
   display_name = "TF-EU1-SG-SRES-HOST-lmt-wizard"
   nsx_id = "TF-EU1-SG-SRES-HOST-lmt-wizard"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "lmt-wizard"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-lmt-wizard"
]
      }
   }
}
resource "nsxt_policy_group" "grp_260" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_261" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_262" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpno"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1easpno"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1easpno"
]
      }
   }
}
resource "nsxt_policy_group" "grp_263" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epwg3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epwg3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epwg3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epwg3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_264" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpdb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1easpdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1easpdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_265" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt0"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_266" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecnp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_267" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecwg3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecwg3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_268" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecwg2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecwg2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_269" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlphstp1ncl"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlphstp1ncl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlphstp1ncl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlphstp1ncl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_270" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcni"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejcni"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejcni"
]
      }
   }
}
resource "nsxt_policy_group" "grp_271" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpni"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejpni"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejpni"
]
      }
   }
}
resource "nsxt_policy_group" "grp_272" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esldc1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esldc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esldc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esldc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_273" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcwg"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcwg"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejcwg"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejcwg"
]
      }
   }
}
resource "nsxt_policy_group" "grp_274" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epni2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epni2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epni2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epni2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_275" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejtnp1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejtnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejtnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejtnp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_276" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlPdshbrd"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlPdshbrd"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlPdshbrd"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlPdshbrd"
]
      }
   }
}
resource "nsxt_policy_group" "grp_277" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecni2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecni2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecni2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecni2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_278" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1staas15"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1staas15"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1staas15"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1staas15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_279" {
   display_name = "TF-EU1-SG-DR62-lpecnsdc"
   nsx_id = "TF-EU1-SG-DR62-lpecnsdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc4",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_280" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspnw000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspnw000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspnw000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspnw000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_281" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecno2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecno2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecno2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecno2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_282" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epno3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epno3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epno3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epno3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_283" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascdb000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascdb000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascdb000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascdb000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_284" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpni"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1easpni"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1easpni"
]
      }
   }
}
resource "nsxt_policy_group" "grp_285" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdhapxy2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdhapxy2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdhapxy2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdhapxy2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_286" {
   display_name = "TF-EU1-SG-SRES-MnEaaS-PRTG-SHR"
   nsx_id = "TF-EU1-SG-SRES-MnEaaS-PRTG-SHR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epnp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecnp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpm1epnp2",
                         "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp2",
                         "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp3",
                         "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpm1epnp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_287" {
   display_name = "TF-EU1-SG-DR62-JumpHost-NTP"
   nsx_id = "TF-EU1-SG-DR62-JumpHost-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpprkjmp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpprkjmp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_288" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpabcmstr"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpabcmstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpabcmstr"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpabcmstr"
]
      }
   }
}
resource "nsxt_policy_group" "grp_289" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecno3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecno3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecno3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecno3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_290" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srltm1esdc"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srltm1esdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srltm1esdc"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srltm1esdc"
]
      }
   }
}
resource "nsxt_policy_group" "grp_291" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascno"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1eascno"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1eascno"
]
      }
   }
}
resource "nsxt_policy_group" "grp_292" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecdb2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecdb2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecdb2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_293" {
   display_name = "TF-EU1-SG-VDR2-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-VDR2-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-VDR2-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-EU1-IPSET-VDR2-ESG-vNic_2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_294" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecwg1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecwg1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_295" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecni3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecni3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecni3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecni3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_296" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1etnp2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1etnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1etnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1etnp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_297" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspni000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspni000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspni000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspni000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_298" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascdb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1eascdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1eascdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_299" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspnp000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspnp000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspnp000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspnp000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_300" {
   display_name = "TF-EU1-SG-DR328-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-DR328-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR328-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR328-ESG-vNic_2",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR328-ESG-vNic_0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_301" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdansdb2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdansdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdansdb2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdansdb2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_302" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdanstw2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdanstw2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_303" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpdefmstr"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpdefmstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1lpdefmstr"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpdefmstr"
]
      }
   }
}
resource "nsxt_policy_group" "grp_304" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlPtmmch"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlPtmmch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlPtmmch"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlPtmmch"
]
      }
   }
}
resource "nsxt_policy_group" "grp_305" {
   display_name = "TF-EU1-SG-DR62-WindowsClients"
   nsx_id = "TF-EU1-SG-DR62-WindowsClients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62wpprkorp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62wpprkorp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_306" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdanstw1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdanstw1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_307" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspno000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspno000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspno000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspno000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_308" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlphsts1ncl"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlphsts1ncl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlphsts1ncl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlphsts1ncl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_309" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecdb3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecdb3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecdb3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecdb3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_310" {
   display_name = "TF-EU1-SG-HOST-SRES-eu1srlngacdwdb"
   nsx_id = "TF-EU1-SG-HOST-SRES-eu1srlngacdwdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlngacdwdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_311" {
   display_name = "TF-EU1-SDE_APIC_Controllers"
   nsx_id = "TF-EU1-SDE_APIC_Controllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SDE_Grabels_APICs",
                         "/infra/domains/default/groups/TF-EU1-IPSET-SDE_Milano_APICs",
                         "/infra/domains/default/groups/TF-EU1-IPSET-SDE_Montpellier_APICs"
]
      }
   }
}
resource "nsxt_policy_group" "grp_312" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epdb2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epdb2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epdb2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_313" {
   display_name = "TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc"
   nsx_id = "TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc4",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_314" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdhapxy1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdhapxy1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdhapxy1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdhapxy1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_315" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk8"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esbk8"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esbk8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_316" {
   display_name = "TF-EU1-SG-HOST-SRES-eu1srlptena1"
   nsx_id = "TF-EU1-SG-HOST-SRES-eu1srlptena1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlptena1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_317" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdexec"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdexec"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdexec"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdexec"
]
      }
   }
}
resource "nsxt_policy_group" "grp_318" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascni000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascni000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascni000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascni000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_319" {
   display_name = "TF-EU1-SG-DR62-eu1d62lpecnsmc"
   nsx_id = "TF-EU1-SG-DR62-eu1d62lpecnsmc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsmc2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsmc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_320" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1staas17"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1staas17"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1staas17"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1staas17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_321" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epnp2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_322" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_323" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascdb000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascdb000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascdb000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascdb000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_324" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejtnp2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejtnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejtnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejtnp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_325" {
   display_name = "TF-EU1-SG-IRES-SPLUNK-HF"
   nsx_id = "TF-EU1-SG-IRES-SPLUNK-HF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-IRES-eu1irsplnkhf01-NAT",
                         "/infra/domains/default/groups/TF-EU1-IPSET-IRES-eu1irsplnkhf02-NAT",
                         "/infra/domains/default/groups/TF-EU1-IPSET-IRES-SPLUNK-HF-VIP-NAT",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1irsplnkhf01",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1irsplnkhf02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_326" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdnexus"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdnexus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdnexus"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdnexus"
]
      }
   }
}
resource "nsxt_policy_group" "grp_327" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdanstw3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdanstw3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_328" {
   display_name = "TF-EU1-SG-SRES-CISO-Splunk-HF"
   nsx_id = "TF-EU1-SG-SRES-CISO-Splunk-HF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpcishfds1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpcishfds2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_329" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspnp000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspnp000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspnp000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspnp000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_330" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srltm1eslc"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srltm1eslc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srltm1eslc"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srltm1eslc"
]
      }
   }
}
resource "nsxt_policy_group" "grp_331" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epnp3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epnp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epnp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_332" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspni000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspni000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspni000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspni000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_333" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1easweb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1easweb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1easweb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1easweb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_334" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esc2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_335" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspno000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspno000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspno000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspno000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_336" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt4"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt4"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_337" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1staas16"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1staas16"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1staas16"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1staas16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_338" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcno"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejcno"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejcno"
]
      }
   }
}
resource "nsxt_policy_group" "grp_339" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpans01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpans01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpans01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_340" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspnw000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspnw000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspnw000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspnw000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_341" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecnp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_342" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1staas14"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1staas14"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1staas14"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1staas14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_343" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epni3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epni3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epni3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epni3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_344" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpcacfbds1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpcacfbds1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpcacfbds1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpcacfbds1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_345" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srltm1esdp"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srltm1esdp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srltm1esdp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srltm1esdp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_346" {
   display_name = "TF-EU1-SG-DR240-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-DR240-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR240-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR240-ESG-vNic_2",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR240-ESG-vNic_1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_347" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt5"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt5"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_348" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdjump"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdjump"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdjump"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdjump"
]
      }
   }
}
resource "nsxt_policy_group" "grp_349" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epno2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epno2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epno2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epno2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_350" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcmssysl"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcmssysl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcmssysl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_351" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdjenkns"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdjenkns"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdjenkns"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdjenkns"
]
      }
   }
}
resource "nsxt_policy_group" "grp_352" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epdb3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epdb3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epdb3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epdb3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_353" {
   display_name = "TF-EU1-SG-DR62-PSN-ISE"
   nsx_id = "TF-EU1-SG-DR62-PSN-ISE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkise1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkise2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_354" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_355" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpwg"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpwg"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejpwg"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejpwg"
]
      }
   }
}
resource "nsxt_policy_group" "grp_356" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpdb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejpdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejpdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_357" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1easbcp"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1easbcp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1easbcp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1easbcp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_358" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascni"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1eascni"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1eascni"
]
      }
   }
}
resource "nsxt_policy_group" "grp_359" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspdb000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspdb000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspdb000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspdb000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_360" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascno000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascno000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascno000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascno000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_361" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpno"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejpno"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejpno"
]
      }
   }
}
resource "nsxt_policy_group" "grp_362" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascno000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascno000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascno000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascno000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_363" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcdb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejcdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejcdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_364" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srltm1eslc2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srltm1eslc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srltm1eslc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srltm1eslc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_365" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1etnp1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1etnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1etnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1etnp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_366" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdansdb1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdansdb1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdansdb1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdansdb1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_367" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epwg2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epwg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epwg2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epwg2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_368" {
   display_name = "TF-EU1-SG-DR62-RestorePoint"
   nsx_id = "TF-EU1-SG-DR62-RestorePoint"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkrp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkrp2"
]
      }
   }
}
#####################################
# DYNAMIC GROUPS
#
# Migration date: 07/18/2023 14:12
# Geography.....: EU1 
# Wave..........: eu_sres_wave4
#####################################
resource "nsxt_policy_group" "grp_369" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpmpcansb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpmpcansb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1lpmpcansb"
      }
   }
}
resource "nsxt_policy_group" "grp_370" {
   display_name = "TF-EU1-SG-PDR-OKTA-ASA-GW"
   nsx_id = "TF-EU1-SG-PDR-OKTA-ASA-GW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "eu1pdr1lpasagw"
      }
   }
}
