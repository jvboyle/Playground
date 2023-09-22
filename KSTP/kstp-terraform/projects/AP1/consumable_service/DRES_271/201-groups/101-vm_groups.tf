#####################################
# VM GROUPS
#
# Migration date: 03/21/2023 16:38
# Geography.....: AP1 
# Wave..........: DRES_271
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AP1-HOST-dr101-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr101-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr101-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.221"]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AP1-HOST-dr114-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr114-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr114-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.227"]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AP1-HOST-ap1h1lpta1hap2"
   nsx_id = "TF-AP1-HOST-ap1h1lpta1hap2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1h1lpta1hap2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.87.240.14"]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AP1-HOST-etn-v2t-03a"
   nsx_id = "TF-AP1-HOST-etn-v2t-03a"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-etn-v2t-03a"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.153.14"]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AP1-HOST-ap1d108lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d108lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d108lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.88.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AP1-HOST-dr141-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr141-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr141-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.231"]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AP1-HOST-sres1-esg1-0"
   nsx_id = "TF-AP1-HOST-sres1-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-sres1-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.54.7"]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AP1-HOST-dr232-esg1-1"
   nsx_id = "TF-AP1-HOST-dr232-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr232-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.25"]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AP1-HOST-vCLS-c0da36c5-ab8c-4753-8728-d1d2a4488c03"
   nsx_id = "TF-AP1-HOST-vCLS-c0da36c5-ab8c-4753-8728-d1d2a4488c03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-c0da36c5-ab8c-4753-8728-d1d2a4488c03"
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
   display_name = "TF-AP1-HOST-pdr-esg1-0"
   nsx_id = "TF-AP1-HOST-pdr-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-pdr-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.75.98"]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AP1-HOST-dr105-esg1-0"
   nsx_id = "TF-AP1-HOST-dr105-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr105-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AP1-HOST-dr290-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr290-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr290-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.250"]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AP1-HOST-dr105-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr105-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr105-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.223"]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AP1-HOST-dr110-esg1-0"
   nsx_id = "TF-AP1-HOST-dr110-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr110-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.14"]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AP1-HOST-dr130-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr130-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr130-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.75.103"]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AP1-HOST-dr258-esg1-0"
   nsx_id = "TF-AP1-HOST-dr258-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr258-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.29"]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AP1-HOST-dr232-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr232-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr232-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.233"]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AP1-HOST-etn-v2t-01"
   nsx_id = "TF-AP1-HOST-etn-v2t-01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-etn-v2t-01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.153.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AP1-HOST-sres1-esg1-1"
   nsx_id = "TF-AP1-HOST-sres1-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-sres1-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AP1-HOST-dr261-esg1-0"
   nsx_id = "TF-AP1-HOST-dr261-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr261-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.30"]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AP1-HOST-dr103-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr103-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr103-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.222"]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AP1-HOST-ADNSap12"
   nsx_id = "TF-AP1-HOST-ADNSap12"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ADNSap12"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.63.131"]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AP1-HOST-dr261-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr261-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr261-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-AP1-HOST-ap1pdr1prx01"
   nsx_id = "TF-AP1-HOST-ap1pdr1prx01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1pdr1prx01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.69.2"]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-AP1-HOST-ap1d110lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d110lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d110lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.90.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-AP1-HOST-dr141-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr141-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr141-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.231"]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AP1-HOST-etn-v2t-02"
   nsx_id = "TF-AP1-HOST-etn-v2t-02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-etn-v2t-02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.153.11"]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-AP1-HOST-ap1dr255lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1dr255lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1dr255lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.116.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-AP1-HOST-dr114-lb1-0"
   nsx_id = "TF-AP1-HOST-dr114-lb1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr114-lb1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.92.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-AP1-HOST-pdr-dlr1-0"
   nsx_id = "TF-AP1-HOST-pdr-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-pdr-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-AP1-HOST-mgmt-nsx-edge-1"
   nsx_id = "TF-AP1-HOST-mgmt-nsx-edge-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "mgmt-nsx-edge-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.63.138"]
      }
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-AP1-HOST-ap1d103lpcacprx1"
   nsx_id = "TF-AP1-HOST-ap1d103lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d103lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.80.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-AP1-HOST-dr258-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr258-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr258-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.238"]
      }
   }
}
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-AP1-HOST-dr290-esg1-0"
   nsx_id = "TF-AP1-HOST-dr290-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr290-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.34"]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-AP1-HOST-rhcos-4-6-8-x86_64-vmware-x86_64_new"
   nsx_id = "TF-AP1-HOST-rhcos-4-6-8-x86_64-vmware-x86_64_new"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhcos-4.6.8-x86_64-vmware.x86_64_new"
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
   display_name = "TF-AP1-HOST-sl-svc-esg1-1"
   nsx_id = "TF-AP1-HOST-sl-svc-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-sl-svc-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.66"]
      }
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-AP1-HOST-dr193-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr193-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr193-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.58"]
      }
   }
}
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-AP1-HOST-dr127-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr127-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr127-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.228"]
      }
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-AP1-HOST-dr110-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr110-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr110-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.226"]
      }
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-AP1-HOST-dr110-lb1-0"
   nsx_id = "TF-AP1-HOST-dr110-lb1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr110-lb1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.205"]
      }
   }
}
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-AP1-HOST-etn-v2t-03b"
   nsx_id = "TF-AP1-HOST-etn-v2t-03b"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-etn-v2t-03b"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.153.15"]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-AP1-HOST-ap1d114lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d114lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d114lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.92.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-AP1-HOST-dr193-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr193-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr193-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.75.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-AP1-HOST-ispwsyd04-2-NSX-controller-2"
   nsx_id = "TF-AP1-HOST-ispwsyd04-2-NSX-controller-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ispwap1-syd04-2-NSX-controller-2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.63.135"]
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-AP1-HOST-dr105-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr105-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr105-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.223"]
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-AP1-HOST-dr114-lb1-1"
   nsx_id = "TF-AP1-HOST-dr114-lb1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr114-lb1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.92.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-AP1-HOST-dr193-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr193-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr193-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.75.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-AP1-HOST-dr107-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr107-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr107-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.224"]
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-AP1-HOST-sres1-dlr1-0"
   nsx_id = "TF-AP1-HOST-sres1-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-sres1-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.2"]
      }
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-AP1-HOST-dr254-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr254-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr254-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.235"]
      }
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-AP1-HOST-ap1d254lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1d254lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d254lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.114.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-AP1-HOST-ap1d231lpnztpr1"
   nsx_id = "TF-AP1-HOST-ap1d231lpnztpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d231lpnztpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.110.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-AP1-HOST-dr128-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr128-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr128-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.229"]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-AP1-HOST-dr107-esg1-1"
   nsx_id = "TF-AP1-HOST-dr107-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr107-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-AP1-HOST-dr268-esg1-1"
   nsx_id = "TF-AP1-HOST-dr268-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr268-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-AP1-HOST-dr271-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr271-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr271-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.242"]
      }
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-AP1-HOST-ap1wtslic01"
   nsx_id = "TF-AP1-HOST-ap1wtslic01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1wtslic01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.77"]
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-AP1-HOST-ap1lsplunkfwd01"
   nsx_id = "TF-AP1-HOST-ap1lsplunkfwd01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1lsplunkfwd01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.81"]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-AP1-HOST-ispwsyd04-1-NSX-controller-1"
   nsx_id = "TF-AP1-HOST-ispwsyd04-1-NSX-controller-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ispwap1-syd04-1-NSX-controller-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.63.134"]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-AP1-HOST-dr114-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr114-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr114-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.227"]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-AP1-HOST-dr101-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr101-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr101-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.221"]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-AP1-HOST-ap1d261lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1d261lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d261lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.122.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-AP1-HOST-dr261-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr261-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr261-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.239"]
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-AP1-HOST-dr264-esg1-0"
   nsx_id = "TF-AP1-HOST-dr264-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr264-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.31"]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-AP1-HOST-v-to-t-esg-1"
   nsx_id = "TF-AP1-HOST-v-to-t-esg-1"
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
         ip_addresses = ["10.63.154.240"]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-AP1-HOST-pdr-esg1-1"
   nsx_id = "TF-AP1-HOST-pdr-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-pdr-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.112.244"]
      }
   }
}
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-AP1-HOST-ap1pdr1smtp01"
   nsx_id = "TF-AP1-HOST-ap1pdr1smtp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1pdr1smtp01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.69.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-AP1-HOST-dr114-esg1-1"
   nsx_id = "TF-AP1-HOST-dr114-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr114-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.15"]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-AP1-HOST-dr255-esg1-0"
   nsx_id = "TF-AP1-HOST-dr255-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr255-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.27"]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-AP1-HOST-ispwnsx"
   nsx_id = "TF-AP1-HOST-ispwnsx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ispwap1-nsx"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.63.133"]
      }
   }
}
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-AP1-HOST-dr232-esg1-0"
   nsx_id = "TF-AP1-HOST-dr232-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr232-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.25"]
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-AP1-HOST-sres1-lb1-1"
   nsx_id = "TF-AP1-HOST-sres1-lb1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-sres1-lb1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.54.18"]
      }
   }
}
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-AP1-HOST-dr231-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr231-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr231-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.75.108"]
      }
   }
}
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-AP1-HOST-dr254-esg1-0"
   nsx_id = "TF-AP1-HOST-dr254-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr254-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-AP1-HOST-rhcos-4-7-7-x86_64-vmware-x86_64"
   nsx_id = "TF-AP1-HOST-rhcos-4-7-7-x86_64-vmware-x86_64"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhcos-4.7.7-x86_64-vmware.x86_64"
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
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-AP1-HOST-rhcos-4-7-0-x86_64-vmware-x86_64"
   nsx_id = "TF-AP1-HOST-rhcos-4-7-0-x86_64-vmware-x86_64"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhcos-4.7.0-x86_64-vmware.x86_64"
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
   display_name = "TF-AP1-HOST-etn-v2t-0201"
   nsx_id = "TF-AP1-HOST-etn-v2t-0201"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-etn-v2t-0201"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.153.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-AP1-HOST-dr108-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr108-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr108-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.225"]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-AP1-HOST-dr130-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr130-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr130-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-AP1-HOST-hres1-esg1-1"
   nsx_id = "TF-AP1-HOST-hres1-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-hres1-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.252"]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-AP1-HOST-dr256-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr256-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr256-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.154"]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-AP1-HOST-dr103-esg1-1"
   nsx_id = "TF-AP1-HOST-dr103-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr103-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-AP1-HOST-ap1dc1"
   nsx_id = "TF-AP1-HOST-ap1dc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1dc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.75"]
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-AP1-HOST-ap1d105lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1d105lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d105lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.82.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-AP1-HOST-ap1dr255lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1dr255lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1dr255lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.116.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-AP1-HOST-dr255-esg1-1"
   nsx_id = "TF-AP1-HOST-dr255-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr255-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.27"]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-AP1-HOST-dr103-esg1-0"
   nsx_id = "TF-AP1-HOST-dr103-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr103-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-AP1-HOST-ap1d264lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1d264lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d264lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.124.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-AP1-HOST-dr268-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr268-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr268-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.241"]
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-AP1-HOST-ap1d128lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d128lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d128lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.96.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-AP1-HOST-dr232-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr232-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr232-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-AP1-HOST-ap1d264lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d264lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d264lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.124.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-AP1-HOST-ap1d261lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d261lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d261lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.122.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-AP1-HOST-ap1d114lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1d114lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d114lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.92.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-AP1-HOST-dr290-esg1-1"
   nsx_id = "TF-AP1-HOST-dr290-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr290-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.34"]
      }
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-AP1-HOST-ap1d258lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1d258lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d258lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.120.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-AP1-HOST-agg-esg1-1"
   nsx_id = "TF-AP1-HOST-agg-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-agg-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.67"]
      }
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-AP1-HOST-dr108-esg1-0"
   nsx_id = "TF-AP1-HOST-dr108-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr108-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-AP1-HOST-dr105-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr105-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr105-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.122"]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-AP1-HOST-dr128-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr128-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr128-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.234"]
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-AP1-HOST-dr271-esg1-0"
   nsx_id = "TF-AP1-HOST-dr271-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr271-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-AP1-HOST-dr231-esg1-0"
   nsx_id = "TF-AP1-HOST-dr231-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr231-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.24"]
      }
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-AP1-HOST-dr110-lb1-1"
   nsx_id = "TF-AP1-HOST-dr110-lb1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr110-lb1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.90.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-AP1-HOST-ap1d271lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1d271lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d271lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.128.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-AP1-HOST-dr271-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr271-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr271-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.234"]
      }
   }
}
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-AP1-HOST-sl-svc-esg1-0"
   nsx_id = "TF-AP1-HOST-sl-svc-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-sl-svc-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.66"]
      }
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-AP1-HOST-ap1d271lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d271lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d271lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.128.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-AP1-HOST-ap1d256lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d256lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d256lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.118.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-AP1-HOST-dr101-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr101-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr101-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.90"]
      }
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-AP1-HOST-dr254-esg1-1"
   nsx_id = "TF-AP1-HOST-dr254-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr254-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-AP1-HOST-dr254-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr254-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr254-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.122"]
      }
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-AP1-HOST-dr107-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr107-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr107-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.154"]
      }
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-AP1-HOST-ap1irvrli01"
   nsx_id = "TF-AP1-HOST-ap1irvrli01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1irvrli01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.79"]
      }
   }
}
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-AP1-HOST-ap1d127lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d127lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d127lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.94.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-AP1-HOST-dr268-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr268-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr268-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.218"]
      }
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-AP1-HOST-dr264-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr264-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr264-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.240"]
      }
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-AP1-HOST-agg-esg1-0"
   nsx_id = "TF-AP1-HOST-agg-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-agg-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.67"]
      }
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-AP1-HOST-hres1-esg1-0"
   nsx_id = "TF-AP1-HOST-hres1-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-hres1-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.252"]
      }
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-AP1-HOST-ap1h1lpta1ssh2"
   nsx_id = "TF-AP1-HOST-ap1h1lpta1ssh2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1h1lpta1ssh2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.87.240.5"]
      }
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-AP1-HOST-ADNSap11"
   nsx_id = "TF-AP1-HOST-ADNSap11"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ADNSap11"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.63.130"]
      }
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-AP1-HOST-ap1d254lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d254lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d254lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.114.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-AP1-HOST-vCLS-614550ea-a607-4186-89e1-b42c68f93456"
   nsx_id = "TF-AP1-HOST-vCLS-614550ea-a607-4186-89e1-b42c68f93456"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-614550ea-a607-4186-89e1-b42c68f93456"
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
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-AP1-HOST-etn-v2t-04a"
   nsx_id = "TF-AP1-HOST-etn-v2t-04a"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-etn-v2t-04a"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.153.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-AP1-HOST-dr290-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr290-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr290-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.243"]
      }
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-AP1-HOST-dr255-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr255-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr255-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.236"]
      }
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-AP1-HOST-dr101-esg1-0"
   nsx_id = "TF-AP1-HOST-dr101-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr101-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-AP1-HOST-ap1d130lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d130lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d130lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.100.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-AP1-HOST-dr105-esg1-1"
   nsx_id = "TF-AP1-HOST-dr105-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr105-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.10"]
      }
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-AP1-HOST-ap1d141lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d141lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d141lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.102.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-AP1-HOST-dr268-esg1-0"
   nsx_id = "TF-AP1-HOST-dr268-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr268-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-AP1-HOST-dr290-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr290-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr290-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.243"]
      }
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-AP1-HOST-vCLS-0150daeb-08a7-4629-a946-cd4e53ab36cc"
   nsx_id = "TF-AP1-HOST-vCLS-0150daeb-08a7-4629-a946-cd4e53ab36cc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-0150daeb-08a7-4629-a946-cd4e53ab36cc"
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
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-AP1-HOST-ap1vmon"
   nsx_id = "TF-AP1-HOST-ap1vmon"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1vmon"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.78"]
      }
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-AP1-HOST-ap1sr1lpcacprx2"
   nsx_id = "TF-AP1-HOST-ap1sr1lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1sr1lpcacprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.54.83"]
      }
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-AP1-HOST-dr130-esg1-0"
   nsx_id = "TF-AP1-HOST-dr130-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr130-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.19"]
      }
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-AP1-HOST-dr107-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr107-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr107-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.224"]
      }
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-AP1-HOST-hres1-dlr1-0"
   nsx_id = "TF-AP1-HOST-hres1-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-hres1-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.42"]
      }
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-AP1-HOST-dr110-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr110-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr110-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.186"]
      }
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-AP1-HOST-dr107-esg1-0"
   nsx_id = "TF-AP1-HOST-dr107-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr107-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.12"]
      }
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-AP1-HOST-dr271-esg1-1"
   nsx_id = "TF-AP1-HOST-dr271-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr271-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-AP1-HOST-hres1-lb1-0"
   nsx_id = "TF-AP1-HOST-hres1-lb1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-hres1-lb1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.41"]
      }
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-AP1-HOST-ap1sr1ptr1_test"
   nsx_id = "TF-AP1-HOST-ap1sr1ptr1_test"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1sr1ptr1_test"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.54.242"]
      }
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-AP1-HOST-ispwvc"
   nsx_id = "TF-AP1-HOST-ispwvc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ispwap1-vc"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.63.132"]
      }
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-AP1-HOST-dr114-esg1-0"
   nsx_id = "TF-AP1-HOST-dr114-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr114-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.15"]
      }
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-AP1-HOST-dr193-esg1-0"
   nsx_id = "TF-AP1-HOST-dr193-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr193-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.22"]
      }
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-AP1-HOST-dr103-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr103-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr103-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.222"]
      }
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-AP1-HOST-dr255-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr255-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr255-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.138"]
      }
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-AP1-HOST-dr141-esg1-1"
   nsx_id = "TF-AP1-HOST-dr141-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr141-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.20"]
      }
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-AP1-HOST-dr261-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr261-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr261-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.239"]
      }
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-AP1-HOST-ap1d105lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d105lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d105lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.82.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-AP1-HOST-dr141-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr141-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr141-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-AP1-HOST-ap1d268lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d268lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d268lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.126.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-AP1-HOST-dr231-esg1-1"
   nsx_id = "TF-AP1-HOST-dr231-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr231-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.24"]
      }
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-AP1-HOST-ap1lmssqr01"
   nsx_id = "TF-AP1-HOST-ap1lmssqr01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1lmssqr01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.81"]
      }
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-AP1-HOST-ap1h1lpta1hap1"
   nsx_id = "TF-AP1-HOST-ap1h1lpta1hap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1h1lpta1hap1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.87.240.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-AP1-HOST-dr255-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr255-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr255-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.236"]
      }
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-AP1-HOST-ap1d258lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d258lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d258lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.120.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-AP1-HOST-dr254-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr254-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr254-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.235"]
      }
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-AP1-HOST-dr128-esg1-1"
   nsx_id = "TF-AP1-HOST-dr128-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr128-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.17"]
      }
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-AP1-HOST-dr127-esg1-0"
   nsx_id = "TF-AP1-HOST-dr127-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr127-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-AP1-HOST-etn-v2t-0202"
   nsx_id = "TF-AP1-HOST-etn-v2t-0202"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-etn-v2t-0202"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.153.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-AP1-HOST-v-to-t-esg-0"
   nsx_id = "TF-AP1-HOST-v-to-t-esg-0"
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
         ip_addresses = ["10.63.154.240"]
      }
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-AP1-HOST-dr103-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr103-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr103-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.106"]
      }
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-AP1-HOST-etn-v2t-04b"
   nsx_id = "TF-AP1-HOST-etn-v2t-04b"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-etn-v2t-04b"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.153.17"]
      }
   }
}
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-AP1-HOST-ap1h1lpta1ssh1"
   nsx_id = "TF-AP1-HOST-ap1h1lpta1ssh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1h1lpta1ssh1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.87.240.4"]
      }
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-AP1-HOST-ap1d101lpcacprx1"
   nsx_id = "TF-AP1-HOST-ap1d101lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d101lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.78.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-AP1-HOST-dr108-esg1-1"
   nsx_id = "TF-AP1-HOST-dr108-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr108-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.13"]
      }
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-AP1-HOST-dr258-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr258-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr258-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.170"]
      }
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-AP1-HOST-dr128-esg1-0"
   nsx_id = "TF-AP1-HOST-dr128-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr128-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.17"]
      }
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-AP1-HOST-rhcos-vmware-x86_64"
   nsx_id = "TF-AP1-HOST-rhcos-vmware-x86_64"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "rhcos-vmware.x86_64"
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
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-AP1-HOST-dr127-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr127-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr127-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.228"]
      }
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-AP1-HOST-ap1d110lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1d110lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d110lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.90.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-AP1-HOST-hres1-vpn1-0"
   nsx_id = "TF-AP1-HOST-hres1-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-hres1-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.112.245"]
      }
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-AP1-HOST-dr130-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr130-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr130-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.75.103"]
      }
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-AP1-HOST-dr256-esg1-0"
   nsx_id = "TF-AP1-HOST-dr256-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr256-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.28"]
      }
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-AP1-HOST-ispwsyd04-3-NSX-controller-3"
   nsx_id = "TF-AP1-HOST-ispwsyd04-3-NSX-controller-3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ispwap1-syd04-3-NSX-controller-3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.63.136"]
      }
   }
}
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-AP1-HOST-dr256-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr256-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr256-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.237"]
      }
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-AP1-HOST-dr256-esg1-1"
   nsx_id = "TF-AP1-HOST-dr256-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr256-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.28"]
      }
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-AP1-HOST-hres1-vpn1-1"
   nsx_id = "TF-AP1-HOST-hres1-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-hres1-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.112.245"]
      }
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-AP1-HOST-dr256-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr256-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr256-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.237"]
      }
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-AP1-HOST-ap1pdr1prx02"
   nsx_id = "TF-AP1-HOST-ap1pdr1prx02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1pdr1prx02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.69.3"]
      }
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-AP1-HOST-vCLS-d7061282-1bbc-4010-bf86-01cce124a823"
   nsx_id = "TF-AP1-HOST-vCLS-d7061282-1bbc-4010-bf86-01cce124a823"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-d7061282-1bbc-4010-bf86-01cce124a823"
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
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-AP1-HOST-ap1d268lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1d268lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d268lpcacpr2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.126.52"]
      }
   }
}
resource "nsxt_policy_group" "grp_184" {
   display_name = "TF-AP1-HOST-dr268-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr268-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr268-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.241"]
      }
   }
}
resource "nsxt_policy_group" "grp_185" {
   display_name = "TF-AP1-HOST-dr110-esg1-1"
   nsx_id = "TF-AP1-HOST-dr110-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr110-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.14"]
      }
   }
}
resource "nsxt_policy_group" "grp_186" {
   display_name = "TF-AP1-HOST-ap1h1lpta2hap1"
   nsx_id = "TF-AP1-HOST-ap1h1lpta2hap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1h1lpta2hap1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.87.240.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_187" {
   display_name = "TF-AP1-HOST-ext-vpn1-0"
   nsx_id = "TF-AP1-HOST-ext-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-ext-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.112.243"]
      }
   }
}
resource "nsxt_policy_group" "grp_188" {
   display_name = "TF-AP1-HOST-sres1-lb1-0"
   nsx_id = "TF-AP1-HOST-sres1-lb1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-sres1-lb1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.45"]
      }
   }
}
resource "nsxt_policy_group" "grp_189" {
   display_name = "TF-AP1-HOST-dr264-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr264-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr264-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.240"]
      }
   }
}
resource "nsxt_policy_group" "grp_190" {
   display_name = "TF-AP1-HOST-dr110-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr110-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr110-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.226"]
      }
   }
}
resource "nsxt_policy_group" "grp_191" {
   display_name = "TF-AP1-HOST-ap1jump02"
   nsx_id = "TF-AP1-HOST-ap1jump02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1jump02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.74"]
      }
   }
}
resource "nsxt_policy_group" "grp_192" {
   display_name = "TF-AP1-HOST-ap1d232lpwnzpr1"
   nsx_id = "TF-AP1-HOST-ap1d232lpwnzpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d232lpwnzpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.112.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_193" {
   display_name = "TF-AP1-HOST-ap1dc2"
   nsx_id = "TF-AP1-HOST-ap1dc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1dc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.76"]
      }
   }
}
resource "nsxt_policy_group" "grp_194" {
   display_name = "TF-AP1-HOST-dr264-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr264-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr264-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.202"]
      }
   }
}
resource "nsxt_policy_group" "grp_195" {
   display_name = "TF-AP1-HOST-vCLS-3f5dc675-64ea-482c-8de3-84d0d778d4fc"
   nsx_id = "TF-AP1-HOST-vCLS-3f5dc675-64ea-482c-8de3-84d0d778d4fc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-3f5dc675-64ea-482c-8de3-84d0d778d4fc"
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
resource "nsxt_policy_group" "grp_196" {
   display_name = "TF-AP1-HOST-dr114-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr114-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr114-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.202"]
      }
   }
}
resource "nsxt_policy_group" "grp_197" {
   display_name = "TF-AP1-HOST-dr108-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr108-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr108-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.170"]
      }
   }
}
resource "nsxt_policy_group" "grp_198" {
   display_name = "TF-AP1-HOST-dr141-esg1-0"
   nsx_id = "TF-AP1-HOST-dr141-esg1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr141-esg1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.20"]
      }
   }
}
resource "nsxt_policy_group" "grp_199" {
   display_name = "TF-AP1-HOST-dr258-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr258-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr258-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.238"]
      }
   }
}
resource "nsxt_policy_group" "grp_200" {
   display_name = "TF-AP1-HOST-dr127-esg1-1"
   nsx_id = "TF-AP1-HOST-dr127-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr127-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_201" {
   display_name = "TF-AP1-HOST-dr128-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr128-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr128-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.229"]
      }
   }
}
resource "nsxt_policy_group" "grp_202" {
   display_name = "TF-AP1-HOST-dr264-esg1-1"
   nsx_id = "TF-AP1-HOST-dr264-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr264-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.31"]
      }
   }
}
resource "nsxt_policy_group" "grp_203" {
   display_name = "TF-AP1-HOST-dr231-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr231-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr231-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.1.90"]
      }
   }
}
resource "nsxt_policy_group" "grp_204" {
   display_name = "TF-AP1-HOST-hres1-lb1-1"
   nsx_id = "TF-AP1-HOST-hres1-lb1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-hres1-lb1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["169.254.1.42"]
      }
   }
}
resource "nsxt_policy_group" "grp_205" {
   display_name = "TF-AP1-HOST-ap1d107lpcacpr2"
   nsx_id = "TF-AP1-HOST-ap1d107lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d107lpcacpr2"
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
resource "nsxt_policy_group" "grp_206" {
   display_name = "TF-AP1-HOST-dr108-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr108-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr108-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.225"]
      }
   }
}
resource "nsxt_policy_group" "grp_207" {
   display_name = "TF-AP1-HOST-dr127-dlr1-0"
   nsx_id = "TF-AP1-HOST-dr127-dlr1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr127-dlr1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.0.218"]
      }
   }
}
resource "nsxt_policy_group" "grp_208" {
   display_name = "TF-AP1-HOST-dr261-esg1-1"
   nsx_id = "TF-AP1-HOST-dr261-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr261-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.30"]
      }
   }
}
resource "nsxt_policy_group" "grp_209" {
   display_name = "TF-AP1-HOST-ap1d107lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d107lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d107lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.86.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_210" {
   display_name = "TF-AP1-HOST-ap1vro01"
   nsx_id = "TF-AP1-HOST-ap1vro01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1vro01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.9.82"]
      }
   }
}
resource "nsxt_policy_group" "grp_211" {
   display_name = "TF-AP1-HOST-dr271-vpn1-1"
   nsx_id = "TF-AP1-HOST-dr271-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr271-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.242"]
      }
   }
}
resource "nsxt_policy_group" "grp_212" {
   display_name = "TF-AP1-HOST-ap1d193lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d193lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d193lpcacpr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.106.51"]
      }
   }
}
resource "nsxt_policy_group" "grp_213" {
   display_name = "TF-AP1-HOST-ap1sr1lpcacprx1"
   nsx_id = "TF-AP1-HOST-ap1sr1lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1sr1lpcacprx1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.54.82"]
      }
   }
}
resource "nsxt_policy_group" "grp_214" {
   display_name = "TF-AP1-HOST-ap1sr1cntrl1_old"
   nsx_id = "TF-AP1-HOST-ap1sr1cntrl1_old"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1sr1cntrl1_old"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.54.16"]
      }
   }
}
resource "nsxt_policy_group" "grp_215" {
   display_name = "TF-AP1-HOST-dr193-esg1-1"
   nsx_id = "TF-AP1-HOST-dr193-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr193-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.22"]
      }
   }
}
resource "nsxt_policy_group" "grp_216" {
   display_name = "TF-AP1-HOST-dr232-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr232-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr232-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["168.1.103.233"]
      }
   }
}
resource "nsxt_policy_group" "grp_217" {
   display_name = "TF-AP1-HOST-dr101-esg1-1"
   nsx_id = "TF-AP1-HOST-dr101-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr101-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.8"]
      }
   }
}
resource "nsxt_policy_group" "grp_218" {
   display_name = "TF-AP1-HOST-mgmt-nsx-edge-0"
   nsx_id = "TF-AP1-HOST-mgmt-nsx-edge-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "mgmt-nsx-edge-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["10.63.63.138"]
      }
   }
}
resource "nsxt_policy_group" "grp_219" {
   display_name = "TF-AP1-HOST-ap1srlpcacfbds1"
   nsx_id = "TF-AP1-HOST-ap1srlpcacfbds1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1srlpcacfbds1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.54.225"]
      }
   }
}
resource "nsxt_policy_group" "grp_220" {
   display_name = "TF-AP1-HOST-ap1sr1lcacfjump02"
   nsx_id = "TF-AP1-HOST-ap1sr1lcacfjump02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1sr1lcacfjump02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.54.85"]
      }
   }
}
resource "nsxt_policy_group" "grp_221" {
   display_name = "TF-AP1-HOST-ext-vpn1-1"
   nsx_id = "TF-AP1-HOST-ext-vpn1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-ext-vpn1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.112.243"]
      }
   }
}
resource "nsxt_policy_group" "grp_222" {
   display_name = "TF-AP1-HOST-ap1sr1lcacfjump01"
   nsx_id = "TF-AP1-HOST-ap1sr1lcacfjump01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1sr1lcacfjump01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["158.87.54.75"]
      }
   }
}
resource "nsxt_policy_group" "grp_223" {
   display_name = "TF-AP1-HOST-ap1d129lpcacpr1"
   nsx_id = "TF-AP1-HOST-ap1d129lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d129lpcacpr1"
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
resource "nsxt_policy_group" "grp_224" {
   display_name = "TF-AP1-HOST-dr130-esg1-1"
   nsx_id = "TF-AP1-HOST-dr130-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr130-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.19"]
      }
   }
}
resource "nsxt_policy_group" "grp_225" {
   display_name = "TF-AP1-HOST-dr258-esg1-1"
   nsx_id = "TF-AP1-HOST-dr258-esg1-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr258-esg1-1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.80.64.29"]
      }
   }
}
resource "nsxt_policy_group" "grp_226" {
   display_name = "TF-AP1-HOST-dr231-vpn1-0"
   nsx_id = "TF-AP1-HOST-dr231-vpn1-0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1-dr231-vpn1-0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["130.198.75.108"]
      }
   }
}
resource "nsxt_policy_group" "grp_227" {
   display_name = "TF-AP1-HOST-ap1h1lpta2hap2"
   nsx_id = "TF-AP1-HOST-ap1h1lpta2hap2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1h1lpta2hap2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.87.240.17"]
      }
   }
}
resource "nsxt_policy_group" "grp_228" {
   display_name = "TF-AP1-HOST-RHEltest"
   nsx_id = "TF-AP1-HOST-RHEltest"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "RHEltest"
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
resource "nsxt_policy_group" "grp_229" {
   display_name = "TF-AP1-HOST-vCLS-7c036cb4-be74-49ca-ba41-b6d0baab86fd"
   nsx_id = "TF-AP1-HOST-vCLS-7c036cb4-be74-49ca-ba41-b6d0baab86fd"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-7c036cb4-be74-49ca-ba41-b6d0baab86fd"
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
