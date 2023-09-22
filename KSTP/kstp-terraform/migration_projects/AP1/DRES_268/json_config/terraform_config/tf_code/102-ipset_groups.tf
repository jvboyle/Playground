#####################################
# IPSETs GROUPS
#
# Migration date: 05/03/2023 11:44
# Geography.....: AP1 
# Wave..........: DRES_268
#####################################
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AP1-IPSET-IBM-TOKYO"
   nsx_id = "TF-AP1-IPSET-IBM-TOKYO"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.123.68"
]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AP1-IPSET-DR264-CPREM-NETCOOL-PROBE"
   nsx_id = "TF-AP1-IPSET-DR264-CPREM-NETCOOL-PROBE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.172.203.7",
                         "10.172.203.6",
                         "10.172.203.5",
                         "10.172.203.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1lcacfjump02"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1lcacfjump02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1lcacfjump01"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1lcacfjump01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.75"
]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AP1-IPSET-Host-ap1d271lpcacpr1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d271lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.128.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AP1-IPSET-Host-ap1d271lpcacpr2"
   nsx_id = "TF-AP1-IPSET-Host-ap1d271lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.128.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AP1-IPSET-Host-pimpact1"
   nsx_id = "TF-AP1-IPSET-Host-pimpact1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "24.100.100.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AP1-IPSET-CPREM-DR110"
   nsx_id = "TF-AP1-IPSET-CPREM-DR110"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.20.0.112",
                         "172.20.0.111"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AP1-IPSET-IP-EU-VIP"
   nsx_id = "TF-AP1-IPSET-IP-EU-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.71.67"
]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AP1-IPSET-IP-KSTP-IN-OCP-01"
   nsx_id = "TF-AP1-IPSET-IP-KSTP-IN-OCP-01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.126.132.5",
                         "100.126.133.1/27",
                         "158.87.61.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AP1-IPSET-DR264-CPREM-OEM-ADAPTER"
   nsx_id = "TF-AP1-IPSET-DR264-CPREM-OEM-ADAPTER"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.172.203.6",
                         "10.172.203.7",
                         "10.172.203.5",
                         "10.172.203.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AP1-IPSET-DR264-LB-VIP1-NAT"
   nsx_id = "TF-AP1-IPSET-DR264-LB-VIP1-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AP1-IPSET-PHPIPAM-VMs"
   nsx_id = "TF-AP1-IPSET-PHPIPAM-VMs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.162.173.209",
                         "10.162.173.219"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AP1-IPSET-SWIT-Gateway-zw2uspriv-app-kyndryl-net"
   nsx_id = "TF-AP1-IPSET-SWIT-Gateway-zw2uspriv-app-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.238.18",
                         "138.95.238.9",
                         "138.95.238.10",
                         "138.95.238.13",
                         "138.95.238.15",
                         "138.95.238.16",
                         "138.95.238.14",
                         "138.95.238.11",
                         "138.95.238.12",
                         "138.95.238.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AP1-IPSET-HWSW-GACDW-AP-DB"
   nsx_id = "TF-AP1-IPSET-HWSW-GACDW-AP-DB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.195.5.34"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AP1-IPSET-HOst-MnE-Build-Source"
   nsx_id = "TF-AP1-IPSET-HOst-MnE-Build-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.5",
                         "100.80.90.71",
                         "100.80.90.75",
                         "100.80.90.74",
                         "100.80.90.76",
                         "158.87.54.6",
                         "100.80.90.73",
                         "158.87.52.32",
                         "100.80.90.72",
                         "158.87.54.108",
                         "158.87.54.4",
                         "100.80.90.70",
                         "100.80.90.77-100.80.90.84",
                         "158.87.54.109"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AP1-IPSET-iP-in1sr1lpcacfbds"
   nsx_id = "TF-AP1-IPSET-iP-in1sr1lpcacfbds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.46"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AP1-IPSET-DR264-CPREM-LB-VIP1"
   nsx_id = "TF-AP1-IPSET-DR264-CPREM-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.125.244"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AP1-IPSET-DR264-LB-VIP1"
   nsx_id = "TF-AP1-IPSET-DR264-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.125.242"
]
      }
   }
}
