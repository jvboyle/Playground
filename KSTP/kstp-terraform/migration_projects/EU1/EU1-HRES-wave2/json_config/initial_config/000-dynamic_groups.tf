#####################################
# VM GROUPS
#
# Migration date: 04/17/2023 19:16
# Geography.....: EU1 
# Wave..........: EU1-HRES-wave2
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-EU1-HOST-dr301-esg1-0"
   nsx_id = "TF-EU1-HOST-dr301-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr301-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.206"]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-EU1-HOST-eu1d297lpcacprx1"
   nsx_id = "TF-EU1-HOST-eu1d297lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d297lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.210.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-EU1-HOST-replica-b7aafaf3-9a1f-43fd-b40c-63c18234dd0c"
   nsx_id = "TF-EU1-HOST-replica-b7aafaf3-9a1f-43fd-b40c-63c18234dd0c"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-b7aafaf3-9a1f-43fd-b40c-63c18234dd0c"
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
   display_name = "TF-EU1-HOST-eu1d296lpptstnp1"
   nsx_id = "TF-EU1-HOST-eu1d296lpptstnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d296lpptstnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.208.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-EU1-HOST-dr300-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr300-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr300-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.12.170"]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-EU1-HOST-eu1d276lprevpxy"
   nsx_id = "TF-EU1-HOST-eu1d276lprevpxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d276lprevpxy"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.174.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-EU1-HOST-NLS01DWSAAPGB02"
   nsx_id = "TF-EU1-HOST-NLS01DWSAAPGB02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01DWSAAPGB02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.79.248.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-EU1-HOST-dr301-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr301-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr301-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.173"]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-EU1-HOST-eu1d297lpcacprx2"
   nsx_id = "TF-EU1-HOST-eu1d297lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d297lpcacprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.210.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-EU1-HOST-replica-a7578d73-0a72-4746-be66-61c5cab2ae1a"
   nsx_id = "TF-EU1-HOST-replica-a7578d73-0a72-4746-be66-61c5cab2ae1a"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-a7578d73-0a72-4746-be66-61c5cab2ae1a"
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
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-EU1-HOST-eu1hr1lpcacfbds"
   nsx_id = "TF-EU1-HOST-eu1hr1lpcacfbds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1hr1lpcacfbds"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.79.240.21"]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-EU1-HOST-dr300-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr300-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr300-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.172"]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-EU1-HOST-dr300-esg1-1"
   nsx_id = "TF-EU1-HOST-dr300-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr300-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.205"]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-EU1-HOST-testvmss"
   nsx_id = "TF-EU1-HOST-testvmss"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "testvmss"
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
   display_name = "TF-EU1-HOST-NL117KIMUPDGB52"
   nsx_id = "TF-EU1-HOST-NL117KIMUPDGB52"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NL117KIMUPDGB52"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.224.112"]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-EU1-HOST-eu1d298lpcacprx1"
   nsx_id = "TF-EU1-HOST-eu1d298lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d298lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.212.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-EU1-HOST-replica-98275f11-5886-4e58-b7c2-4e492ac85372"
   nsx_id = "TF-EU1-HOST-replica-98275f11-5886-4e58-b7c2-4e492ac85372"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-98275f11-5886-4e58-b7c2-4e492ac85372"
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
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-EU1-HOST-dr297-esg1-1"
   nsx_id = "TF-EU1-HOST-dr297-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr297-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.203"]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-EU1-HOST-dr297-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr297-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr297-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.170"]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-EU1-HOST-eu1d301lpcacprx1"
   nsx_id = "TF-EU1-HOST-eu1d301lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d301lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.216.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-EU1-HOST-eu1d300lpabstnp2"
   nsx_id = "TF-EU1-HOST-eu1d300lpabstnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d300lpabstnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.214.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-EU1-HOST-replica-de9f6b8d-b080-4bc1-884f-7b6d69e56c19"
   nsx_id = "TF-EU1-HOST-replica-de9f6b8d-b080-4bc1-884f-7b6d69e56c19"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-de9f6b8d-b080-4bc1-884f-7b6d69e56c19"
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
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-EU1-HOST-NLS01POCUPDGB03"
   nsx_id = "TF-EU1-HOST-NLS01POCUPDGB03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01POCUPDGB03"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.79.248.53"]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-EU1-HOST-replica-ccd6d6a9-5e00-404f-8664-be4af23fe468"
   nsx_id = "TF-EU1-HOST-replica-ccd6d6a9-5e00-404f-8664-be4af23fe468"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-ccd6d6a9-5e00-404f-8664-be4af23fe468"
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
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-EU1-HOST-eu1d298lpcacprx2"
   nsx_id = "TF-EU1-HOST-eu1d298lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d298lpcacprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.212.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-EU1-HOST-dr297-esg1-0"
   nsx_id = "TF-EU1-HOST-dr297-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr297-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.203"]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-EU1-HOST-dr300-esg1-0"
   nsx_id = "TF-EU1-HOST-dr300-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr300-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.205"]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-EU1-HOST-dr298-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr298-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr298-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.171"]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-EU1-HOST-dr298-esg1-1"
   nsx_id = "TF-EU1-HOST-dr298-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr298-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.204"]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-EU1-HOST-eu1d276wpDDE"
   nsx_id = "TF-EU1-HOST-eu1d276wpDDE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d276wpDDE"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.174.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-EU1-HOST-replica-dc327e2a-aec4-4ab1-b73b-1ffefefdb27d"
   nsx_id = "TF-EU1-HOST-replica-dc327e2a-aec4-4ab1-b73b-1ffefefdb27d"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-dc327e2a-aec4-4ab1-b73b-1ffefefdb27d"
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
   display_name = "TF-EU1-HOST-dr297-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr297-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr297-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.12.138"]
      }
   }
}
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-EU1-HOST-NL117KIMUPGLD23"
   nsx_id = "TF-EU1-HOST-NL117KIMUPGLD23"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NL117KIMUPGLD23"
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
   display_name = "TF-EU1-HOST-NL117KIMUPDGB51"
   nsx_id = "TF-EU1-HOST-NL117KIMUPDGB51"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NL117KIMUPDGB51"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.224.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-EU1-HOST-dr298-esg1-0"
   nsx_id = "TF-EU1-HOST-dr298-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr298-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.204"]
      }
   }
}
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-EU1-HOST-dr300-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr300-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr300-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.172"]
      }
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-EU1-HOST-replica-88690195-d313-4b43-8cb8-ba4e71324df5"
   nsx_id = "TF-EU1-HOST-replica-88690195-d313-4b43-8cb8-ba4e71324df5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-88690195-d313-4b43-8cb8-ba4e71324df5"
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
   display_name = "TF-EU1-HOST-dr298-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr298-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr298-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.12.154"]
      }
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-EU1-HOST-dr301-esg1-1"
   nsx_id = "TF-EU1-HOST-dr301-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr301-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.64.206"]
      }
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-EU1-HOST-eu1d296lpptstnp2"
   nsx_id = "TF-EU1-HOST-eu1d296lpptstnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d296lpptstnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.208.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-EU1-HOST-eu1d301lpcacprx2"
   nsx_id = "TF-EU1-HOST-eu1d301lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d301lpcacprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.216.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-EU1-HOST-NLD31RPACAPVM23"
   nsx_id = "TF-EU1-HOST-NLD31RPACAPVM23"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLD31RPACAPVM23"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.112.54"]
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-EU1-HOST-replica-5a51d188-6560-40f2-bd14-c67b85ab4994"
   nsx_id = "TF-EU1-HOST-replica-5a51d188-6560-40f2-bd14-c67b85ab4994"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-5a51d188-6560-40f2-bd14-c67b85ab4994"
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
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-EU1-HOST-eu1d300lpabstnp1"
   nsx_id = "TF-EU1-HOST-eu1d300lpabstnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d300lpabstnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.73.214.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-EU1-HOST-dr297-vpn1-0"
   nsx_id = "TF-EU1-HOST-dr297-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr297-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.170"]
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-EU1-HOST-dr298-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr298-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr298-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.171"]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-EU1-HOST-replica-366eacb3-8e66-489a-a66b-b41f25e50cfe"
   nsx_id = "TF-EU1-HOST-replica-366eacb3-8e66-489a-a66b-b41f25e50cfe"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-366eacb3-8e66-489a-a66b-b41f25e50cfe"
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
   display_name = "TF-EU1-HOST-dr301-vpn1-1"
   nsx_id = "TF-EU1-HOST-dr301-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr301-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.51.163.173"]
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-EU1-HOST-replica-7ee1c2dd-af82-4178-8cf7-ab59121752f6"
   nsx_id = "TF-EU1-HOST-replica-7ee1c2dd-af82-4178-8cf7-ab59121752f6"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-7ee1c2dd-af82-4178-8cf7-ab59121752f6"
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
   display_name = "TF-EU1-HOST-replica-5b4aa138-14ac-47db-8e44-7856a163f11b"
   nsx_id = "TF-EU1-HOST-replica-5b4aa138-14ac-47db-8e44-7856a163f11b"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-5b4aa138-14ac-47db-8e44-7856a163f11b"
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
   display_name = "TF-EU1-HOST-dr301-dlr1-0"
   nsx_id = "TF-EU1-HOST-dr301-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1-dr301-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.12.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-EU1-HOST-eu1hr1lpcacfovpn"
   nsx_id = "TF-EU1-HOST-eu1hr1lpcacfovpn"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1hr1lpcacfovpn"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.79.240.22"]
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-EU1-HOST-NL117KIMUPDGB53"
   nsx_id = "TF-EU1-HOST-NL117KIMUPDGB53"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NL117KIMUPDGB53"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.224.110"]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-EU1-HOST-replica-99f2b93f-23a7-4b46-a3f2-e929a6a52abb"
   nsx_id = "TF-EU1-HOST-replica-99f2b93f-23a7-4b46-a3f2-e929a6a52abb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "replica-99f2b93f-23a7-4b46-a3f2-e929a6a52abb"
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
# Migration date: 04/17/2023 19:16
# Geography.....: EU1 
# Wave..........: EU1-HRES-wave2
#####################################
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-EU1-IPSET-DRES297-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES297-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.210.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epnp4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epnp4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.161"
]
      }
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpbzprod2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpbzprod2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-EU1-IPSET-RITM0134127"
   nsx_id = "TF-EU1-IPSET-RITM0134127"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.137.105",
                         "158.98.137.109",
                         "158.98.137.108"
]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-79-236-142"
   nsx_id = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-79-236-142"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.130.164",
                         "100.79.236.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lnbzztest"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lnbzztest"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-EU1-IPSET-AG1-US-ONLY-GRF-DATABASE"
   nsx_id = "TF-EU1-IPSET-AG1-US-ONLY-GRF-DATABASE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.209"
]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-EU1-IPSET-AG1-HRES-ag1h1lpta1ssh1"
   nsx_id = "TF-EU1-IPSET-AG1-HRES-ag1h1lpta1ssh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-EU1-IPSET-DA-JP-XBX-jp01dsl01drslr4-158-87-222-209"
   nsx_id = "TF-EU1-IPSET-DA-JP-XBX-jp01dsl01drslr4-158-87-222-209"
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
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-EU1-IPSET-DA-JP-KOB-DA-JH-PROD-158-98-21-124"
   nsx_id = "TF-EU1-IPSET-DA-JP-KOB-DA-JH-PROD-158-98-21-124"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.21.124"
]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.50",
                         "158.87.53.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-EU1-IPSET-India-Payroll-zw2uspriv-app-kyndryl-net"
   nsx_id = "TF-EU1-IPSET-India-Payroll-zw2uspriv-app-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.238.20-138.95.238.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-EU1-IPSET-IN1-SRES-in1sr1wpgrfdb"
   nsx_id = "TF-EU1-IPSET-IN1-SRES-in1sr1wpgrfdb"
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
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1dxdev02"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1dxdev02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-EU1-IPSET-IN1-dp-elastic-in1-prod-int-kyndryl-net"
   nsx_id = "TF-EU1-IPSET-IN1-dp-elastic-in1-prod-int-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-EU1-IPSET-DRES298-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES298-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.212.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcarwas1000"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcarwas1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.252"
]
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-EU1-IPSET-gb46pdn01ir01fm-fab-esni-ibm-com"
   nsx_id = "TF-EU1-IPSET-gb46pdn01ir01fm-fab-esni-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.66.76"
]
      }
   }
}
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlphcs0001"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlphcs0001"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-EU1-IPSET-DA-GSNI-BDS-Clients"
   nsx_id = "TF-EU1-IPSET-DA-GSNI-BDS-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.71.166-158.98.71.167",
                         "100.79.236.119-100.79.236.124",
                         "195.75.20.44-195.75.20.45",
                         "129.39.157.230-129.39.157.231",
                         "195.183.78.74-195.183.78.75"
]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcardb1000"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcardb1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.253"
]
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-EU1-IPSET-DA-IPC-prodnljh02-146-89-167-216"
   nsx_id = "TF-EU1-IPSET-DA-IPC-prodnljh02-146-89-167-216"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.167.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-EU1-IPSET-DA-F2M-ilp-j124-146-192-227-176"
   nsx_id = "TF-EU1-IPSET-DA-F2M-ilp-j124-146-192-227-176"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.192.227.176"
]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-EU1-IPSET-CDI-GTSCDI-EU-Proxy01-02"
   nsx_id = "TF-EU1-IPSET-CDI-GTSCDI-EU-Proxy01-02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.76",
                         "146.89.187.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-EU1-IPSET-soapp22sil-sni-ch-ibm-com-9-159-217-155"
   nsx_id = "TF-EU1-IPSET-soapp22sil-sni-ch-ibm-com-9-159-217-155"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.159.217.155"
]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-EU1-IPSET-HRES-eu1hr1lpcacfbds-VIP"
   nsx_id = "TF-EU1-IPSET-HRES-eu1hr1lpcacfbds-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.57.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-EU1-IPSET-AG1-SRES-produsgrfdb01-usat01-com"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-produsgrfdb01-usat01-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-EU1-IPSET-SRES-eu1rhellic01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1rhellic01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.110"
]
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-79-236-146"
   nsx_id = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-79-236-146"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.98.240",
                         "100.79.236.146"
]
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-EU1-IPSET-AG1-SG-SRES-OCP-Cluster07-VIP"
   nsx_id = "TF-EU1-IPSET-AG1-SG-SRES-OCP-Cluster07-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.8",
                         "158.87.50.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-EU1-IPSET-SG-SRES-GACDW-PROD"
   nsx_id = "TF-EU1-IPSET-SG-SRES-GACDW-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.181",
                         "158.87.53.218",
                         "158.87.53.82",
                         "158.87.53.239",
                         "158.87.53.220",
                         "158.87.53.238",
                         "158.87.53.219",
                         "158.87.53.188-158.87.53.189",
                         "158.87.53.217"
]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1pcacfgit1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1pcacfgit1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.251"
]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.163"
]
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-EU1-IPSET-DA-BVM-lvpapdynautmx02-150-100-195-164"
   nsx_id = "TF-EU1-IPSET-DA-BVM-lvpapdynautmx02-150-100-195-164"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "150.100.195.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-EU1-IPSET-DA-F2W-ilp-j128-146-192-227-86"
   nsx_id = "TF-EU1-IPSET-DA-F2W-ilp-j128-146-192-227-86"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.192.227.86"
]
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-EU1-IPSET-DRES301-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES301-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.216.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpbzzprod"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpbzzprod"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpgsenexgen"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpgsenexgen"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-EU1-IPSET-BLUEIDP1-zw2uspriv-app-kyndryl-net"
   nsx_id = "TF-EU1-IPSET-BLUEIDP1-zw2uspriv-app-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.238.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-EU1-IPSET-DA-F2M-ilp-j123-146-192-227-175"
   nsx_id = "TF-EU1-IPSET-DA-F2M-ilp-j123-146-192-227-175"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.192.227.175"
]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmsatcld1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmsatcld1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.89"
]
      }
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-EU1-IPSET-AP1-SRES-POC"
   nsx_id = "TF-EU1-IPSET-AP1-SRES-POC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.236"
]
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-EU1-IPSET-SL-IRES-MnEaaS-Dynatrace-Monitoring"
   nsx_id = "TF-EU1-IPSET-SL-IRES-MnEaaS-Dynatrace-Monitoring"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.137.124",
                         "10.175.137.67",
                         "10.175.137.115",
                         "10.175.137.74",
                         "10.175.137.93",
                         "10.175.137.66",
                         "10.175.137.68",
                         "10.175.137.79",
                         "10.175.137.117"
]
      }
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-EU1-IPSET-DA-F2W-ilp-j127-146-192-227-85"
   nsx_id = "TF-EU1-IPSET-DA-F2W-ilp-j127-146-192-227-85"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.192.227.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1cntrl1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1cntrl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-EU1-IPSET-AG1-DR12-LB-VIPs-NAT"
   nsx_id = "TF-EU1-IPSET-AG1-DR12-LB-VIPs-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.243",
                         "158.87.104.244",
                         "158.87.104.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-EU1-IPSET-RPA-AOCC-iaplfra6aocc007-8-9"
   nsx_id = "TF-EU1-IPSET-RPA-AOCC-iaplfra6aocc007-8-9"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "161.156.190.82",
                         "161.156.190.83",
                         "161.156.190.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-EU1-IPSET-M-EaaS-Proxy-100-72-69-4"
   nsx_id = "TF-EU1-IPSET-M-EaaS-Proxy-100-72-69-4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.69.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpgse1000"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpgse1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-EU1-IPSET-gb46pdn02ir01fm-fab-esni-ibm-com"
   nsx_id = "TF-EU1-IPSET-gb46pdn02ir01fm-fab-esni-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.66.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpgsenb01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpgsenb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.244"
]
      }
   }
}
#####################################
# EMPTY GROUPS
#
# Migration date: 04/17/2023 19:16
# Geography.....: EU1 
# Wave..........: EU1-HRES-wave2
#####################################
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-EU1-SG-SRES-Netcool-Next-CACF"
   nsx_id = "TF-EU1-SG-SRES-Netcool-Next-CACF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-EU1-SG-SRES-AA-Controlroom"
   nsx_id = "TF-EU1-SG-SRES-AA-Controlroom"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-BPE-AppDevSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-BPE-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-EU1-SG-SRES01-ICp-Cluster02-Worker-Nodes"
   nsx_id = "TF-EU1-SG-SRES01-ICp-Cluster02-Worker-Nodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcProdSrv"
   nsx_id = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR60-RPA-BP-GNF-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcUatSrv"
   nsx_id = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR60-RPA-BP-GNF-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-EU1-SG-DRES86-MNEAAS-H3G-NCPP"
   nsx_id = "TF-EU1-SG-DRES86-MNEAAS-H3G-NCPP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR37-RPA-BP-ICF-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcServers"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-EU1-SG-DR35-STaaS-Mail-Clients"
   nsx_id = "TF-EU1-SG-DR35-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR46-RPA-BP-IBE-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-EU1-SG-SRES-RPA-JHS-Jump-Servers"
   nsx_id = "TF-EU1-SG-SRES-RPA-JHS-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppDevSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR39-RPA-BP-ECI-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR39-RPA-BP-ECI-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-Jump-Servers"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR37-RPA-BP-ICF-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-EU1-SG-DR48-STaaS-Mail-Clients"
   nsx_id = "TF-EU1-SG-DR48-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-EU1-SG-SRES-GTS-Analytics"
   nsx_id = "TF-EU1-SG-SRES-GTS-Analytics"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR60-RPA-BP-GNF-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR46-RPA-BP-IBE-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-OrcProdSrv"
   nsx_id = "TF-EU1-SG-DR31-RPA-UP-POC-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcDevSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-Jump-Servers"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-EU1-SG-eu1d72lpsphprx-Proxy-VIP"
   nsx_id = "TF-EU1-SG-eu1d72lpsphprx-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-EU1-SG-SRES-RPA-GBS-AA-UAT-ControlRoom"
   nsx_id = "TF-EU1-SG-SRES-RPA-GBS-AA-UAT-ControlRoom"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-EU1-SG-SRES-IAM-NODB-PROD"
   nsx_id = "TF-EU1-SG-SRES-IAM-NODB-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-EU1-SG-DRDDC-CSSR-All"
   nsx_id = "TF-EU1-SG-DRDDC-CSSR-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR39-RPA-BP-ECI-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-EU1-SG-Empty"
   nsx_id = "TF-EU1-SG-Empty"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR37-RPA-BP-ICF-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR51-RPA-BP-CTT-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR51-RPA-BP-CTT-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-OrcUatSrv"
   nsx_id = "TF-EU1-SG-DR31-RPA-UP-POC-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-AppServers"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-AppServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-BPE-AppUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-BPE-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-EU1-SG-SRES-IAM-WINDOWS-PROD"
   nsx_id = "TF-EU1-SG-SRES-IAM-WINDOWS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GBS-AppProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-GBS-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GBS-AppUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-GBS-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-EU1-SG-DR18-AA-Jump-Servers"
   nsx_id = "TF-EU1-SG-DR18-AA-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcDevSrv"
   nsx_id = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR46-RPA-BP-IBE-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-EU1-SG-SRES-RPA-GBS-BP-AppServers"
   nsx_id = "TF-EU1-SG-SRES-RPA-GBS-BP-AppServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-EU1-SG-SRES-WIN-DA"
   nsx_id = "TF-EU1-SG-SRES-WIN-DA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR51-RPA-BP-CTT-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-POC-PostgresSQL"
   nsx_id = "TF-EU1-SG-SRES-RPA-AA-POC-PostgresSQL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-EU1-SG-ISIM-EUISPW-DRES-Members"
   nsx_id = "TF-EU1-SG-ISIM-EUISPW-DRES-Members"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-EU1-SG-SRES-IAM-LINUX-PROD"
   nsx_id = "TF-EU1-SG-SRES-IAM-LINUX-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
