#####################################
# IPSETs GROUPS
#
# Migration date: 05/23/2023 12:54
# Geography.....: AG1 
# Wave..........: IAM_PHASE3
#####################################
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-SECRET-UAT"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-SECRET-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.75",
                         "158.87.49.88",
                         "158.87.49.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpiamprsdi1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpiamprsdi1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.96"
]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMDB"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMDB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.224",
                         "158.87.49.225"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMMQ"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMMQ"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.220",
                         "158.87.49.221"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lniamuasdi"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lniamuasdi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.67"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMMGMT01"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMMGMT01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-EU"
   nsx_id = "TF-AG1-IPSET-EU"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.237.53",
                         "158.98.237.21",
                         "158.98.237.20",
                         "158.98.237.22",
                         "158.98.237.16",
                         "158.98.237.41",
                         "158.98.237.18",
                         "158.98.237.17",
                         "158.98.237.112"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-IPSET-Host-SRES-IAMAAS-THY-UAT"
   nsx_id = "TF-AG1-IPSET-Host-SRES-IAMAAS-THY-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.72",
                         "158.87.49.75",
                         "158.87.49.77",
                         "158.87.49.73",
                         "158.87.49.82",
                         "158.87.49.76",
                         "158.87.49.81",
                         "158.87.49.78",
                         "158.87.49.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-IPSET-ag1sr1lpiamciprx1"
   nsx_id = "TF-AG1-IPSET-ag1sr1lpiamciprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.204"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamptra"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamptra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AG1-IPSET-SRES-SRM-PROD"
   nsx_id = "TF-AG1-IPSET-SRES-SRM-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.221",
                         "158.87.49.228",
                         "158.87.49.230",
                         "158.87.49.225",
                         "158.87.49.222",
                         "158.87.49.220",
                         "158.87.49.229",
                         "158.87.49.219",
                         "158.87.49.224",
                         "158.87.49.226",
                         "158.87.49.223",
                         "158.87.49.216",
                         "158.87.49.217",
                         "158.87.49.215",
                         "158.87.49.227",
                         "158.87.49.218"
]
      }
   }
}

resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lniamptsdi"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lniamptsdi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.13"
]
      }
   }
}

resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMPPMQ01"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMPPMQ01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.226"
]
      }
   }
}


resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMPPWAS01"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMPPWAS01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.227"
]
      }
   }
}

resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-AG1-IPSET-WAS-Admin"
   nsx_id = "TF-AG1-IPSET-WAS-Admin"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.227",
                         "158.87.49.222",
                         "158.87.49.223"
]
      }
   }
}

resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniampte1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniampte1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-AG1-IPSET-SMR-Prod-for-Blue-acess"
   nsx_id = "TF-AG1-IPSET-SMR-Prod-for-Blue-acess"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.227",
                         "158.87.49.222",
                         "158.87.49.223",
                         "158.87.49.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamuae1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamuae1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMWAS"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMWAS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.222",
                         "158.87.49.223"
]
      }
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-AG1-IPSET-ecmagpreprod-sl-bluecloud"
   nsx_id = "TF-AG1-IPSET-ecmagpreprod-sl-bluecloud"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.239.99"
]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-AG1-IPSET-SRM-DB-Hosts"
   nsx_id = "TF-AG1-IPSET-SRM-DB-Hosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.224",
                         "158.87.49.228",
                         "158.87.49.225"
]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamprra"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamprra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-SECRET-PEN"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-SECRET-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.92",
                         "158.87.49.22",
                         "158.87.49.20"
]
      }
   }
}

resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMPPDB01"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMPPDB01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.228"
]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-AG1-IPSET-SRM-WAS"
   nsx_id = "TF-AG1-IPSET-SRM-WAS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.223",
                         "158.87.49.222",
                         "158.87.49.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamptr1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamptr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-UAT"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.72",
                         "158.87.49.88",
                         "158.87.49.73",
                         "158.87.49.81",
                         "158.87.49.82"
]
      }
   }
}
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamptr2"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamptr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.23"
]
      }
   }
}
