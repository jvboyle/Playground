#####################################
# VM GROUPS
#
# Migration date: 05/16/2023 13:49
# Geography.....: EU1 
# Wave..........: eu_sres_wave2
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-EU1-HOST-eu1d307lpdantnp1"
   nsx_id = "TF-EU1-HOST-eu1d307lpdantnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d307lpdantnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.224.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-EU1-HOST-dr307-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr307-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr307-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.179"]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-EU1-HOST-dr306-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr306-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr306-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.13.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-EU1-HOST-eu1d305lpcacprx1"
   nsx_id = "TF-EU1-HOST-eu1d305lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d305lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.222.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-EU1-HOST-eu1d90lpce3tnp2"
   nsx_id = "TF-EU1-HOST-eu1d90lpce3tnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d90lpce3tnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.204.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-EU1-HOST-dr306-esg1-1"
   nsx_id = "TF-EU1-HOST-dr306-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr306-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.211"]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-EU1-HOST-replica-d09b85bb-dd60-44c3-8647-ea92b5dafe2a"
   nsx_id = "TF-EU1-HOST-replica-d09b85bb-dd60-44c3-8647-ea92b5dafe2a"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-d09b85bb-dd60-44c3-8647-ea92b5dafe2a"
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
   display_name = "TF-EU1-HOST-dr310-esg1-0"
   nsx_id = "TF-EU1-HOST-dr310-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr310-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.213"]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-EU1-HOST-dr310-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr310-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr310-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.181"]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-EU1-HOST-dr303-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr303-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr303-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.12.202"]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-EU1-HOST-dr305-esg1-0"
   nsx_id = "TF-EU1-HOST-dr305-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr305-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.209"]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-EU1-HOST-eu1d306lpcacprx2"
   nsx_id = "TF-EU1-HOST-eu1d306lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d306lpcacprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.226.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-EU1-HOST-eu1d90lpce3tnp1"
   nsx_id = "TF-EU1-HOST-eu1d90lpce3tnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d90lpce3tnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.204.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-EU1-HOST-dr310-esg1-1"
   nsx_id = "TF-EU1-HOST-dr310-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr310-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.213"]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-EU1-HOST-replica-24268879-bf2f-448f-bf1f-37c7738357d8"
   nsx_id = "TF-EU1-HOST-replica-24268879-bf2f-448f-bf1f-37c7738357d8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-24268879-bf2f-448f-bf1f-37c7738357d8"
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
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-EU1-HOST-dr309-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr309-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr309-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.180"]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-EU1-HOST-dr305-esg1-1"
   nsx_id = "TF-EU1-HOST-dr305-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr305-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.209"]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-EU1-HOST-dr303-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr303-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr303-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.175"]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-EU1-HOST-dr303-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr303-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr303-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.175"]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-EU1-HOST-dr309-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr309-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr309-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.13.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-EU1-HOST-dr307-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr307-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr307-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.179"]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-EU1-HOST-dr306-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr306-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr306-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.178"]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-EU1-HOST-dr307-esg1-1"
   nsx_id = "TF-EU1-HOST-dr307-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr307-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.210"]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-EU1-HOST-dr307-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr307-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr307-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.12.250"]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-EU1-HOST-eu1d306lpcacprx1"
   nsx_id = "TF-EU1-HOST-eu1d306lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d306lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.226.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-EU1-HOST-dr309-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr309-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr309-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.180"]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-EU1-HOST-eu1d305lpcacprx2"
   nsx_id = "TF-EU1-HOST-eu1d305lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d305lpcacprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.222.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-EU1-HOST-dr306-esg1-0"
   nsx_id = "TF-EU1-HOST-dr306-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr306-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.211"]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-EU1-HOST-dr310-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr310-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr310-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.181"]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-EU1-HOST-dr304-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr304-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr304-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.176"]
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-EU1-HOST-dr305-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr305-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr305-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.12.234"]
      }
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-EU1-HOST-replica-caaa870d-8296-4103-b802-88f436894a61"
   nsx_id = "TF-EU1-HOST-replica-caaa870d-8296-4103-b802-88f436894a61"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-caaa870d-8296-4103-b802-88f436894a61"
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
   display_name = "TF-EU1-HOST-NLS01GBSAAGLD23"
   nsx_id = "TF-EU1-HOST-NLS01GBSAAGLD23"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01GBSAAGLD23"
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
   display_name = "TF-EU1-HOST-dr303-esg1-0"
   nsx_id = "TF-EU1-HOST-dr303-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr303-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.207"]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-EU1-HOST-eu1d307lpdantnp2"
   nsx_id = "TF-EU1-HOST-eu1d307lpdantnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d307lpdantnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.224.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-EU1-HOST-dr309-esg1-1"
   nsx_id = "TF-EU1-HOST-dr309-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr309-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.212"]
      }
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-EU1-HOST-replica-2eeb0c39-bda9-4652-a1c2-ef36e768480f"
   nsx_id = "TF-EU1-HOST-replica-2eeb0c39-bda9-4652-a1c2-ef36e768480f"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-2eeb0c39-bda9-4652-a1c2-ef36e768480f"
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
   display_name = "TF-EU1-HOST-eu1d205lpkrnsap"
   nsx_id = "TF-EU1-HOST-eu1d205lpkrnsap"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d205lpkrnsap"
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
   display_name = "TF-EU1-HOST-dr306-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr306-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr306-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.178"]
      }
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-EU1-HOST-eu1d304lpbtltnp1"
   nsx_id = "TF-EU1-HOST-eu1d304lpbtltnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d304lpbtltnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.220.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-EU1-HOST-dr304-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr304-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr304-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.176"]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-EU1-HOST-eu1d304lpbtltnp2"
   nsx_id = "TF-EU1-HOST-eu1d304lpbtltnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d304lpbtltnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.220.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-EU1-HOST-NLS01POCUPUGB01"
   nsx_id = "TF-EU1-HOST-NLS01POCUPUGB01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01POCUPUGB01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.79.248.70"]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-EU1-HOST-eu1d296lpcacprx2"
   nsx_id = "TF-EU1-HOST-eu1d296lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d296lpcacprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.208.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-EU1-HOST-eu1d296lpcacprx1"
   nsx_id = "TF-EU1-HOST-eu1d296lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d296lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.208.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-EU1-HOST-dr305-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr305-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr305-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.177"]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-EU1-HOST-dr310-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr310-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr310-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.13.42"]
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-EU1-HOST-eu1d303lptlfprx1"
   nsx_id = "TF-EU1-HOST-eu1d303lptlfprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d303lptlfprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.218.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-EU1-HOST-replica-7459a48b-d025-4930-a081-39f66112b16c"
   nsx_id = "TF-EU1-HOST-replica-7459a48b-d025-4930-a081-39f66112b16c"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-7459a48b-d025-4930-a081-39f66112b16c"
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
   display_name = "TF-EU1-HOST-dr307-esg1-0"
   nsx_id = "TF-EU1-HOST-dr307-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr307-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.210"]
      }
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-EU1-HOST-dr305-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr305-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr305-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.177"]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-EU1-HOST-dr304-esg1-0"
   nsx_id = "TF-EU1-HOST-dr304-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr304-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.208"]
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-EU1-HOST-dr304-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr304-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr304-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.12.218"]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-EU1-HOST-dr304-esg1-1"
   nsx_id = "TF-EU1-HOST-dr304-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr304-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.208"]
      }
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-EU1-HOST-dr309-esg1-0"
   nsx_id = "TF-EU1-HOST-dr309-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr309-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.212"]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-EU1-HOST-dr303-esg1-1"
   nsx_id = "TF-EU1-HOST-dr303-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr303-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.207"]
      }
   }
}
