#####################################
# VM GROUPS
#
# Migration date: 03/30/2023 17:32
# Geography.....: AG1 
# Wave..........: DVAA-ETOC-INFRA
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AG1-HOST-ag1srlptocdb02"
   nsx_id = "TF-AG1-HOST-ag1srlptocdb02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlptocdb02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.208"]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AG1-HOST-ag1pdr1prx03"
   nsx_id = "TF-AG1-HOST-ag1pdr1prx03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1pdr1prx03"
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
   display_name = "TF-AG1-HOST-dr299-esg1-1"
   nsx_id = "TF-AG1-HOST-dr299-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr299-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.73"]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AG1-HOST-dr299-esg1-0"
   nsx_id = "TF-AG1-HOST-dr299-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr299-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.73"]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AG1-HOST-ag1pdr1prx04"
   nsx_id = "TF-AG1-HOST-ag1pdr1prx04"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1pdr1prx04"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.69.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AG1-HOST-dr299-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr299-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr299-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.216"]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AG1-HOST-ag1d299lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d299lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d299lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.208.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AG1-HOST-dr299-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr299-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr299-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.4.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AG1-HOST-ag1diamjfwkali3"
   nsx_id = "TF-AG1-HOST-ag1diamjfwkali3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1diamjfwkali3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.128.55"]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AG1-HOST-ag1srlptocdb01"
   nsx_id = "TF-AG1-HOST-ag1srlptocdb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlptocdb01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.207"]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AG1-HOST-ag1sr1sltestvm_old"
   nsx_id = "TF-AG1-HOST-ag1sr1sltestvm_old"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1sltestvm_old"
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
   display_name = "TF-AG1-HOST-dr299-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr299-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr299-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.216"]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AG1-HOST-ag1dr234lparx_old"
   nsx_id = "TF-AG1-HOST-ag1dr234lparx_old"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr234lparx_old"
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
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AG1-HOST-ag1diam2jfwkali4"
   nsx_id = "TF-AG1-HOST-ag1diam2jfwkali4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1diam2jfwkali4"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.130.55"]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-HOST-ag1d299lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d299lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d299lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.208.51"]
      }
   }
}
