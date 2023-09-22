#####################################
# IPSETs GROUPS
#
# Migration date: 07/18/2023 14:12
# Geography.....: EU1 
# Wave..........: eu_sres_wave4
#####################################
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-BlueCat-KPOP"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-BlueCat-KPOP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "142.88.130.104",
                         "142.88.132.106",
                         "142.88.133.104",
                         "130.103.1.30",
                         "142.88.129.104",
                         "142.88.132.104",
                         "142.88.131.104",
                         "142.88.131.106",
                         "130.103.1.31",
                         "142.88.128.106",
                         "142.88.135.104",
                         "142.88.134.104",
                         "142.88.133.106",
                         "142.88.129.106",
                         "142.88.130.106",
                         "142.88.135.106",
                         "142.88.134.106",
                         "142.88.128.104"
]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.167"
]
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcishfds2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcishfds2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.124"
]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejcno"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejcno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlptocdb01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlptocdb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.126"
]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD1001860020-100-107-10-6"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD1001860020-100-107-10-6"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1easpni"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1easpni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.237"
]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdnexus"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdnexus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.209"
]
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-EU1-IPSET-DR328-CPREM-SL1-COLLECTOR"
   nsx_id = "TF-EU1-IPSET-DR328-CPREM-SL1-COLLECTOR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.222.79.232",
                         "10.72.114.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdansdb2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdansdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.205"
]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-EU1-IPSET-SRES-nlaspnp000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspnp000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epni3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epni3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-EU1-IPSET-kdpnwans01-158-98-158-71"
   nsx_id = "TF-EU1-IPSET-kdpnwans01-158-98-158-71"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.158.71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-EU1-IPSET-SDE_Grabels_APICs"
   nsx_id = "TF-EU1-IPSET-SDE_Grabels_APICs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.100.120.68",
                         "100.100.120.70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlphsts1ncl"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlphsts1ncl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.159"
]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.228"
]
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-EU1-IPSET-SRES-nlaspno000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspno000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-EU1-IPSET-VDR2-ESG-vNic_2"
   nsx_id = "TF-EU1-IPSET-VDR2-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.0.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-EU1-IPSET-SRES-MnEaaS-PRTG-SHR"
   nsx_id = "TF-EU1-IPSET-SRES-MnEaaS-PRTG-SHR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.170",
                         "158.87.53.148",
                         "158.87.53.171",
                         "158.87.53.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-EU1-IPSET-DA-GH2-ibmpsoboxgh22-100-96-132-21"
   nsx_id = "TF-EU1-IPSET-DA-GH2-ibmpsoboxgh22-100-96-132-21"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.96.132.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdexec"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdexec"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.210"
]
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-EU1-IPSET-DRES333-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES333-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.240.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1etnp2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1etnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.156"
]
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-EU1-IPSET-SRES-nlaspnw000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspnw000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlPdshbrd"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlPdshbrd"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-EU1-IPSET-JPTestJumphost"
   nsx_id = "TF-EU1-IPSET-JPTestJumphost"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.222.209"
]
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-EU1-IPSET-AG1-SRES-ag-work01"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-ag-work01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.242.233",
                         "158.87.50.43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-EU1-IPSET-SRES-nlascdb000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlascdb000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-EU1-IPSET-DA-ACO-atllx008-100-98-8-81"
   nsx_id = "TF-EU1-IPSET-DA-ACO-atllx008-100-98-8-81"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.98.8.81"
]
      }
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-EU1-IPSET-SRES-eu1srwpsgesql01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srwpsgesql01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.42"
]
      }
   }
}
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-EU1-IPSET-DA-BCP-lpar7r7-100-105-20-60"
   nsx_id = "TF-EU1-IPSET-DA-BCP-lpar7r7-100-105-20-60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.105.20.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-EU1-IPSET-DA-BES-shnisap1-100-105-20-9"
   nsx_id = "TF-EU1-IPSET-DA-BES-shnisap1-100-105-20-9"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.105.20.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecdb2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.147"
]
      }
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejpno"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejpno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejpdb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejpdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejcni"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejcni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-EU1-IPSET-CPREM-EY-MOOGSOFT"
   nsx_id = "TF-EU1-IPSET-CPREM-EY-MOOGSOFT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.143.178.143",
                         "10.152.136.82",
                         "10.152.154.113",
                         "10.146.40.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecno2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecno2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-EU1-IPSET-DR328-ESG-vNic_0"
   nsx_id = "TF-EU1-IPSET-DR328-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.64.214"
]
      }
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-1"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.208.0/24",
                         "158.98.72.0/24",
                         "9.87.63.11",
                         "129.39.131.0/25",
                         "100.98.8.113",
                         "10.140.49.32/27",
                         "194.194.213.0/24",
                         "129.39.52.109",
                         "141.171.55.0/24",
                         "158.98.74.208/28",
                         "194.10.158.0/23",
                         "158.98.29.0/24",
                         "62.186.253.0/24",
                         "129.39.33.0/24",
                         "129.39.134.182",
                         "10.159.156.0/24",
                         "129.39.215.0/24",
                         "194.10.157.0/24",
                         "62.185.45.0/24",
                         "158.98.90.0/23",
                         "167.210.72.6",
                         "10.159.145.0/24",
                         "9.87.62.49",
                         "100.112.10.0/24",
                         "158.98.137.0/26",
                         "193.149.209.0/24",
                         "10.159.157.0/24",
                         "129.39.50.109",
                         "100.112.135.48/28",
                         "158.98.80.0/24",
                         "100.112.13.224/28",
                         "158.98.85.0/24",
                         "167.210.72.7",
                         "100.112.12.48/29",
                         "158.98.74.192/28",
                         "158.98.225.0/24",
                         "158.98.137.224/27",
                         "10.172.86.47",
                         "158.98.148.0/24",
                         "129.39.136.0/24",
                         "129.39.40.0/24",
                         "100.112.13.64/28",
                         "193.149.210.0/24",
                         "158.98.73.128/25",
                         "158.98.133.20",
                         "10.173.195.0/26",
                         "129.39.32.0/24",
                         "129.39.210.0/24",
                         "158.98.132.0/24",
                         "62.186.38.128/25",
                         "9.87.99.42",
                         "10.159.151.0/24",
                         "158.98.74.224/27",
                         "100.112.135.128/26",
                         "100.112.135.64/28",
                         "158.98.240.47",
                         "9.87.63.8",
                         "10.149.12.128/25",
                         "167.210.72.5",
                         "158.98.92.0/24",
                         "195.79.87.160/28",
                         "100.102.0.0/24",
                         "129.39.147.0/24",
                         "158.98.74.160/28",
                         "158.98.28.0/24",
                         "158.98.76.0/24",
                         "129.39.38.0/24",
                         "9.87.99.43",
                         "100.112.12.240/28",
                         "167.210.72.4",
                         "84.94.222.21",
                         "62.187.181.0/24",
                         "100.112.135.32/28",
                         "141.171.11.0/24",
                         "192.168.24.12",
                         "62.185.41.64/27",
                         "195.79.87.152/29",
                         "84.94.222.17",
                         "158.98.89.0/24",
                         "141.171.30.0/24",
                         "141.171.252.0/24",
                         "141.171.10.0/24",
                         "194.194.26.0/24",
                         "62.186.40.0/22",
                         "62.185.44.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esbk8"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esbk8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.215"
]
      }
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-ASPAC"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-ASPAC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.104.0/24",
                         "100.84.137.16/29",
                         "130.103.183.0/24",
                         "129.39.118.0/27",
                         "167.210.56.0/24",
                         "129.39.126.152/29",
                         "10.190.34.139",
                         "158.98.24.0/24",
                         "158.98.101.0/24",
                         "158.98.249.0/24",
                         "158.99.123.0/24",
                         "158.98.99.0/24",
                         "158.98.112.0/24",
                         "158.98.248.0/24",
                         "158.98.103.0/24",
                         "10.197.113.119",
                         "129.39.100.0/25",
                         "158.98.226.0/24",
                         "9.190.232.22",
                         "158.98.22.0/24",
                         "146.89.241.0/24",
                         "129.39.110.0/25",
                         "158.98.19.0/24",
                         "158.98.21.0/24",
                         "100.87.130.16/29",
                         "129.39.112.0/24",
                         "158.98.119.0/24",
                         "129.39.109.0/24",
                         "130.103.160.62",
                         "100.84.145.16/29",
                         "10.0.148.12",
                         "129.42.151.0/24",
                         "158.98.106.0/24",
                         "202.81.23.146",
                         "158.98.97.0/24",
                         "100.84.129.16/29",
                         "202.81.24.112",
                         "158.98.102.0/24",
                         "129.39.125.0/24",
                         "129.39.126.192/27",
                         "129.39.122.64/27",
                         "129.39.111.0/25",
                         "9.182.116.205",
                         "158.98.104.0/24",
                         "158.98.98.0/24",
                         "158.98.229.0/24",
                         "158.99.40.115",
                         "158.98.18.0/24",
                         "158.98.122.0/24",
                         "129.39.115.0/24",
                         "129.39.124.0/24",
                         "129.39.103.0/24",
                         "158.98.100.0/24",
                         "130.103.181.0/25",
                         "130.103.180.0/24",
                         "9.190.232.34",
                         "158.99.124.0/24",
                         "100.90.41.16/29",
                         "129.42.147.0/24",
                         "158.98.230.0/24",
                         "202.81.17.129",
                         "158.98.250.0/24",
                         "100.87.98.16/29",
                         "10.191.48.151",
                         "130.103.160.61",
                         "158.98.251.0/24",
                         "158.98.20.0/24",
                         "100.84.153.16/29",
                         "9.182.116.206",
                         "129.39.117.0/24",
                         "158.98.252.0/24",
                         "158.98.113.237",
                         "158.98.25.0/24",
                         "158.98.23.0/24",
                         "100.80.8.134",
                         "129.39.127.0/24",
                         "129.39.120.0/26",
                         "9.182.116.207"
]
      }
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1eascdb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1eascdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-EU1-IPSET-SRES-eu1srwnbassql"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srwnbassql"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.41"
]
      }
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-NA"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-NA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.52.0/25",
                         "129.39.208.0/24",
                         "10.21.198.139",
                         "206.75.101.64/28",
                         "167.210.8.0/25",
                         "10.23.95.231",
                         "129.39.196.160/28",
                         "129.39.193.192/26",
                         "206.75.96.0/24",
                         "10.28.170.139",
                         "129.39.248.0/24",
                         "129.39.210.0/24",
                         "129.39.205.128/25",
                         "129.39.207.224/27",
                         "206.75.100.0/24",
                         "129.39.196.128/28",
                         "10.29.188.229",
                         "129.39.214.128/25",
                         "10.23.95.13",
                         "192.91.193.240/28",
                         "192.91.193.0/27",
                         "129.39.215.0/24",
                         "10.28.170.140",
                         "129.39.204.0/26",
                         "129.39.198.0/24",
                         "10.21.38.53",
                         "206.75.97.240/28",
                         "10.23.140.88",
                         "167.210.53.128/28",
                         "167.210.9.128/28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-EU1-IPSET-CPREM-DRES280-EY-SL1-Collectors"
   nsx_id = "TF-EU1-IPSET-CPREM-DRES280-EY-SL1-Collectors"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.152.138.61-10.152.138.62",
                         "10.146.214.91-10.146.214.92",
                         "10.151.139.191-10.151.139.193",
                         "10.174.104.51-10.174.104.53",
                         "10.226.100.61-10.226.100.63"
]
      }
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-EU1-IPSET-DA-JP-MEI-jbp11h-100-87-2-92-"
   nsx_id = "TF-EU1-IPSET-DA-JP-MEI-jbp11h-100-87-2-92-"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.2.92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esc2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.208"
]
      }
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-87-130-195"
   nsx_id = "TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-87-130-195"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.130.195"
]
      }
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1eascno"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1eascno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.236"
]
      }
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpabcmstr"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpabcmstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.115"
]
      }
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdhapxy2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdhapxy2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.207"
]
      }
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-EU1-IPSET-IN1-SRES-POC"
   nsx_id = "TF-EU1-IPSET-IN1-SRES-POC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.157"
]
      }
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1eascni"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1eascni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.238"
]
      }
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-EU1-IPSET-DA-JP-FNL-KAJMPAPP01-158-98-100-133"
   nsx_id = "TF-EU1-IPSET-DA-JP-FNL-KAJMPAPP01-158-98-100-133"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.100.133"
]
      }
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt5"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.49"
]
      }
   }
}
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epwg2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epwg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.144"
]
      }
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecni3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecni3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.165"
]
      }
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpgacdwut01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpgacdwut01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-EU1-IPSET-ICD-MAXIMO-ESLSX"
   nsx_id = "TF-EU1-IPSET-ICD-MAXIMO-ESLSX"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.218",
                         "146.89.184.103",
                         "146.89.187.197",
                         "146.89.184.82",
                         "146.89.151.235"
]
      }
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-EU1-IPSET-DR20-BGE-Datacenter-CPREM-Networks"
   nsx_id = "TF-EU1-IPSET-DR20-BGE-Datacenter-CPREM-Networks"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.67.86.0/23",
                         "10.67.108.0/22",
                         "10.66.84.0/22",
                         "10.66.202.0/23",
                         "10.66.88.0/22",
                         "10.67.112.0/22",
                         "10.67.222.0/23",
                         "10.67.228.0/22",
                         "10.67.232.0/22",
                         "10.66.124.0/23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epnp3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epnp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.170"
]
      }
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-EU1-IPSET-DA-JP-FNS-mmsjmp02-100-87-34-190"
   nsx_id = "TF-EU1-IPSET-DA-JP-FNS-mmsjmp02-100-87-34-190"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.34.190"
]
      }
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-EU1-IPSET-DRES332-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES332-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.238.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1staas17"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1staas17"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.48"
]
      }
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-EU1-IPSET-DR62-CACF-VIP"
   nsx_id = "TF-EU1-IPSET-DR62-CACF-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.162.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-EU1-IPSET-DR240-ESG-vNic_2"
   nsx_id = "TF-EU1-IPSET-DR240-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.9.217"
]
      }
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-EU1-IPSET-SRES-nlaspdb000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspdb000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejtnp2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejtnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-CALA"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-CALA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.223.4.3",
                         "129.39.175.32/29",
                         "9.7.2.55",
                         "129.39.177.0/24",
                         "129.39.172.0/24",
                         "9.8.68.12",
                         "158.98.58.0/24",
                         "167.210.80.0/24",
                         "129.39.170.0/23",
                         "158.98.50.0/24",
                         "129.39.82.0/24",
                         "129.39.168.0/24",
                         "158.98.15.0/24",
                         "129.39.180.0/24",
                         "129.39.175.200/31",
                         "129.39.87.0/24",
                         "129.39.166.0/24",
                         "129.39.175.0/24",
                         "9.8.68.11",
                         "192.168.254.249",
                         "129.39.55.0/24",
                         "158.98.5.0/24",
                         "129.39.176.0/24",
                         "158.98.54.0/24",
                         "129.39.174.0/24",
                         "129.39.81.0/24",
                         "129.39.181.0/24",
                         "158.98.14.0/24",
                         "9.8.131.128/26",
                         "149.131.150.0/24",
                         "129.39.164.0/24",
                         "158.98.51.0/24",
                         "158.98.57.0/24",
                         "129.39.165.0/24",
                         "129.39.183.0/24",
                         "129.39.80.0/24",
                         "158.98.52.0/24",
                         "129.39.167.0/24",
                         "158.98.48.0/24",
                         "158.98.53.0/24",
                         "167.210.81.0/24",
                         "129.39.73.0/24",
                         "149.131.151.0/24",
                         "149.131.148.0/24",
                         "149.131.156.0/23",
                         "129.39.83.0/24",
                         "158.98.7.0/24",
                         "192.168.254.252",
                         "158.98.59.0/24",
                         "158.98.4.0/24",
                         "149.131.149.0/24",
                         "129.39.86.0/24",
                         "158.98.60.0/24",
                         "158.98.55.0/24",
                         "158.98.56.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdjenkns"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdjenkns"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.208"
]
      }
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-EU1-IPSET-DR328-LB-VIP1-NAT"
   nsx_id = "TF-EU1-IPSET-DR328-LB-VIP1-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-EU1-IPSET-SRES-eu1srltm1eslc"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srltm1eslc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdansdb1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdansdb1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.204"
]
      }
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcacfbds1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcacfbds1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.225"
]
      }
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-EU1-IPSET-DA-JP-TDS-SSORJH01-100-87-130-226"
   nsx_id = "TF-EU1-IPSET-DA-JP-TDS-SSORJH01-100-87-130-226"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.130.226"
]
      }
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-EU1-IPSET-IRES-SPLUNK-HF-VIP-NAT"
   nsx_id = "TF-EU1-IPSET-IRES-SPLUNK-HF-VIP-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.68.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-EU1-IPSET-AG1-DR217-LB-VIPs-NAT"
   nsx_id = "TF-EU1-IPSET-AG1-DR217-LB-VIPs-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.185.243",
                         "100.64.185.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-EU1-IPSET-SRES-nlaspni000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspni000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.53"
]
      }
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-EU1-IPSET-AG1-SRES-SRM-PROD"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-SRM-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.221",
                         "158.87.49.220",
                         "158.87.49.230",
                         "158.87.49.217",
                         "158.87.49.224",
                         "158.87.49.227",
                         "158.87.49.226",
                         "158.87.49.219",
                         "158.87.49.228",
                         "158.87.49.215",
                         "158.87.49.229",
                         "158.87.49.225",
                         "158.87.49.222",
                         "158.87.49.218",
                         "158.87.49.223",
                         "158.87.49.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1easpno"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1easpno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.235"
]
      }
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdhapxy1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdhapxy1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.206"
]
      }
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejcdb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejcdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-EU1-IPSET-DR240-LB-VIP1-NAT"
   nsx_id = "TF-EU1-IPSET-DR240-LB-VIP1-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-EU1-IPSET-DA-BES-shnisap1-100-105-20-9n"
   nsx_id = "TF-EU1-IPSET-DA-BES-shnisap1-100-105-20-9n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.105.20.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-EU1-IPSET-DA-JP-NRK-rmnansa1-100-87-2-240-100-87-2-240"
   nsx_id = "TF-EU1-IPSET-DA-JP-NRK-rmnansa1-100-87-2-240-100-87-2-240"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.2.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-EU1-IPSET-SDE_Milano_APICs"
   nsx_id = "TF-EU1-IPSET-SDE_Milano_APICs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.102.14.129",
                         "100.102.14.193",
                         "100.102.14.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD10018D3013-100-107-10-4"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD10018D3013-100-107-10-4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1esldc1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1esldc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-EU1-IPSET-DR328-LB-VIP1"
   nsx_id = "TF-EU1-IPSET-DR328-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.233.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-EU1-IPSET-SRES-nlascni000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlascni000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.54"
]
      }
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpmpcansb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpmpcansb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.34"
]
      }
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-EU1-IPSET-SRES-nlaspno000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspno000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-EU1-IPSET-GNPP-CIO_DNS_KPOP"
   nsx_id = "TF-EU1-IPSET-GNPP-CIO_DNS_KPOP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "142.88.130.104",
                         "142.88.132.106",
                         "142.88.133.104",
                         "130.103.1.30",
                         "142.88.129.104",
                         "142.88.132.104",
                         "142.88.131.106",
                         "142.88.131.104",
                         "130.103.1.31",
                         "142.88.135.104",
                         "142.88.128.106",
                         "142.88.134.104",
                         "142.88.129.106",
                         "142.88.133.106",
                         "142.88.130.106",
                         "142.88.135.106",
                         "142.88.134.106",
                         "142.88.128.104"
]
      }
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecni2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecni2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.143"
]
      }
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-EU1-IPSET-GNPP-SATHC-EU"
   nsx_id = "TF-EU1-IPSET-GNPP-SATHC-EU"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.208.0/24",
                         "129.39.147.0/24",
                         "129.39.210.0/24",
                         "158.98.106.0/24",
                         "158.98.226.0/24",
                         "194.194.213.0/24",
                         "158.98.124.0/24",
                         "194.194.26.0/24",
                         "129.39.126.0/24",
                         "158.98.122.0/24",
                         "129.39.122.0/24",
                         "129.39.215.0/24",
                         "129.39.127.0/24",
                         "158.98.92.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1easbcp"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1easbcp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-US-2"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-US-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.44.58.141",
                         "167.210.249.160/27",
                         "9.56.252.103",
                         "9.45.76.13",
                         "167.210.243.224/27",
                         "9.45.114.25",
                         "129.42.64.0/19",
                         "167.210.252.128/28",
                         "167.210.244.128/27",
                         "9.51.106.75",
                         "167.210.237.96/27",
                         "167.210.245.128/26",
                         "167.210.218.0/28",
                         "167.210.250.24/29",
                         "9.252.0.0/16",
                         "100.124.120.128/28",
                         "100.124.74.128/28",
                         "167.210.241.32/28",
                         "167.210.241.0/28",
                         "100.124.7.128/28",
                         "167.210.241.240/28",
                         "9.17.137.23",
                         "9.58.132.186",
                         "9.45.75.11",
                         "167.210.216.72/29",
                         "167.210.219.0/24",
                         "167.210.249.240/28",
                         "167.210.241.192/28",
                         "167.210.242.32/27",
                         "129.42.104.0/21",
                         "129.42.128.0/19",
                         "167.210.248.192/28",
                         "129.42.112.0/20",
                         "167.210.240.62/26",
                         "167.210.248.224/28",
                         "167.210.216.96/27",
                         "167.210.216.160/27",
                         "9.253.0.0/16",
                         "167.210.234.0/23",
                         "100.124.0.128/28",
                         "167.210.204.64/28",
                         "170.225.28.32/27",
                         "167.210.244.32/27",
                         "167.210.240.192/26",
                         "167.210.249.0/28",
                         "170.225.28.192/26",
                         "9.255.0.0/16",
                         "167.210.249.64/28",
                         "167.210.242.64/27",
                         "167.210.249.48/28",
                         "167.210.252.0/25",
                         "9.254.0.0/16",
                         "167.210.246.80/29",
                         "167.210.237.64/27",
                         "167.210.237.32/27",
                         "167.210.250.0/29",
                         "167.210.230.0/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-EU1-IPSET-BLUEIDP1-zkpw3uspriv-app-kyndryl-net-138-95-240-6"
   nsx_id = "TF-EU1-IPSET-BLUEIDP1-zkpw3uspriv-app-kyndryl-net-138-95-240-6"
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
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-EU1-IPSET-SRES-nlascni000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlascni000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-107-10-7"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-107-10-7"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD1001860002-100-107-10-3"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD1001860002-100-107-10-3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-EU1-IPSET-SRES-lmt-wizard"
   nsx_id = "TF-EU1-IPSET-SRES-lmt-wizard"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.226"
]
      }
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecdb3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecdb3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.169"
]
      }
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-EU1-IPSET-DA-JP-NRK-hmnansa1-100-87-2-241-100-87-2-241"
   nsx_id = "TF-EU1-IPSET-DA-JP-NRK-hmnansa1-100-87-2-241-100-87-2-241"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.2.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-EU1-IPSET-DR276-CPREM-BDS"
   nsx_id = "TF-EU1-IPSET-DR276-CPREM-BDS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.231.142.22-10.231.142.23",
                         "10.221.142.22-10.221.142.23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_184" {
   display_name = "TF-EU1-IPSET-SRES-eu1srljmp02"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srljmp02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_185" {
   display_name = "TF-EU1-IPSET-VDR2-LB-VIP1"
   nsx_id = "TF-EU1-IPSET-VDR2-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.70.14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_186" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlptocdb03"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlptocdb03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.128"
]
      }
   }
}
resource "nsxt_policy_group" "grp_187" {
   display_name = "TF-EU1-IPSET-SDE_Montpellier_APICs"
   nsx_id = "TF-EU1-IPSET-SDE_Montpellier_APICs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.100.120.6",
                         "100.100.120.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_188" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1etnp1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1etnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.155"
]
      }
   }
}
resource "nsxt_policy_group" "grp_189" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1staas15"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1staas15"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.46"
]
      }
   }
}
resource "nsxt_policy_group" "grp_190" {
   display_name = "TF-EU1-IPSET-DA-JP-SBN-ttsojh01-100-87-130-192"
   nsx_id = "TF-EU1-IPSET-DA-JP-SBN-ttsojh01-100-87-130-192"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.130.192"
]
      }
   }
}
resource "nsxt_policy_group" "grp_191" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-US-1"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-US-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.224.216/29",
                         "129.39.17.80/29",
                         "129.39.59.88/29",
                         "167.210.160.64/29",
                         "129.39.240.192/29",
                         "129.39.94.160/27",
                         "10.11.7.16",
                         "129.39.233.64/27",
                         "167.210.161.0/26",
                         "129.39.254.0/24",
                         "167.210.169.0/26",
                         "167.210.153.96/28",
                         "167.210.203.160/28",
                         "129.39.227.224/27",
                         "129.39.8.64/28",
                         "129.39.27.64/28",
                         "167.210.167.64/28",
                         "167.210.123.112/28",
                         "167.210.123.48/28",
                         "167.210.152.0/27",
                         "167.210.153.0/27",
                         "149.131.26.0/25",
                         "167.210.152.112/28",
                         "129.39.56.0/25",
                         "167.210.115.80/28",
                         "129.39.59.48/28",
                         "129.39.14.0/26",
                         "167.210.179.224/28",
                         "167.210.0.0/23",
                         "129.39.224.40/29",
                         "167.210.200.0/24",
                         "10.6.36.106",
                         "158.98.9.128/25",
                         "158.87.6.0/24",
                         "129.33.203.0/28",
                         "167.210.152.192/28",
                         "129.39.57.224/29",
                         "167.210.167.160/28",
                         "167.210.167.16/29",
                         "129.39.12.128/25",
                         "129.39.237.0/27",
                         "129.39.240.80/28",
                         "167.210.175.192/26",
                         "129.39.241.48/29",
                         "129.39.8.192/27",
                         "129.39.11.0/28",
                         "129.39.235.64/29",
                         "167.210.160.192/27",
                         "129.39.57.32/27",
                         "129.39.16.0/24",
                         "129.39.22.136/29",
                         "129.39.29.96/28",
                         "129.39.23.0/25",
                         "129.39.252.0/23",
                         "167.210.157.160/27",
                         "167.210.203.208/28",
                         "10.34.37.22",
                         "167.210.157.144/28",
                         "129.39.22.168/29",
                         "129.39.235.120/29",
                         "167.210.152.64/28",
                         "167.210.114.0/25",
                         "167.210.157.96/28",
                         "167.210.199.0/25",
                         "167.210.153.192/26",
                         "167.210.175.128/26",
                         "129.39.92.112/28",
                         "129.39.231.64/27",
                         "129.39.93.0/26",
                         "167.210.203.0/29",
                         "167.210.123.16/29",
                         "129.39.237.160/27",
                         "167.210.123.144/29",
                         "149.131.26.192/28",
                         "167.210.156.0/24",
                         "167.210.123.128/28",
                         "129.39.250.0/24",
                         "167.210.153.64/27",
                         "129.39.95.0/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_192" {
   display_name = "TF-EU1-IPSET-DR240-LB-VIP1"
   nsx_id = "TF-EU1-IPSET-DR240-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.127.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_193" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcishfds1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcishfds1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.123"
]
      }
   }
}
resource "nsxt_policy_group" "grp_194" {
   display_name = "TF-EU1-IPSET-VDR2-ESG-vNic_0"
   nsx_id = "TF-EU1-IPSET-VDR2-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.64.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_195" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.160"
]
      }
   }
}
resource "nsxt_policy_group" "grp_196" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_197" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejpni"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejpni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_198" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.202"
]
      }
   }
}
resource "nsxt_policy_group" "grp_199" {
   display_name = "TF-EU1-IPSET-IRES-eu1irsplnkhf01-NAT"
   nsx_id = "TF-EU1-IPSET-IRES-eu1irsplnkhf01-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.68.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_200" {
   display_name = "TF-EU1-IPSET-SRES-nlascdb000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlascdb000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.56"
]
      }
   }
}
resource "nsxt_policy_group" "grp_201" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.171"
]
      }
   }
}
resource "nsxt_policy_group" "grp_202" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpdefmstr"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpdefmstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.119"
]
      }
   }
}
resource "nsxt_policy_group" "grp_203" {
   display_name = "TF-EU1-IPSET-DR240-ESG-vNic_0"
   nsx_id = "TF-EU1-IPSET-DR240-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.64.160"
]
      }
   }
}
resource "nsxt_policy_group" "grp_204" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epni2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epni2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_205" {
   display_name = "TF-EU1-IPSET-AG1-SRES-PSRMVMs"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-PSRMVMs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.215-158.87.49.230"
]
      }
   }
}
resource "nsxt_policy_group" "grp_206" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epwg3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epwg3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.166"
]
      }
   }
}
resource "nsxt_policy_group" "grp_207" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1easpdb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1easpdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_208" {
   display_name = "TF-EU1-IPSET-DA-JP-NXI-100-87-2-221-100-87-162-60-100-87-162-61-100-87-162-62"
   nsx_id = "TF-EU1-IPSET-DA-JP-NXI-100-87-2-221-100-87-162-60-100-87-162-61-100-87-162-62"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.162.60",
                         "100.87.162.60-100.87.162.62",
                         "100.87.162.62",
                         "100.87.162.61",
                         "100.87.2.221"
]
      }
   }
}
resource "nsxt_policy_group" "grp_209" {
   display_name = "TF-EU1-IPSET-SRES-eu1srltm1esdp"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srltm1esdp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.35"
]
      }
   }
}
resource "nsxt_policy_group" "grp_210" {
   display_name = "TF-EU1-IPSET-DA-JP-FNS-mmsjmp01-100-87-34-189"
   nsx_id = "TF-EU1-IPSET-DA-JP-FNS-mmsjmp01-100-87-34-189"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.34.189"
]
      }
   }
}
resource "nsxt_policy_group" "grp_211" {
   display_name = "TF-EU1-IPSET-VDR2-LB-VIP2"
   nsx_id = "TF-EU1-IPSET-VDR2-LB-VIP2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.70.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_212" {
   display_name = "TF-EU1-IPSET-SRES-eu1srltm1eslc2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srltm1eslc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_213" {
   display_name = "TF-EU1-IPSET-SRES-nlascno000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlascno000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_214" {
   display_name = "TF-EU1-IPSET-DA-JP-REA-H031S3448-100-87-98-195"
   nsx_id = "TF-EU1-IPSET-DA-JP-REA-H031S3448-100-87-98-195"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.98.195"
]
      }
   }
}
resource "nsxt_policy_group" "grp_215" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epnp2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.148"
]
      }
   }
}
resource "nsxt_policy_group" "grp_216" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejpwg"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejpwg"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_217" {
   display_name = "TF-EU1-IPSET-IRES-eu1irsplnkhf02-NAT"
   nsx_id = "TF-EU1-IPSET-IRES-eu1irsplnkhf02-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.68.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_218" {
   display_name = "TF-EU1-IPSET-SRES-nlaspni000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspni000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_219" {
   display_name = "TF-EU1-IPSET-DR240-CPREM-SL1-COLLECTOR"
   nsx_id = "TF-EU1-IPSET-DR240-CPREM-SL1-COLLECTOR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.31.1.146-172.31.1.148"
]
      }
   }
}
resource "nsxt_policy_group" "grp_220" {
   display_name = "TF-EU1-IPSET-SRES-nlaspnw000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspnw000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_221" {
   display_name = "TF-EU1-IPSET-HOSTS-GACDW-ISIM-France-tools"
   nsx_id = "TF-EU1-IPSET-HOSTS-GACDW-ISIM-France-tools"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.74.13-129.39.74.14",
                         "129.39.133.227-129.39.133.228",
                         "129.39.74.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_222" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlphstp1ncl"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlphstp1ncl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_223" {
   display_name = "TF-EU1-IPSET-SRES-nlaspnp000m1ermp"
   nsx_id = "TF-EU1-IPSET-SRES-nlaspnp000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_224" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epdb2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.146"
]
      }
   }
}
resource "nsxt_policy_group" "grp_225" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecwg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.145"
]
      }
   }
}
resource "nsxt_policy_group" "grp_226" {
   display_name = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-87-98-240"
   nsx_id = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-87-98-240"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.98.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_227" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejcwg"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejcwg"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_228" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdanstw3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.203"
]
      }
   }
}
resource "nsxt_policy_group" "grp_229" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlptena1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlptena1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.231"
]
      }
   }
}
resource "nsxt_policy_group" "grp_230" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlPtmmch"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlPtmmch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_231" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epno2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epno2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_232" {
   display_name = "TF-EU1-IPSET-DR328-ESG-vNic_1"
   nsx_id = "TF-EU1-IPSET-DR328-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.13.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_233" {
   display_name = "TF-EU1-IPSET-DA-JP-FNS-bmsjmp01-100-87-98-213"
   nsx_id = "TF-EU1-IPSET-DA-JP-FNS-bmsjmp01-100-87-98-213"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.98.213"
]
      }
   }
}
resource "nsxt_policy_group" "grp_234" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt0"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_235" {
   display_name = "TF-EU1-IPSET-EU-DR62-eu1d62prkebcdm-VIP"
   nsx_id = "TF-EU1-IPSET-EU-DR62-eu1d62prkebcdm-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.162.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_236" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-107-10-7n"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-107-10-7n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_237" {
   display_name = "TF-EU1-IPSET-DA-ShJH-FSS-ilp-j100-66-50-30"
   nsx_id = "TF-EU1-IPSET-DA-ShJH-FSS-ilp-j100-66-50-30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.66.50.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_238" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlptocdb02"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlptocdb02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.127"
]
      }
   }
}
resource "nsxt_policy_group" "grp_239" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-2"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.156.108.115",
                         "129.39.51.0/24",
                         "194.194.213.0/24",
                         "9.156.112.0/24",
                         "109.236.185.0/24",
                         "129.39.148.0/24",
                         "158.87.185.225",
                         "129.39.143.144/28",
                         "158.98.232.176/29",
                         "158.98.77.0/24",
                         "158.98.233.224/27",
                         "85.89.244.112/29",
                         "158.98.226.0/24",
                         "85.89.226.112/29",
                         "100.96.128.95",
                         "158.87.144.0/24",
                         "158.98.146.0/24",
                         "100.98.249.0/24",
                         "10.212.194.12",
                         "129.39.79.48/28",
                         "109.236.184.0/24",
                         "9.165.152.20",
                         "85.89.236.0/24",
                         "193.27.75.0/24",
                         "129.39.53.0/24",
                         "100.98.252.0/24",
                         "85.89.228.0/24",
                         "100.98.246.0/24",
                         "129.39.50.0/24",
                         "100.124.74.120",
                         "158.98.106.0/24",
                         "100.98.248.0/24",
                         "129.39.141.128/26",
                         "100.96.128.96",
                         "149.131.228.0/24",
                         "85.89.247.0/24",
                         "129.39.52.0/24",
                         "129.39.79.0/27",
                         "158.98.224.0/24",
                         "9.156.107.115",
                         "100.96.188.0/24",
                         "100.98.14.233",
                         "129.39.54.7",
                         "158.98.124.0/24",
                         "192.168.255.2",
                         "158.98.247.0/25",
                         "129.39.141.32/27",
                         "158.98.122.0/24",
                         "158.98.31.0/24",
                         "100.98.253.0/24",
                         "158.98.92.0/24",
                         "158.98.247.128/25",
                         "109.236.183.0/27",
                         "158.98.158.0/24",
                         "85.89.225.0/24",
                         "85.89.245.0/24",
                         "100.98.243.0/24",
                         "129.39.79.32/28",
                         "158.98.68.0/24",
                         "158.98.82.0/24",
                         "9.165.152.21",
                         "129.39.142.32/28",
                         "109.236.183.96/28",
                         "158.98.143.0/24",
                         "158.98.47.0/24",
                         "129.39.149.0/24",
                         "129.39.76.0/24",
                         "158.98.130.0/24",
                         "85.89.231.48/29",
                         "129.39.126.0/24",
                         "100.124.74.121",
                         "129.39.122.0/24",
                         "10.212.193.11",
                         "129.39.39.0/24",
                         "158.98.156.0/24",
                         "158.98.149.0/24",
                         "193.24.115.92",
                         "194.194.26.0/24",
                         "129.39.127.0/24",
                         "9.165.153.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_240" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1staas16"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1staas16"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.47"
]
      }
   }
}
resource "nsxt_policy_group" "grp_241" {
   display_name = "TF-EU1-IPSET-DR328-ESG-vNic_2"
   nsx_id = "TF-EU1-IPSET-DR328-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.13.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_242" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlplmt3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlplmt3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.230"
]
      }
   }
}
resource "nsxt_policy_group" "grp_243" {
   display_name = "TF-EU1-IPSET-DA-JP-MRT-m0iainfra01-100-87-98-161"
   nsx_id = "TF-EU1-IPSET-DA-JP-MRT-m0iainfra01-100-87-98-161"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.98.161"
]
      }
   }
}
resource "nsxt_policy_group" "grp_244" {
   display_name = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-SDDC"
   nsx_id = "TF-EU1-IPSET-EU-DR62-Frontier-EMEA-SDDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.100.120.0/22",
                         "100.107.248.0/21",
                         "100.109.128.0/21",
                         "100.108.128.0/21",
                         "100.113.128.0/21",
                         "100.96.192.0/23",
                         "100.102.14.0/23",
                         "100.107.240.0/21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_245" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcdjump"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcdjump"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_246" {
   display_name = "TF-EU1-IPSET-DR240-ESG-vNic_1"
   nsx_id = "TF-EU1-IPSET-DR240-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.9.210"
]
      }
   }
}
resource "nsxt_policy_group" "grp_247" {
   display_name = "TF-EU1-IPSET-DA-BVP-lppbfx301-100-105-20-106"
   nsx_id = "TF-EU1-IPSET-DA-BVP-lppbfx301-100-105-20-106"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.105.20.106"
]
      }
   }
}
resource "nsxt_policy_group" "grp_248" {
   display_name = "TF-EU1-IPSET-SRES-nlascno000m1erms"
   nsx_id = "TF-EU1-IPSET-SRES-nlascno000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_249" {
   display_name = "TF-EU1-IPSET-DA-JP-MEI-jbp21h-100-87-2-99-"
   nsx_id = "TF-EU1-IPSET-DA-JP-MEI-jbp21h-100-87-2-99-"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.2.99"
]
      }
   }
}
resource "nsxt_policy_group" "grp_250" {
   display_name = "TF-EU1-IPSET-SRES-eu1srltm1esdc"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srltm1esdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.36"
]
      }
   }
}
resource "nsxt_policy_group" "grp_251" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1staas14"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1staas14"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.45"
]
      }
   }
}
resource "nsxt_policy_group" "grp_252" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ejtnp1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ejtnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_253" {
   display_name = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-87-130-164"
   nsx_id = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-87-130-164"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.130.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_254" {
   display_name = "TF-EU1-IPSET-DA-BCP-lpar7r7-100-105-20-60n"
   nsx_id = "TF-EU1-IPSET-DA-BCP-lpar7r7-100-105-20-60n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.105.20.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_255" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epdb3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epdb3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.168"
]
      }
   }
}
resource "nsxt_policy_group" "grp_256" {
   display_name = "TF-EU1-IPSET-DA-ECI-MXCPD10018E0007-100-107-10-5"
   nsx_id = "TF-EU1-IPSET-DA-ECI-MXCPD10018E0007-100-107-10-5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.107.10.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_257" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1easweb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1easweb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.239"
]
      }
   }
}
