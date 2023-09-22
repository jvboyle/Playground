#####################################
# VM GROUPS
#
# Migration date: 03/22/2023 16:07
# Geography.....: AG1 
# Wave..........: DVAA
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AG1-HOST-dr224-esg1-0"
   nsx_id = "TF-AG1-HOST-dr224-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr224-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.63"]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AG1-HOST-ag1dr162lpfm"
   nsx_id = "TF-AG1-HOST-ag1dr162lpfm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr162lpfm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AG1-HOST-ag1hrlpcscproxy"
   nsx_id = "TF-AG1-HOST-ag1hrlpcscproxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1hrlpcscproxy"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.71.240.21"]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AG1-HOST-dr144-esg1-1"
   nsx_id = "TF-AG1-HOST-dr144-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr144-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.35"]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AG1-HOST-ag1dr162dc2"
   nsx_id = "TF-AG1-HOST-ag1dr162dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr162dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcir3"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcir3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcir3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.190"]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AG1-HOST-dr112-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr112-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr112-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.170"]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AG1-HOST-ag1srlphcs0001"
   nsx_id = "TF-AG1-HOST-ag1srlphcs0001"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlphcs0001"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.146"]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AG1-HOST-AG1D53WPIGATPC1"
   nsx_id = "TF-AG1-HOST-AG1D53WPIGATPC1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1D53WPIGATPC1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.88.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AG1-HOST-ag1vrops01"
   nsx_id = "TF-AG1-HOST-ag1vrops01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1vrops01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.142"]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AG1-HOST-ag1dc2"
   nsx_id = "TF-AG1-HOST-ag1dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.131"]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AG1-HOST-dr151-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr151-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr151-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.42"]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AG1-HOST-dr111-esg1-1"
   nsx_id = "TF-AG1-HOST-dr111-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr111-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.28"]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AG1-HOST-dr234-esg1-1"
   nsx_id = "TF-AG1-HOST-dr234-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr234-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.66"]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-HOST-dr204-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr204-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr204-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.47.188.36"]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-HOST-ag1dr19lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr19lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr19lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.80.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-HOST-ag1dr162lpstl"
   nsx_id = "TF-AG1-HOST-ag1dr162lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr162lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-HOST-dr12-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr12-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr12-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.146"]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AG1-HOST-ag1dr151dc1"
   nsx_id = "TF-AG1-HOST-ag1dr151dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr151dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.136.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AG1-HOST-agnsr1lnccmjmp6"
   nsx_id = "TF-AG1-HOST-agnsr1lnccmjmp6"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsr1lnccmjmp6"
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
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AG1-HOST-ag1dr151lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr151lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr151lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.136.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AG1-HOST-dr118-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr118-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr118-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.202"]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AG1-HOST-dr183-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr183-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr183-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.172"]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-AG1-HOST-dr100-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr100-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr100-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.158"]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-AG1-HOST-driamaasthy3-vpn1-1"
   nsx_id = "TF-AG1-HOST-driamaasthy3-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy3-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.185"]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-AG1-HOST-edge-71-jobdata-753834-0"
   nsx_id = "TF-AG1-HOST-edge-71-jobdata-753834-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "edge-71-jobdata-753834-0"
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
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AG1-HOST-ag1srlpcardb1000"
   nsx_id = "TF-AG1-HOST-ag1srlpcardb1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpcardb1000"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-AG1-HOST-ext-vpn1-1"
   nsx_id = "TF-AG1-HOST-ext-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-ext-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.230"]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-AG1-HOST-ag1dr234lparx"
   nsx_id = "TF-AG1-HOST-ag1dr234lparx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr234lparx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.194.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-AG1-HOST-dr75-esg1-0"
   nsx_id = "TF-AG1-HOST-dr75-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr75-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.20"]
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-AG1-HOST-ag1dr77arx"
   nsx_id = "TF-AG1-HOST-ag1dr77arx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr77arx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.104.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-AG1-HOST-dr223-esg1-0"
   nsx_id = "TF-AG1-HOST-dr223-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr223-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.62"]
      }
   }
}
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-AG1-HOST-ag1dr11sat"
   nsx_id = "TF-AG1-HOST-ag1dr11sat"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr11sat"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.74.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-AG1-HOST-driamaasthy-esg1-0"
   nsx_id = "TF-AG1-HOST-driamaasthy-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-AG1-HOST-ag1vc1"
   nsx_id = "TF-AG1-HOST-ag1vc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1vc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.134"]
      }
   }
}
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcit1"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcit1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcit1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.185"]
      }
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-AG1-HOST-ag1sr1lniamuaprx2"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamuaprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamuaprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.71"]
      }
   }
}
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-AG1-HOST-ag1sr1wniamptfs"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamptfs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamptfs"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.92"]
      }
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-AG1-HOST-sres1-dlr1-0"
   nsx_id = "TF-AG1-HOST-sres1-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-sres1-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.2"]
      }
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-AG1-HOST-dr116-esg1-1"
   nsx_id = "TF-AG1-HOST-dr116-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr116-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.30"]
      }
   }
}
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-AG1-HOST-dr285-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr285-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr285-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.215"]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-AG1-HOST-ag1srlpdvaapp01"
   nsx_id = "TF-AG1-HOST-ag1srlpdvaapp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpdvaapp01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.147"]
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-AG1-HOST-ag1dr151lpstl"
   nsx_id = "TF-AG1-HOST-ag1dr151lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr151lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.136.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-AG1-HOST-driamaasthy3-dlr1-0"
   nsx_id = "TF-AG1-HOST-driamaasthy3-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy3-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.154"]
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-AG1-HOST-ag1dr151lparx"
   nsx_id = "TF-AG1-HOST-ag1dr151lparx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr151lparx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.136.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-AG1-HOST-dr74-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr74-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr74-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.154"]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-AG1-HOST-ag1dr162stw"
   nsx_id = "TF-AG1-HOST-ag1dr162stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr162stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-AG1-HOST-ag1dr19stl"
   nsx_id = "TF-AG1-HOST-ag1dr19stl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr19stl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.80.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-AG1-HOST-agnsr1lnaiodev1"
   nsx_id = "TF-AG1-HOST-agnsr1lnaiodev1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsr1lnaiodev1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.162"]
      }
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-AG1-HOST-dr201-esg1-1"
   nsx_id = "TF-AG1-HOST-dr201-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr201-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.55"]
      }
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-AG1-HOST-dr19-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr19-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr19-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-AG1-HOST-ag1d100stl"
   nsx_id = "TF-AG1-HOST-ag1d100stl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d100stl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.116.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-AG1-HOST-ag1dr237lpfm"
   nsx_id = "TF-AG1-HOST-ag1dr237lpfm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr237lpfm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.196.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-AG1-HOST-dr216-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr216-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr216-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.154"]
      }
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-AG1-HOST-ag1d183lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d183lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d183lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.156.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-AG1-HOST-ag1d112dc1"
   nsx_id = "TF-AG1-HOST-ag1d112dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d112dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.120.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-AG1-HOST-driamaasthy4-esg1-1"
   nsx_id = "TF-AG1-HOST-driamaasthy4-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy4-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.48"]
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-AG1-HOST-dr59-esg1-0"
   nsx_id = "TF-AG1-HOST-dr59-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr59-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.15"]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-AG1-HOST-driamaasthy4-esg1-0"
   nsx_id = "TF-AG1-HOST-driamaasthy4-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy4-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.48"]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-AG1-HOST-ag1sr1wniamsbe1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamsbe1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamsbe1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.199"]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-AG1-HOST-v-to-t-esg-0"
   nsx_id = "TF-AG1-HOST-v-to-t-esg-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "v-to-t-esg-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.211.161.240"]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamuep2"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamuep2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamuep2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.140"]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-AG1-HOST-ag1d124lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d124lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d124lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.126.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamprr3"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamprr3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamprr3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.112"]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-AG1-HOST-dres1-esg1-1"
   nsx_id = "TF-AG1-HOST-dres1-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dres1-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-AG1-HOST-ag1sr1wniamtse2"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamtse2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamtse2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.44"]
      }
   }
}
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-AG1-HOST-dr180-esg1-1"
   nsx_id = "TF-AG1-HOST-dr180-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr180-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.45"]
      }
   }
}
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-AG1-HOST-dr12-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr12-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr12-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.74"]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-AG1-HOST-dr118-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr118-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr118-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["52.116.104.70"]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-AG1-HOST-agnsrlnrckvm1"
   nsx_id = "TF-AG1-HOST-agnsrlnrckvm1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnrckvm1"
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
   display_name = "TF-AG1-HOST-ag1sr1sql01"
   nsx_id = "TF-AG1-HOST-ag1sr1sql01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1sql01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-AG1-HOST-sres1-esg1-0"
   nsx_id = "TF-AG1-HOST-sres1-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-sres1-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-AG1-HOST-ag1dr147dc2"
   nsx_id = "TF-AG1-HOST-ag1dr147dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr147dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.134.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-AG1-HOST-ag1dr234lpfm"
   nsx_id = "TF-AG1-HOST-ag1dr234lpfm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr234lpfm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.194.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-AG1-HOST-ag1dr151lpfm"
   nsx_id = "TF-AG1-HOST-ag1dr151lpfm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr151lpfm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.136.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-AG1-HOST-agnsrlnmnepen1_old"
   nsx_id = "TF-AG1-HOST-agnsrlnmnepen1_old"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnmnepen1_old"
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
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-AG1-HOST-ag1sr1wniamptt2"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamptt2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamptt2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.21"]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-AG1-HOST-dr182-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr182-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr182-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.171"]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-AG1-HOST-dr223-esg1-1"
   nsx_id = "TF-AG1-HOST-dr223-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr223-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.62"]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-AG1-HOST-dr234-esg1-0"
   nsx_id = "TF-AG1-HOST-dr234-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr234-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.66"]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-AG1-HOST-sres-lb1-1"
   nsx_id = "TF-AG1-HOST-sres-lb1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-sres-lb1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-AG1-HOST-dr112-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr112-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr112-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.160"]
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-AG1-HOST-dr95-esg1-0"
   nsx_id = "TF-AG1-HOST-dr95-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr95-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.23"]
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-AG1-HOST-ag1d204lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d204lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d204lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.176.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-AG1-HOST-ag1d100stw"
   nsx_id = "TF-AG1-HOST-ag1d100stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d100stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.116.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-AG1-HOST-dr160-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr160-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr160-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["52.116.104.81"]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-AG1-HOST-dr273-esg1-0"
   nsx_id = "TF-AG1-HOST-dr273-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr273-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.70"]
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-AG1-HOST-ag1d111lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d111lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d111lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.118.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-AG1-HOST-dr216-esg1-0"
   nsx_id = "TF-AG1-HOST-dr216-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr216-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.60"]
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-AG1-HOST-dr124-esg1-1"
   nsx_id = "TF-AG1-HOST-dr124-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr124-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-AG1-HOST-hres1-lb1-1"
   nsx_id = "TF-AG1-HOST-hres1-lb1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-hres1-lb1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.146"]
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-AG1-HOST-pdr-esg1-1"
   nsx_id = "TF-AG1-HOST-pdr-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-pdr-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["52.116.104.68"]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamuep5"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamuep5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamuep5"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.143"]
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcira"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcira"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcira"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.179"]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-AG1-HOST-dr216-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr216-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr216-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.201"]
      }
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-AG1-HOST-hres1-vpn1-0"
   nsx_id = "TF-AG1-HOST-hres1-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-hres1-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.137"]
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-AG1-HOST-dr147-esg1-1"
   nsx_id = "TF-AG1-HOST-dr147-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr147-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.36"]
      }
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-AG1-HOST-dr111-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr111-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr111-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.180"]
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-AG1-HOST-dr234-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr234-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr234-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.209"]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-AG1-HOST-dr223-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr223-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr223-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.203"]
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-AG1-HOST-dr201-esg1-0"
   nsx_id = "TF-AG1-HOST-dr201-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr201-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.55"]
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-AG1-HOST-ag1sr1lniamptsdi"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamptsdi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamptsdi"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-AG1-HOST-agnsrlnccmlxjmp"
   nsx_id = "TF-AG1-HOST-agnsrlnccmlxjmp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnccmlxjmp"
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
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-AG1-HOST-ag1sr1wniamtsq1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamtsq1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamtsq1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.39"]
      }
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-AG1-HOST-ag1d223lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d223lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d223lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.186.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-AG1-HOST-driamaas2-esg1-1"
   nsx_id = "TF-AG1-HOST-driamaas2-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaas2-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.34"]
      }
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-AG1-HOST-dr156-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr156-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr156-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.165"]
      }
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-AG1-HOST-sl-svc-esg1-0"
   nsx_id = "TF-AG1-HOST-sl-svc-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-sl-svc-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.211.127.2"]
      }
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-AG1-HOST-ag1d75wphwcweb"
   nsx_id = "TF-AG1-HOST-ag1d75wphwcweb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d75wphwcweb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.102.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-AG1-HOST-dr158-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr158-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr158-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.74"]
      }
   }
}
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-AG1-HOST-ag1srwphwcstr01"
   nsx_id = "TF-AG1-HOST-ag1srwphwcstr01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwphwcstr01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.151"]
      }
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-AG1-HOST-dr65-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr65-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr65-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.218"]
      }
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-AG1-HOST-agnsr1lnccmjmp3"
   nsx_id = "TF-AG1-HOST-agnsr1lnccmjmp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsr1lnccmjmp3"
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
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-AG1-HOST-dr165-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr165-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr165-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.138"]
      }
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-AG1-HOST-ag1dr11slog"
   nsx_id = "TF-AG1-HOST-ag1dr11slog"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr11slog"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.74.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-AG1-HOST-AG1D53LPIGASTL1"
   nsx_id = "TF-AG1-HOST-AG1D53LPIGASTL1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1D53LPIGASTL1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.88.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-AG1-HOST-dr47-dlr1-1"
   nsx_id = "TF-AG1-HOST-dr47-dlr1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr47-dlr1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.98"]
      }
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-AG1-HOST-ag1d95lpjllprx2"
   nsx_id = "TF-AG1-HOST-ag1d95lpjllprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d95lpjllprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.108.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-AG1-HOST-ag1sr1wniamtse1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamtse1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamtse1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.43"]
      }
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-AG1-HOST-ag1srlptena1"
   nsx_id = "TF-AG1-HOST-ag1srlptena1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlptena1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.197"]
      }
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-AG1-HOST-ag1d100dc2"
   nsx_id = "TF-AG1-HOST-ag1d100dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d100dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.116.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-AG1-HOST-ag1sr1nfs02"
   nsx_id = "TF-AG1-HOST-ag1sr1nfs02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1nfs02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.36"]
      }
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-AG1-HOST-ag1dr59dc1"
   nsx_id = "TF-AG1-HOST-ag1dr59dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr59dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.92.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-AG1-HOST-ag1vmon"
   nsx_id = "TF-AG1-HOST-ag1vmon"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1vmon"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.156"]
      }
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-AG1-HOST-dr212-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr212-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr212-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.138"]
      }
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-AG1-HOST-dr251-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr251-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr251-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.211"]
      }
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-AG1-HOST-dr216-esg1-1"
   nsx_id = "TF-AG1-HOST-dr216-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr216-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.60"]
      }
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-AG1-HOST-dr233-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr233-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr233-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.234"]
      }
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamprr2"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamprr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamprr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.111"]
      }
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-AG1-HOST-ag1sr1daipwin01"
   nsx_id = "TF-AG1-HOST-ag1sr1daipwin01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1daipwin01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.28"]
      }
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-AG1-HOST-dr151-esg1-1"
   nsx_id = "TF-AG1-HOST-dr151-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr151-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.37"]
      }
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-AG1-HOST-ag1d144lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d144lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d144lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-AG1-HOST-dr203-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr203-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr203-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.179"]
      }
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-AG1-HOST-ag1dr19arx"
   nsx_id = "TF-AG1-HOST-ag1dr19arx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr19arx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.80.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-AG1-HOST-ag1d100dc1"
   nsx_id = "TF-AG1-HOST-ag1d100dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d100dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.116.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-AG1-HOST-dr197-esg1-0"
   nsx_id = "TF-AG1-HOST-dr197-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr197-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.53"]
      }
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-AG1-HOST-ag1d124lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d124lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d124lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.126.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-AG1-HOST-ag1dr144stw"
   nsx_id = "TF-AG1-HOST-ag1dr144stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr144stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-AG1-HOST-ag1sr1lniamsbbkl1"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamsbbkl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamsbbkl1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.200"]
      }
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-AG1-HOST-ag1sr1wniamuat1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamuat1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamuat1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.74"]
      }
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-AG1-HOST-ag1nsxm1"
   nsx_id = "TF-AG1-HOST-ag1nsxm1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1nsxm1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.135"]
      }
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-AG1-HOST-ag1srlphwcsss01"
   nsx_id = "TF-AG1-HOST-ag1srlphwcsss01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlphwcsss01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.163"]
      }
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-AG1-HOST-ag1dr158lpprx1"
   nsx_id = "TF-AG1-HOST-ag1dr158lpprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr158lpprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.140.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcifs"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcifs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcifs"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.184"]
      }
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-AG1-HOST-ag1sr1wniamtst1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamtst1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamtst1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.40"]
      }
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-AG1-HOST-dr52-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr52-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr52-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.154"]
      }
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-AG1-HOST-ag1sr1lniamuasdi3"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamuasdi3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamuasdi3"
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
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-AG1-HOST-dr12-esg1-0"
   nsx_id = "TF-AG1-HOST-dr12-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr12-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-AG1-HOST-dr159-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr159-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr159-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.167"]
      }
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcir1"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcir1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcir1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.188"]
      }
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-AG1-HOST-dr162-esg1-0"
   nsx_id = "TF-AG1-HOST-dr162-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr162-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.42"]
      }
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-AG1-HOST-ag1dr65dc2"
   nsx_id = "TF-AG1-HOST-ag1dr65dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr65dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.94.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-AG1-HOST-ag1srwpdvaapp02"
   nsx_id = "TF-AG1-HOST-ag1srwpdvaapp02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwpdvaapp02"
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
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-AG1-HOST-dr234-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr234-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr234-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.209"]
      }
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-AG1-HOST-ag1d212lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d212lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d212lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.180.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-AG1-HOST-dr204-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr204-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr204-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.47.188.36"]
      }
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-AG1-HOST-dr187-esg1-1"
   nsx_id = "TF-AG1-HOST-dr187-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr187-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.49"]
      }
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-AG1-HOST-etn-v2t-01a"
   nsx_id = "TF-AG1-HOST-etn-v2t-01a"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-etn-v2t-01a"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.209.25"]
      }
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-AG1-HOST-dr118-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr118-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr118-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["52.116.104.70"]
      }
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-AG1-HOST-dr196-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr196-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr196-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.176"]
      }
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-AG1-HOST-ag1dr12sfm"
   nsx_id = "TF-AG1-HOST-ag1dr12sfm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr12sfm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.76.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-AG1-HOST-dr52-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr52-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr52-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.237"]
      }
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-AG1-HOST-ag1sr1bfrelay1"
   nsx_id = "TF-AG1-HOST-ag1sr1bfrelay1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1bfrelay1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.71"]
      }
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-AG1-HOST-ag1sr1sepm1"
   nsx_id = "TF-AG1-HOST-ag1sr1sepm1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1sepm1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.85"]
      }
   }
}
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-AG1-HOST-dr192-esg1-0"
   nsx_id = "TF-AG1-HOST-dr192-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr192-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-AG1-HOST-ag1srlpSATZcld_rhel7"
   nsx_id = "TF-AG1-HOST-ag1srlpSATZcld_rhel7"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpSATZcld_rhel7"
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
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-AG1-HOST-ag1d144lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d144lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d144lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamprd2"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamprd2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamprd2"
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
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-AG1-HOST-ag1dr59lppr1"
   nsx_id = "TF-AG1-HOST-ag1dr59lppr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr59lppr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.92.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-AG1-HOST-ag1sr1wdns02"
   nsx_id = "TF-AG1-HOST-ag1sr1wdns02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wdns02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-AG1-HOST-ag1dr156lparx"
   nsx_id = "TF-AG1-HOST-ag1dr156lparx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr156lparx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.138.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-AG1-HOST-ext-vpn1-0"
   nsx_id = "TF-AG1-HOST-ext-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-ext-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.230"]
      }
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamprq2"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamprq2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamprq2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.2.189"]
      }
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-AG1-HOST-ag1dr156dc1"
   nsx_id = "TF-AG1-HOST-ag1dr156dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr156dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.138.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-AG1-HOST-ag1d251lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d251lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d251lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.198.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-AG1-HOST-ag1pdr1prx02"
   nsx_id = "TF-AG1-HOST-ag1pdr1prx02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1pdr1prx02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.69.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-AG1-HOST-ag1dit4lniamjpf"
   nsx_id = "TF-AG1-HOST-ag1dit4lniamjpf"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dit4lniamjpf"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.158.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-AG1-HOST-dr75-esg1-1"
   nsx_id = "TF-AG1-HOST-dr75-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr75-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.20"]
      }
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-AG1-HOST-driamaasthy4-vpn1-0"
   nsx_id = "TF-AG1-HOST-driamaasthy4-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy4-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-AG1-HOST-ag1d78lpaecprx1"
   nsx_id = "TF-AG1-HOST-ag1d78lpaecprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d78lpaecprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.106.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-AG1-HOST-ag1sr1rhellic01"
   nsx_id = "TF-AG1-HOST-ag1sr1rhellic01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1rhellic01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.100"]
      }
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-AG1-HOST-dr216-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr216-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr216-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.201"]
      }
   }
}
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-AG1-HOST-driamaasthy4-vpn1-1"
   nsx_id = "TF-AG1-HOST-driamaasthy4-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy4-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_184" {
   display_name = "TF-AG1-HOST-dr47-esg1-0"
   nsx_id = "TF-AG1-HOST-dr47-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr47-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_185" {
   display_name = "TF-AG1-HOST-dr201-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr201-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr201-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.178"]
      }
   }
}
resource "nsxt_policy_group" "grp_186" {
   display_name = "TF-AG1-HOST-ag1sr1cntrl1"
   nsx_id = "TF-AG1-HOST-ag1sr1cntrl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1cntrl1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.38"]
      }
   }
}
resource "nsxt_policy_group" "grp_187" {
   display_name = "TF-AG1-HOST-dr182-esg1-1"
   nsx_id = "TF-AG1-HOST-dr182-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr182-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.46"]
      }
   }
}
resource "nsxt_policy_group" "grp_188" {
   display_name = "TF-AG1-HOST-dr116-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr116-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr116-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.161"]
      }
   }
}
resource "nsxt_policy_group" "grp_189" {
   display_name = "TF-AG1-HOST-ag1d75wphwcetl"
   nsx_id = "TF-AG1-HOST-ag1d75wphwcetl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d75wphwcetl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.102.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_190" {
   display_name = "TF-AG1-HOST-dr100-esg1-0"
   nsx_id = "TF-AG1-HOST-dr100-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr100-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.27"]
      }
   }
}
resource "nsxt_policy_group" "grp_191" {
   display_name = "TF-AG1-HOST-ag1dr59stw"
   nsx_id = "TF-AG1-HOST-ag1dr59stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr59stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.92.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_192" {
   display_name = "TF-AG1-HOST-ag1dr59stl"
   nsx_id = "TF-AG1-HOST-ag1dr59stl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr59stl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.92.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_193" {
   display_name = "TF-AG1-HOST-dr47-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr47-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr47-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.236"]
      }
   }
}
resource "nsxt_policy_group" "grp_194" {
   display_name = "TF-AG1-HOST-dr233-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr233-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr233-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.208"]
      }
   }
}
resource "nsxt_policy_group" "grp_195" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamprq1"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamprq1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamprq1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.103"]
      }
   }
}
resource "nsxt_policy_group" "grp_196" {
   display_name = "TF-AG1-HOST-dr285-esg1-0"
   nsx_id = "TF-AG1-HOST-dr285-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr285-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.72"]
      }
   }
}
resource "nsxt_policy_group" "grp_197" {
   display_name = "TF-AG1-HOST-agg-esg1-1"
   nsx_id = "TF-AG1-HOST-agg-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-agg-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.227"]
      }
   }
}
resource "nsxt_policy_group" "grp_198" {
   display_name = "TF-AG1-HOST-ag1d11lpstl"
   nsx_id = "TF-AG1-HOST-ag1d11lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d11lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.74.15"]
      }
   }
}
resource "nsxt_policy_group" "grp_199" {
   display_name = "TF-AG1-HOST-dr156-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr156-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr156-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.58"]
      }
   }
}
resource "nsxt_policy_group" "grp_200" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamprt3"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamprt3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamprt3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.109"]
      }
   }
}
resource "nsxt_policy_group" "grp_201" {
   display_name = "TF-AG1-HOST-dr52-esg1-0"
   nsx_id = "TF-AG1-HOST-dr52-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr52-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_202" {
   display_name = "TF-AG1-HOST-ag1sr1wpiampre3"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiampre3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiampre3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.170"]
      }
   }
}
resource "nsxt_policy_group" "grp_203" {
   display_name = "TF-AG1-HOST-dr203-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr203-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr203-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.90"]
      }
   }
}
resource "nsxt_policy_group" "grp_204" {
   display_name = "TF-AG1-HOST-ag1d162lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d162lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d162lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_205" {
   display_name = "TF-AG1-HOST-ag1srwphwcweb01"
   nsx_id = "TF-AG1-HOST-ag1srwphwcweb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwphwcweb01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.147"]
      }
   }
}
resource "nsxt_policy_group" "grp_206" {
   display_name = "TF-AG1-HOST-ag1d182lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d182lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d182lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.154.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_207" {
   display_name = "TF-AG1-HOST-dr144-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr144-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr144-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.162"]
      }
   }
}
resource "nsxt_policy_group" "grp_208" {
   display_name = "TF-AG1-HOST-ag1dr59fm"
   nsx_id = "TF-AG1-HOST-ag1dr59fm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr59fm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.92.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_209" {
   display_name = "TF-AG1-HOST-dr197-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr197-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr197-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.42"]
      }
   }
}
resource "nsxt_policy_group" "grp_210" {
   display_name = "TF-AG1-HOST-dr124-esg1-0"
   nsx_id = "TF-AG1-HOST-dr124-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr124-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_211" {
   display_name = "TF-AG1-HOST-ag1d278lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d278lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d278lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.204.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_212" {
   display_name = "TF-AG1-HOST-dr188-esg1-0"
   nsx_id = "TF-AG1-HOST-dr188-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr188-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.50"]
      }
   }
}
resource "nsxt_policy_group" "grp_213" {
   display_name = "TF-AG1-HOST-dr47-esg1-1"
   nsx_id = "TF-AG1-HOST-dr47-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr47-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_214" {
   display_name = "TF-AG1-HOST-ag1dr197dc1"
   nsx_id = "TF-AG1-HOST-ag1dr197dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr197dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.168.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_215" {
   display_name = "TF-AG1-HOST-ag1d151LPDRbg1"
   nsx_id = "TF-AG1-HOST-ag1d151LPDRbg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d151LPDRbg1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.136.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_216" {
   display_name = "TF-AG1-HOST-ag1d158lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d158lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d158lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.140.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_217" {
   display_name = "TF-AG1-HOST-dr95-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr95-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr95-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.157"]
      }
   }
}
resource "nsxt_policy_group" "grp_218" {
   display_name = "TF-AG1-HOST-ag1sr1lniamtssdi2"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamtssdi2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamtssdi2"
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
resource "nsxt_policy_group" "grp_219" {
   display_name = "TF-AG1-HOST-ag1dr77dc1"
   nsx_id = "TF-AG1-HOST-ag1dr77dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr77dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.104.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_220" {
   display_name = "TF-AG1-HOST-dr234-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr234-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr234-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.250"]
      }
   }
}
resource "nsxt_policy_group" "grp_221" {
   display_name = "TF-AG1-HOST-dr224-esg1-1"
   nsx_id = "TF-AG1-HOST-dr224-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr224-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.63"]
      }
   }
}
resource "nsxt_policy_group" "grp_222" {
   display_name = "TF-AG1-HOST-dr162-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr162-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr162-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.122"]
      }
   }
}
resource "nsxt_policy_group" "grp_223" {
   display_name = "TF-AG1-HOST-ag1d112stw"
   nsx_id = "TF-AG1-HOST-ag1d112stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d112stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.120.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_224" {
   display_name = "TF-AG1-HOST-ag1dr162lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr162lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr162lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_225" {
   display_name = "TF-AG1-HOST-dr78-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr78-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr78-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.58"]
      }
   }
}
resource "nsxt_policy_group" "grp_226" {
   display_name = "TF-AG1-HOST-AG1D53WPIGADCD1"
   nsx_id = "TF-AG1-HOST-AG1D53WPIGADCD1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1D53WPIGADCD1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.88.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_227" {
   display_name = "TF-AG1-HOST-dr77-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr77-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr77-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.246"]
      }
   }
}
resource "nsxt_policy_group" "grp_228" {
   display_name = "TF-AG1-HOST-dr116-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr116-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr116-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.161"]
      }
   }
}
resource "nsxt_policy_group" "grp_229" {
   display_name = "TF-AG1-HOST-dr211-esg1-0"
   nsx_id = "TF-AG1-HOST-dr211-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr211-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.58"]
      }
   }
}
resource "nsxt_policy_group" "grp_230" {
   display_name = "TF-AG1-HOST-dr251-esg1-1"
   nsx_id = "TF-AG1-HOST-dr251-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr251-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.68"]
      }
   }
}
resource "nsxt_policy_group" "grp_231" {
   display_name = "TF-AG1-HOST-ag1sr1lniamptsdi2"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamptsdi2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamptsdi2"
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
resource "nsxt_policy_group" "grp_232" {
   display_name = "TF-AG1-HOST-ag1srlphwcmon01"
   nsx_id = "TF-AG1-HOST-ag1srlphwcmon01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlphwcmon01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.178"]
      }
   }
}
resource "nsxt_policy_group" "grp_233" {
   display_name = "TF-AG1-HOST-dr192-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr192-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr192-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_234" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamprsdi3"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamprsdi3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamprsdi3"
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
resource "nsxt_policy_group" "grp_235" {
   display_name = "TF-AG1-HOST-ag1dr74stl"
   nsx_id = "TF-AG1-HOST-ag1dr74stl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr74stl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.100.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_236" {
   display_name = "TF-AG1-HOST-ag1sr1wpiampre1"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiampre1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiampre1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.113"]
      }
   }
}
resource "nsxt_policy_group" "grp_237" {
   display_name = "TF-AG1-HOST-dr158-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr158-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr158-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.166"]
      }
   }
}
resource "nsxt_policy_group" "grp_238" {
   display_name = "TF-AG1-HOST-ag1d233lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d233lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d233lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.192.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_239" {
   display_name = "TF-AG1-HOST-ag1d201lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d201lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d201lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.172.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_240" {
   display_name = "TF-AG1-HOST-ag1d116lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d116lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d116lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.122.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_241" {
   display_name = "TF-AG1-HOST-ag1dlniamjpfts2"
   nsx_id = "TF-AG1-HOST-ag1dlniamjpfts2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dlniamjpfts2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.130.15"]
      }
   }
}
resource "nsxt_policy_group" "grp_242" {
   display_name = "TF-AG1-HOST-ag1dr197lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr197lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr197lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.168.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_243" {
   display_name = "TF-AG1-HOST-ag1sr1wniamsbfs"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamsbfs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamsbfs"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.202"]
      }
   }
}
resource "nsxt_policy_group" "grp_244" {
   display_name = "TF-AG1-HOST-dr65-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr65-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr65-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.152"]
      }
   }
}
resource "nsxt_policy_group" "grp_245" {
   display_name = "TF-AG1-HOST-ag1dr65lpskl2"
   nsx_id = "TF-AG1-HOST-ag1dr65lpskl2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr65lpskl2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.94.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_246" {
   display_name = "TF-AG1-HOST-ag1sr1wniamptq1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamptq1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamptq1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.18"]
      }
   }
}
resource "nsxt_policy_group" "grp_247" {
   display_name = "TF-AG1-HOST-ag1dr147lpocum"
   nsx_id = "TF-AG1-HOST-ag1dr147lpocum"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr147lpocum"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.134.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_248" {
   display_name = "TF-AG1-HOST-dr124-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr124-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr124-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.218"]
      }
   }
}
resource "nsxt_policy_group" "grp_249" {
   display_name = "TF-AG1-HOST-ag1dr197lparx"
   nsx_id = "TF-AG1-HOST-ag1dr197lparx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr197lparx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.168.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_250" {
   display_name = "TF-AG1-HOST-dr118-esg1-0"
   nsx_id = "TF-AG1-HOST-dr118-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr118-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.31"]
      }
   }
}
resource "nsxt_policy_group" "grp_251" {
   display_name = "TF-AG1-HOST-ag1sr1lpta1str1"
   nsx_id = "TF-AG1-HOST-ag1sr1lpta1str1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpta1str1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.114"]
      }
   }
}
resource "nsxt_policy_group" "grp_252" {
   display_name = "TF-AG1-HOST-ag1dr162dc1"
   nsx_id = "TF-AG1-HOST-ag1dr162dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr162dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_253" {
   display_name = "TF-AG1-HOST-agnsrlndvadevdb"
   nsx_id = "TF-AG1-HOST-agnsrlndvadevdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlndvadevdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.133"]
      }
   }
}
resource "nsxt_policy_group" "grp_254" {
   display_name = "TF-AG1-HOST-ag1sr1w19lic01"
   nsx_id = "TF-AG1-HOST-ag1sr1w19lic01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1w19lic01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.161"]
      }
   }
}
resource "nsxt_policy_group" "grp_255" {
   display_name = "TF-AG1-HOST-ag1sr1wniamsbq1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamsbq1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamsbq1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.196"]
      }
   }
}
resource "nsxt_policy_group" "grp_256" {
   display_name = "TF-AG1-HOST-dr75-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr75-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr75-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.245"]
      }
   }
}
resource "nsxt_policy_group" "grp_257" {
   display_name = "TF-AG1-HOST-ag1sr1wniamptq2"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamptq2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamptq2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.80"]
      }
   }
}
resource "nsxt_policy_group" "grp_258" {
   display_name = "TF-AG1-HOST-dr12-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr12-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr12-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.146"]
      }
   }
}
resource "nsxt_policy_group" "grp_259" {
   display_name = "TF-AG1-HOST-ag1dr198stw"
   nsx_id = "TF-AG1-HOST-ag1dr198stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr198stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.170.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_260" {
   display_name = "TF-AG1-HOST-ag1sr1staas1"
   nsx_id = "TF-AG1-HOST-ag1sr1staas1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1staas1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.30"]
      }
   }
}
resource "nsxt_policy_group" "grp_261" {
   display_name = "TF-AG1-HOST-ag1sr1wniamsbr1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamsbr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamsbr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.198"]
      }
   }
}
resource "nsxt_policy_group" "grp_262" {
   display_name = "TF-AG1-HOST-dr65-esg1-0"
   nsx_id = "TF-AG1-HOST-dr65-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr65-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_263" {
   display_name = "TF-AG1-HOST-AG1D53WPIGASFM1"
   nsx_id = "TF-AG1-HOST-AG1D53WPIGASFM1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1D53WPIGASFM1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.88.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_264" {
   display_name = "TF-AG1-HOST-dr147-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr147-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr147-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.163"]
      }
   }
}
resource "nsxt_policy_group" "grp_265" {
   display_name = "TF-AG1-HOST-agnsrwnccmwsus"
   nsx_id = "TF-AG1-HOST-agnsrwnccmwsus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrwnccmwsus"
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
resource "nsxt_policy_group" "grp_266" {
   display_name = "TF-AG1-HOST-ag1sr1lpcactest"
   nsx_id = "TF-AG1-HOST-ag1sr1lpcactest"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpcactest"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.234"]
      }
   }
}
resource "nsxt_policy_group" "grp_267" {
   display_name = "TF-AG1-HOST-AG1D53LPIGAKLM1"
   nsx_id = "TF-AG1-HOST-AG1D53LPIGAKLM1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1D53LPIGAKLM1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.88.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_268" {
   display_name = "TF-AG1-HOST-dr78-esg1-0"
   nsx_id = "TF-AG1-HOST-dr78-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr78-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.22"]
      }
   }
}
resource "nsxt_policy_group" "grp_269" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamprsdi1"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamprsdi1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamprsdi1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.96"]
      }
   }
}
resource "nsxt_policy_group" "grp_270" {
   display_name = "TF-AG1-HOST-dr65-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr65-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr65-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.152"]
      }
   }
}
resource "nsxt_policy_group" "grp_271" {
   display_name = "TF-AG1-HOST-ag1dit3lniamjpf"
   nsx_id = "TF-AG1-HOST-ag1dit3lniamjpf"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dit3lniamjpf"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.150.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_272" {
   display_name = "TF-AG1-HOST-ag1d192lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d192lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d192lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.164.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_273" {
   display_name = "TF-AG1-HOST-ag1sr1lniamdb02"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamdb02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamdb02"
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
resource "nsxt_policy_group" "grp_274" {
   display_name = "TF-AG1-HOST-ag1d183lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d183lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d183lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.156.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_275" {
   display_name = "TF-AG1-HOST-ag1dr237dc1"
   nsx_id = "TF-AG1-HOST-ag1dr237dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr237dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.196.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_276" {
   display_name = "TF-AG1-HOST-ag1srlpSATZcld_old"
   nsx_id = "TF-AG1-HOST-ag1srlpSATZcld_old"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpSATZcld_old"
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
resource "nsxt_policy_group" "grp_277" {
   display_name = "TF-AG1-HOST-dr198-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr198-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr198-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.205"]
      }
   }
}
resource "nsxt_policy_group" "grp_278" {
   display_name = "TF-AG1-HOST-dr75-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr75-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr75-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_279" {
   display_name = "TF-AG1-HOST-ag1dr59dc2"
   nsx_id = "TF-AG1-HOST-ag1dr59dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr59dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.92.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_280" {
   display_name = "TF-AG1-HOST-WIN2016stdLatest"
   nsx_id = "TF-AG1-HOST-WIN2016stdLatest"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "WIN2016stdLatest"
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
resource "nsxt_policy_group" "grp_281" {
   display_name = "TF-AG1-HOST-ag1dr197lpocum"
   nsx_id = "TF-AG1-HOST-ag1dr197lpocum"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr197lpocum"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.168.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_282" {
   display_name = "TF-AG1-HOST-ag1dr65stl"
   nsx_id = "TF-AG1-HOST-ag1dr65stl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr65stl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.94.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_283" {
   display_name = "TF-AG1-HOST-driamaasthy3-vpn1-0"
   nsx_id = "TF-AG1-HOST-driamaasthy3-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy3-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.185"]
      }
   }
}
resource "nsxt_policy_group" "grp_284" {
   display_name = "TF-AG1-HOST-dr162-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr162-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr162-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.169"]
      }
   }
}
resource "nsxt_policy_group" "grp_285" {
   display_name = "TF-AG1-HOST-dr19-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr19-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr19-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.147"]
      }
   }
}
resource "nsxt_policy_group" "grp_286" {
   display_name = "TF-AG1-HOST-dr237-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr237-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr237-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.210"]
      }
   }
}
resource "nsxt_policy_group" "grp_287" {
   display_name = "TF-AG1-HOST-dr118-esg1-1"
   nsx_id = "TF-AG1-HOST-dr118-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr118-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.31"]
      }
   }
}
resource "nsxt_policy_group" "grp_288" {
   display_name = "TF-AG1-HOST-dr156-esg1-1"
   nsx_id = "TF-AG1-HOST-dr156-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr156-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.38"]
      }
   }
}
resource "nsxt_policy_group" "grp_289" {
   display_name = "TF-AG1-HOST-dr204-esg1-1"
   nsx_id = "TF-AG1-HOST-dr204-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr204-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.57"]
      }
   }
}
resource "nsxt_policy_group" "grp_290" {
   display_name = "TF-AG1-HOST-dr165-esg1-1"
   nsx_id = "TF-AG1-HOST-dr165-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr165-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.43"]
      }
   }
}
resource "nsxt_policy_group" "grp_291" {
   display_name = "TF-AG1-HOST-ag1sr1sltestvm"
   nsx_id = "TF-AG1-HOST-ag1sr1sltestvm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1sltestvm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.164"]
      }
   }
}
resource "nsxt_policy_group" "grp_292" {
   display_name = "TF-AG1-HOST-edge-71-jobdata-753773-1"
   nsx_id = "TF-AG1-HOST-edge-71-jobdata-753773-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "edge-71-jobdata-753773-1"
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
resource "nsxt_policy_group" "grp_293" {
   display_name = "TF-AG1-HOST-ag1dr198lpstl"
   nsx_id = "TF-AG1-HOST-ag1dr198lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr198lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.170.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_294" {
   display_name = "TF-AG1-HOST-ag1d233lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d233lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d233lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.192.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_295" {
   display_name = "TF-AG1-HOST-ag1dr198dc1"
   nsx_id = "TF-AG1-HOST-ag1dr198dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr198dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.170.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_296" {
   display_name = "TF-AG1-HOST-dr227-esg1-0"
   nsx_id = "TF-AG1-HOST-dr227-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr227-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.64"]
      }
   }
}
resource "nsxt_policy_group" "grp_297" {
   display_name = "TF-AG1-HOST-ag1h1lpta2hap1"
   nsx_id = "TF-AG1-HOST-ag1h1lpta2hap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1h1lpta2hap1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.71.240.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_298" {
   display_name = "TF-AG1-HOST-dr19-esg1-0"
   nsx_id = "TF-AG1-HOST-dr19-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr19-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_299" {
   display_name = "TF-AG1-HOST-dr162-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr162-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr162-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.169"]
      }
   }
}
resource "nsxt_policy_group" "grp_300" {
   display_name = "TF-AG1-HOST-driamaas2-esg1-0"
   nsx_id = "TF-AG1-HOST-driamaas2-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaas2-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.34"]
      }
   }
}
resource "nsxt_policy_group" "grp_301" {
   display_name = "TF-AG1-HOST-ag1d78lpaecprx2"
   nsx_id = "TF-AG1-HOST-ag1d78lpaecprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d78lpaecprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.106.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_302" {
   display_name = "TF-AG1-HOST-ag1srapjfwkali1"
   nsx_id = "TF-AG1-HOST-ag1srapjfwkali1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srapjfwkali1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.172"]
      }
   }
}
resource "nsxt_policy_group" "grp_303" {
   display_name = "TF-AG1-HOST-agg-esg1-0"
   nsx_id = "TF-AG1-HOST-agg-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-agg-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.227"]
      }
   }
}
resource "nsxt_policy_group" "grp_304" {
   display_name = "TF-AG1-HOST-ag1dr144lpipq2"
   nsx_id = "TF-AG1-HOST-ag1dr144lpipq2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr144lpipq2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_305" {
   display_name = "TF-AG1-HOST-ag1d217lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d217lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d217lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.184.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_306" {
   display_name = "TF-AG1-HOST-dr201-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr201-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr201-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.178"]
      }
   }
}
resource "nsxt_policy_group" "grp_307" {
   display_name = "TF-AG1-HOST-ag1dr162lpocum"
   nsx_id = "TF-AG1-HOST-ag1dr162lpocum"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr162lpocum"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_308" {
   display_name = "TF-AG1-HOST-agnsr1lnccmjmp2"
   nsx_id = "TF-AG1-HOST-agnsr1lnccmjmp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsr1lnccmjmp2"
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
resource "nsxt_policy_group" "grp_309" {
   display_name = "TF-AG1-HOST-rhcos-4-3-8-x86_64-vmware-x86_64"
   nsx_id = "TF-AG1-HOST-rhcos-4-3-8-x86_64-vmware-x86_64"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhcos-4.3.8-x86_64-vmware.x86_64"
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
resource "nsxt_policy_group" "grp_310" {
   display_name = "TF-AG1-HOST-ag1sr1ljmp01n"
   nsx_id = "TF-AG1-HOST-ag1sr1ljmp01n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1ljmp01n"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.174"]
      }
   }
}
resource "nsxt_policy_group" "grp_311" {
   display_name = "TF-AG1-HOST-ag1d158lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d158lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d158lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.140.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_312" {
   display_name = "TF-AG1-HOST-ag1d187lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d187lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d187lpcacpr2"
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
resource "nsxt_policy_group" "grp_313" {
   display_name = "TF-AG1-HOST-sres1-esg1-1"
   nsx_id = "TF-AG1-HOST-sres1-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-sres1-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_314" {
   display_name = "TF-AG1-HOST-ag1sr1aniamuasvg2"
   nsx_id = "TF-AG1-HOST-ag1sr1aniamuasvg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1aniamuasvg2"
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
resource "nsxt_policy_group" "grp_315" {
   display_name = "TF-AG1-HOST-ag1dr151stw"
   nsx_id = "TF-AG1-HOST-ag1dr151stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr151stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.136.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_316" {
   display_name = "TF-AG1-HOST-agnsrlnccmtower"
   nsx_id = "TF-AG1-HOST-agnsrlnccmtower"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnccmtower"
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
resource "nsxt_policy_group" "grp_317" {
   display_name = "TF-AG1-HOST-ag1sr1lpocnnfs02"
   nsx_id = "TF-AG1-HOST-ag1sr1lpocnnfs02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpocnnfs02"
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
resource "nsxt_policy_group" "grp_318" {
   display_name = "TF-AG1-HOST-ag1dr12dc1"
   nsx_id = "TF-AG1-HOST-ag1dr12dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr12dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.76.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_319" {
   display_name = "TF-AG1-HOST-ag1d217lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d217lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d217lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.184.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_320" {
   display_name = "TF-AG1-HOST-dr183-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr183-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr183-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.172"]
      }
   }
}
resource "nsxt_policy_group" "grp_321" {
   display_name = "TF-AG1-HOST-dr197-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr197-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr197-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.177"]
      }
   }
}
resource "nsxt_policy_group" "grp_322" {
   display_name = "TF-AG1-HOST-ag1dr147stw"
   nsx_id = "TF-AG1-HOST-ag1dr147stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr147stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.134.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_323" {
   display_name = "TF-AG1-HOST-ag1pdr1ucdrly01"
   nsx_id = "TF-AG1-HOST-ag1pdr1ucdrly01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1pdr1ucdrly01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.69.40"]
      }
   }
}
resource "nsxt_policy_group" "grp_324" {
   display_name = "TF-AG1-HOST-dr77-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr77-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr77-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.155"]
      }
   }
}
resource "nsxt_policy_group" "grp_325" {
   display_name = "TF-AG1-HOST-ag1dr59arx"
   nsx_id = "TF-AG1-HOST-ag1dr59arx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr59arx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.92.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_326" {
   display_name = "TF-AG1-HOST-dr192-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr192-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr192-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.175"]
      }
   }
}
resource "nsxt_policy_group" "grp_327" {
   display_name = "TF-AG1-HOST-dr52-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr52-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr52-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.237"]
      }
   }
}
resource "nsxt_policy_group" "grp_328" {
   display_name = "TF-AG1-HOST-dr165-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr165-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr165-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["52.116.104.83"]
      }
   }
}
resource "nsxt_policy_group" "grp_329" {
   display_name = "TF-AG1-HOST-NSX_Controller_e9509c8f-8b0b-4966-8b51-757d3e431cba"
   nsx_id = "TF-AG1-HOST-NSX_Controller_e9509c8f-8b0b-4966-8b51-757d3e431cba"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NSX_Controller_e9509c8f-8b0b-4966-8b51-757d3e431cba"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.137"]
      }
   }
}
resource "nsxt_policy_group" "grp_330" {
   display_name = "TF-AG1-HOST-ag1sr1wniamptra"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamptra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamptra"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.24"]
      }
   }
}
resource "nsxt_policy_group" "grp_331" {
   display_name = "TF-AG1-HOST-ag1sr1wniamtsr1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamtsr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamtsr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.41"]
      }
   }
}
resource "nsxt_policy_group" "grp_332" {
   display_name = "TF-AG1-HOST-agnsrwndvadeva2"
   nsx_id = "TF-AG1-HOST-agnsrwndvadeva2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrwndvadeva2"
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
resource "nsxt_policy_group" "grp_333" {
   display_name = "TF-AG1-HOST-driamaasthy3-esg1-1"
   nsx_id = "TF-AG1-HOST-driamaasthy3-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy3-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.44"]
      }
   }
}
resource "nsxt_policy_group" "grp_334" {
   display_name = "TF-AG1-HOST-dr19-esg1-1"
   nsx_id = "TF-AG1-HOST-dr19-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr19-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_335" {
   display_name = "TF-AG1-HOST-dr188-esg1-1"
   nsx_id = "TF-AG1-HOST-dr188-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr188-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.50"]
      }
   }
}
resource "nsxt_policy_group" "grp_336" {
   display_name = "TF-AG1-HOST-ag1dr74dc1"
   nsx_id = "TF-AG1-HOST-ag1dr74dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr74dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.100.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_337" {
   display_name = "TF-AG1-HOST-dr112-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr112-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr112-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.160"]
      }
   }
}
resource "nsxt_policy_group" "grp_338" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamprprx1"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamprprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamprprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.101"]
      }
   }
}
resource "nsxt_policy_group" "grp_339" {
   display_name = "TF-AG1-HOST-dres1-dlr1-0"
   nsx_id = "TF-AG1-HOST-dres1-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dres1-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.42"]
      }
   }
}
resource "nsxt_policy_group" "grp_340" {
   display_name = "TF-AG1-HOST-ag1srlphwcls01"
   nsx_id = "TF-AG1-HOST-ag1srlphwcls01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlphwcls01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.152"]
      }
   }
}
resource "nsxt_policy_group" "grp_341" {
   display_name = "TF-AG1-HOST-vm0121-pt"
   nsx_id = "TF-AG1-HOST-vm0121-pt"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vm0121-pt"
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
resource "nsxt_policy_group" "grp_342" {
   display_name = "TF-AG1-HOST-ag1d211lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d211lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d211lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.178.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_343" {
   display_name = "TF-AG1-HOST-ag1dr156lpfm"
   nsx_id = "TF-AG1-HOST-ag1dr156lpfm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr156lpfm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.138.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_344" {
   display_name = "TF-AG1-HOST-dr59-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr59-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr59-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.240"]
      }
   }
}
resource "nsxt_policy_group" "grp_345" {
   display_name = "TF-AG1-HOST-ubuntu1604_vm"
   nsx_id = "TF-AG1-HOST-ubuntu1604_vm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ubuntu1604_vm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.81"]
      }
   }
}
resource "nsxt_policy_group" "grp_346" {
   display_name = "TF-AG1-HOST-ag1sr1bfrelay2"
   nsx_id = "TF-AG1-HOST-ag1sr1bfrelay2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1bfrelay2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.72"]
      }
   }
}
resource "nsxt_policy_group" "grp_347" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamciprx1"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamciprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamciprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.204"]
      }
   }
}
resource "nsxt_policy_group" "grp_348" {
   display_name = "TF-AG1-HOST-gres-dlr1-0"
   nsx_id = "TF-AG1-HOST-gres-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "gres-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_349" {
   display_name = "TF-AG1-HOST-dr259-esg1-1"
   nsx_id = "TF-AG1-HOST-dr259-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr259-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.69"]
      }
   }
}
resource "nsxt_policy_group" "grp_350" {
   display_name = "TF-AG1-HOST-dr158-esg1-0"
   nsx_id = "TF-AG1-HOST-dr158-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr158-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.39"]
      }
   }
}
resource "nsxt_policy_group" "grp_351" {
   display_name = "TF-AG1-HOST-ag1dr11fm"
   nsx_id = "TF-AG1-HOST-ag1dr11fm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr11fm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.74.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_352" {
   display_name = "TF-AG1-HOST-ag1sr1aniamuasvg1"
   nsx_id = "TF-AG1-HOST-ag1sr1aniamuasvg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1aniamuasvg1"
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
resource "nsxt_policy_group" "grp_353" {
   display_name = "TF-AG1-HOST-ag1sr1lpsecgw1"
   nsx_id = "TF-AG1-HOST-ag1sr1lpsecgw1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpsecgw1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.233"]
      }
   }
}
resource "nsxt_policy_group" "grp_354" {
   display_name = "TF-AG1-HOST-dr197-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr197-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr197-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.177"]
      }
   }
}
resource "nsxt_policy_group" "grp_355" {
   display_name = "TF-AG1-HOST-ag1sr1staas2"
   nsx_id = "TF-AG1-HOST-ag1sr1staas2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1staas2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.31"]
      }
   }
}
resource "nsxt_policy_group" "grp_356" {
   display_name = "TF-AG1-HOST-ag1srwphwcdb01"
   nsx_id = "TF-AG1-HOST-ag1srwphwcdb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwphwcdb01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.148"]
      }
   }
}
resource "nsxt_policy_group" "grp_357" {
   display_name = "TF-AG1-HOST-ag1d162LPDRbg1"
   nsx_id = "TF-AG1-HOST-ag1d162LPDRbg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d162LPDRbg1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_358" {
   display_name = "TF-AG1-HOST-ag1dr12dc2"
   nsx_id = "TF-AG1-HOST-ag1dr12dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr12dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.76.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_359" {
   display_name = "TF-AG1-HOST-ag1sr1lniamsbprx1"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamsbprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamsbprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.195"]
      }
   }
}
resource "nsxt_policy_group" "grp_360" {
   display_name = "TF-AG1-HOST-driamaasthy-esg1-1"
   nsx_id = "TF-AG1-HOST-driamaasthy-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_361" {
   display_name = "TF-AG1-HOST-dr196-esg1-1"
   nsx_id = "TF-AG1-HOST-dr196-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr196-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_362" {
   display_name = "TF-AG1-HOST-ag1d203lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d203lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d203lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.174.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_363" {
   display_name = "TF-AG1-HOST-ag1dr11lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr11lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr11lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.74.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_364" {
   display_name = "TF-AG1-HOST-ag1sr1lniamuasdi"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamuasdi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamuasdi"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.67"]
      }
   }
}
resource "nsxt_policy_group" "grp_365" {
   display_name = "TF-AG1-HOST-ag1sr1wniamuae1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamuae1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamuae1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.78"]
      }
   }
}
resource "nsxt_policy_group" "grp_366" {
   display_name = "TF-AG1-HOST-dr192-esg1-1"
   nsx_id = "TF-AG1-HOST-dr192-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr192-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_367" {
   display_name = "TF-AG1-HOST-ag1sr1lniamtsd1"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamtsd1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamtsd1"
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
resource "nsxt_policy_group" "grp_368" {
   display_name = "TF-AG1-HOST-ag1sr1wniamuar2"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamuar2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamuar2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.77"]
      }
   }
}
resource "nsxt_policy_group" "grp_369" {
   display_name = "TF-AG1-HOST-ag1dr65skl"
   nsx_id = "TF-AG1-HOST-ag1dr65skl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr65skl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.94.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_370" {
   display_name = "TF-AG1-HOST-ag1d95lpjllprx1"
   nsx_id = "TF-AG1-HOST-ag1d95lpjllprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d95lpjllprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.108.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_371" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamprsdi2"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamprsdi2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamprsdi2"
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
resource "nsxt_policy_group" "grp_372" {
   display_name = "TF-AG1-HOST-ag1sr1wniampte1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniampte1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniampte1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_373" {
   display_name = "TF-AG1-HOST-ag1dr159lnprx1"
   nsx_id = "TF-AG1-HOST-ag1dr159lnprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr159lnprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.142.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_374" {
   display_name = "TF-AG1-HOST-ag1dr19dc1"
   nsx_id = "TF-AG1-HOST-ag1dr19dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr19dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.80.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_375" {
   display_name = "TF-AG1-HOST-ag1sr1aniamigi"
   nsx_id = "TF-AG1-HOST-ag1sr1aniamigi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1aniamigi"
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
resource "nsxt_policy_group" "grp_376" {
   display_name = "TF-AG1-HOST-dr77-esg1-1"
   nsx_id = "TF-AG1-HOST-dr77-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr77-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.21"]
      }
   }
}
resource "nsxt_policy_group" "grp_377" {
   display_name = "TF-AG1-HOST-ag1sftp01"
   nsx_id = "TF-AG1-HOST-ag1sftp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sftp01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.140"]
      }
   }
}
resource "nsxt_policy_group" "grp_378" {
   display_name = "TF-AG1-HOST-ag1d182lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d182lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d182lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.154.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_379" {
   display_name = "TF-AG1-HOST-ag1dr237lpstl"
   nsx_id = "TF-AG1-HOST-ag1dr237lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr237lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.196.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_380" {
   display_name = "TF-AG1-HOST-ag1dr59lppr2"
   nsx_id = "TF-AG1-HOST-ag1dr59lppr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr59lppr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.92.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_381" {
   display_name = "TF-AG1-HOST-ag1srlpdvaweb01"
   nsx_id = "TF-AG1-HOST-ag1srlpdvaweb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpdvaweb01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.149"]
      }
   }
}
resource "nsxt_policy_group" "grp_382" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamprfs"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamprfs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamprfs"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_383" {
   display_name = "TF-AG1-HOST-agnsrlnetocddb"
   nsx_id = "TF-AG1-HOST-agnsrlnetocddb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnetocddb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.130"]
      }
   }
}
resource "nsxt_policy_group" "grp_384" {
   display_name = "TF-AG1-HOST-dr224-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr224-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr224-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.202"]
      }
   }
}
resource "nsxt_policy_group" "grp_385" {
   display_name = "TF-AG1-HOST-agnsrlnetocdwas"
   nsx_id = "TF-AG1-HOST-agnsrlnetocdwas"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnetocdwas"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.131"]
      }
   }
}
resource "nsxt_policy_group" "grp_386" {
   display_name = "TF-AG1-HOST-dr278-esg1-0"
   nsx_id = "TF-AG1-HOST-dr278-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr278-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.71"]
      }
   }
}
resource "nsxt_policy_group" "grp_387" {
   display_name = "TF-AG1-HOST-ag1d100lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d100lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d100lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.116.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_388" {
   display_name = "TF-AG1-HOST-ag1d227lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d227lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d227lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.190.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_389" {
   display_name = "TF-AG1-HOST-dr112-esg1-0"
   nsx_id = "TF-AG1-HOST-dr112-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr112-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.29"]
      }
   }
}
resource "nsxt_policy_group" "grp_390" {
   display_name = "TF-AG1-HOST-ag1dr237stw"
   nsx_id = "TF-AG1-HOST-ag1dr237stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr237stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.196.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_391" {
   display_name = "TF-AG1-HOST-NSX_Controller_742c22a7-b7a0-488e-9450-5a9a080cf4c2"
   nsx_id = "TF-AG1-HOST-NSX_Controller_742c22a7-b7a0-488e-9450-5a9a080cf4c2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NSX_Controller_742c22a7-b7a0-488e-9450-5a9a080cf4c2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.136"]
      }
   }
}
resource "nsxt_policy_group" "grp_392" {
   display_name = "TF-AG1-HOST-agnsrlnccmrhel7"
   nsx_id = "TF-AG1-HOST-agnsrlnccmrhel7"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnccmrhel7"
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
resource "nsxt_policy_group" "grp_393" {
   display_name = "TF-AG1-HOST-dr259-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr259-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr259-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.212"]
      }
   }
}
resource "nsxt_policy_group" "grp_394" {
   display_name = "TF-AG1-HOST-dr183-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr183-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr183-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.202"]
      }
   }
}
resource "nsxt_policy_group" "grp_395" {
   display_name = "TF-AG1-HOST-dr59-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr59-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr59-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.151"]
      }
   }
}
resource "nsxt_policy_group" "grp_396" {
   display_name = "TF-AG1-HOST-dr273-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr273-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr273-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.213"]
      }
   }
}
resource "nsxt_policy_group" "grp_397" {
   display_name = "TF-AG1-HOST-dr259-esg1-0"
   nsx_id = "TF-AG1-HOST-dr259-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr259-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.69"]
      }
   }
}
resource "nsxt_policy_group" "grp_398" {
   display_name = "TF-AG1-HOST-dr259-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr259-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr259-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.4.42"]
      }
   }
}
resource "nsxt_policy_group" "grp_399" {
   display_name = "TF-AG1-HOST-dr74-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr74-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr74-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.154"]
      }
   }
}
resource "nsxt_policy_group" "grp_400" {
   display_name = "TF-AG1-HOST-dr211-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr211-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr211-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.181"]
      }
   }
}
resource "nsxt_policy_group" "grp_401" {
   display_name = "TF-AG1-HOST-ag1dr77lpocum"
   nsx_id = "TF-AG1-HOST-ag1dr77lpocum"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr77lpocum"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.104.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_402" {
   display_name = "TF-AG1-HOST-dr204-esg1-0"
   nsx_id = "TF-AG1-HOST-dr204-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr204-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.57"]
      }
   }
}
resource "nsxt_policy_group" "grp_403" {
   display_name = "TF-AG1-HOST-ag1srwphwcetl01"
   nsx_id = "TF-AG1-HOST-ag1srwphwcetl01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwphwcetl01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.149"]
      }
   }
}
resource "nsxt_policy_group" "grp_404" {
   display_name = "TF-AG1-HOST-ag1dr158lpprx2"
   nsx_id = "TF-AG1-HOST-ag1dr158lpprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr158lpprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.140.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_405" {
   display_name = "TF-AG1-HOST-ag1srlpsatpxy2"
   nsx_id = "TF-AG1-HOST-ag1srlpsatpxy2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpsatpxy2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.128"]
      }
   }
}
resource "nsxt_policy_group" "grp_406" {
   display_name = "TF-AG1-HOST-dr278-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr278-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr278-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.214"]
      }
   }
}
resource "nsxt_policy_group" "grp_407" {
   display_name = "TF-AG1-HOST-dr53-esg1-1"
   nsx_id = "TF-AG1-HOST-dr53-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr53-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_408" {
   display_name = "TF-AG1-HOST-ag1sr1wpiampre4"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiampre4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiampre4"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.171"]
      }
   }
}
resource "nsxt_policy_group" "grp_409" {
   display_name = "TF-AG1-HOST-ag1d223lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d223lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d223lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.186.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_410" {
   display_name = "TF-AG1-HOST-ag1sr1lniamptd1"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamptd1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamptd1"
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
resource "nsxt_policy_group" "grp_411" {
   display_name = "TF-AG1-HOST-ag1srlpdefmstr"
   nsx_id = "TF-AG1-HOST-ag1srlpdefmstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpdefmstr"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.62"]
      }
   }
}
resource "nsxt_policy_group" "grp_412" {
   display_name = "TF-AG1-HOST-ag1dr19dc2"
   nsx_id = "TF-AG1-HOST-ag1dr19dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr19dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.80.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_413" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamciq2"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamciq2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamciq2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.147"]
      }
   }
}
resource "nsxt_policy_group" "grp_414" {
   display_name = "TF-AG1-HOST-ag1pdr1lpmcmgw1"
   nsx_id = "TF-AG1-HOST-ag1pdr1lpmcmgw1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1pdr1lpmcmgw1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.69.25"]
      }
   }
}
resource "nsxt_policy_group" "grp_415" {
   display_name = "TF-AG1-HOST-dr95-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr95-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr95-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.157"]
      }
   }
}
resource "nsxt_policy_group" "grp_416" {
   display_name = "TF-AG1-HOST-dr159-esg1-1"
   nsx_id = "TF-AG1-HOST-dr159-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr159-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.40"]
      }
   }
}
resource "nsxt_policy_group" "grp_417" {
   display_name = "TF-AG1-HOST-ag1tubu01"
   nsx_id = "TF-AG1-HOST-ag1tubu01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1tubu01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.163"]
      }
   }
}
resource "nsxt_policy_group" "grp_418" {
   display_name = "TF-AG1-HOST-ag1dr151dc2"
   nsx_id = "TF-AG1-HOST-ag1dr151dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr151dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.136.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_419" {
   display_name = "TF-AG1-HOST-dr111-esg1-0"
   nsx_id = "TF-AG1-HOST-dr111-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr111-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.28"]
      }
   }
}
resource "nsxt_policy_group" "grp_420" {
   display_name = "TF-AG1-HOST-ag1dr144lpipq1"
   nsx_id = "TF-AG1-HOST-ag1dr144lpipq1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr144lpipq1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_421" {
   display_name = "TF-AG1-HOST-ag1srlpetocdb1011"
   nsx_id = "TF-AG1-HOST-ag1srlpetocdb1011"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpetocdb1011"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.25"]
      }
   }
}
resource "nsxt_policy_group" "grp_422" {
   display_name = "TF-AG1-HOST-ag1dlniamjpf2"
   nsx_id = "TF-AG1-HOST-ag1dlniamjpf2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dlniamjpf2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.130.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_423" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamprprx2"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamprprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamprprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.102"]
      }
   }
}
resource "nsxt_policy_group" "grp_424" {
   display_name = "TF-AG1-HOST-dr251-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr251-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr251-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.4.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_425" {
   display_name = "TF-AG1-HOST-ag1sr1wjmp02"
   nsx_id = "TF-AG1-HOST-ag1sr1wjmp02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wjmp02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.96"]
      }
   }
}
resource "nsxt_policy_group" "grp_426" {
   display_name = "TF-AG1-HOST-dr227-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr227-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr227-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.206"]
      }
   }
}
resource "nsxt_policy_group" "grp_427" {
   display_name = "TF-AG1-HOST-ag1dr234dc2"
   nsx_id = "TF-AG1-HOST-ag1dr234dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr234dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.194.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_428" {
   display_name = "TF-AG1-HOST-ag1dr234stw"
   nsx_id = "TF-AG1-HOST-ag1dr234stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr234stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.194.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_429" {
   display_name = "TF-AG1-HOST-dr211-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr211-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr211-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.122"]
      }
   }
}
resource "nsxt_policy_group" "grp_430" {
   display_name = "TF-AG1-HOST-rhel-template2-sr1-sp-ibm-local"
   nsx_id = "TF-AG1-HOST-rhel-template2-sr1-sp-ibm-local"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhel-template2.sr1.ag1.sp.ibm.local"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.70"]
      }
   }
}
resource "nsxt_policy_group" "grp_431" {
   display_name = "TF-AG1-HOST-ag1dr198dc2"
   nsx_id = "TF-AG1-HOST-ag1dr198dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr198dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.170.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_432" {
   display_name = "TF-AG1-HOST-dr160-esg1-1"
   nsx_id = "TF-AG1-HOST-dr160-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr160-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.41"]
      }
   }
}
resource "nsxt_policy_group" "grp_433" {
   display_name = "TF-AG1-HOST-dr180-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr180-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr180-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.170"]
      }
   }
}
resource "nsxt_policy_group" "grp_434" {
   display_name = "TF-AG1-HOST-dr273-esg1-1"
   nsx_id = "TF-AG1-HOST-dr273-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr273-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.70"]
      }
   }
}
resource "nsxt_policy_group" "grp_435" {
   display_name = "TF-AG1-HOST-dr196-esg1-0"
   nsx_id = "TF-AG1-HOST-dr196-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr196-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_436" {
   display_name = "TF-AG1-HOST-ag1h1lpta1hap2"
   nsx_id = "TF-AG1-HOST-ag1h1lpta1hap2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1h1lpta1hap2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.71.240.14"]
      }
   }
}
resource "nsxt_policy_group" "grp_437" {
   display_name = "TF-AG1-HOST-ag1dr144lparx"
   nsx_id = "TF-AG1-HOST-ag1dr144lparx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr144lparx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_438" {
   display_name = "TF-AG1-HOST-ag1srlpdvadb01"
   nsx_id = "TF-AG1-HOST-ag1srlpdvadb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpdvadb01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.148"]
      }
   }
}
resource "nsxt_policy_group" "grp_439" {
   display_name = "TF-AG1-HOST-dr203-esg1-1"
   nsx_id = "TF-AG1-HOST-dr203-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr203-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.56"]
      }
   }
}
resource "nsxt_policy_group" "grp_440" {
   display_name = "TF-AG1-HOST-dres1-vpn1-1"
   nsx_id = "TF-AG1-HOST-dres1-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dres1-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.229"]
      }
   }
}
resource "nsxt_policy_group" "grp_441" {
   display_name = "TF-AG1-HOST-ag1sr1wniamptr1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamptr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamptr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.22"]
      }
   }
}
resource "nsxt_policy_group" "grp_442" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcie3"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcie3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcie3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.193"]
      }
   }
}
resource "nsxt_policy_group" "grp_443" {
   display_name = "TF-AG1-HOST-dr278-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr278-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr278-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.4.74"]
      }
   }
}
resource "nsxt_policy_group" "grp_444" {
   display_name = "TF-AG1-HOST-ag1prx01n"
   nsx_id = "TF-AG1-HOST-ag1prx01n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1prx01n"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.177"]
      }
   }
}
resource "nsxt_policy_group" "grp_445" {
   display_name = "TF-AG1-HOST-dr278-esg1-1"
   nsx_id = "TF-AG1-HOST-dr278-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr278-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.71"]
      }
   }
}
resource "nsxt_policy_group" "grp_446" {
   display_name = "TF-AG1-HOST-dr211-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr211-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr211-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.181"]
      }
   }
}
resource "nsxt_policy_group" "grp_447" {
   display_name = "TF-AG1-HOST-dr165-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr165-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr165-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["52.116.104.83"]
      }
   }
}
resource "nsxt_policy_group" "grp_448" {
   display_name = "TF-AG1-HOST-dr53-esg1-0"
   nsx_id = "TF-AG1-HOST-dr53-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr53-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_449" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamprt1"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamprt1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamprt1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.107"]
      }
   }
}
resource "nsxt_policy_group" "grp_450" {
   display_name = "TF-AG1-HOST-ag1h1lpta1ssh1"
   nsx_id = "TF-AG1-HOST-ag1h1lpta1ssh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1h1lpta1ssh1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.71.240.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_451" {
   display_name = "TF-AG1-HOST-ag1d201lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d201lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d201lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.172.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_452" {
   display_name = "TF-AG1-HOST-ag1srlpsatpxy1"
   nsx_id = "TF-AG1-HOST-ag1srlpsatpxy1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpsatpxy1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.127"]
      }
   }
}
resource "nsxt_policy_group" "grp_453" {
   display_name = "TF-AG1-HOST-ag1d259lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d259lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d259lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.200.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_454" {
   display_name = "TF-AG1-HOST-ag1d75wphwcdb"
   nsx_id = "TF-AG1-HOST-ag1d75wphwcdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d75wphwcdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.102.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_455" {
   display_name = "TF-AG1-HOST-dr112-esg1-1"
   nsx_id = "TF-AG1-HOST-dr112-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr112-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.29"]
      }
   }
}
resource "nsxt_policy_group" "grp_456" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamprd1"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamprd1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamprd1"
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
resource "nsxt_policy_group" "grp_457" {
   display_name = "TF-AG1-HOST-ag1dr74stw"
   nsx_id = "TF-AG1-HOST-ag1dr74stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr74stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.100.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_458" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamuep4"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamuep4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamuep4"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.142"]
      }
   }
}
resource "nsxt_policy_group" "grp_459" {
   display_name = "TF-AG1-HOST-rhel-hc"
   nsx_id = "TF-AG1-HOST-rhel-hc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhel-hc"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.69"]
      }
   }
}
resource "nsxt_policy_group" "grp_460" {
   display_name = "TF-AG1-HOST-hres1-vpn1-1"
   nsx_id = "TF-AG1-HOST-hres1-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-hres1-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.137"]
      }
   }
}
resource "nsxt_policy_group" "grp_461" {
   display_name = "TF-AG1-HOST-ag1sr1wniamuafs"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamuafs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamuafs"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.88"]
      }
   }
}
resource "nsxt_policy_group" "grp_462" {
   display_name = "TF-AG1-HOST-rhel8_test2"
   nsx_id = "TF-AG1-HOST-rhel8_test2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhel8_test2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.156"]
      }
   }
}
resource "nsxt_policy_group" "grp_463" {
   display_name = "TF-AG1-HOST-ag1dr162lparx"
   nsx_id = "TF-AG1-HOST-ag1dr162lparx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr162lparx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_464" {
   display_name = "TF-AG1-HOST-ag1sr1wpiampre2"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiampre2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiampre2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.114"]
      }
   }
}
resource "nsxt_policy_group" "grp_465" {
   display_name = "TF-AG1-HOST-dr95-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr95-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr95-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.74"]
      }
   }
}
resource "nsxt_policy_group" "grp_466" {
   display_name = "TF-AG1-HOST-ag1jump02"
   nsx_id = "TF-AG1-HOST-ag1jump02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1jump02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.139"]
      }
   }
}
resource "nsxt_policy_group" "grp_467" {
   display_name = "TF-AG1-HOST-dr74-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr74-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr74-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_468" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamuep6"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamuep6"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamuep6"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.144"]
      }
   }
}
resource "nsxt_policy_group" "grp_469" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcir2"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcir2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcir2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.189"]
      }
   }
}
resource "nsxt_policy_group" "grp_470" {
   display_name = "TF-AG1-HOST-dr188-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr188-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr188-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.174"]
      }
   }
}
resource "nsxt_policy_group" "grp_471" {
   display_name = "TF-AG1-HOST-ag1dr19sklm"
   nsx_id = "TF-AG1-HOST-ag1dr19sklm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr19sklm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.80.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_472" {
   display_name = "TF-AG1-HOST-dr227-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr227-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr227-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.206"]
      }
   }
}
resource "nsxt_policy_group" "grp_473" {
   display_name = "TF-AG1-HOST-ag1sr1staas3"
   nsx_id = "TF-AG1-HOST-ag1sr1staas3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1staas3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_474" {
   display_name = "TF-AG1-HOST-dr156-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr156-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr156-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.165"]
      }
   }
}
resource "nsxt_policy_group" "grp_475" {
   display_name = "TF-AG1-HOST-dr203-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr203-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr203-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.179"]
      }
   }
}
resource "nsxt_policy_group" "grp_476" {
   display_name = "TF-AG1-HOST-dr217-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr217-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr217-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.202"]
      }
   }
}
resource "nsxt_policy_group" "grp_477" {
   display_name = "TF-AG1-HOST-dr212-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr212-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr212-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.182"]
      }
   }
}
resource "nsxt_policy_group" "grp_478" {
   display_name = "TF-AG1-HOST-dr212-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr212-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr212-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.182"]
      }
   }
}
resource "nsxt_policy_group" "grp_479" {
   display_name = "TF-AG1-HOST-dr144-esg1-0"
   nsx_id = "TF-AG1-HOST-dr144-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr144-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.35"]
      }
   }
}
resource "nsxt_policy_group" "grp_480" {
   display_name = "TF-AG1-HOST-pdr-esg1-0"
   nsx_id = "TF-AG1-HOST-pdr-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-pdr-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["52.116.104.68"]
      }
   }
}
resource "nsxt_policy_group" "grp_481" {
   display_name = "TF-AG1-HOST-AG1D53LPIGAKLM2"
   nsx_id = "TF-AG1-HOST-AG1D53LPIGAKLM2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1D53LPIGAKLM2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.88.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_482" {
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
         ip_addresses = ["158.87.49.175"]
      }
   }
}
resource "nsxt_policy_group" "grp_483" {
   display_name = "TF-AG1-HOST-agnsrlndvadeva1"
   nsx_id = "TF-AG1-HOST-agnsrlndvadeva1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlndvadeva1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.132"]
      }
   }
}
resource "nsxt_policy_group" "grp_484" {
   display_name = "TF-AG1-HOST-ag1d112dc2"
   nsx_id = "TF-AG1-HOST-ag1d112dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d112dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.120.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_485" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcie2"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcie2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcie2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.192"]
      }
   }
}
resource "nsxt_policy_group" "grp_486" {
   display_name = "TF-AG1-HOST-ag1trhl01"
   nsx_id = "TF-AG1-HOST-ag1trhl01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1trhl01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.164"]
      }
   }
}
resource "nsxt_policy_group" "grp_487" {
   display_name = "TF-AG1-HOST-ag1d112stl"
   nsx_id = "TF-AG1-HOST-ag1d112stl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d112stl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.120.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_488" {
   display_name = "TF-AG1-HOST-ag1dr198lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr198lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr198lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.170.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_489" {
   display_name = "TF-AG1-HOST-dr233-esg1-0"
   nsx_id = "TF-AG1-HOST-dr233-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr233-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.65"]
      }
   }
}
resource "nsxt_policy_group" "grp_490" {
   display_name = "TF-AG1-HOST-ag1d112fm"
   nsx_id = "TF-AG1-HOST-ag1d112fm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d112fm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.120.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_491" {
   display_name = "TF-AG1-HOST-ag1twin01"
   nsx_id = "TF-AG1-HOST-ag1twin01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1twin01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.162"]
      }
   }
}
resource "nsxt_policy_group" "grp_492" {
   display_name = "TF-AG1-HOST-ag1dr156lpstl"
   nsx_id = "TF-AG1-HOST-ag1dr156lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr156lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.138.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_493" {
   display_name = "TF-AG1-HOST-ag1dr156dc2"
   nsx_id = "TF-AG1-HOST-ag1dr156dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr156dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.138.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_494" {
   display_name = "TF-AG1-HOST-dr203-esg1-0"
   nsx_id = "TF-AG1-HOST-dr203-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr203-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.56"]
      }
   }
}
resource "nsxt_policy_group" "grp_495" {
   display_name = "TF-AG1-HOST-dr285-esg1-1"
   nsx_id = "TF-AG1-HOST-dr285-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr285-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.72"]
      }
   }
}
resource "nsxt_policy_group" "grp_496" {
   display_name = "TF-AG1-HOST-ag1pdr1prx01"
   nsx_id = "TF-AG1-HOST-ag1pdr1prx01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1pdr1prx01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.69.2"]
      }
   }
}
resource "nsxt_policy_group" "grp_497" {
   display_name = "TF-AG1-HOST-ag1sr1dajh01"
   nsx_id = "TF-AG1-HOST-ag1sr1dajh01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1dajh01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_498" {
   display_name = "TF-AG1-HOST-ag1sr1lpansb"
   nsx_id = "TF-AG1-HOST-ag1sr1lpansb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpansb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.196"]
      }
   }
}
resource "nsxt_policy_group" "grp_499" {
   display_name = "TF-AG1-HOST-dr233-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr233-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr233-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.208"]
      }
   }
}
resource "nsxt_policy_group" "grp_500" {
   display_name = "TF-AG1-HOST-ag1sr1aniamtssvg1"
   nsx_id = "TF-AG1-HOST-ag1sr1aniamtssvg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1aniamtssvg1"
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
resource "nsxt_policy_group" "grp_501" {
   display_name = "TF-AG1-HOST-dr251-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr251-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr251-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.211"]
      }
   }
}
resource "nsxt_policy_group" "grp_502" {
   display_name = "TF-AG1-HOST-ag1sr1wniamtsfs"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamtsfs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamtsfs"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.45"]
      }
   }
}
resource "nsxt_policy_group" "grp_503" {
   display_name = "TF-AG1-HOST-ag1vrli01"
   nsx_id = "TF-AG1-HOST-ag1vrli01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1vrli01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.141"]
      }
   }
}
resource "nsxt_policy_group" "grp_504" {
   display_name = "TF-AG1-HOST-dres1-esg1-0"
   nsx_id = "TF-AG1-HOST-dres1-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dres1-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_505" {
   display_name = "TF-AG1-HOST-dr165-esg1-0"
   nsx_id = "TF-AG1-HOST-dr165-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr165-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.43"]
      }
   }
}
resource "nsxt_policy_group" "grp_506" {
   display_name = "TF-AG1-HOST-ag1wtslic01"
   nsx_id = "TF-AG1-HOST-ag1wtslic01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1wtslic01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.153"]
      }
   }
}
resource "nsxt_policy_group" "grp_507" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamciq1"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamciq1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamciq1"
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
resource "nsxt_policy_group" "grp_508" {
   display_name = "TF-AG1-HOST-ag1sr1apiamprsvg2"
   nsx_id = "TF-AG1-HOST-ag1sr1apiamprsvg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1apiamprsvg2"
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
resource "nsxt_policy_group" "grp_509" {
   display_name = "TF-AG1-HOST-ag1dr237dc2"
   nsx_id = "TF-AG1-HOST-ag1dr237dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr237dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.196.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_510" {
   display_name = "TF-AG1-HOST-dr160-esg1-0"
   nsx_id = "TF-AG1-HOST-dr160-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr160-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.41"]
      }
   }
}
resource "nsxt_policy_group" "grp_511" {
   display_name = "TF-AG1-HOST-ag1sr1aniamptsvg2"
   nsx_id = "TF-AG1-HOST-ag1sr1aniamptsvg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1aniamptsvg2"
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
resource "nsxt_policy_group" "grp_512" {
   display_name = "TF-AG1-HOST-dr237-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr237-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr237-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.4.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_513" {
   display_name = "TF-AG1-HOST-ag1srwphwcsrv01"
   nsx_id = "TF-AG1-HOST-ag1srwphwcsrv01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwphwcsrv01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.150"]
      }
   }
}
resource "nsxt_policy_group" "grp_514" {
   display_name = "TF-AG1-HOST-dr187-esg1-0"
   nsx_id = "TF-AG1-HOST-dr187-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr187-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.49"]
      }
   }
}
resource "nsxt_policy_group" "grp_515" {
   display_name = "TF-AG1-HOST-ag1lmssqr01_migration-to-splunk_nic-removed"
   nsx_id = "TF-AG1-HOST-ag1lmssqr01_migration-to-splunk_nic-removed"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1lmssqr01_migration to splunk_nic removed"
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
resource "nsxt_policy_group" "grp_516" {
   display_name = "TF-AG1-HOST-ag1sr1lniamptprx2"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamptprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamptprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.17"]
      }
   }
}
resource "nsxt_policy_group" "grp_517" {
   display_name = "TF-AG1-HOST-ag1d259lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d259lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d259lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.200.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_518" {
   display_name = "TF-AG1-HOST-rhel7_testvm"
   nsx_id = "TF-AG1-HOST-rhel7_testvm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhel7_testvm"
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
resource "nsxt_policy_group" "grp_519" {
   display_name = "TF-AG1-HOST-dr187-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr187-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr187-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.234"]
      }
   }
}
resource "nsxt_policy_group" "grp_520" {
   display_name = "TF-AG1-HOST-dr278-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr278-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr278-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.214"]
      }
   }
}
resource "nsxt_policy_group" "grp_521" {
   display_name = "TF-AG1-HOST-ag1lsplunkfwd01"
   nsx_id = "TF-AG1-HOST-ag1lsplunkfwd01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1lsplunkfwd01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.152"]
      }
   }
}
resource "nsxt_policy_group" "grp_522" {
   display_name = "TF-AG1-HOST-ag1dr77stl"
   nsx_id = "TF-AG1-HOST-ag1dr77stl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr77stl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.104.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_523" {
   display_name = "TF-AG1-HOST-ag1dr12stl"
   nsx_id = "TF-AG1-HOST-ag1dr12stl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr12stl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.76.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_524" {
   display_name = "TF-AG1-HOST-dr52-esg1-1"
   nsx_id = "TF-AG1-HOST-dr52-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr52-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_525" {
   display_name = "TF-AG1-HOST-ag1sr1wdns01"
   nsx_id = "TF-AG1-HOST-ag1sr1wdns01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wdns01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.2"]
      }
   }
}
resource "nsxt_policy_group" "grp_526" {
   display_name = "TF-AG1-HOST-dr192-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr192-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr192-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.175"]
      }
   }
}
resource "nsxt_policy_group" "grp_527" {
   display_name = "TF-AG1-HOST-dr11-esg1-0"
   nsx_id = "TF-AG1-HOST-dr11-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr11-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_528" {
   display_name = "TF-AG1-HOST-agnsr1lnccmimpt"
   nsx_id = "TF-AG1-HOST-agnsr1lnccmimpt"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsr1lnccmimpt"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.189"]
      }
   }
}
resource "nsxt_policy_group" "grp_529" {
   display_name = "TF-AG1-HOST-dr158-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr158-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr158-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.166"]
      }
   }
}
resource "nsxt_policy_group" "grp_530" {
   display_name = "TF-AG1-HOST-ag1dr11dc2"
   nsx_id = "TF-AG1-HOST-ag1dr11dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr11dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.74.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_531" {
   display_name = "TF-AG1-HOST-ag1d187lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d187lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d187lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.160.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_532" {
   display_name = "TF-AG1-HOST-dr11-esg1-1"
   nsx_id = "TF-AG1-HOST-dr11-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr11-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_533" {
   display_name = "TF-AG1-HOST-rhel-template1-sr1-sp-ibm-local"
   nsx_id = "TF-AG1-HOST-rhel-template1-sr1-sp-ibm-local"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhel-template1.sr1.ag1.sp.ibm.local"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.69"]
      }
   }
}
resource "nsxt_policy_group" "grp_534" {
   display_name = "TF-AG1-HOST-ag1d188lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d188lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d188lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.162.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_535" {
   display_name = "TF-AG1-HOST-ag1sr1wniamuat2"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamuat2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamuat2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.75"]
      }
   }
}
resource "nsxt_policy_group" "grp_536" {
   display_name = "TF-AG1-HOST-ag1dr12stw"
   nsx_id = "TF-AG1-HOST-ag1dr12stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr12stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.76.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_537" {
   display_name = "TF-AG1-HOST-ag1d100fm"
   nsx_id = "TF-AG1-HOST-ag1d100fm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d100fm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.116.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_538" {
   display_name = "TF-AG1-HOST-ag1dr144dc1"
   nsx_id = "TF-AG1-HOST-ag1dr144dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr144dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_539" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamcibkl1"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamcibkl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamcibkl1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.194"]
      }
   }
}
resource "nsxt_policy_group" "grp_540" {
   display_name = "TF-AG1-HOST-dr224-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr224-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr224-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.204"]
      }
   }
}
resource "nsxt_policy_group" "grp_541" {
   display_name = "TF-AG1-HOST-dr11-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr11-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr11-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.145"]
      }
   }
}
resource "nsxt_policy_group" "grp_542" {
   display_name = "TF-AG1-HOST-ag1d100lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d100lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d100lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.116.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_543" {
   display_name = "TF-AG1-HOST-dr78-esg1-1"
   nsx_id = "TF-AG1-HOST-dr78-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr78-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.22"]
      }
   }
}
resource "nsxt_policy_group" "grp_544" {
   display_name = "TF-AG1-HOST-dr273-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr273-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr273-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.4.58"]
      }
   }
}
resource "nsxt_policy_group" "grp_545" {
   display_name = "TF-AG1-HOST-driamaasthy-vpn1-0"
   nsx_id = "TF-AG1-HOST-driamaasthy-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.183"]
      }
   }
}
resource "nsxt_policy_group" "grp_546" {
   display_name = "TF-AG1-HOST-ag1sr1aniamigi2"
   nsx_id = "TF-AG1-HOST-ag1sr1aniamigi2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1aniamigi2"
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
resource "nsxt_policy_group" "grp_547" {
   display_name = "TF-AG1-HOST-ag1h1lpta2hap2"
   nsx_id = "TF-AG1-HOST-ag1h1lpta2hap2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1h1lpta2hap2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.71.240.17"]
      }
   }
}
resource "nsxt_policy_group" "grp_548" {
   display_name = "TF-AG1-HOST-ag1d203lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d203lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d203lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.174.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_549" {
   display_name = "TF-AG1-HOST-dr159-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr159-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr159-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.90"]
      }
   }
}
resource "nsxt_policy_group" "grp_550" {
   display_name = "TF-AG1-HOST-ag1d59lpstl"
   nsx_id = "TF-AG1-HOST-ag1d59lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d59lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.92.15"]
      }
   }
}
resource "nsxt_policy_group" "grp_551" {
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
         ip_addresses = ["158.87.49.176"]
      }
   }
}
resource "nsxt_policy_group" "grp_552" {
   display_name = "TF-AG1-HOST-ag1dr65dc1"
   nsx_id = "TF-AG1-HOST-ag1dr65dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr65dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.94.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_553" {
   display_name = "TF-AG1-HOST-ag1dr147dc1"
   nsx_id = "TF-AG1-HOST-ag1dr147dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr147dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.134.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_554" {
   display_name = "TF-AG1-HOST-dr187-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr187-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr187-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.173"]
      }
   }
}
resource "nsxt_policy_group" "grp_555" {
   display_name = "TF-AG1-HOST-ag1sr1lcacfjump01"
   nsx_id = "TF-AG1-HOST-ag1sr1lcacfjump01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lcacfjump01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.165"]
      }
   }
}
resource "nsxt_policy_group" "grp_556" {
   display_name = "TF-AG1-HOST-dr180-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr180-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr180-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["52.116.104.85"]
      }
   }
}
resource "nsxt_policy_group" "grp_557" {
   display_name = "TF-AG1-HOST-gres-esg1-0"
   nsx_id = "TF-AG1-HOST-gres-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "gres-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_558" {
   display_name = "TF-AG1-HOST-ag1dlniamjpfua2"
   nsx_id = "TF-AG1-HOST-ag1dlniamjpfua2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dlniamjpfua2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.130.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_559" {
   display_name = "TF-AG1-HOST-ag1sr1lniamtssdi1"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamtssdi1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamtssdi1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.34"]
      }
   }
}
resource "nsxt_policy_group" "grp_560" {
   display_name = "TF-AG1-HOST-ag1dr147lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr147lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr147lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.134.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_561" {
   display_name = "TF-AG1-HOST-ag1srlnetocdb1021"
   nsx_id = "TF-AG1-HOST-ag1srlnetocdb1021"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlnetocdb1021"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.27"]
      }
   }
}
resource "nsxt_policy_group" "grp_562" {
   display_name = "TF-AG1-HOST-ag1dr12arx"
   nsx_id = "TF-AG1-HOST-ag1dr12arx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr12arx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.76.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_563" {
   display_name = "TF-AG1-HOST-dr74-esg1-0"
   nsx_id = "TF-AG1-HOST-dr74-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr74-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.19"]
      }
   }
}
resource "nsxt_policy_group" "grp_564" {
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
         ip_addresses = ["158.87.48.35"]
      }
   }
}
resource "nsxt_policy_group" "grp_565" {
   display_name = "TF-AG1-HOST-ag1srwphwcgrfds"
   nsx_id = "TF-AG1-HOST-ag1srwphwcgrfds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwphwcgrfds"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.159"]
      }
   }
}
resource "nsxt_policy_group" "grp_566" {
   display_name = "TF-AG1-HOST-ag1srwphwcgrfds-clone"
   nsx_id = "TF-AG1-HOST-ag1srwphwcgrfds-clone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwphwcgrfds-clone"
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
resource "nsxt_policy_group" "grp_567" {
   display_name = "TF-AG1-HOST-dr187-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr187-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr187-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.173"]
      }
   }
}
resource "nsxt_policy_group" "grp_568" {
   display_name = "TF-AG1-HOST-dr160-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr160-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr160-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["52.116.104.81"]
      }
   }
}
resource "nsxt_policy_group" "grp_569" {
   display_name = "TF-AG1-HOST-ag1dr156lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr156lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr156lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.138.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_570" {
   display_name = "TF-AG1-HOST-ag1dr74arx"
   nsx_id = "TF-AG1-HOST-ag1dr74arx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr74arx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.100.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_571" {
   display_name = "TF-AG1-HOST-hres1-lb1-0"
   nsx_id = "TF-AG1-HOST-hres1-lb1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-hres1-lb1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.71.240.2"]
      }
   }
}
resource "nsxt_policy_group" "grp_572" {
   display_name = "TF-AG1-HOST-dr159-esg1-0"
   nsx_id = "TF-AG1-HOST-dr159-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr159-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.40"]
      }
   }
}
resource "nsxt_policy_group" "grp_573" {
   display_name = "TF-AG1-HOST-dr151-esg1-0"
   nsx_id = "TF-AG1-HOST-dr151-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr151-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.37"]
      }
   }
}
resource "nsxt_policy_group" "grp_574" {
   display_name = "TF-AG1-HOST-ag1srlpchatixf1"
   nsx_id = "TF-AG1-HOST-ag1srlpchatixf1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpchatixf1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.167"]
      }
   }
}
resource "nsxt_policy_group" "grp_575" {
   display_name = "TF-AG1-HOST-ag1h1lpta1hap1"
   nsx_id = "TF-AG1-HOST-ag1h1lpta1hap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1h1lpta1hap1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.71.240.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_576" {
   display_name = "TF-AG1-HOST-dr196-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr196-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr196-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_577" {
   display_name = "TF-AG1-HOST-dr196-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr196-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr196-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.176"]
      }
   }
}
resource "nsxt_policy_group" "grp_578" {
   display_name = "TF-AG1-HOST-dr237-esg1-1"
   nsx_id = "TF-AG1-HOST-dr237-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr237-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.67"]
      }
   }
}
resource "nsxt_policy_group" "grp_579" {
   display_name = "TF-AG1-HOST-pdr-dlr1-0"
   nsx_id = "TF-AG1-HOST-pdr-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-pdr-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_580" {
   display_name = "TF-AG1-HOST-ag1dr234lpstl"
   nsx_id = "TF-AG1-HOST-ag1dr234lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr234lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.194.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_581" {
   display_name = "TF-AG1-HOST-ag1sr1lniamtssdi3"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamtssdi3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamtssdi3"
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
resource "nsxt_policy_group" "grp_582" {
   display_name = "TF-AG1-HOST-dr182-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr182-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr182-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_583" {
   display_name = "TF-AG1-HOST-dr197-esg1-1"
   nsx_id = "TF-AG1-HOST-dr197-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr197-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.53"]
      }
   }
}
resource "nsxt_policy_group" "grp_584" {
   display_name = "TF-AG1-HOST-ag1dr198lparx"
   nsx_id = "TF-AG1-HOST-ag1dr198lparx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr198lparx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.170.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_585" {
   display_name = "TF-AG1-HOST-dr204-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr204-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr204-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_586" {
   display_name = "TF-AG1-HOST-rhel8_test1"
   nsx_id = "TF-AG1-HOST-rhel8_test1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhel8_test1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.155"]
      }
   }
}
resource "nsxt_policy_group" "grp_587" {
   display_name = "TF-AG1-HOST-dr217-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr217-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr217-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.202"]
      }
   }
}
resource "nsxt_policy_group" "grp_588" {
   display_name = "TF-AG1-HOST-ag1d151LPDRbg2"
   nsx_id = "TF-AG1-HOST-ag1d151LPDRbg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d151LPDRbg2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.136.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_589" {
   display_name = "TF-AG1-HOST-ag1sr1lniamdb01"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamdb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamdb01"
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
resource "nsxt_policy_group" "grp_590" {
   display_name = "TF-AG1-HOST-dr116-esg1-0"
   nsx_id = "TF-AG1-HOST-dr116-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr116-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.30"]
      }
   }
}
resource "nsxt_policy_group" "grp_591" {
   display_name = "TF-AG1-HOST-dr201-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr201-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr201-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.74"]
      }
   }
}
resource "nsxt_policy_group" "grp_592" {
   display_name = "TF-AG1-HOST-dr182-esg1-0"
   nsx_id = "TF-AG1-HOST-dr182-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr182-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.46"]
      }
   }
}
resource "nsxt_policy_group" "grp_593" {
   display_name = "TF-AG1-HOST-ag1srlpcarwas1000"
   nsx_id = "TF-AG1-HOST-ag1srlpcarwas1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpcarwas1000"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.31"]
      }
   }
}
resource "nsxt_policy_group" "grp_594" {
   display_name = "TF-AG1-HOST-ag1dr144dc2"
   nsx_id = "TF-AG1-HOST-ag1dr144dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr144dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_595" {
   display_name = "TF-AG1-HOST-ag1srlnetocwas1021"
   nsx_id = "TF-AG1-HOST-ag1srlnetocwas1021"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlnetocwas1021"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.28"]
      }
   }
}
resource "nsxt_policy_group" "grp_596" {
   display_name = "TF-AG1-HOST-ag1dr147lpstl"
   nsx_id = "TF-AG1-HOST-ag1dr147lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr147lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.134.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_597" {
   display_name = "TF-AG1-HOST-etn-v2t-01b"
   nsx_id = "TF-AG1-HOST-etn-v2t-01b"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-etn-v2t-01b"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.209.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_598" {
   display_name = "TF-AG1-HOST-ag1d112lparx"
   nsx_id = "TF-AG1-HOST-ag1d112lparx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d112lparx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.120.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_599" {
   display_name = "TF-AG1-HOST-ag1srlpetocwas1011"
   nsx_id = "TF-AG1-HOST-ag1srlpetocwas1011"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpetocwas1011"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_600" {
   display_name = "TF-AG1-HOST-ag1sr1lniamptsdi3"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamptsdi3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamptsdi3"
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
resource "nsxt_policy_group" "grp_601" {
   display_name = "TF-AG1-HOST-ag1dr144lpOrch"
   nsx_id = "TF-AG1-HOST-ag1dr144lpOrch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr144lpOrch"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_602" {
   display_name = "TF-AG1-HOST-ag1sr1lniamuaprx1"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamuaprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamuaprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.70"]
      }
   }
}
resource "nsxt_policy_group" "grp_603" {
   display_name = "TF-AG1-HOST-dr53-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr53-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr53-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.149"]
      }
   }
}
resource "nsxt_policy_group" "grp_604" {
   display_name = "TF-AG1-HOST-ag1dr197dc2"
   nsx_id = "TF-AG1-HOST-ag1dr197dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr197dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.168.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_605" {
   display_name = "TF-AG1-HOST-ag1sr1wniamsbt1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamsbt1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamsbt1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.197"]
      }
   }
}
resource "nsxt_policy_group" "grp_606" {
   display_name = "TF-AG1-HOST-dr237-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr237-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr237-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.210"]
      }
   }
}
resource "nsxt_policy_group" "grp_607" {
   display_name = "TF-AG1-HOST-dr285-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr285-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr285-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.215"]
      }
   }
}
resource "nsxt_policy_group" "grp_608" {
   display_name = "TF-AG1-HOST-agnsr1lnccmomni"
   nsx_id = "TF-AG1-HOST-agnsr1lnccmomni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsr1lnccmomni"
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
resource "nsxt_policy_group" "grp_609" {
   display_name = "TF-AG1-HOST-edge-68-jobdata-753858-0"
   nsx_id = "TF-AG1-HOST-edge-68-jobdata-753858-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "edge-68-jobdata-753858-0"
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
resource "nsxt_policy_group" "grp_610" {
   display_name = "TF-AG1-HOST-ag1sr1apiamprsvg1"
   nsx_id = "TF-AG1-HOST-ag1sr1apiamprsvg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1apiamprsvg1"
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
resource "nsxt_policy_group" "grp_611" {
   display_name = "TF-AG1-HOST-dr95-esg1-1"
   nsx_id = "TF-AG1-HOST-dr95-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr95-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.23"]
      }
   }
}
resource "nsxt_policy_group" "grp_612" {
   display_name = "TF-AG1-HOST-ag1sr1lniamptprx1"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamptprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamptprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_613" {
   display_name = "TF-AG1-HOST-ag1d227lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d227lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d227lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.190.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_614" {
   display_name = "TF-AG1-HOST-ag1sr1wniamptr2"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamptr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamptr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.23"]
      }
   }
}
resource "nsxt_policy_group" "grp_615" {
   display_name = "TF-AG1-HOST-agnsrwndvaapp02"
   nsx_id = "TF-AG1-HOST-agnsrwndvaapp02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrwndvaapp02"
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
resource "nsxt_policy_group" "grp_616" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamprt2"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamprt2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamprt2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.108"]
      }
   }
}
resource "nsxt_policy_group" "grp_617" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamprra"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamprra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamprra"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.93"]
      }
   }
}
resource "nsxt_policy_group" "grp_618" {
   display_name = "TF-AG1-HOST-Ag1srlpSATZcld"
   nsx_id = "TF-AG1-HOST-Ag1srlpSATZcld"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "Ag1srlpSATZcld"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.230"]
      }
   }
}
resource "nsxt_policy_group" "grp_619" {
   display_name = "TF-AG1-HOST-driamaasthy3-esg1-0"
   nsx_id = "TF-AG1-HOST-driamaasthy3-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy3-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.44"]
      }
   }
}
resource "nsxt_policy_group" "grp_620" {
   display_name = "TF-AG1-HOST-dr77-esg1-0"
   nsx_id = "TF-AG1-HOST-dr77-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr77-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.21"]
      }
   }
}
resource "nsxt_policy_group" "grp_621" {
   display_name = "TF-AG1-HOST-driamaas2-vpn1-1"
   nsx_id = "TF-AG1-HOST-driamaas2-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaas2-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.184"]
      }
   }
}
resource "nsxt_policy_group" "grp_622" {
   display_name = "TF-AG1-HOST-dr111-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr111-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr111-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.154"]
      }
   }
}
resource "nsxt_policy_group" "grp_623" {
   display_name = "TF-AG1-HOST-agnsrlnmnepen1"
   nsx_id = "TF-AG1-HOST-agnsrlnmnepen1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnmnepen1"
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
resource "nsxt_policy_group" "grp_624" {
   display_name = "TF-AG1-HOST-dr217-esg1-1"
   nsx_id = "TF-AG1-HOST-dr217-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr217-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.61"]
      }
   }
}
resource "nsxt_policy_group" "grp_625" {
   display_name = "TF-AG1-HOST-ag1dr77fm"
   nsx_id = "TF-AG1-HOST-ag1dr77fm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr77fm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.104.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_626" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcit3"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcit3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcit3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.187"]
      }
   }
}
resource "nsxt_policy_group" "grp_627" {
   display_name = "TF-AG1-HOST-ag1d251lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d251lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d251lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.198.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_628" {
   display_name = "TF-AG1-HOST-v-to-t-esg-1"
   nsx_id = "TF-AG1-HOST-v-to-t-esg-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "v-to-t-esg-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.211.161.240"]
      }
   }
}
resource "nsxt_policy_group" "grp_629" {
   display_name = "TF-AG1-HOST-dr100-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr100-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr100-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.158"]
      }
   }
}
resource "nsxt_policy_group" "grp_630" {
   display_name = "TF-AG1-HOST-dr227-esg1-1"
   nsx_id = "TF-AG1-HOST-dr227-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr227-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.64"]
      }
   }
}
resource "nsxt_policy_group" "grp_631" {
   display_name = "TF-AG1-HOST-ag1dr144lpfm"
   nsx_id = "TF-AG1-HOST-ag1dr144lpfm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr144lpfm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_632" {
   display_name = "TF-AG1-HOST-ag1dr77lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr77lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr77lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.104.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_633" {
   display_name = "TF-AG1-HOST-agnsrlndvaweb01"
   nsx_id = "TF-AG1-HOST-agnsrlndvaweb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlndvaweb01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.157"]
      }
   }
}
resource "nsxt_policy_group" "grp_634" {
   display_name = "TF-AG1-HOST-ag1sr1lniamuasdi2"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamuasdi2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamuasdi2"
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
resource "nsxt_policy_group" "grp_635" {
   display_name = "TF-AG1-HOST-dr156-esg1-0"
   nsx_id = "TF-AG1-HOST-dr156-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr156-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.38"]
      }
   }
}
resource "nsxt_policy_group" "grp_636" {
   display_name = "TF-AG1-HOST-AG1D53APIGAARX1"
   nsx_id = "TF-AG1-HOST-AG1D53APIGAARX1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1D53APIGAARX1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.88.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_637" {
   display_name = "TF-AG1-HOST-ag1srapjfwkalif2"
   nsx_id = "TF-AG1-HOST-ag1srapjfwkalif2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srapjfwkalif2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.201"]
      }
   }
}
resource "nsxt_policy_group" "grp_638" {
   display_name = "TF-AG1-HOST-dr212-esg1-0"
   nsx_id = "TF-AG1-HOST-dr212-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr212-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.59"]
      }
   }
}
resource "nsxt_policy_group" "grp_639" {
   display_name = "TF-AG1-HOST-dr223-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr223-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr223-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.203"]
      }
   }
}
resource "nsxt_policy_group" "grp_640" {
   display_name = "TF-AG1-HOST-ag1sr1dajh02"
   nsx_id = "TF-AG1-HOST-ag1sr1dajh02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1dajh02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.27"]
      }
   }
}
resource "nsxt_policy_group" "grp_641" {
   display_name = "TF-AG1-HOST-ag1d162lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d162lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d162lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_642" {
   display_name = "TF-AG1-HOST-agnsr1lnccmjmp4"
   nsx_id = "TF-AG1-HOST-agnsr1lnccmjmp4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsr1lnccmjmp4"
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
resource "nsxt_policy_group" "grp_643" {
   display_name = "TF-AG1-HOST-ag1dr40crotedrmm_test"
   nsx_id = "TF-AG1-HOST-ag1dr40crotedrmm_test"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr40crotedrmm_test"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.78"]
      }
   }
}
resource "nsxt_policy_group" "grp_644" {
   display_name = "TF-AG1-HOST-ag1dr74lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr74lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr74lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.100.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_645" {
   display_name = "TF-AG1-HOST-dr147-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr147-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr147-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_646" {
   display_name = "TF-AG1-HOST-ag1sr1wniamuaq2"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamuaq2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamuaq2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.73"]
      }
   }
}
resource "nsxt_policy_group" "grp_647" {
   display_name = "TF-AG1-HOST-dr273-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr273-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr273-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.213"]
      }
   }
}
resource "nsxt_policy_group" "grp_648" {
   display_name = "TF-AG1-HOST-dr11-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr11-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr11-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.58"]
      }
   }
}
resource "nsxt_policy_group" "grp_649" {
   display_name = "TF-AG1-HOST-ag1srwphwcstl01"
   nsx_id = "TF-AG1-HOST-ag1srwphwcstl01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwphwcstl01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.153"]
      }
   }
}
resource "nsxt_policy_group" "grp_650" {
   display_name = "TF-AG1-HOST-dr124-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr124-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr124-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.187"]
      }
   }
}
resource "nsxt_policy_group" "grp_651" {
   display_name = "TF-AG1-HOST-dr78-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr78-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr78-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.156"]
      }
   }
}
resource "nsxt_policy_group" "grp_652" {
   display_name = "TF-AG1-HOST-ag1dr74fm"
   nsx_id = "TF-AG1-HOST-ag1dr74fm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr74fm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.100.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_653" {
   display_name = "TF-AG1-HOST-ag1sr1wniamuar1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamuar1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamuar1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.76"]
      }
   }
}
resource "nsxt_policy_group" "grp_654" {
   display_name = "TF-AG1-HOST-ag1sr1daipwin02"
   nsx_id = "TF-AG1-HOST-ag1sr1daipwin02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1daipwin02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.29"]
      }
   }
}
resource "nsxt_policy_group" "grp_655" {
   display_name = "TF-AG1-HOST-dr151-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr151-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr151-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.164"]
      }
   }
}
resource "nsxt_policy_group" "grp_656" {
   display_name = "TF-AG1-HOST-ag1dr234lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr234lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr234lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.194.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_657" {
   display_name = "TF-AG1-HOST-dr159-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr159-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr159-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.167"]
      }
   }
}
resource "nsxt_policy_group" "grp_658" {
   display_name = "TF-AG1-HOST-ag1sr1lniamtsprx1"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamtsprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamtsprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.38"]
      }
   }
}
resource "nsxt_policy_group" "grp_659" {
   display_name = "TF-AG1-HOST-dr47-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr47-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr47-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.97"]
      }
   }
}
resource "nsxt_policy_group" "grp_660" {
   display_name = "TF-AG1-HOST-photon-custom-lsilogic-hw11-2-0-304b817"
   nsx_id = "TF-AG1-HOST-photon-custom-lsilogic-hw11-2-0-304b817"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "photon-custom-lsilogic-hw11-2.0-304b817"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["fe80::250:56ff:feb7:10c7"]
      }
   }
}
resource "nsxt_policy_group" "grp_661" {
   display_name = "TF-AG1-HOST-dr188-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr188-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr188-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.250"]
      }
   }
}
resource "nsxt_policy_group" "grp_662" {
   display_name = "TF-AG1-HOST-dr259-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr259-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr259-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.212"]
      }
   }
}
resource "nsxt_policy_group" "grp_663" {
   display_name = "TF-AG1-HOST-ag1d212lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d212lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d212lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.180.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_664" {
   display_name = "TF-AG1-HOST-ag1dr112lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr112lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr112lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.120.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_665" {
   display_name = "TF-AG1-HOST-agnsrlnicp1nfs01"
   nsx_id = "TF-AG1-HOST-agnsrlnicp1nfs01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnicp1nfs01"
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
resource "nsxt_policy_group" "grp_666" {
   display_name = "TF-AG1-HOST-ag1sr1aniamptsvg1"
   nsx_id = "TF-AG1-HOST-ag1sr1aniamptsvg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1aniamptsvg1"
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
resource "nsxt_policy_group" "grp_667" {
   display_name = "TF-AG1-HOST-dr182-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr182-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr182-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.171"]
      }
   }
}
resource "nsxt_policy_group" "grp_668" {
   display_name = "TF-AG1-HOST-dr19-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr19-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr19-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.147"]
      }
   }
}
resource "nsxt_policy_group" "grp_669" {
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
resource "nsxt_policy_group" "grp_670" {
   display_name = "TF-AG1-HOST-ag1dr144lpstl"
   nsx_id = "TF-AG1-HOST-ag1dr144lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr144lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_671" {
   display_name = "TF-AG1-HOST-dr59-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr59-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr59-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.202"]
      }
   }
}
resource "nsxt_policy_group" "grp_672" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamuep1"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamuep1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamuep1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.139"]
      }
   }
}
resource "nsxt_policy_group" "grp_673" {
   display_name = "TF-AG1-HOST-driamaasthy-vpn1-1"
   nsx_id = "TF-AG1-HOST-driamaasthy-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.183"]
      }
   }
}
resource "nsxt_policy_group" "grp_674" {
   display_name = "TF-AG1-HOST-agnsrlndvadb01"
   nsx_id = "TF-AG1-HOST-agnsrlndvadb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlndvadb01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.156"]
      }
   }
}
resource "nsxt_policy_group" "grp_675" {
   display_name = "TF-AG1-HOST-dr223-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr223-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr223-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_676" {
   display_name = "TF-AG1-HOST-dr144-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr144-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr144-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.162"]
      }
   }
}
resource "nsxt_policy_group" "grp_677" {
   display_name = "TF-AG1-HOST-ag1d285lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d285lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d285lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.206.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_678" {
   display_name = "TF-AG1-HOST-ag1d224lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d224lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d224lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.188.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_679" {
   display_name = "TF-AG1-HOST-ag1sr1staas4"
   nsx_id = "TF-AG1-HOST-ag1sr1staas4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1staas4"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_680" {
   display_name = "TF-AG1-HOST-driamaas2-dlr1-0"
   nsx_id = "TF-AG1-HOST-driamaas2-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaas2-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.250"]
      }
   }
}
resource "nsxt_policy_group" "grp_681" {
   display_name = "TF-AG1-HOST-ag1srwphwcgrfdb"
   nsx_id = "TF-AG1-HOST-ag1srwphwcgrfdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwphwcgrfdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.160"]
      }
   }
}
resource "nsxt_policy_group" "grp_682" {
   display_name = "TF-AG1-HOST-hres1-dlr1-0"
   nsx_id = "TF-AG1-HOST-hres1-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-hres1-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.31.250"]
      }
   }
}
resource "nsxt_policy_group" "grp_683" {
   display_name = "TF-AG1-HOST-dr212-esg1-1"
   nsx_id = "TF-AG1-HOST-dr212-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr212-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.59"]
      }
   }
}
resource "nsxt_policy_group" "grp_684" {
   display_name = "TF-AG1-HOST-dr180-esg1-0"
   nsx_id = "TF-AG1-HOST-dr180-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr180-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.45"]
      }
   }
}
resource "nsxt_policy_group" "grp_685" {
   display_name = "TF-AG1-HOST-dr111-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr111-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr111-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.180"]
      }
   }
}
resource "nsxt_policy_group" "grp_686" {
   display_name = "TF-AG1-HOST-ag1d162LPDRbg2"
   nsx_id = "TF-AG1-HOST-ag1d162LPDRbg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d162LPDRbg2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.146.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_687" {
   display_name = "TF-AG1-HOST-ag1sr1lpi1pprx1"
   nsx_id = "TF-AG1-HOST-ag1sr1lpi1pprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpi1pprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_688" {
   display_name = "TF-AG1-HOST-ag1d116lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d116lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d116lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.122.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_689" {
   display_name = "TF-AG1-HOST-ag1sr1lpiamciprx2"
   nsx_id = "TF-AG1-HOST-ag1sr1lpiamciprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpiamciprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.181"]
      }
   }
}
resource "nsxt_policy_group" "grp_690" {
   display_name = "TF-AG1-HOST-ag1dr234dc1"
   nsx_id = "TF-AG1-HOST-ag1dr234dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr234dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.194.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_691" {
   display_name = "TF-AG1-HOST-ag1srwpetpp1000"
   nsx_id = "TF-AG1-HOST-ag1srwpetpp1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwpetpp1000"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.229"]
      }
   }
}
resource "nsxt_policy_group" "grp_692" {
   display_name = "TF-AG1-HOST-sres-lb1-0"
   nsx_id = "TF-AG1-HOST-sres-lb1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-sres-lb1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.133"]
      }
   }
}
resource "nsxt_policy_group" "grp_693" {
   display_name = "TF-AG1-HOST-ag1sr1lpi1pprx2"
   nsx_id = "TF-AG1-HOST-ag1sr1lpi1pprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpi1pprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_694" {
   display_name = "TF-AG1-HOST-dr237-esg1-0"
   nsx_id = "TF-AG1-HOST-dr237-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr237-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.67"]
      }
   }
}
resource "nsxt_policy_group" "grp_695" {
   display_name = "TF-AG1-HOST-ag1sr1ljmp02"
   nsx_id = "TF-AG1-HOST-ag1sr1ljmp02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1ljmp02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_696" {
   display_name = "TF-AG1-HOST-driamaasthy4-dlr1-0"
   nsx_id = "TF-AG1-HOST-driamaasthy4-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy4-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.218"]
      }
   }
}
resource "nsxt_policy_group" "grp_697" {
   display_name = "TF-AG1-HOST-dr251-esg1-0"
   nsx_id = "TF-AG1-HOST-dr251-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr251-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.68"]
      }
   }
}
resource "nsxt_policy_group" "grp_698" {
   display_name = "TF-AG1-HOST-ag1sr1lnocpnfs02"
   nsx_id = "TF-AG1-HOST-ag1sr1lnocpnfs02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lnocpnfs02"
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
resource "nsxt_policy_group" "grp_699" {
   display_name = "TF-AG1-HOST-ag1dr147lparx"
   nsx_id = "TF-AG1-HOST-ag1dr147lparx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr147lparx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.134.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_700" {
   display_name = "TF-AG1-HOST-dr100-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr100-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr100-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.138"]
      }
   }
}
resource "nsxt_policy_group" "grp_701" {
   display_name = "TF-AG1-HOST-agnsrwnccmwin16"
   nsx_id = "TF-AG1-HOST-agnsrwnccmwin16"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrwnccmwin16"
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
resource "nsxt_policy_group" "grp_702" {
   display_name = "TF-AG1-HOST-ag1srlpcacfbds1"
   nsx_id = "TF-AG1-HOST-ag1srlpcacfbds1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlpcacfbds1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.225"]
      }
   }
}
resource "nsxt_policy_group" "grp_703" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcie1"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcie1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcie1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.191"]
      }
   }
}
resource "nsxt_policy_group" "grp_704" {
   display_name = "TF-AG1-HOST-dr77-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr77-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr77-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.42"]
      }
   }
}
resource "nsxt_policy_group" "grp_705" {
   display_name = "TF-AG1-HOST-ag1h1lpta1ssh2"
   nsx_id = "TF-AG1-HOST-ag1h1lpta1ssh2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1h1lpta1ssh2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.71.240.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_706" {
   display_name = "TF-AG1-HOST-AG1D53WPIGASTW1"
   nsx_id = "TF-AG1-HOST-AG1D53WPIGASTW1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1D53WPIGASTW1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.88.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_707" {
   display_name = "TF-AG1-HOST-dr198-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr198-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr198-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.205"]
      }
   }
}
resource "nsxt_policy_group" "grp_708" {
   display_name = "TF-AG1-HOST-ag1d224lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d224lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d224lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.188.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_709" {
   display_name = "TF-AG1-HOST-dr217-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr217-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr217-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.170"]
      }
   }
}
resource "nsxt_policy_group" "grp_710" {
   display_name = "TF-AG1-HOST-agnsrlnicp1nfs02"
   nsx_id = "TF-AG1-HOST-agnsrlnicp1nfs02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnicp1nfs02"
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
resource "nsxt_policy_group" "grp_711" {
   display_name = "TF-AG1-HOST-ag1srwphwcodb01"
   nsx_id = "TF-AG1-HOST-ag1srwphwcodb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwphwcodb01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.154"]
      }
   }
}
resource "nsxt_policy_group" "grp_712" {
   display_name = "TF-AG1-HOST-dr224-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr224-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr224-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.204"]
      }
   }
}
resource "nsxt_policy_group" "grp_713" {
   display_name = "TF-AG1-HOST-ag1sr1rhel82022"
   nsx_id = "TF-AG1-HOST-ag1sr1rhel82022"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1rhel82022"
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
resource "nsxt_policy_group" "grp_714" {
   display_name = "TF-AG1-HOST-ag1dr197lpstl"
   nsx_id = "TF-AG1-HOST-ag1dr197lpstl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr197lpstl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.168.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_715" {
   display_name = "TF-AG1-HOST-dr100-esg1-1"
   nsx_id = "TF-AG1-HOST-dr100-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr100-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.27"]
      }
   }
}
resource "nsxt_policy_group" "grp_716" {
   display_name = "TF-AG1-HOST-ag1d192lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d192lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d192lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.164.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_717" {
   display_name = "TF-AG1-HOST-driamaas2-vpn1-0"
   nsx_id = "TF-AG1-HOST-driamaas2-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaas2-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.184"]
      }
   }
}
resource "nsxt_policy_group" "grp_718" {
   display_name = "TF-AG1-HOST-driamaasthy-dlr1-0"
   nsx_id = "TF-AG1-HOST-driamaasthy-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-driamaasthy-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.234"]
      }
   }
}
resource "nsxt_policy_group" "grp_719" {
   display_name = "TF-AG1-HOST-agnsrlnccmrhrepo"
   nsx_id = "TF-AG1-HOST-agnsrlnccmrhrepo"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlnccmrhrepo"
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
resource "nsxt_policy_group" "grp_720" {
   display_name = "TF-AG1-HOST-ag1sftp01n"
   nsx_id = "TF-AG1-HOST-ag1sftp01n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sftp01n"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.178"]
      }
   }
}
resource "nsxt_policy_group" "grp_721" {
   display_name = "TF-AG1-HOST-dr78-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr78-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr78-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.156"]
      }
   }
}
resource "nsxt_policy_group" "grp_722" {
   display_name = "TF-AG1-HOST-edge-71-jobdata-751988-1"
   nsx_id = "TF-AG1-HOST-edge-71-jobdata-751988-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "edge-71-jobdata-751988-1"
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
resource "nsxt_policy_group" "grp_723" {
   display_name = "TF-AG1-HOST-ag1d204lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d204lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d204lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.176.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_724" {
   display_name = "TF-AG1-HOST-ag1sr1lpocpnfs01"
   nsx_id = "TF-AG1-HOST-ag1sr1lpocpnfs01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lpocpnfs01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.138"]
      }
   }
}
resource "nsxt_policy_group" "grp_725" {
   display_name = "TF-AG1-HOST-ag1dlniamjpfua1"
   nsx_id = "TF-AG1-HOST-ag1dlniamjpfua1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dlniamjpfua1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.128.27"]
      }
   }
}
resource "nsxt_policy_group" "grp_726" {
   display_name = "TF-AG1-HOST-dr183-esg1-0"
   nsx_id = "TF-AG1-HOST-dr183-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr183-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.47"]
      }
   }
}
resource "nsxt_policy_group" "grp_727" {
   display_name = "TF-AG1-HOST-ag1d211lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d211lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d211lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.178.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_728" {
   display_name = "TF-AG1-HOST-ag1sr1lniamuad1"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamuad1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamuad1"
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
resource "nsxt_policy_group" "grp_729" {
   display_name = "TF-AG1-HOST-ag1dr151lpfm_rhel8"
   nsx_id = "TF-AG1-HOST-ag1dr151lpfm_rhel8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr151lpfm_rhel8"
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
resource "nsxt_policy_group" "grp_730" {
   display_name = "TF-AG1-HOST-ag1dr11dc1"
   nsx_id = "TF-AG1-HOST-ag1dr11dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr11dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.74.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_731" {
   display_name = "TF-AG1-HOST-ag1dr74dc2"
   nsx_id = "TF-AG1-HOST-ag1dr74dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr74dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.100.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_732" {
   display_name = "TF-AG1-HOST-dr160-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr160-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr160-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_733" {
   display_name = "TF-AG1-HOST-dr233-esg1-1"
   nsx_id = "TF-AG1-HOST-dr233-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr233-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.65"]
      }
   }
}
resource "nsxt_policy_group" "grp_734" {
   display_name = "TF-AG1-HOST-ag1d100arx"
   nsx_id = "TF-AG1-HOST-ag1d100arx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d100arx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.116.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_735" {
   display_name = "TF-AG1-HOST-dr65-esg1-1"
   nsx_id = "TF-AG1-HOST-dr65-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr65-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_736" {
   display_name = "TF-AG1-HOST-ag1sr1ljmp01"
   nsx_id = "TF-AG1-HOST-ag1sr1ljmp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1ljmp01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_737" {
   display_name = "TF-AG1-HOST-dr11-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr11-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr11-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.145"]
      }
   }
}
resource "nsxt_policy_group" "grp_738" {
   display_name = "TF-AG1-HOST-ag1sr1wniamuaq1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamuaq1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamuaq1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.192"]
      }
   }
}
resource "nsxt_policy_group" "grp_739" {
   display_name = "TF-AG1-HOST-ag1dr19lpfm"
   nsx_id = "TF-AG1-HOST-ag1dr19lpfm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr19lpfm"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.80.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_740" {
   display_name = "TF-AG1-HOST-agnsr1lnccmjmp5"
   nsx_id = "TF-AG1-HOST-agnsr1lnccmjmp5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsr1lnccmjmp5"
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
resource "nsxt_policy_group" "grp_741" {
   display_name = "TF-AG1-HOST-dr198-esg1-0"
   nsx_id = "TF-AG1-HOST-dr198-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr198-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.54"]
      }
   }
}
resource "nsxt_policy_group" "grp_742" {
   display_name = "TF-AG1-HOST-dr211-esg1-1"
   nsx_id = "TF-AG1-HOST-dr211-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr211-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.58"]
      }
   }
}
resource "nsxt_policy_group" "grp_743" {
   display_name = "TF-AG1-HOST-dr227-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr227-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr227-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.218"]
      }
   }
}
resource "nsxt_policy_group" "grp_744" {
   display_name = "TF-AG1-HOST-ag1srwpenapok2"
   nsx_id = "TF-AG1-HOST-ag1srwpenapok2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwpenapok2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.169"]
      }
   }
}
resource "nsxt_policy_group" "grp_745" {
   display_name = "TF-AG1-HOST-ag1dr77dc2"
   nsx_id = "TF-AG1-HOST-ag1dr77dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr77dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.104.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_746" {
   display_name = "TF-AG1-HOST-dr198-esg1-1"
   nsx_id = "TF-AG1-HOST-dr198-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr198-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.54"]
      }
   }
}
resource "nsxt_policy_group" "grp_747" {
   display_name = "TF-AG1-HOST-ag1srwpetpd1000"
   nsx_id = "TF-AG1-HOST-ag1srwpetpd1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwpetpd1000"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.228"]
      }
   }
}
resource "nsxt_policy_group" "grp_748" {
   display_name = "TF-AG1-HOST-ag1srlncacfxfr"
   nsx_id = "TF-AG1-HOST-ag1srlncacfxfr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlncacfxfr"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.145"]
      }
   }
}
resource "nsxt_policy_group" "grp_749" {
   display_name = "TF-AG1-HOST-ag1dr65stw"
   nsx_id = "TF-AG1-HOST-ag1dr65stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr65stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.94.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_750" {
   display_name = "TF-AG1-HOST-NSX_Controller_4788ea62-68db-420c-9674-85879af7da31"
   nsx_id = "TF-AG1-HOST-NSX_Controller_4788ea62-68db-420c-9674-85879af7da31"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NSX_Controller_4788ea62-68db-420c-9674-85879af7da31"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.138"]
      }
   }
}
resource "nsxt_policy_group" "grp_751" {
   display_name = "TF-AG1-HOST-dr144-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr144-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr144-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.2.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_752" {
   display_name = "TF-AG1-HOST-dr59-esg1-1"
   nsx_id = "TF-AG1-HOST-dr59-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr59-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.15"]
      }
   }
}
resource "nsxt_policy_group" "grp_753" {
   display_name = "TF-AG1-HOST-agnsr1lnccmjmp1"
   nsx_id = "TF-AG1-HOST-agnsr1lnccmjmp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsr1lnccmjmp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.190"]
      }
   }
}
resource "nsxt_policy_group" "grp_754" {
   display_name = "TF-AG1-HOST-ag1srwpenapok1"
   nsx_id = "TF-AG1-HOST-ag1srwpenapok1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srwpenapok1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.168"]
      }
   }
}
resource "nsxt_policy_group" "grp_755" {
   display_name = "TF-AG1-HOST-dr75-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr75-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr75-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.245"]
      }
   }
}
resource "nsxt_policy_group" "grp_756" {
   display_name = "TF-AG1-HOST-ag1dlniamjpfts1"
   nsx_id = "TF-AG1-HOST-ag1dlniamjpfts1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dlniamjpfts1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.128.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_757" {
   display_name = "TF-AG1-HOST-ag1d285lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d285lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d285lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.206.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_758" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamprr1"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamprr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamprr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.110"]
      }
   }
}
resource "nsxt_policy_group" "grp_759" {
   display_name = "TF-AG1-HOST-ag1sr1wjmp01"
   nsx_id = "TF-AG1-HOST-ag1sr1wjmp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wjmp01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_760" {
   display_name = "TF-AG1-HOST-ag1dlniamjpf1"
   nsx_id = "TF-AG1-HOST-ag1dlniamjpf1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dlniamjpf1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.128.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_761" {
   display_name = "TF-AG1-HOST-dres1-vpn1-0"
   nsx_id = "TF-AG1-HOST-dres1-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dres1-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.229"]
      }
   }
}
resource "nsxt_policy_group" "grp_762" {
   display_name = "TF-AG1-HOST-ag1d111lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d111lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d111lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.118.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_763" {
   display_name = "TF-AG1-HOST-dr217-esg1-0"
   nsx_id = "TF-AG1-HOST-dr217-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr217-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.61"]
      }
   }
}
resource "nsxt_policy_group" "grp_764" {
   display_name = "TF-AG1-HOST-hres1-esg1-1"
   nsx_id = "TF-AG1-HOST-hres1-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-hres1-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.252"]
      }
   }
}
resource "nsxt_policy_group" "grp_765" {
   display_name = "TF-AG1-HOST-hres1-esg1-0"
   nsx_id = "TF-AG1-HOST-hres1-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-hres1-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.252"]
      }
   }
}
resource "nsxt_policy_group" "grp_766" {
   display_name = "TF-AG1-HOST-ag1prx01"
   nsx_id = "TF-AG1-HOST-ag1prx01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1prx01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.145"]
      }
   }
}
resource "nsxt_policy_group" "grp_767" {
   display_name = "TF-AG1-HOST-dr53-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr53-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr53-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.0.170"]
      }
   }
}
resource "nsxt_policy_group" "grp_768" {
   display_name = "TF-AG1-HOST-dr116-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr116-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr116-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.1.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_769" {
   display_name = "TF-AG1-HOST-AG1D53WPIGADCD2"
   nsx_id = "TF-AG1-HOST-AG1D53WPIGADCD2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "AG1D53WPIGADCD2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.88.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_770" {
   display_name = "TF-AG1-HOST-ag1dr77stw"
   nsx_id = "TF-AG1-HOST-ag1dr77stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr77stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.104.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_771" {
   display_name = "TF-AG1-HOST-dr53-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr53-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr53-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.149"]
      }
   }
}
resource "nsxt_policy_group" "grp_772" {
   display_name = "TF-AG1-HOST-agnsrlndvaapp01"
   nsx_id = "TF-AG1-HOST-agnsrlndvaapp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "agnsrlndvaapp01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.155"]
      }
   }
}
resource "nsxt_policy_group" "grp_773" {
   display_name = "TF-AG1-HOST-dr47-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr47-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr47-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.63.82.236"]
      }
   }
}
resource "nsxt_policy_group" "grp_774" {
   display_name = "TF-AG1-HOST-ag1dr197stw"
   nsx_id = "TF-AG1-HOST-ag1dr197stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr197stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.168.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_775" {
   display_name = "TF-AG1-HOST-dr188-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr188-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr188-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.174"]
      }
   }
}
resource "nsxt_policy_group" "grp_776" {
   display_name = "TF-AG1-HOST-gres-esg1-1"
   nsx_id = "TF-AG1-HOST-gres-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "gres-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_777" {
   display_name = "TF-AG1-HOST-ag1dr237lparx"
   nsx_id = "TF-AG1-HOST-ag1dr237lparx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr237lparx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.196.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_778" {
   display_name = "TF-AG1-HOST-dr147-esg1-0"
   nsx_id = "TF-AG1-HOST-dr147-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr147-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.36"]
      }
   }
}
resource "nsxt_policy_group" "grp_779" {
   display_name = "TF-AG1-HOST-ag1sr1wsus01"
   nsx_id = "TF-AG1-HOST-ag1sr1wsus01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wsus01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.48.144"]
      }
   }
}
resource "nsxt_policy_group" "grp_780" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamcit2"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamcit2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamcit2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_781" {
   display_name = "TF-AG1-HOST-ag1dr144lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr144lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr144lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.132.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_782" {
   display_name = "TF-AG1-HOST-ag1sr1wpiamuep3"
   nsx_id = "TF-AG1-HOST-ag1sr1wpiamuep3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wpiamuep3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.141"]
      }
   }
}
resource "nsxt_policy_group" "grp_783" {
   display_name = "TF-AG1-HOST-ag1d188lpcacpr2"
   nsx_id = "TF-AG1-HOST-ag1d188lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d188lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.162.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_784" {
   display_name = "TF-AG1-HOST-dr147-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr147-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr147-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.163"]
      }
   }
}
resource "nsxt_policy_group" "grp_785" {
   display_name = "TF-AG1-HOST-dr180-vpn1-0"
   nsx_id = "TF-AG1-HOST-dr180-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr180-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["52.116.104.85"]
      }
   }
}
resource "nsxt_policy_group" "grp_786" {
   display_name = "TF-AG1-HOST-ag1dr100lpskl"
   nsx_id = "TF-AG1-HOST-ag1dr100lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr100lpskl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.116.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_787" {
   display_name = "TF-AG1-HOST-dr124-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr124-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr124-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.187"]
      }
   }
}
resource "nsxt_policy_group" "grp_788" {
   display_name = "TF-AG1-HOST-ag1dr65arx"
   nsx_id = "TF-AG1-HOST-ag1dr65arx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr65arx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.94.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_789" {
   display_name = "TF-AG1-HOST-sl-svc-esg1-1"
   nsx_id = "TF-AG1-HOST-sl-svc-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-sl-svc-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.211.127.2"]
      }
   }
}
resource "nsxt_policy_group" "grp_790" {
   display_name = "TF-AG1-HOST-ag1sr1wniamptt1"
   nsx_id = "TF-AG1-HOST-ag1sr1wniamptt1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1wniamptt1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.20"]
      }
   }
}
resource "nsxt_policy_group" "grp_791" {
   display_name = "TF-AG1-HOST-dr162-esg1-1"
   nsx_id = "TF-AG1-HOST-dr162-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr162-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.42"]
      }
   }
}
resource "nsxt_policy_group" "grp_792" {
   display_name = "TF-AG1-HOST-dr74-esg1-1"
   nsx_id = "TF-AG1-HOST-dr74-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr74-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.19"]
      }
   }
}
resource "nsxt_policy_group" "grp_793" {
   display_name = "TF-AG1-HOST-ag1dr19stw"
   nsx_id = "TF-AG1-HOST-ag1dr19stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr19stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.80.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_794" {
   display_name = "TF-AG1-HOST-dr12-esg1-1"
   nsx_id = "TF-AG1-HOST-dr12-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr12-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_795" {
   display_name = "TF-AG1-HOST-ag1sr1lniamptd2"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamptd2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamptd2"
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
resource "nsxt_policy_group" "grp_796" {
   display_name = "TF-AG1-HOST-ag1sr1lniamuad2"
   nsx_id = "TF-AG1-HOST-ag1sr1lniamuad2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1lniamuad2"
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
resource "nsxt_policy_group" "grp_797" {
   display_name = "TF-AG1-HOST-dr183-esg1-1"
   nsx_id = "TF-AG1-HOST-dr183-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr183-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.47"]
      }
   }
}
resource "nsxt_policy_group" "grp_798" {
   display_name = "TF-AG1-HOST-ag1dc1"
   nsx_id = "TF-AG1-HOST-ag1dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.65.55.130"]
      }
   }
}
resource "nsxt_policy_group" "grp_799" {
   display_name = "TF-AG1-HOST-ag1dr11arx"
   nsx_id = "TF-AG1-HOST-ag1dr11arx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr11arx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.74.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_800" {
   display_name = "TF-AG1-HOST-dr158-esg1-1"
   nsx_id = "TF-AG1-HOST-dr158-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr158-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.64.39"]
      }
   }
}
resource "nsxt_policy_group" "grp_801" {
   display_name = "TF-AG1-HOST-dr285-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr285-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr285-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.4.90"]
      }
   }
}
resource "nsxt_policy_group" "grp_802" {
   display_name = "TF-AG1-HOST-ag1d278lpcacpr1"
   nsx_id = "TF-AG1-HOST-ag1d278lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1d278lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.204.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_803" {
   display_name = "TF-AG1-HOST-ag1pdr1smtp01"
   nsx_id = "TF-AG1-HOST-ag1pdr1smtp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1pdr1smtp01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.69.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_804" {
   display_name = "TF-AG1-HOST-dr151-vpn1-1"
   nsx_id = "TF-AG1-HOST-dr151-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr151-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["150.239.66.164"]
      }
   }
}
resource "nsxt_policy_group" "grp_805" {
   display_name = "TF-AG1-HOST-dr198-dlr1-0"
   nsx_id = "TF-AG1-HOST-dr198-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1-dr198-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.3.58"]
      }
   }
}
resource "nsxt_policy_group" "grp_806" {
   display_name = "TF-AG1-HOST-ag1dr156stw"
   nsx_id = "TF-AG1-HOST-ag1dr156stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr156stw"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.64.138.6"]
      }
   }
}
resource "nsxt_policy_group" "grp_807" {
   display_name = "TF-AG1-HOST-vm0120-pt"
   nsx_id = "TF-AG1-HOST-vm0120-pt"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vm0120-pt"
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
resource "nsxt_policy_group" "grp_808" {
   display_name = "TF-AG1-HOST-ag1sr1win19test"
   nsx_id = "TF-AG1-HOST-ag1sr1win19test"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1sr1win19test"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.49.158"]
      }
   }
}
