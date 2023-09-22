#####################################
# IPSETs GROUPS
#
# Migration date: 06/08/2023 20:04
# Geography.....: AG1 
# Wave..........: IAM_PHASE4
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpiamciprx-All"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpiamciprx-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.180",
                         "158.87.49.181"
]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AG1-IPSET-HWSW-BLUEIDP1"
   nsx_id = "TF-AG1-IPSET-HWSW-BLUEIDP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.3.72.6",
                         "138.95.240.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AG1-IPSET-DR327-VMs"
   nsx_id = "TF-AG1-IPSET-DR327-VMs"
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
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AG1-IPSET-ETOC-WAS"
   nsx_id = "TF-AG1-IPSET-ETOC-WAS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.28",
                         "158.87.49.131",
                         "158.87.49.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamcifs"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamcifs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.184"
]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lniamsbbkl1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lniamsbbkl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AG1-IPSET-ag1irsplnkhf02"
   nsx_id = "TF-AG1-IPSET-ag1irsplnkhf02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.189",
                         "100.64.68.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AG1-IPSET-CAR-APP-NAT"
   nsx_id = "TF-AG1-IPSET-CAR-APP-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.37.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AG1-IPSET-ETOC"
   nsx_id = "TF-AG1-IPSET-ETOC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.26",
                         "158.87.49.28",
                         "158.87.49.131",
                         "158.87.49.25",
                         "158.87.49.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamsb-All"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamsb-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.198",
                         "158.87.49.196",
                         "158.87.49.202",
                         "158.87.49.197",
                         "158.87.49.199"
]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AG1-IPSET-ag1irsplnkhf01"
   nsx_id = "TF-AG1-IPSET-ag1irsplnkhf01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.139",
                         "10.65.55.179"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamcie-All"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamcie-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.193",
                         "158.87.49.191",
                         "158.87.49.192"
]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AG1-IPSET-Host_ag1sr1wpiamprt_All"
   nsx_id = "TF-AG1-IPSET-Host_ag1sr1wpiamprt_All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.107",
                         "158.87.49.109",
                         "158.87.49.108"
]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamciq-All"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamciq-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.182",
                         "169.254.1.251"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-IPSET-ag1srlpsrmmlm01"
   nsx_id = "TF-AG1-IPSET-ag1srlpsrmmlm01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.215-158.87.49.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-ag1d308-Server"
   nsx_id = "TF-AG1-IPSET-ag1d308-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.88.7-167.210.88.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-IPSET-ETOC-DBs"
   nsx_id = "TF-AG1-IPSET-ETOC-DBs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.25",
                         "158.87.49.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-IPSET-DR329-CACF-Proxy"
   nsx_id = "TF-AG1-IPSET-DR329-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.214.51",
                         "100.64.214.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lniamsbprx1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lniamsbprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.195"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1sr1lpiamuep-All"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1sr1lpiamuep-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.143",
                         "158.87.49.144"
]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AG1-IPSET-ag1srlpsrmnfs01"
   nsx_id = "TF-AG1-IPSET-ag1srlpsrmnfs01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.230"
]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpiamcibkl1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpiamcibkl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.194"
]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AG1-IPSET-EU1-ETOC-HOSTS"
   nsx_id = "TF-AG1-IPSET-EU1-ETOC-HOSTS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.126",
                         "158.87.52.127"
]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-AG1-IPSET-BR-UAT"
   nsx_id = "TF-AG1-IPSET-BR-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.69",
                         "158.87.106.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-AG1-IPSET-DR329-PROXY"
   nsx_id = "TF-AG1-IPSET-DR329-PROXY"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.214.51",
                         "100.64.214.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1aniamtssvg1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1aniamtssvg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "1.1.1.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AG1-IPSET-Kyndryl-DNS"
   nsx_id = "TF-AG1-IPSET-Kyndryl-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.1.30",
                         "130.103.1.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-AG1-IPSET-AG-ag1sr1wpiamcit-All"
   nsx_id = "TF-AG1-IPSET-AG-ag1sr1wpiamcit-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.187",
                         "158.87.49.186",
                         "158.87.49.185"
]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamcir-all"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamcir-all"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.188",
                         "158.87.49.190",
                         "158.87.49.189",
                         "158.87.49.179"
]
      }
   }
}
