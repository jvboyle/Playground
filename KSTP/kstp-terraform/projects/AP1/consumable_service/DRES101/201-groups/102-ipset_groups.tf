#####################################
# IPSETs GROUPS
#
# Migration date: 05/12/2023 12:24
# Geography.....: AP1 
# Wave..........: DRES101
#####################################
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AP1-IPSET-BPI-SL1-COLLECTORS-PROD"
   nsx_id = "TF-AP1-IPSET-BPI-SL1-COLLECTORS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.20.0.169"
]
      }
   }
}


resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AP1-IPSET-CISO-TOOLS-AWS"
   nsx_id = "TF-AP1-IPSET-CISO-TOOLS-AWS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.18.5",
                         "158.87.18.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AP1-IPSET-Host-ap1d110lpbp1sdc"
   nsx_id = "TF-AP1-IPSET-Host-ap1d110lpbp1sdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.72",
                         "100.80.90.72"
]
      }
   }
}

resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AP1-IPSET-Host-ap1d110lpbp1sdp"
   nsx_id = "TF-AP1-IPSET-Host-ap1d110lpbp1sdp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.71",
                         "100.80.90.71"
]
      }
   }
}

resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-AP1-IPSET-Host-ap1d110lpbp1sd-vip"
   nsx_id = "TF-AP1-IPSET-Host-ap1d110lpbp1sd-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.70",
                         "100.80.90.70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-AP1-IPSET-BPI-SL1-COLLECTORS-UAT"
   nsx_id = "TF-AP1-IPSET-BPI-SL1-COLLECTORS-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.20.128.129"
]
      }
   }
}
