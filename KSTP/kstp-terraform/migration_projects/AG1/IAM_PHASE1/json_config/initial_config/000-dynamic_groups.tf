#####################################
# VM GROUPS
#
# Migration date: 04/20/2023 08:46
# Geography.....: AG1 
# Wave..........: IAM_PHASE1
#####################################
resource "nsxt_policy_group" "grp_1" {
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
resource "nsxt_policy_group" "grp_2" {
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
resource "nsxt_policy_group" "grp_3" {
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
resource "nsxt_policy_group" "grp_4" {
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
resource "nsxt_policy_group" "grp_5" {
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
resource "nsxt_policy_group" "grp_6" {
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
resource "nsxt_policy_group" "grp_9" {
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
resource "nsxt_policy_group" "grp_10" {
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
resource "nsxt_policy_group" "grp_11" {
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
resource "nsxt_policy_group" "grp_12" {
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
resource "nsxt_policy_group" "grp_13" {
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
resource "nsxt_policy_group" "grp_14" {
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
#####################################
# IPSETs GROUPS
#
# Migration date: 04/20/2023 08:46
# Geography.....: AG1 
# Wave..........: IAM_PHASE1
#####################################
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1bfrelay1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1bfrelay1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-Host-agnsrlnetocddb"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlnetocddb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Storage-V5000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Storage-V5000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.64.90.117",
                         "10.64.90.123",
                         "10.64.90.116",
                         "10.69.161.21-10.69.161.26",
                         "10.64.90.124",
                         "10.64.90.115",
                         "10.69.161.138",
                         "10.64.90.122",
                         "10.64.90.118",
                         "10.69.161.136",
                         "10.69.161.137",
                         "10.64.90.114",
                         "10.64.90.119"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-IPSET-DR273-ESG-dlr-vNic_3"
   nsx_id = "TF-AG1-IPSET-DR273-ESG-dlr-vNic_3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.203.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AG1-IPSET-CISO-TOOLS-AWS"
   nsx_id = "TF-AG1-IPSET-CISO-TOOLS-AWS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.18.21",
                         "158.87.18.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AG1-IPSET-Host-agnsrlndvadeva1"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlndvadeva1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AG1-IPSET-eu1srwpgacdwdsc"
   nsx_id = "TF-AG1-IPSET-eu1srwpgacdwdsc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.219"
]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AG1-IPSET-eu1srlPsat2"
   nsx_id = "TF-AG1-IPSET-eu1srlPsat2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.79"
]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AG1-IPSET-DR12-LB-VIP3-NAT"
   nsx_id = "TF-AG1-IPSET-DR12-LB-VIP3-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.77.244"
]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-AG1-IPSET-sres-tanzu-workload-05"
   nsx_id = "TF-AG1-IPSET-sres-tanzu-workload-05"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.47",
                         "100.71.242.245",
                         "100.71.242.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-AG1-IPSET-DR12-CPREM-RPA2"
   nsx_id = "TF-AG1-IPSET-DR12-CPREM-RPA2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.92.98.122"
]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-AG1-IPSET-Host-sldalnoidb02"
   nsx_id = "TF-AG1-IPSET-Host-sldalnoidb02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.254.114"
]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-AG1-IPSET-HWSW-GACDW-AP-DB"
   nsx_id = "TF-AG1-IPSET-HWSW-GACDW-AP-DB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.195.5.34"
]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-AG1-IPSET-SG-EU1-SRES-GACDW-PROD"
   nsx_id = "TF-AG1-IPSET-SG-EU1-SRES-GACDW-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.188-158.87.53.189",
                         "158.87.53.181",
                         "158.87.53.217-158.87.53.220"
]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-AG1-IPSET-UAT-BR"
   nsx_id = "TF-AG1-IPSET-UAT-BR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-AG1-IPSET-IP-ag1nsxtvrops01"
   nsx_id = "TF-AG1-IPSET-IP-ag1nsxtvrops01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-AG1-IPSET-Eastern-Creek-DC"
   nsx_id = "TF-AG1-IPSET-Eastern-Creek-DC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.102.4",
                         "129.39.102.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-AG1-IPSET-eu1srlngacdwwas"
   nsx_id = "TF-AG1-IPSET-eu1srlngacdwwas"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.199"
]
      }
   }
}
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-AG1-IPSET-IP-test-sciencelogic-db"
   nsx_id = "TF-AG1-IPSET-IP-test-sciencelogic-db"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.194",
                         "158.87.159.66"
]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1sepm1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1sepm1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-AG1-IPSET-DR273-ESG-vpn-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR273-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.4.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-AG1-IPSET-DR273-CPREM-DATAMART"
   nsx_id = "TF-AG1-IPSET-DR273-CPREM-DATAMART"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "148.171.97.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-AG1-IPSET-IP-EU-BAT-BATS"
   nsx_id = "TF-AG1-IPSET-IP-EU-BAT-BATS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.191"
]
      }
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-AG1-IPSET-Eu1srlpmsatcld"
   nsx_id = "TF-AG1-IPSET-Eu1srlpmsatcld"
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
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-AG1-IPSET-Host-ICD-UAT-Belfius"
   nsx_id = "TF-AG1-IPSET-Host-ICD-UAT-Belfius"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "212.63.226.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwdb"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.217"
]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wsus01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wsus01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.144"
]
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-AG1-IPSET-Host-driamaas2-Subnet"
   nsx_id = "TF-AG1-IPSET-Host-driamaas2-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.130.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpetocwas1011"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpetocwas1011"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpcactest"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpcactest"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.234"
]
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-AG1-IPSET-Host-agnsrlndvaapp01"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlndvaapp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.155"
]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-REMEDY-PROD1"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-REMEDY-PROD1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "161.228.62.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-AG1-IPSET-Host-ag1srwpetpp1000"
   nsx_id = "TF-AG1-IPSET-Host-ag1srwpetpp1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-AG1-IPSET-ag-bfiapdapp22"
   nsx_id = "TF-AG1-IPSET-ag-bfiapdapp22"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.9.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-AG1-IPSET-NET-HST-NA-Cloud"
   nsx_id = "TF-AG1-IPSET-NET-HST-NA-Cloud"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.254.36.0-169.254.36.127",
                         "169.254.36.128-169.254.36.255",
                         "100.124.0.128/26",
                         "158.87.36.0/25",
                         "158.87.36.128/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-AG1-IPSET-DR285-CPREM-VRA"
   nsx_id = "TF-AG1-IPSET-DR285-CPREM-VRA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "207.131.204.99",
                         "207.131.204.93",
                         "207.131.204.92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-AG1-IPSET-vpc-10-dx-platform-prod1"
   nsx_id = "TF-AG1-IPSET-vpc-10-dx-platform-prod1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.71.4",
                         "158.87.51.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-AG1-IPSET-EU1-SRES-eu1srlngacdwdb"
   nsx_id = "TF-AG1-IPSET-EU1-SRES-eu1srlngacdwdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-AG1-IPSET-DRES299-CP-JH"
   nsx_id = "TF-AG1-IPSET-DRES299-CP-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.212.241.44",
                         "167.212.241.41",
                         "167.212.241.81",
                         "167.212.240.58",
                         "167.212.240.59",
                         "167.212.241.40",
                         "167.212.242.2",
                         "167.212.242.1",
                         "167.212.241.2",
                         "167.212.240.56",
                         "167.212.241.79",
                         "167.212.241.80",
                         "167.212.240.2",
                         "167.212.241.1",
                         "167.212.240.57",
                         "167.212.240.1",
                         "167.212.241.43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpdvadb01"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpdvadb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.148"
]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-AG1-IPSET-Host-agnsrlndvadb01"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlndvadb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.156"
]
      }
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1win19test"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1win19test"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-AG1-IPSET-CAN-Prod-DB"
   nsx_id = "TF-AG1-IPSET-CAN-Prod-DB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.37.17",
                         "158.87.37.19",
                         "158.87.37.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-AG1-IPSET-Host-agnsrlndvadevdb"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlndvadevdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.133"
]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-AG1-IPSET-Host-ag1srwpetpd1000"
   nsx_id = "TF-AG1-IPSET-Host-ag1srwpetpd1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.228"
]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpdvaapp01"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpdvaapp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.147"
]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1daipwin01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1daipwin01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-AG1-IPSET-Host-agnsrlnetocdwas"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlnetocdwas"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwisds"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwisds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.218"
]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-AG1-IPSET-Host-CNICC-Dow-Flex"
   nsx_id = "TF-AG1-IPSET-Host-CNICC-Dow-Flex"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.23.0.0/16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1w19lic01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1w19lic01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.161"
]
      }
   }
}
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-AG1-IPSET-DRES299-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DRES299-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.50",
                         "100.64.208.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-AG1-IPSET-DR273-CPREM-JHOSTS"
   nsx_id = "TF-AG1-IPSET-DR273-CPREM-JHOSTS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "148.173.18.75",
                         "148.171.98.88"
]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-AG1-IPSET-M-E-Lab-COFCA"
   nsx_id = "TF-AG1-IPSET-M-E-Lab-COFCA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.39",
                         "158.87.159.112",
                         "158.87.159.92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1rhellic01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1rhellic01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.100"
]
      }
   }
}
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-AG1-IPSET-IP-IN-AIOPS"
   nsx_id = "TF-AG1-IPSET-IP-IN-AIOPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.126.132.5",
                         "100.126.133.1/27",
                         "158.87.61.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-AG1-IPSET-DR204-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR204-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.176.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwCognos2"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwCognos2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.189"
]
      }
   }
}
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpdvaweb01"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpdvaweb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwCognos1"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwCognos1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.188"
]
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1sltestvm"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1sltestvm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-AG1-IPSET-DR273-ESG-agg-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR273-ESG-agg-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-AG1-IPSET-eu1sr1wphwcetl-"
   nsx_id = "TF-AG1-IPSET-eu1sr1wphwcetl-"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.153"
]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-AG1-IPSET-STaaS-DR1-FS7200"
   nsx_id = "TF-AG1-IPSET-STaaS-DR1-FS7200"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "125.157.103.15-125.157.103.16",
                         "125.157.103.18-125.157.103.20",
                         "125.156.103.16",
                         "125.156.103.21-125.156.103.23",
                         "125.156.103.15",
                         "125.156.103.13",
                         "125.157.103.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-AG1-IPSET-DOW-customer-Solarwinds-CNICC"
   nsx_id = "TF-AG1-IPSET-DOW-customer-Solarwinds-CNICC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.116.62.8/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1ljmp01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1ljmp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-AG1-IPSET-Host-ag1srlnetocwas1021"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlnetocwas1021"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-AG1-IPSET-DR12-CPREM-RPA1"
   nsx_id = "TF-AG1-IPSET-DR12-CPREM-RPA1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.92.98.121"
]
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-AG1-IPSET-STaaS-DR144-V7k"
   nsx_id = "TF-AG1-IPSET-STaaS-DR144-V7k"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.101.240.20-10.101.240.22",
                         "10.101.240.30-10.101.240.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwwas1"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwwas1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.220"
]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-AG1-IPSET-US-ONLY-GRF-DATABASE"
   nsx_id = "TF-AG1-IPSET-US-ONLY-GRF-DATABASE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.209",
                         "169.44.83.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-AG1-IPSET-ag1sr1cntrl1"
   nsx_id = "TF-AG1-IPSET-ag1sr1cntrl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-AG1-IPSET-DR273-CPREM-NETCOOL"
   nsx_id = "TF-AG1-IPSET-DR273-CPREM-NETCOOL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "148.171.96.23",
                         "148.173.18.71",
                         "148.173.18.73",
                         "148.171.96.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-AG1-IPSET-Host-NET-SRES-APP"
   nsx_id = "TF-AG1-IPSET-Host-NET-SRES-APP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.0/23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-AG1-IPSET-ag1d160lpprx-VIP"
   nsx_id = "TF-AG1-IPSET-ag1d160lpprx-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.144.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-AG1-IPSET-meaas-noi-inn6y-nco-"
   nsx_id = "TF-AG1-IPSET-meaas-noi-inn6y-nco-"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.210"
]
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-AG1-IPSET-sldalnoidb01"
   nsx_id = "TF-AG1-IPSET-sldalnoidb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.254.113"
]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-AG1-IPSET-STaaS-DR11-Storage-V5000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR11-Storage-V5000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.10.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-AG1-IPSET-KSTP-IN-IP-HWSW"
   nsx_id = "TF-AG1-IPSET-KSTP-IN-IP-HWSW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.21-158.87.61.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-AG1-IPSET-DR204-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR204-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.23.155.94",
                         "172.23.155.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-AG1-IPSET-DR12-CPREM-RPA3"
   nsx_id = "TF-AG1-IPSET-DR12-CPREM-RPA3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.201.216.194"
]
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-AG1-IPSET-sres-tanzu-workload-06"
   nsx_id = "TF-AG1-IPSET-sres-tanzu-workload-06"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.245.0/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-AG1-IPSET-SRES-ag1srlphwcsss01"
   nsx_id = "TF-AG1-IPSET-SRES-ag1srlphwcsss01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.163"
]
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1daipwin02"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1daipwin02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-AG1-IPSET-Azure-Infra-VNET"
   nsx_id = "TF-AG1-IPSET-Azure-Infra-VNET"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.86.7.213"
]
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-AG1-IPSET-IP-sldb01"
   nsx_id = "TF-AG1-IPSET-IP-sldb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.117",
                         "10.175.14.245"
]
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-AG1-IPSET-ARMS-CC-SYNC-SERVER"
   nsx_id = "TF-AG1-IPSET-ARMS-CC-SYNC-SERVER"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.210",
                         "158.87.52.72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-AG1-IPSET-CPREM-MSSGDC"
   nsx_id = "TF-AG1-IPSET-CPREM-MSSGDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "149.131.76.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-AG1-IPSET-NET-ZCLOUD-DAL"
   nsx_id = "TF-AG1-IPSET-NET-ZCLOUD-DAL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.41.43.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwwas2"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwwas2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.181"
]
      }
   }
}
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1dajh01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1dajh01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-AG1-IPSET-Host-driamaasthy-Subnet"
   nsx_id = "TF-AG1-IPSET-Host-driamaasthy-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.128.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-AG1-IPSET-driamaasthy-Customer1-Windows-EP-1"
   nsx_id = "TF-AG1-IPSET-driamaasthy-Customer1-Windows-EP-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.186.25.156"
]
      }
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-AG1-IPSET-Host-pdr-esg01-lb-vip-7"
   nsx_id = "TF-AG1-IPSET-Host-pdr-esg01-lb-vip-7"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "150.239.66.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-AG1-IPSET-DR12-LB-VIP2-NAT"
   nsx_id = "TF-AG1-IPSET-DR12-LB-VIP2-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.77.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-AG1-IPSET-DR273-CPREM-MBUSPROBES"
   nsx_id = "TF-AG1-IPSET-DR273-CPREM-MBUSPROBES"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "148.173.18.72",
                         "148.173.18.74",
                         "148.171.96.25",
                         "148.171.96.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-AG1-IPSET-Brazil-Shared-Netcool-GSMAListener"
   nsx_id = "TF-AG1-IPSET-Brazil-Shared-Netcool-GSMAListener"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.84.140",
                         "158.87.85.167",
                         "158.87.84.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-AG1-IPSET-STaaS-DR71-Storage-V7000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR71-Storage-V7000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.205.2.7-10.205.2.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-AG1-IPSET-SLDalImpactNode"
   nsx_id = "TF-AG1-IPSET-SLDalImpactNode"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.53.35.218",
                         "169.53.35.217"
]
      }
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-AG1-IPSET-SG-EU1-SRES-GACDW-DEV"
   nsx_id = "TF-AG1-IPSET-SG-EU1-SRES-GACDW-DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.198-158.87.52.199"
]
      }
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-AG1-IPSET-Host-PDR-Subnet"
   nsx_id = "TF-AG1-IPSET-Host-PDR-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.69.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-AG1-IPSET-IP-PDR-Internet-Proxy-Server"
   nsx_id = "TF-AG1-IPSET-IP-PDR-Internet-Proxy-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.69.2-100.64.69.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-AG1-IPSET-icd-was-us-gtsaas-softlayer"
   nsx_id = "TF-AG1-IPSET-icd-was-us-gtsaas-softlayer"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.34.210.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-AG1-IPSET-dr100-ESG-vNic_1"
   nsx_id = "TF-AG1-IPSET-dr100-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.1.129"
]
      }
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpetocdb1011"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpetocdb1011"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-AG1-IPSET-NET-ZCLOUD-RTP"
   nsx_id = "TF-AG1-IPSET-NET-ZCLOUD-RTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.21.0/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-AG1-IPSET-NET-ZCLOUD-ASH"
   nsx_id = "TF-AG1-IPSET-NET-ZCLOUD-ASH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.41.51.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-AG1-IPSET-Brazil-Shared-Netcool-MessageBus"
   nsx_id = "TF-AG1-IPSET-Brazil-Shared-Netcool-MessageBus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.84.143",
                         "158.87.84.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-REMEDY-PROD2"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-REMEDY-PROD2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "152.144.129.144"
]
      }
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-AG1-IPSET-Host-ag1srlnetocdb1021"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlnetocdb1021"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-AG1-IPSET-NET-ZCLOUD-POK"
   nsx_id = "TF-AG1-IPSET-NET-ZCLOUD-POK"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.31.224/28",
                         "129.39.31.192/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1ljmp01n"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1ljmp01n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.174"
]
      }
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-AG1-IPSET-eu1srlngacdwdb"
   nsx_id = "TF-AG1-IPSET-eu1srlngacdwdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-AG1-IPSET-M-E-Lab-10_175_14_129"
   nsx_id = "TF-AG1-IPSET-M-E-Lab-10_175_14_129"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.129"
]
      }
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1sql01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1sql01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-AG1-IPSET-DR273-ESG-dlr-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR273-ESG-dlr-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.4.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-AG1-IPSET-Host-ag1srapjfwkalif2"
   nsx_id = "TF-AG1-IPSET-Host-ag1srapjfwkalif2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1bfrelay2"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1bfrelay2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-AG1-IPSET-azure-infra-res-vnet"
   nsx_id = "TF-AG1-IPSET-azure-infra-res-vnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.86.8.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1dajh02"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1dajh02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-AG1-IPSET-UAT-LA"
   nsx_id = "TF-AG1-IPSET-UAT-LA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.94",
                         "158.87.106.78",
                         "158.87.106.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-AG1-IPSET-DR12-LB-VIP1-NAT"
   nsx_id = "TF-AG1-IPSET-DR12-LB-VIP1-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.77.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-AG1-IPSET-DR12-ESG-vpn-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR12-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.0.66",
                         "158.87.104.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-AG1-IPSET-Host-agnsrlnmnepen1"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlnmnepen1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-AG1-IPSET-NET-ZCLOUD-BLD"
   nsx_id = "TF-AG1-IPSET-NET-ZCLOUD-BLD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.172.0/25"
]
      }
   }
}
#####################################
# EMPTY GROUPS
#
# Migration date: 04/20/2023 08:46
# Geography.....: AG1 
# Wave..........: IAM_PHASE1
#####################################
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-AG1-SG-AG1SR1CP2P0"
   nsx_id = "TF-AG1-SG-AG1SR1CP2P0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxDR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-AG1-SG-SRES-WIN-DA"
   nsx_id = "TF-AG1-SG-SRES-WIN-DA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-All"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-AG1-SG-DRES40-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES40-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-AG1-SG-SRES-TKG-Base-Server"
   nsx_id = "TF-AG1-SG-SRES-TKG-Base-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-AG1-SG-SRES-DVAA-Dev-Servers"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Dev-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-Front"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-Front"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-AG1-SG-Ansible-SSH-Hosts"
   nsx_id = "TF-AG1-SG-Ansible-SSH-Hosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-AG1-SG-SRES-agnsrlnicp1p-vip"
   nsx_id = "TF-AG1-SG-SRES-agnsrlnicp1p-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SDI-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SDI-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-AG1-SG-SRES-AGNSRLNICP1-ICP"
   nsx_id = "TF-AG1-SG-SRES-AGNSRLNICP1-ICP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-AG1-SG-DRES96-CRO-All-Servers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-All-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DE-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DE-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SECRET-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SECRET-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-AG1-SG-BigFix-Relay"
   nsx_id = "TF-AG1-SG-BigFix-Relay"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-AG1-SG-DR52-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR52-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersWinDr"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersWinDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-AG1-SG-DR52-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR52-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-AG1-SG-DR40-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DR40-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-AG1-SG-DRES98-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES98-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersWinDr"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersWinDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-AG1-SG-DR40-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DR40-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-AG1-SG-ISIM-WDC-SRES-Standalone"
   nsx_id = "TF-AG1-SG-ISIM-WDC-SRES-Standalone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-AG1-SG-OCP-Cluster6-wrkrnodes"
   nsx_id = "TF-AG1-SG-OCP-Cluster6-wrkrnodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-AG1-SG-DR71-STaaS-Arxview"
   nsx_id = "TF-AG1-SG-DR71-STaaS-Arxview"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-AG1-SG-DR71-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR71-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_184" {
   display_name = "TF-AG1-SG-SRES-OCP-Cluster2-Control_Node"
   nsx_id = "TF-AG1-SG-SRES-OCP-Cluster2-Control_Node"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_185" {
   display_name = "TF-AG1-SG-SRES-DVAA-Prod-Servers-Front"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Prod-Servers-Front"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_186" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_187" {
   display_name = "TF-AG1-SG-DR40-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DR40-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_188" {
   display_name = "TF-AG1-SG-SRES-CACM-Test-Servers"
   nsx_id = "TF-AG1-SG-SRES-CACM-Test-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_189" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_190" {
   display_name = "TF-AG1-SG-DR71-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR71-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_191" {
   display_name = "TF-AG1-SG-GRES01-CogSol-Logicnets"
   nsx_id = "TF-AG1-SG-GRES01-CogSol-Logicnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_192" {
   display_name = "TF-AG1-SG-DRES74-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES74-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_193" {
   display_name = "TF-AG1-SG-DRES96-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_194" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-Back"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-Back"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_195" {
   display_name = "TF-AG1-SG-DR71-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR71-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_196" {
   display_name = "TF-AG1-SG-ISIM-WDC-GRES-Standalone"
   nsx_id = "TF-AG1-SG-ISIM-WDC-GRES-Standalone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_197" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_198" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-RMQ-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-RMQ-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_199" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_200" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_201" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_202" {
   display_name = "TF-AG1-SG-OCP-Cluster6-cntrlnodes"
   nsx_id = "TF-AG1-SG-OCP-Cluster6-cntrlnodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_203" {
   display_name = "TF-AG1-SG-DRES99-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES99-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_204" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_205" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_206" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_207" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersWinDR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersWinDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_208" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
#####################################
# SGEM GROUPS
#
# Migration date: 04/20/2023 08:46
# Geography.....: AG1 
# Wave..........: IAM_PHASE1
#####################################
resource "nsxt_policy_group" "grp_209" {
   display_name = "TF-AG1-SG-EU1-SRES-GACDW-DEV"
   nsx_id = "TF-AG1-SG-EU1-SRES-GACDW-DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlngacdwdb",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlngacdwwas"
]
      }
   }
}
resource "nsxt_policy_group" "grp_210" {
   display_name = "TF-AG1-SG-CISO-TOOLS-KSTP"
   nsx_id = "TF-AG1-SG-CISO-TOOLS-KSTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-QRADAR-NAT-IP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1lsplunkfwd01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_211" {
   display_name = "TF-AG1-SG-EU1-SRES-GACDW-PROD"
   nsx_id = "TF-AG1-SG-EU1-SRES-GACDW-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwdb",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwisds",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srwpgacdwdsc",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwwas1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwwas2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwCognos2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwCognos1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_212" {
   display_name = "TF-AG1-SG-DR273-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR273-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR273-ESG-dlr-vNic_2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR273-ESG-dlr-vNic_3",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR273-ESG-agg-vNic_0",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR273-ESG-vpn-vNic_1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_213" {
   display_name = "TF-AG1-SG-DR299-CACF-Proxy"
   nsx_id = "TF-AG1-SG-DR299-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d299lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d299lpcacpr2"
]
      }
   }
}
#####################################
# DYNAMIC GROUPS
#
# Migration date: 04/20/2023 08:46
# Geography.....: AG1 
# Wave..........: IAM_PHASE1
#####################################
resource "nsxt_policy_group" "grp_214" {
   display_name = "TF-AG1-PDR-Servers"
   nsx_id = "TF-AG1-PDR-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1pdr"
      }
   }
}
resource "nsxt_policy_group" "grp_215" {
   display_name = "TF-AG1-ALL-driamaas2-Servers"
   nsx_id = "TF-AG1-ALL-driamaas2-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1dlniam"
      }
   }
}
resource "nsxt_policy_group" "grp_216" {
   display_name = "TF-AG1-ALL-driamaasthy-Servers"
   nsx_id = "TF-AG1-ALL-driamaasthy-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1dlniam"
      }
   }
}
resource "nsxt_policy_group" "grp_217" {
   display_name = "TF-AG1-SG-All-SRES-SERVERS"
   nsx_id = "TF-AG1-SG-All-SRES-SERVERS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1sr"
      }
   }
}
