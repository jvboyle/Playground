#####################################
# VM GROUPS
#
# Migration date: 06/28/2023 14:37
# Geography.....: EU1 
# Wave..........: eu_sres_wave3
#####################################
resource "nsxt_policy_group" "grp_1" {
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
resource "nsxt_policy_group" "grp_2" {
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
resource "nsxt_policy_group" "grp_3" {
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
resource "nsxt_policy_group" "grp_4" {
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
resource "nsxt_policy_group" "grp_5" {
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
resource "nsxt_policy_group" "grp_6" {
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
resource "nsxt_policy_group" "grp_7" {
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
resource "nsxt_policy_group" "grp_8" {
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
resource "nsxt_policy_group" "grp_9" {
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
resource "nsxt_policy_group" "grp_10" {
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
resource "nsxt_policy_group" "grp_11" {
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
resource "nsxt_policy_group" "grp_12" {
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
resource "nsxt_policy_group" "grp_13" {
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
resource "nsxt_policy_group" "grp_14" {
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
resource "nsxt_policy_group" "grp_15" {
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
resource "nsxt_policy_group" "grp_16" {
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
resource "nsxt_policy_group" "grp_17" {
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
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-EU1-HOST-NLS01POCAATAP01_RITM0152206"
   nsx_id = "TF-EU1-HOST-NLS01POCAATAP01_RITM0152206"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01POCAATAP01_RITM0152206"
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
resource "nsxt_policy_group" "grp_19" {
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
resource "nsxt_policy_group" "grp_20" {
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
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-EU1-HOST-NLS01POCBPTAP01_RITM0152205"
   nsx_id = "TF-EU1-HOST-NLS01POCBPTAP01_RITM0152205"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01POCBPTAP01_RITM0152205"
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
resource "nsxt_policy_group" "grp_22" {
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
resource "nsxt_policy_group" "grp_23" {
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
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-EU1-HOST-NLS01GJPBPDBB14"
   nsx_id = "TF-EU1-HOST-NLS01GJPBPDBB14"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01GJPBPDBB14"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.79.248.91"]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
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
resource "nsxt_policy_group" "grp_26" {
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
resource "nsxt_policy_group" "grp_27" {
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
resource "nsxt_policy_group" "grp_28" {
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
resource "nsxt_policy_group" "grp_29" {
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
resource "nsxt_policy_group" "grp_30" {
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
resource "nsxt_policy_group" "grp_31" {
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
resource "nsxt_policy_group" "grp_32" {
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
resource "nsxt_policy_group" "grp_33" {
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
resource "nsxt_policy_group" "grp_34" {
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
resource "nsxt_policy_group" "grp_35" {
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
resource "nsxt_policy_group" "grp_36" {
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
resource "nsxt_policy_group" "grp_37" {
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
resource "nsxt_policy_group" "grp_38" {
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
resource "nsxt_policy_group" "grp_39" {
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
resource "nsxt_policy_group" "grp_40" {
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
resource "nsxt_policy_group" "grp_41" {
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
resource "nsxt_policy_group" "grp_42" {
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
resource "nsxt_policy_group" "grp_43" {
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
resource "nsxt_policy_group" "grp_44" {
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
resource "nsxt_policy_group" "grp_45" {
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
resource "nsxt_policy_group" "grp_46" {
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
resource "nsxt_policy_group" "grp_47" {
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
resource "nsxt_policy_group" "grp_48" {
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
resource "nsxt_policy_group" "grp_49" {
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
resource "nsxt_policy_group" "grp_50" {
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
resource "nsxt_policy_group" "grp_51" {
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
resource "nsxt_policy_group" "grp_52" {
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
resource "nsxt_policy_group" "grp_53" {
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
resource "nsxt_policy_group" "grp_54" {
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
resource "nsxt_policy_group" "grp_55" {
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
