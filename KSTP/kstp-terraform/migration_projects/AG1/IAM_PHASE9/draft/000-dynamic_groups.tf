#####################################
# VM GROUPS
#
# Migration date: 08/03/2023 15:44
# Geography.....: AG1 
# Wave..........: IAM_PHASE9
#####################################


# Nothing to migrate#####################################
# IPSETs GROUPS
#
# Migration date: 08/03/2023 15:44
# Geography.....: AG1 
# Wave..........: IAM_PHASE9
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1sr1lpta1str1"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1sr1lpta1str1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.114"
]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1sr1lpocpnfs01"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1sr1lpocpnfs01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.138"
]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1sr1lcacfjump01"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1sr1lcacfjump01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.165"
]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1srwphwcstr01"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1srwphwcstr01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.151"
]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AG1-IPSET-Ag1-Host-agnsr1lnccmimpt"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-agnsr1lnccmimpt"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.189"
]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AG1-IPSET-SAT-NEXT_GEN"
   nsx_id = "TF-AG1-IPSET-SAT-NEXT_GEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "51.105.115.71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1srwphwcdb01"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1srwphwcdb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.148"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AG1-IPSET-DR100-CPREM-Netcool-Secondary"
   nsx_id = "TF-AG1-IPSET-DR100-CPREM-Netcool-Secondary"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.15.197.190"
]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AG1-IPSET-DR100-ESG-vNic_ip"
   nsx_id = "TF-AG1-IPSET-DR100-ESG-vNic_ip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.1.130",
                         "100.64.117.241",
                         "100.64.1.137",
                         "100.64.64.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AG1-IPSET-ETOC-Server-NA"
   nsx_id = "TF-AG1-IPSET-ETOC-Server-NA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.130",
                         "158.87.49.27",
                         "158.87.49.131",
                         "158.87.49.26",
                         "158.87.49.28",
                         "158.87.48.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AG1-IPSET-MCMS-169-47-156-116"
   nsx_id = "TF-AG1-IPSET-MCMS-169-47-156-116"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.47.156.116"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AG1-IPSET-GSNI-France"
   nsx_id = "TF-AG1-IPSET-GSNI-France"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.141.24",
                         "129.39.133.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AG1-IPSET-ag1srlpsrmnfs"
   nsx_id = "TF-AG1-IPSET-ag1srlpsrmnfs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.45"
]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AG1-IPSET-SRM-WEB-VIP"
   nsx_id = "TF-AG1-IPSET-SRM-WEB-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-IPSET-DR100-CPREM-Netcool-Primary"
   nsx_id = "TF-AG1-IPSET-DR100-CPREM-Netcool-Primary"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.15.197.111"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-Host-CPREM-148-173-6-24"
   nsx_id = "TF-AG1-IPSET-Host-CPREM-148-173-6-24"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "148.173.6.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-IPSET-DR308-RP-Agents"
   nsx_id = "TF-AG1-IPSET-DR308-RP-Agents"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.88.9",
                         "167.210.88.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-IPSET-Ag1-Host-agnsr1lnccmjmp1"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-agnsr1lnccmjmp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.190"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AG1-IPSET-HPST-EU-eu1srwphwcgrfds"
   nsx_id = "TF-AG1-IPSET-HPST-EU-eu1srwphwcgrfds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.178"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AG1-IPSET-Host-158-87-159-111"
   nsx_id = "TF-AG1-IPSET-Host-158-87-159-111"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.111"
]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AG1-IPSET-AP1-Host-ap1srwphwcgads"
   nsx_id = "TF-AG1-IPSET-AP1-Host-ap1srwphwcgads"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.237",
                         "158.87.54.236"
]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AG1-IPSET-Host-DRES100-Netcool-LB"
   nsx_id = "TF-AG1-IPSET-Host-DRES100-Netcool-LB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.117.242",
                         "100.64.117.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AG1-IPSET-EU-eu1srwphwcgrfdb"
   nsx_id = "TF-AG1-IPSET-EU-eu1srwphwcgrfdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.177"
]
      }
   }
}
#####################################
# EMPTY GROUPS
#
# Migration date: 08/03/2023 15:44
# Geography.....: AG1 
# Wave..........: IAM_PHASE9
#####################################


# Nothing to migrate#####################################
# SGEM GROUPS
#
# Migration date: 08/03/2023 15:44
# Geography.....: AG1 
# Wave..........: IAM_PHASE9
#####################################


# Nothing to migrate#####################################
# DYNAMIC GROUPS
#
# Migration date: 08/03/2023 15:44
# Geography.....: AG1 
# Wave..........: IAM_PHASE9
#####################################


# Nothing to migrate