#####################################
# SGEM GROUPS
#
# Migration date: 04/17/2023 19:16
# Geography.....: EU1 
# Wave..........: EU1-HRES-wave2
#####################################
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpcardb1000"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpcardb1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpcardb1000"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpcardb1000"
]
      }
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-EU1-SG-SRES-TSB-M-EaaS-SL1-Powerflow"
   nsx_id = "TF-EU1-SG-SRES-TSB-M-EaaS-SL1-Powerflow"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlnm1eslpf01",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eslpf01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-EU1-SG-DR209-M-EaaS-lphlcs"
   nsx_id = "TF-EU1-SG-DR209-M-EaaS-lphlcs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR209-eu1d209lphlcsdp-vip",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlcsdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlcsdc"
]
      }
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-EU1-SG-MnEaaS-Dynatrace-Monitoring"
   nsx_id = "TF-EU1-SG-MnEaaS-Dynatrace-Monitoring"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlascni000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-SL-IRES-MnEaaS-Dynatrace-Monitoring",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlaspnp000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlaspni000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlascnp000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlascdb000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlascno000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlaspdb000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlaspno000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlaspnw000iswrm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcni",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejtnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg2",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpwg",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpno",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcwg",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascno000dc1rm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcno",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000dc1rm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcno",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000dc1rm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpno",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejtnp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcfrtnp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcfrtnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpni",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpni",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000dc1rm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcni",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascni000dc1rm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpni",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascni",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easweb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp3",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-EU1-HOST-HRES-CACF-BDS-Child"
   nsx_id = "TF-EU1-HOST-HRES-CACF-BDS-Child"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds"
]
      }
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-EU1-SG-SRES-MNE-AMS3-Shared"
   nsx_id = "TF-EU1-SG-SRES-MNE-AMS3-Shared"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-EU1-EU-SG-SRES-eu1srlpm1esd3-vip"
   nsx_id = "TF-EU1-EU-SG-SRES-eu1srlpm1esd3-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmsatcld1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmsatcld1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpgsenb01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpgsenb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpgsenb01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpgsenb01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlphcs0001"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlphcs0001"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlphcs0001"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlphcs0001"
]
      }
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-EU1-SG-SRES-TSB-M-EaaS-SL1-DB"
   nsx_id = "TF-EU1-SG-SRES-TSB-M-EaaS-SL1-DB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpgse1000"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpgse1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpgse1000"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpgse1000"
]
      }
   }
}
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpgsenexgen"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpgsenexgen"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpgsenexgen"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpgsenexgen"
]
      }
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-EU1-SG-DR88-M-EaaS-SL1"
   nsx_id = "TF-EU1-SG-DR88-M-EaaS-SL1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d88lpciftnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d88lpciftnp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-EU1-SG-DR209-M-EaaS-lphlctnp"
   nsx_id = "TF-EU1-SG-DR209-M-EaaS-lphlctnp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlctnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlctnp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpcarwas1000"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpcarwas1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpcarwas1000"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpcarwas1000"
]
      }
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpbzprod2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpbzprod2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1lpbzprod2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpbzprod2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpbzzprod"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpbzzprod"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1lpbzzprod"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpbzzprod"
]
      }
   }
}
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1dxdev02"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1dxdev02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1dxdev02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1dxdev02"
]
      }
   }
}
#####################################
# DYNAMIC GROUPS
#
# Migration date: 04/17/2023 19:16
# Geography.....: EU1 
# Wave..........: EU1-HRES-wave2
#####################################
