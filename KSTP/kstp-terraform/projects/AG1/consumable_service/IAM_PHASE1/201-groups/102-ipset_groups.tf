#####################################
# IPSETs GROUPS
#
# Migration date: 04/20/2023 08:46
# Geography.....: AG1 
# Wave..........: IAM_PHASE1
#####################################
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-Host-agnsrlnetocddb"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlnetocddb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Storage-V5000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Storage-V5000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.64.90.117",
                         "10.64.90.123",
                         "10.64.90.116",
                         "10.69.161.21-10.69.161.26",
                         "10.64.90.124",
                         "10.64.90.115",
                         "10.69.161.138",
                         "10.64.90.122",
                         "10.64.90.118",
                         "10.69.161.136",
                         "10.69.161.137",
                         "10.64.90.114",
                         "10.64.90.119"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AG1-IPSET-CISO-TOOLS-AWS"
   nsx_id = "TF-AG1-IPSET-CISO-TOOLS-AWS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.18.21",
                         "158.87.18.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AG1-IPSET-DR12-LB-VIP3-NAT"
   nsx_id = "TF-AG1-IPSET-DR12-LB-VIP3-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.77.244"
]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-AG1-IPSET-HWSW-GACDW-AP-DB"
   nsx_id = "TF-AG1-IPSET-HWSW-GACDW-AP-DB"
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
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-AG1-IPSET-IP-ag1nsxtvrops01"
   nsx_id = "TF-AG1-IPSET-IP-ag1nsxtvrops01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-AG1-IPSET-Eastern-Creek-DC"
   nsx_id = "TF-AG1-IPSET-Eastern-Creek-DC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.102.4",
                         "129.39.102.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-AG1-IPSET-IP-test-sciencelogic-db"
   nsx_id = "TF-AG1-IPSET-IP-test-sciencelogic-db"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.194",
                         "158.87.159.66"
]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1sepm1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1sepm1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wsus01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wsus01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.144"
]
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-AG1-IPSET-Host-driamaas2-Subnet"
   nsx_id = "TF-AG1-IPSET-Host-driamaas2-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.130.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpetocwas1011"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpetocwas1011"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpcactest"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpcactest"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.234"
]
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-AG1-IPSET-Host-ag1srwpetpp1000"
   nsx_id = "TF-AG1-IPSET-Host-ag1srwpetpp1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-AG1-IPSET-NET-HST-NA-Cloud"
   nsx_id = "TF-AG1-IPSET-NET-HST-NA-Cloud"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.254.36.0-169.254.36.127",
                         "169.254.36.128-169.254.36.255",
                         "100.124.0.128/26",
                         "158.87.36.0/25",
                         "158.87.36.128/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-AG1-IPSET-vpc-10-dx-platform-prod1"
   nsx_id = "TF-AG1-IPSET-vpc-10-dx-platform-prod1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.71.4",
                         "158.87.51.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpdvadb01"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpdvadb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.148"
]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-AG1-IPSET-Host-ag1srwpetpd1000"
   nsx_id = "TF-AG1-IPSET-Host-ag1srwpetpd1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.228"
]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpdvaapp01"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpdvaapp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.147"
]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1daipwin01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1daipwin01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-AG1-IPSET-Host-agnsrlnetocdwas"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlnetocdwas"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1w19lic01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1w19lic01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.161"
]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-AG1-IPSET-M-E-Lab-COFCA"
   nsx_id = "TF-AG1-IPSET-M-E-Lab-COFCA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.39",
                         "158.87.159.112",
                         "158.87.159.92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1rhellic01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1rhellic01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.100"
]
      }
   }
}
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-AG1-IPSET-IP-IN-AIOPS"
   nsx_id = "TF-AG1-IPSET-IP-IN-AIOPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.126.132.5",
                         "100.126.133.0/27",
                         "158.87.61.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-AG1-IPSET-DR204-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR204-Proxy-VIP"
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
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpdvaweb01"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpdvaweb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-AG1-IPSET-eu1sr1wphwcetl-"
   nsx_id = "TF-AG1-IPSET-eu1sr1wphwcetl-"
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
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-AG1-IPSET-DOW-customer-Solarwinds-CNICC"
   nsx_id = "TF-AG1-IPSET-DOW-customer-Solarwinds-CNICC"
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
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1ljmp01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1ljmp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-AG1-IPSET-Host-ag1srlnetocwas1021"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlnetocwas1021"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-AG1-IPSET-US-ONLY-GRF-DATABASE"
   nsx_id = "TF-AG1-IPSET-US-ONLY-GRF-DATABASE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.209",
                         "169.44.83.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-AG1-IPSET-ag1sr1cntrl1"
   nsx_id = "TF-AG1-IPSET-ag1sr1cntrl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-AG1-IPSET-Host-NET-SRES-APP"
   nsx_id = "TF-AG1-IPSET-Host-NET-SRES-APP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.0/23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-AG1-IPSET-meaas-noi-inn6y-nco-"
   nsx_id = "TF-AG1-IPSET-meaas-noi-inn6y-nco-"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.210"
]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-AG1-IPSET-STaaS-DR11-Storage-V5000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR11-Storage-V5000"
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
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-AG1-IPSET-KSTP-IN-IP-HWSW"
   nsx_id = "TF-AG1-IPSET-KSTP-IN-IP-HWSW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.21-158.87.61.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-AG1-IPSET-DR204-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR204-CPREM-JH"
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
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1daipwin02"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1daipwin02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-AG1-IPSET-Azure-Infra-VNET"
   nsx_id = "TF-AG1-IPSET-Azure-Infra-VNET"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.86.7.213"
]
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-AG1-IPSET-IP-sldb01"
   nsx_id = "TF-AG1-IPSET-IP-sldb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.117",
                         "10.175.14.245"
]
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-AG1-IPSET-ARMS-CC-SYNC-SERVER"
   nsx_id = "TF-AG1-IPSET-ARMS-CC-SYNC-SERVER"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.210",
                         "158.87.52.72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-AG1-IPSET-NET-ZCLOUD-DAL"
   nsx_id = "TF-AG1-IPSET-NET-ZCLOUD-DAL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.41.43.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1dajh01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1dajh01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-AG1-IPSET-Host-driamaasthy-Subnet"
   nsx_id = "TF-AG1-IPSET-Host-driamaasthy-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.128.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-AG1-IPSET-Host-pdr-esg01-lb-vip-7"
   nsx_id = "TF-AG1-IPSET-Host-pdr-esg01-lb-vip-7"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "150.239.66.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-AG1-IPSET-DR12-LB-VIP2-NAT"
   nsx_id = "TF-AG1-IPSET-DR12-LB-VIP2-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.77.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-AG1-IPSET-Brazil-Shared-Netcool-GSMAListener"
   nsx_id = "TF-AG1-IPSET-Brazil-Shared-Netcool-GSMAListener"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.84.140",
                         "158.87.85.167",
                         "158.87.84.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-AG1-IPSET-STaaS-DR71-Storage-V7000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR71-Storage-V7000"
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
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-AG1-IPSET-Host-PDR-Subnet"
   nsx_id = "TF-AG1-IPSET-Host-PDR-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.69.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-AG1-IPSET-icd-was-us-gtsaas-softlayer"
   nsx_id = "TF-AG1-IPSET-icd-was-us-gtsaas-softlayer"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.34.210.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpetocdb1011"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpetocdb1011"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-AG1-IPSET-NET-ZCLOUD-RTP"
   nsx_id = "TF-AG1-IPSET-NET-ZCLOUD-RTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.21.0/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-AG1-IPSET-NET-ZCLOUD-ASH"
   nsx_id = "TF-AG1-IPSET-NET-ZCLOUD-ASH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.41.51.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-AG1-IPSET-Brazil-Shared-Netcool-MessageBus"
   nsx_id = "TF-AG1-IPSET-Brazil-Shared-Netcool-MessageBus"
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
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-AG1-IPSET-Host-ag1srlnetocdb1021"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlnetocdb1021"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-AG1-IPSET-NET-ZCLOUD-POK"
   nsx_id = "TF-AG1-IPSET-NET-ZCLOUD-POK"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.31.224/28",
                         "129.39.31.192/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1ljmp01n"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1ljmp01n"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.174"
]
      }
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-AG1-IPSET-M-E-Lab-10_175_14_129"
   nsx_id = "TF-AG1-IPSET-M-E-Lab-10_175_14_129"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.129"
]
      }
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1sql01"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1sql01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-AG1-IPSET-Host-ag1srapjfwkalif2"
   nsx_id = "TF-AG1-IPSET-Host-ag1srapjfwkalif2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-AG1-IPSET-azure-infra-res-vnet"
   nsx_id = "TF-AG1-IPSET-azure-infra-res-vnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.86.8.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1dajh02"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1dajh02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-AG1-IPSET-UAT-LA"
   nsx_id = "TF-AG1-IPSET-UAT-LA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.94",
                         "158.87.106.78",
                         "158.87.106.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-AG1-IPSET-DR12-LB-VIP1-NAT"
   nsx_id = "TF-AG1-IPSET-DR12-LB-VIP1-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.77.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-AG1-IPSET-Host-agnsrlnmnepen1"
   nsx_id = "TF-AG1-IPSET-Host-agnsrlnmnepen1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-AG1-IPSET-NET-ZCLOUD-BLD"
   nsx_id = "TF-AG1-IPSET-NET-ZCLOUD-BLD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.172.0/25"
]
      }
   }
}
