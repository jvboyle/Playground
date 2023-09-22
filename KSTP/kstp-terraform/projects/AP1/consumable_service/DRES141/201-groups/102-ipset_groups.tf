#####################################
# IPSETs GROUPS
#
# Migration date: 06/07/2023 17:26
# Geography.....: AP1 
# Wave..........: DRES141
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AP1-IPSET-Host-ap1d103lpcacprx1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d103lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.80.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AP1-IPSET-Host-ap1d105lpcacpr2"
   nsx_id = "TF-AP1-IPSET-Host-ap1d105lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.82.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AP1-IPSET-Tanzu-Workload-02"
   nsx_id = "TF-AP1-IPSET-Tanzu-Workload-02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.242.64/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AP1-IPSET-Host-ap1d256lpcacpr1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d256lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.118.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AP1-IPSET-Kyndryl-DNS"
   nsx_id = "TF-AP1-IPSET-Kyndryl-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "142.88.135.104",
                         "142.88.134.104",
                         "130.103.1.30",
                         "142.88.135.106",
                         "130.103.1.31",
                         "142.88.134.106"
]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AP1-IPSET-DRES-VMs-NSXT"
   nsx_id = "TF-AP1-IPSET-DRES-VMs-NSXT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.128.52",
                         "100.87.242.3",
                         "100.80.128.50",
                         "100.87.243.130",
                         "100.87.232.66",
                         "100.87.232.67",
                         "100.80.128.51",
                         "100.80.130.51",
                         "100.80.130.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AP1-IPSET-Host-ap1d130lpcacpr1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d130lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.100.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AP1-IPSET-Host-ap1d105lpcacpr1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d105lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.82.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AP1-IPSET-hkgsninoi"
   nsx_id = "TF-AP1-IPSET-hkgsninoi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.226.214",
                         "146.89.226.213"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AP1-IPSET-AG1-SRES-SRM-PROD"
   nsx_id = "TF-AP1-IPSET-AG1-SRES-SRM-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.223",
                         "158.87.49.217",
                         "158.87.49.230",
                         "158.87.49.227",
                         "158.87.49.224",
                         "158.87.49.220",
                         "158.87.49.222",
                         "158.87.49.216",
                         "158.87.49.226",
                         "158.87.49.229",
                         "158.87.49.221",
                         "158.87.49.218",
                         "158.87.49.225",
                         "158.87.49.215",
                         "158.87.49.219",
                         "158.87.49.228"
]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AP1-IPSET-KSTP-AP-VROPS-IRES-NSX-T"
   nsx_id = "TF-AP1-IPSET-KSTP-AP-VROPS-IRES-NSX-T"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.70.217"
]
      }
   }
}
