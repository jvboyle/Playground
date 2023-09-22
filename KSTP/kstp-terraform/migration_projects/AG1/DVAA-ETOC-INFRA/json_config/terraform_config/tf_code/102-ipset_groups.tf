#####################################
# IPSETs GROUPS
#
# Migration date: 03/30/2023 17:32
# Geography.....: AG1 
# Wave..........: DVAA-ETOC-INFRA
#####################################
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-Host-agnsrlndvadb01"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlndvadb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.156"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-IPSET-sres-tanzu-workload-06"
   nsx_id = "TF-AG1-IPSET-sres-tanzu-workload-06"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.245.0/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-IPSET-Brazil-Shared-Netcool--GSMAListener"
   nsx_id = "TF-AG1-IPSET-Brazil-Shared-Netcool--GSMAListener"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.84.140",
                         "158.87.84.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AG1-IPSET-UAT-BR"
   nsx_id = "TF-AG1-IPSET-UAT-BR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AG1-IPSET-sres-tanzu-workload-05"
   nsx_id = "TF-AG1-IPSET-sres-tanzu-workload-05"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.242.245",
                         "158.87.50.47",
                         "100.71.242.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AG1-IPSET-DR12-CPREM-RPA3"
   nsx_id = "TF-AG1-IPSET-DR12-CPREM-RPA3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.201.216.194"
]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-REMEDY-PROD2"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-REMEDY-PROD2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "152.144.129.144"
]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AG1-IPSET-Host-agnsrlndvadevdb"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlndvadevdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.133"
]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-AG1-IPSET-DR12-CPREM-RPA2"
   nsx_id = "TF-AG1-IPSET-DR12-CPREM-RPA2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.115.103.194"
]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-AG1-IPSET-DR273-CPREM-NETCOOL"
   nsx_id = "TF-AG1-IPSET-DR273-CPREM-NETCOOL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "148.173.18.73",
                         "148.173.18.71",
                         "148.171.96.23",
                         "148.171.96.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-AG1-IPSET-DR204--CPREM--JH"
   nsx_id = "TF-AG1-IPSET-DR204--CPREM--JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.23.155.94",
                         "172.23.155.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AG1-IPSET-driamaasthy-Customer1-Windows-EP-1"
   nsx_id = "TF-AG1-IPSET-driamaasthy-Customer1-Windows-EP-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.186.25.156"
]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-AG1-IPSET-eu1srlngacdwwas"
   nsx_id = "TF-AG1-IPSET-eu1srlngacdwwas"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.199"
]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwisds"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwisds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.218"
]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-AG1-IPSET-Host-CNICC-Dow-Flex"
   nsx_id = "TF-AG1-IPSET-Host-CNICC-Dow-Flex"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.23.0.0/16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1bfrelay2"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1bfrelay2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-AG1-IPSET-IP-EU-BAT-BATS"
   nsx_id = "TF-AG1-IPSET-IP-EU-BAT-BATS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.191"
]
      }
   }
}
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-AG1-IPSET-DRES299-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DRES299-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.50",
                         "100.64.208.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-AG1-IPSET-Host-ICD-UAT-Belfius"
   nsx_id = "TF-AG1-IPSET-Host-ICD-UAT-Belfius"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "212.63.226.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-AG1-IPSET-Host-agnsrlndvadeva1"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlndvadeva1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-AG1-IPSET-DR273-ESG-dlr-vNic_3"
   nsx_id = "TF-AG1-IPSET-DR273-ESG-dlr-vNic_3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.203.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-AG1-IPSET-Brazil-Shared-Netcool--MessageBus"
   nsx_id = "TF-AG1-IPSET-Brazil-Shared-Netcool--MessageBus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.84.143",
                         "158.87.84.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-AG1-IPSET-eu1srlngacdwdb"
   nsx_id = "TF-AG1-IPSET-eu1srlngacdwdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-REMEDY-PROD1"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-REMEDY-PROD1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "161.228.62.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-AG1-IPSET-ag-bfiapdapp22"
   nsx_id = "TF-AG1-IPSET-ag-bfiapdapp22"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.9.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-AG1-IPSET-EU1-SRES-eu1srlngacdwdb"
   nsx_id = "TF-AG1-IPSET-EU1-SRES-eu1srlngacdwdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-AG1-IPSET-STaaS-DR1-FS7200"
   nsx_id = "TF-AG1-IPSET-STaaS-DR1-FS7200"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "125.156.103.16",
                         "125.157.103.15-125.157.103.16",
                         "125.156.103.13",
                         "125.157.103.13",
                         "125.156.103.21-125.156.103.23",
                         "125.157.103.18-125.157.103.20",
                         "125.156.103.15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-AG1-IPSET-SG-EU1-SRES-GACDW-DEV"
   nsx_id = "TF-AG1-IPSET-SG-EU1-SRES-GACDW-DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.198-158.87.52.199"
]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-AG1-IPSET-CAN-Prod-DB"
   nsx_id = "TF-AG1-IPSET-CAN-Prod-DB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.37.19",
                         "158.87.37.17",
                         "158.87.37.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-AG1-IPSET-Eu1srlpmsatcld"
   nsx_id = "TF-AG1-IPSET-Eu1srlpmsatcld"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.89"
]
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1bfrelay1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1bfrelay1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-AG1-IPSET-dr100-ESG-vNic_1"
   nsx_id = "TF-AG1-IPSET-dr100-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.1.129"
]
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-AG1-IPSET-ag1d160lpprx-VIP"
   nsx_id = "TF-AG1-IPSET-ag1d160lpprx-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.144.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-AG1-IPSET-SG-EU1-SRES-GACDW-PROD"
   nsx_id = "TF-AG1-IPSET-SG-EU1-SRES-GACDW-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.217-158.87.53.220",
                         "158.87.53.188-158.87.53.189",
                         "158.87.53.181"
]
      }
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-AG1-IPSET-IP-PDR-Internet-Proxy-Server"
   nsx_id = "TF-AG1-IPSET-IP-PDR-Internet-Proxy-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.69.2-100.64.69.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-AG1-IPSET-sldalnoidb01"
   nsx_id = "TF-AG1-IPSET-sldalnoidb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.254.113"
]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-AG1-IPSET-DOW-customer-Solarwinds--CNICC"
   nsx_id = "TF-AG1-IPSET-DOW-customer-Solarwinds--CNICC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.116.62.8/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwwas1"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwwas1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.220"
]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Storage--V5000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Storage--V5000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.64.90.117",
                         "10.64.90.115",
                         "10.64.90.118",
                         "10.64.90.116",
                         "10.69.161.137",
                         "10.69.161.21-10.69.161.26",
                         "10.64.90.122",
                         "10.64.90.114",
                         "10.64.90.119",
                         "10.64.90.124",
                         "10.69.161.138",
                         "10.64.90.123",
                         "10.69.161.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-AG1-IPSET-NET-HST--NA-Cloud"
   nsx_id = "TF-AG1-IPSET-NET-HST--NA-Cloud"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.124.0.128/26",
                         "158.87.36.0/25",
                         "158.87.36.128/25",
                         "169.254.36.0-169.254.36.127",
                         "169.254.36.128-169.254.36.255"
]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-AG1-IPSET-DR273-CPREM-JHOSTS"
   nsx_id = "TF-AG1-IPSET-DR273-CPREM-JHOSTS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "148.173.18.75",
                         "148.171.98.88"
]
      }
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwdb"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.217"
]
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-AG1-IPSET-STaaS-DR71-Storage--V7000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR71-Storage--V7000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.205.2.7-10.205.2.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-AG1-IPSET-DR273-ESG-vpn-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR273-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.4.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-AG1-IPSET-Host-agnsrlndvaapp01"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlndvaapp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.155"
]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-AG1-IPSET-DR12-CPREM-RPA1"
   nsx_id = "TF-AG1-IPSET-DR12-CPREM-RPA1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.115.103.223"
]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-AG1-IPSET-STaaS-DR11-Storage--V5000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR11-Storage--V5000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.10.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-AG1-IPSET-DR273-CPREM-DATAMART"
   nsx_id = "TF-AG1-IPSET-DR273-CPREM-DATAMART"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "148.171.97.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-AG1-IPSET-SLDalImpactNode"
   nsx_id = "TF-AG1-IPSET-SLDalImpactNode"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.53.35.217",
                         "169.53.35.218"
]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-AG1-IPSET-DR273-ESG-dlr-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR273-ESG-dlr-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.4.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-AG1-IPSET-HWSW-GACDW-AP--DB"
   nsx_id = "TF-AG1-IPSET-HWSW-GACDW-AP--DB"
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
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-AG1-IPSET-eu1srlPsat2"
   nsx_id = "TF-AG1-IPSET-eu1srlPsat2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.79"
]
      }
   }
}
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1sltestvm"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1sltestvm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-AG1-IPSET-DR273-CPREM-MBUSPROBES"
   nsx_id = "TF-AG1-IPSET-DR273-CPREM-MBUSPROBES"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "148.171.96.24",
                         "148.171.96.25",
                         "148.173.18.72",
                         "148.173.18.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-AG1-IPSET-STaaS-DR144-V7k"
   nsx_id = "TF-AG1-IPSET-STaaS-DR144-V7k"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.101.240.20-10.101.240.22",
                         "10.101.240.30-10.101.240.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-AG1-IPSET-eu1srwpgacdwdsc"
   nsx_id = "TF-AG1-IPSET-eu1srwpgacdwdsc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.219"
]
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwwas2"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwwas2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.181"
]
      }
   }
}
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-AG1-IPSET-SRES-ag1srlphwcsss01"
   nsx_id = "TF-AG1-IPSET-SRES-ag1srlphwcsss01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.163"
]
      }
   }
}
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-AG1-IPSET-DR273-ESG-agg-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR273-ESG-agg-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-AG1-IPSET-DR285-CPREM-VRA"
   nsx_id = "TF-AG1-IPSET-DR285-CPREM-VRA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "207.131.204.99",
                         "207.131.204.93",
                         "207.131.204.92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-AG1-IPSET-DRES299-CP-JH"
   nsx_id = "TF-AG1-IPSET-DRES299-CP-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.212.241.2",
                         "167.212.240.2",
                         "167.212.242.1",
                         "167.212.240.1",
                         "167.212.242.2",
                         "167.212.241.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-AG1-IPSET-CPREM-MSSGDC"
   nsx_id = "TF-AG1-IPSET-CPREM-MSSGDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "149.131.76.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwCognos1"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwCognos1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.188"
]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-AG1-IPSET-DR204--Proxy--VIP"
   nsx_id = "TF-AG1-IPSET-DR204--Proxy--VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.176.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-AG1-IPSET-eu1srlpgacdwCognos2"
   nsx_id = "TF-AG1-IPSET-eu1srlpgacdwCognos2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.189"
]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1win19test"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1win19test"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-AG1-IPSET-DR12-ESG-vpn-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR12-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.241",
                         "100.64.0.66"
]
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-AG1-IPSET-Host-sldalnoidb02"
   nsx_id = "TF-AG1-IPSET-Host-sldalnoidb02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.254.114"
]
      }
   }
}
