#####################################
# IPSETs GROUPS
#
# Migration date: 09/06/2023 13:49
# Geography.....: EU1 
# Wave..........: eu_sres_wave6
#####################################
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecdb4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecdb4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-EU1-IPSET-Host-eu1d265lpcacprxVIP"
   nsx_id = "TF-EU1-IPSET-Host-eu1d265lpcacprxVIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.160.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esbk5"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esbk5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.175"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-EU1-IPSET-HTEMNODE02-10-112-242-208"
   nsx_id = "TF-EU1-IPSET-HTEMNODE02-10-112-242-208"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.112.242.208"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpi2pprx2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpi2pprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esbk4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esbk4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.49"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-EU1-IPSET-SRES-eu1srwphwcgrfdb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srwphwcgrfdb"
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
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecni4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecni4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.36"
]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1wphwcetl"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1wphwcetl"
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
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-EU1-IPSET-DR360-eu1d360lpcacprx2"
   nsx_id = "TF-EU1-IPSET-DR360-eu1d360lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.74.2.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1wphwcdb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1wphwcdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.152"
]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epno4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epno4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.33"
]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-EU1-IPSET-SRES-eu1srwphwcdb2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srwphwcdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.65"
]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecno4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecno4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.34"
]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-EU1-IPSET-KSTP-JP-Azure-AIOPS-VIP"
   nsx_id = "TF-EU1-IPSET-KSTP-JP-Azure-AIOPS-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.216.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-EU1-IPSET-AP1-RITM0158205"
   nsx_id = "TF-EU1-IPSET-AP1-RITM0158205"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.104",
                         "158.87.54.102",
                         "100.80.90.75",
                         "100.80.90.76",
                         "158.87.54.107",
                         "100.80.90.83",
                         "100.80.90.78",
                         "100.80.90.79",
                         "100.80.90.77",
                         "100.80.90.82",
                         "158.87.54.109",
                         "158.87.54.101",
                         "158.87.54.105",
                         "158.87.54.108",
                         "158.87.54.103",
                         "158.87.54.106",
                         "100.80.90.80",
                         "100.80.90.81",
                         "100.80.90.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-EU1-IPSET-EXT-Kyndryl-shared-tool-zone-subnet"
   nsx_id = "TF-EU1-IPSET-EXT-Kyndryl-shared-tool-zone-subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.60.136.184/32",
                         "169.45.213.216/29",
                         "169.60.136.148/32",
                         "169.60.136.192/26",
                         "169.47.15.16/28",
                         "169.62.212.64/26",
                         "169.47.12.0/27",
                         "146.89.168.65/32",
                         "146.89.142.192/26",
                         "169.60.136.183/32",
                         "169.60.136.161/32",
                         "169.47.12.96/28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epdb4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epdb4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.42"
]
      }
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-EU1-IPSET-HTEMNODE01-10-112-242-207"
   nsx_id = "TF-EU1-IPSET-HTEMNODE01-10-112-242-207"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.112.242.207"
]
      }
   }
}
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-EU1-IPSET-AG1-SG-SRES-ag1srlpsrm"
   nsx_id = "TF-EU1-IPSET-AG1-SG-SRES-ag1srlpsrm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.223",
                         "158.87.49.215",
                         "158.87.49.222",
                         "158.87.49.229",
                         "158.87.49.217",
                         "158.87.49.219",
                         "158.87.49.224",
                         "158.87.49.227",
                         "158.87.49.226",
                         "158.87.49.220",
                         "158.87.49.221",
                         "158.87.49.218",
                         "158.87.49.225",
                         "158.87.49.228",
                         "158.87.49.230",
                         "158.87.49.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcishfds-vip"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcishfds-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.125"
]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1eslbak1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1eslbak1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epni4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epni4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.35"
]
      }
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-EU1-IPSET-SRES-eu1srltm1esbk"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srltm1esbk"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.37"
]
      }
   }
}
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1licpres"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1licpres"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.54"
]
      }
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1wphwcweb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1wphwcweb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.151"
]
      }
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esap7"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esap7"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.199"
]
      }
   }
}
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-EU1-IPSET-pdr-esg01-lb-vip-12"
   nsx_id = "TF-EU1-IPSET-pdr-esg01-lb-vip-12"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.51.162.248"
]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlnsaspoc1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlnsaspoc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.214"
]
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-EU1-IPSET-SG-SRES-MNEAAS-EM-Shared4"
   nsx_id = "TF-EU1-IPSET-SG-SRES-MNEAAS-EM-Shared4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.43",
                         "158.87.52.161",
                         "158.87.53.82",
                         "158.87.52.163",
                         "158.87.52.42",
                         "158.87.52.33-158.87.52.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-EU1-IPSET-SRES-eu1srwphwcgrfds"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srwphwcgrfds"
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
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-EU1-IPSET-NET-Kyndryl-Intranet"
   nsx_id = "TF-EU1-IPSET-NET-Kyndryl-Intranet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.0.0.0/8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-EU1-IPSET-SRES-eu1srwdhwcgrfds"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srwdhwcgrfds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.69"
]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-EU1-IPSET-DR62-SNI-1"
   nsx_id = "TF-EU1-IPSET-DR62-SNI-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.98.249.0/24",
                         "85.89.226.128/26",
                         "85.89.231.128/25",
                         "85.89.227.140/30",
                         "85.89.231.96/28",
                         "158.98.70.128/27",
                         "158.98.141.160/28",
                         "85.89.244.112/29",
                         "85.89.247.136/29",
                         "100.98.14.233",
                         "158.98.140.128/27",
                         "129.39.53.0/24",
                         "109.236.183.128/28",
                         "85.89.242.0/27",
                         "85.89.242.32/27",
                         "217.10.16.192/27",
                         "129.39.54.7",
                         "92.60.156.0/24",
                         "85.89.247.88/29",
                         "193.27.75.0/24",
                         "85.89.236.112/29",
                         "85.89.247.112/29",
                         "100.98.253.0/24",
                         "85.89.226.88/29",
                         "109.236.183.64/27",
                         "85.89.226.112/29",
                         "158.98.233.224/27",
                         "85.89.227.160/30",
                         "109.236.184.0/24",
                         "129.39.51.0/24",
                         "158.98.143.0/24",
                         "85.89.247.96/29",
                         "85.89.225.0/24",
                         "85.89.228.0/24",
                         "85.89.226.192/27",
                         "85.89.236.120/29",
                         "92.60.151.192/26",
                         "85.89.247.128/29",
                         "129.39.52.0/24",
                         "85.89.247.208/29",
                         "85.89.231.48/29",
                         "109.236.183.96/28",
                         "100.98.246.0/24",
                         "109.236.183.0/27",
                         "85.89.244.128/25",
                         "85.89.241.0/27",
                         "129.39.148.0/24",
                         "85.89.247.104/29",
                         "85.89.227.164/30",
                         "158.98.77.0/24",
                         "85.89.243.112/28",
                         "85.89.249.240/29",
                         "85.89.236.128/29",
                         "85.89.247.120/29",
                         "129.39.50.0/24",
                         "92.60.154.224/28",
                         "158.98.82.0/24",
                         "85.89.243.96/29",
                         "85.89.231.64/28",
                         "85.89.236.136/29",
                         "85.89.247.176/29",
                         "85.89.245.0/24",
                         "85.89.231.80/28",
                         "217.10.16.0/26",
                         "158.98.130.113",
                         "85.89.236.104/29",
                         "85.89.242.96/27",
                         "85.89.236.152/29",
                         "109.236.185.128/25",
                         "85.89.247.192/29",
                         "158.98.68.0/24",
                         "109.236.185.0/25",
                         "85.89.227.168/30",
                         "85.89.242.192/27",
                         "100.98.243.0/24",
                         "85.89.242.64/27",
                         "100.98.252.0/24",
                         "158.98.232.176/29",
                         "100.98.248.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esbk3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esbk3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-EU1-IPSET-AG1-DR308-ag1d308apprkise2"
   nsx_id = "TF-EU1-IPSET-AG1-DR308-ag1d308apprkise2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.88.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-EU1-IPSET-EU-DR62-SNI-2"
   nsx_id = "TF-EU1-IPSET-EU-DR62-SNI-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "141.171.52.100",
                         "129.39.38.0/24",
                         "100.96.188.0/24",
                         "129.39.52.109",
                         "194.10.157.0/24",
                         "158.98.80.0/24",
                         "62.186.253.0/24",
                         "129.39.39.0/24",
                         "158.98.225.0/24",
                         "158.87.185.225",
                         "100.112.12.48/29",
                         "158.98.31.0/24",
                         "100.112.13.64/28",
                         "158.98.132.0/24",
                         "141.171.49.181",
                         "100.98.8.113",
                         "100.102.0.0/24",
                         "84.94.222.21",
                         "84.94.222.17",
                         "192.168.24.12",
                         "158.98.158.0/24",
                         "129.39.133.0/24",
                         "62.186.40.0/22",
                         "141.171.55.0/24",
                         "158.98.89.0/24",
                         "158.98.133.20",
                         "100.100.8.0/24",
                         "129.39.40.0/24",
                         "194.194.26.0/24",
                         "62.185.45.0/24",
                         "100.112.135.48/28",
                         "62.186.38.128/25",
                         "158.98.148.0/24",
                         "194.194.213.0/24",
                         "100.100.9.169",
                         "129.39.142.0/24",
                         "100.112.12.240/28",
                         "158.98.47.0/24",
                         "153.45.9.7-153.45.9.8",
                         "100.112.10.0/24",
                         "158.98.76.0/24",
                         "158.98.224.0/24",
                         "149.131.228.0/24",
                         "129.35.160.55",
                         "193.24.115.92",
                         "129.39.50.109",
                         "158.98.72.0/24",
                         "129.39.79.0/24",
                         "158.98.247.0/24",
                         "158.98.92.0/24",
                         "62.186.178.219",
                         "158.98.28.0/24",
                         "62.185.41.64/27",
                         "158.98.29.0/24",
                         "129.39.141.0/24",
                         "195.79.87.160/28",
                         "129.39.131.0/25",
                         "158.98.156.0/24",
                         "100.112.135.32/28",
                         "193.149.209.0/24",
                         "141.171.33.0/24",
                         "158.98.146.0/24",
                         "100.112.13.224/28",
                         "129.39.147.0/24",
                         "62.185.44.0/24",
                         "141.171.10.0/24",
                         "141.171.30.0/24",
                         "129.39.76.0/24",
                         "158.98.240.47",
                         "100.100.126.0/24",
                         "158.98.85.0/24",
                         "62.187.181.0/24",
                         "100.112.135.64/28",
                         "129.39.136.0/24",
                         "158.87.144.0/24",
                         "167.210.72.4-167.210.72.7",
                         "141.171.252.0/24",
                         "129.39.32.0/24",
                         "193.149.210.0/24",
                         "100.96.128.95-100.96.128.96",
                         "195.79.87.152/29",
                         "194.10.158.0/23",
                         "158.98.74.0/24",
                         "158.98.90.0/23",
                         "100.124.74.120-100.124.74.121",
                         "158.98.73.128/25",
                         "129.39.143.0/24",
                         "141.171.11.0/24",
                         "158.98.137.0/24",
                         "192.168.255.2",
                         "158.98.149.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-EU1-IPSET-DR339-eu1d339lpmh0tnp1"
   nsx_id = "TF-EU1-IPSET-DR339-eu1d339lpmh0tnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.250.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpelk1001"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpelk1001"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.62"
]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1ljmp01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1ljmp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-EU1-IPSET-SWIT-Gateway-zeuspriv-app-kyndryl-net"
   nsx_id = "TF-EU1-IPSET-SWIT-Gateway-zeuspriv-app-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.89.37",
                         "138.95.89.42",
                         "138.95.89.71",
                         "138.95.89.45",
                         "138.95.89.44",
                         "138.95.89.72",
                         "138.95.89.43",
                         "138.95.89.35",
                         "138.95.89.36",
                         "138.95.89.41",
                         "138.95.89.38",
                         "138.95.89.40",
                         "138.95.89.39",
                         "138.95.88.0/28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecnoip4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecnoip4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-EU1-IPSET-EU-SRES-eu1srlpm1epnoip4"
   nsx_id = "TF-EU1-IPSET-EU-SRES-eu1srlpm1epnoip4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1wphwccog"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1wphwccog"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.154"
]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esbk2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esbk2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.207"
]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epwg4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epwg4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.37"
]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-EU1-IPSET-DR339-eu1d339lpmh0tnp2"
   nsx_id = "TF-EU1-IPSET-DR339-eu1d339lpmh0tnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.250.33"
]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-EU1-IPSET-AG1-DR308-ag1d308apprkise1"
   nsx_id = "TF-EU1-IPSET-AG1-DR308-ag1d308apprkise1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.88.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esbk6"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esbk6"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.193"
]
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esbk7"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esbk7"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-EU1-IPSET-SRES-nlaspdb000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspdb000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.55"
]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-EU1-IPSET-DR360-eu1d360lpcacprx1"
   nsx_id = "TF-EU1-IPSET-DR360-eu1d360lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.74.2.51"
]
      }
   }
}
