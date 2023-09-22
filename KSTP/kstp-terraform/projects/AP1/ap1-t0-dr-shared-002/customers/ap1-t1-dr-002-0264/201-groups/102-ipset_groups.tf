#####################################
# IPSETs GROUPS
#
# Migration date: 07/10/2023 17:13
# Geography.....: AP1 
# Wave..........: DRES264
#####################################
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AP1-IPSET-IP-IN-in1irlpm1esldc02"
   nsx_id = "TF-AP1-IPSET-IP-IN-in1irlpm1esldc02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.162.173.199",
                         "100.126.131.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
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
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AP1-IPSET-ap1d193lpcacpr1"
   nsx_id = "TF-AP1-IPSET-ap1d193lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.106.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
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
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AP1-IPSET-Kyndryl-DNS"
   nsx_id = "TF-AP1-IPSET-Kyndryl-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.1.30",
                         "142.88.134.104",
                         "142.88.135.106",
                         "142.88.135.104",
                         "142.88.134.106",
                         "130.103.1.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AP1-IPSET-ap1irsplnkfwd01"
   nsx_id = "TF-AP1-IPSET-ap1irsplnkfwd01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.111",
                         "100.80.68.21",
                         "10.63.9.112",
                         "100.80.68.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AP1-IPSET-CACF-PROXY"
   nsx_id = "TF-AP1-IPSET-CACF-PROXY"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.126.51",
                         "100.80.126.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
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
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AP1-IPSET-IP-AZURE-BLUEID"
   nsx_id = "TF-AP1-IPSET-IP-AZURE-BLUEID"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.240.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AP1-IPSET-ap1d258lpcacpr2"
   nsx_id = "TF-AP1-IPSET-ap1d258lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.120.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AP1-IPSET-Host-ap1d141lpcacpr1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d141lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.102.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AP1-IPSET-AAZG"
   nsx_id = "TF-AP1-IPSET-AAZG"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.97.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AP1-IPSET-ap1d255lpcacpr1"
   nsx_id = "TF-AP1-IPSET-ap1d255lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.116.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AP1-IPSET-MCI-AUX"
   nsx_id = "TF-AP1-IPSET-MCI-AUX"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.171.176",
                         "130.103.171.143",
                         "130.103.171.207",
                         "130.103.171.195"
]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AP1-IPSET-ap1d255lpcacpr2"
   nsx_id = "TF-AP1-IPSET-ap1d255lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.116.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-AP1-IPSET-ap1d107lpcacpr"
   nsx_id = "TF-AP1-IPSET-ap1d107lpcacpr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.86.52",
                         "100.80.86.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-AP1-IPSET-IP-IP-in1irlpm1esldc01"
   nsx_id = "TF-AP1-IPSET-IP-IP-in1irlpm1esldc01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.162.173.252",
                         "100.126.131.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-AP1-IPSET-Host-ap1d108lpcacpr1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d108lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.88.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AP1-IPSET-CACF-TOWER"
   nsx_id = "TF-AP1-IPSET-CACF-TOWER"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.38.79.34"
]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-AP1-IPSET-ap1d258lpcacpr1"
   nsx_id = "TF-AP1-IPSET-ap1d258lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.120.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-AP1-IPSET-ap1srwpsgesql01"
   nsx_id = "TF-AP1-IPSET-ap1srwpsgesql01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-AP1-IPSET-ap1d101lpcacprx1"
   nsx_id = "TF-AP1-IPSET-ap1d101lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.78.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
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
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-AP1-IPSET-DRES-VMs-NSXT"
   nsx_id = "TF-AP1-IPSET-DRES-VMs-NSXT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.242.3",
                         "100.80.128.52",
                         "100.87.232.67",
                         "100.80.128.51",
                         "100.80.130.52",
                         "100.87.243.130",
                         "100.87.232.66",
                         "100.80.130.51",
                         "100.80.128.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_33" {
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
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-AP1-IPSET-AG1-SRES-SRM-PROD"
   nsx_id = "TF-AP1-IPSET-AG1-SRES-SRM-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.217",
                         "158.87.49.229",
                         "158.87.49.230",
                         "158.87.49.226",
                         "158.87.49.225",
                         "158.87.49.216",
                         "158.87.49.215",
                         "158.87.49.224",
                         "158.87.49.223",
                         "158.87.49.220",
                         "158.87.49.228",
                         "158.87.49.218",
                         "158.87.49.219",
                         "158.87.49.222",
                         "158.87.49.221",
                         "158.87.49.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
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
resource "nsxt_policy_group" "grp_36" {
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
resource "nsxt_policy_group" "grp_37" {
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
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-AP1-IPSET-KYNDRYL-DNS"
   nsx_id = "TF-AP1-IPSET-KYNDRYL-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.1.30",
                         "142.88.129.104",
                         "142.88.128.104",
                         "142.88.128.106",
                         "142.88.129.106",
                         "130.103.1.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-AP1-IPSET-Host-ap1d127lpcacpr1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d127lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.94.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-AP1-IPSET-Host-ap1d128lpcacpr1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d128lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.96.51"
]
      }
   }
}
