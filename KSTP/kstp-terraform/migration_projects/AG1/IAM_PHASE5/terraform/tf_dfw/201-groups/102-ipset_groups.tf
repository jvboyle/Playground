#####################################
# IPSETs GROUPS
#
# Migration date: 06/19/2023 17:07
# Geography.....: AG1 
# Wave..........: IAM_PHASE5
#####################################
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamprt-All"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamprt-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.108",
                         "158.87.49.109",
                         "158.87.49.107"
]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AG1-IPSET-DR299-ESG-agg-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR299-ESG-agg-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamprq-All"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamprq-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.103",
                         "169.254.2.120"
]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiampre-All"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiampre-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.114",
                         "158.87.49.170",
                         "158.87.49.113",
                         "158.87.49.171"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AG1-IPSET-IN1-in1srlptocdb01"
   nsx_id = "TF-AG1-IPSET-IN1-in1srlptocdb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.56"
]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AG1-IPSET-DR299-ESG-vpn-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR299-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.4.98"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AG1-IPSET-ag1d308-AD"
   nsx_id = "TF-AG1-IPSET-ag1d308-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.88.16",
                         "167.210.88.18",
                         "167.210.88.15",
                         "167.210.88.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AG1-IPSET-DR327-DCs"
   nsx_id = "TF-AG1-IPSET-DR327-DCs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.212.3",
                         "100.64.212.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AG1-IPSET-Host-SNOW-Tool"
   nsx_id = "TF-AG1-IPSET-Host-SNOW-Tool"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "149.96.88.191",
                         "149.96.27.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AG1-IPSET-DR299-Remedy-ITSM-CMDB"
   nsx_id = "TF-AG1-IPSET-DR299-Remedy-ITSM-CMDB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.212.241.77",
                         "167.212.240.10",
                         "167.212.240.55"
]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpiamprprx-All"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpiamprprx-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.101",
                         "158.87.49.102"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-IPSET-DR299-ESG-dlr-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR299-ESG-dlr-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.4.105"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-Elastic-EU1-PROD"
   nsx_id = "TF-AG1-IPSET-Elastic-EU1-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-IPSET-Prod-gfn-rcp"
   nsx_id = "TF-AG1-IPSET-Prod-gfn-rcp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.34.28",
                         "158.87.34.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-IPSET-DR299-LB-VIP"
   nsx_id = "TF-AG1-IPSET-DR299-LB-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.208.241",
                         "100.64.208.244",
                         "100.64.208.243",
                         "100.64.208.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamprfs"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamprfs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.106"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AG1-IPSET-DR299-SOI"
   nsx_id = "TF-AG1-IPSET-DR299-SOI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.212.240.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamprr-1-3"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamprr-1-3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.111",
                         "158.87.49.112",
                         "158.87.49.110"
]
      }
   }
}
