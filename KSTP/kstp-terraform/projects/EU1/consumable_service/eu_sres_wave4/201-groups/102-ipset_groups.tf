#####################################
# IPSETs GROUPS
#
# Migration date: 07/18/2023 14:12
# Geography.....: EU1 
# Wave..........: eu_sres_wave4
#####################################
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
