#####################################
# VM GROUPS
#
# Migration date: 07/18/2023 18:01
# Geography.....: AG1 
# Wave..........: IAM_PHASE7
#####################################


# Nothing to migrate#####################################
# IPSETs GROUPS
#
# Migration date: 07/18/2023 18:01
# Geography.....: AG1 
# Wave..........: IAM_PHASE7
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1srwphwcgrfdb"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1srwphwcgrfdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.160"
]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AG1-IPSET-SG-AVI-SEs"
   nsx_id = "TF-AG1-IPSET-SG-AVI-SEs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.234.5",
                         "100.71.246.32",
                         "100.71.242.242",
                         "100.71.242.241",
                         "100.71.244.28",
                         "100.71.234.9",
                         "100.71.246.33",
                         "100.71.244.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AG1-IPSET-SplunkHF-VIP"
   nsx_id = "TF-AG1-IPSET-SplunkHF-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.141",
                         "10.65.55.181"
]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AG1-IPSET-Argentina-129-39-168-99"
   nsx_id = "TF-AG1-IPSET-Argentina-129-39-168-99"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.168.99"
]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AG1-IPSET-Uruguay-CP-JH-158-98-15-152"
   nsx_id = "TF-AG1-IPSET-Uruguay-CP-JH-158-98-15-152"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.15.152"
]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AG1-IPSET-Colombia-CP-JH-129-39-170-4"
   nsx_id = "TF-AG1-IPSET-Colombia-CP-JH-129-39-170-4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.170.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AG1-IPSET-IBM-BLUE-SAGE"
   nsx_id = "TF-AG1-IPSET-IBM-BLUE-SAGE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.57.198.228"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AG1-IPSET-KX-Azure-Australia"
   nsx_id = "TF-AG1-IPSET-KX-Azure-Australia"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.9.138",
                         "158.87.9.137"
]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1srwphwcgrfds"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1srwphwcgrfds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.159"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AG1-IPSET-SAGE-IBM-BLUE"
   nsx_id = "TF-AG1-IPSET-SAGE-IBM-BLUE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.247.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AG1-IPSET-Ecuador-CP-JH-129-39-73-73"
   nsx_id = "TF-AG1-IPSET-Ecuador-CP-JH-129-39-73-73"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.73.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AG1-IPSET-ag1srljmp02"
   nsx_id = "TF-AG1-IPSET-ag1srljmp02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AG1-IPSET-Argentina-129-39-81-17"
   nsx_id = "TF-AG1-IPSET-Argentina-129-39-81-17"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.81.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AG1-IPSET-SAGE-IBM-CLOUD"
   nsx_id = "TF-AG1-IPSET-SAGE-IBM-CLOUD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.125.158",
                         "146.89.125.150",
                         "146.89.125.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-IPSET-Argentina-129-39-81-16"
   nsx_id = "TF-AG1-IPSET-Argentina-129-39-81-16"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.81.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1srlphwcmon01"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1srlphwcmon01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.178"
]
      }
   }
}
#####################################
# EMPTY GROUPS
#
# Migration date: 07/18/2023 18:01
# Geography.....: AG1 
# Wave..........: IAM_PHASE7
#####################################


# Nothing to migrate#####################################
# SGEM GROUPS
#
# Migration date: 07/18/2023 18:01
# Geography.....: AG1 
# Wave..........: IAM_PHASE7
#####################################
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-Host-Argentina-CP-JH"
   nsx_id = "TF-AG1-Host-Argentina-CP-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-Argentina-129-39-81-16",
                         "/infra/domains/default/groups/TF-AG1-IPSET-Argentina-129-39-81-17",
                         "/infra/domains/default/groups/TF-AG1-IPSET-Argentina-129-39-168-99"
]
      }
   }
}
#####################################
# DYNAMIC GROUPS
#
# Migration date: 07/18/2023 18:01
# Geography.....: AG1 
# Wave..........: IAM_PHASE7
#####################################
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-SG-PDR-OKTA-ASA-GW"
   nsx_id = "TF-AG1-SG-PDR-OKTA-ASA-GW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "ag1pdr1lpasagw2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "ag1pdr1lpasagw1"
      }
   }
}
