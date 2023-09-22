#####################################
# IPSETs GROUPS
#
# Migration date: 07/26/2023 14:28
# Geography.....: AG1 
# Wave..........: IAM_PHASE8
#####################################
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AG1-IPSET-cns-prod-dallas-netcool"
   nsx_id = "TF-AG1-IPSET-cns-prod-dallas-netcool"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.54.209.19"
]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AG1-IPSET-cns-prod-dallas-solarwinds"
   nsx_id = "TF-AG1-IPSET-cns-prod-dallas-solarwinds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.53.35.205"
]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AG1-IPSET-Ag1-Host-agnsr1lnaiodev1"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-agnsr1lnaiodev1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.162"
]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AG1-IPSET-SWIT-Gateway-zw2uspriv-app-kyndryl-net"
   nsx_id = "TF-AG1-IPSET-SWIT-Gateway-zw2uspriv-app-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.238.16",
                         "138.95.238.15",
                         "138.95.238.9",
                         "138.95.238.18",
                         "138.95.238.14",
                         "138.95.238.13",
                         "138.95.238.12",
                         "138.95.238.17",
                         "138.95.238.10",
                         "138.95.238.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpchatixf1"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpchatixf1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.167"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AG1-IPSET-Peru-CP-JH-129-39-162-227"
   nsx_id = "TF-AG1-IPSET-Peru-CP-JH-129-39-162-227"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.162.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AG1-IPSET-cns-prod-dallas-cisco-aci"
   nsx_id = "TF-AG1-IPSET-cns-prod-dallas-cisco-aci"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.117.33.134",
                         "52.117.33.139",
                         "52.117.33.135",
                         "52.117.33.138",
                         "52.117.33.136",
                         "52.117.33.137"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1srwpenapok-All"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1srwpenapok-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.168",
                         "158.87.49.169"
]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AG1-IPSET-Host-DRES273-VIP-OCP1"
   nsx_id = "TF-AG1-IPSET-Host-DRES273-VIP-OCP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.203.244"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1sr1wdns02"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1sr1wdns02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1srlphcs0001"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1srlphcs0001"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.146"
]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1pdr1smtp01"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1pdr1smtp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.69.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-IPSET-IBM-CLOUD-SERVER"
   nsx_id = "TF-AG1-IPSET-IBM-CLOUD-SERVER"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.156.194.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1srlpcacfbds1"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1srlpcacfbds1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.225"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-IPSET-MEXICO-CP-JH"
   nsx_id = "TF-AG1-IPSET-MEXICO-CP-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.60.52",
                         "158.98.54.184",
                         "158.98.54.185"
]
      }
   }
}
