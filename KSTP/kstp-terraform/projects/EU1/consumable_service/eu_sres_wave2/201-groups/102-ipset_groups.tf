#####################################
# IPSETs GROUPS
#
# Migration date: 05/16/2023 13:49
# Geography.....: EU1 
# Wave..........: eu_sres_wave2
#####################################
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-EU1-IPSET-HRES-eu1hr1lpcacfbds"
   nsx_id = "TF-EU1-IPSET-HRES-eu1hr1lpcacfbds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-EU1-IPSET-NET-DR276-ESG-VPN-transit1"
   nsx_id = "TF-EU1-IPSET-NET-DR276-ESG-VPN-transit1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.11.81"
]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-PROD-ALL"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-PROD-ALL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.138",
                         "172.16.0.132",
                         "172.16.0.130",
                         "172.16.0.134",
                         "172.16.0.136",
                         "172.16.0.131",
                         "172.16.0.140",
                         "172.16.0.129",
                         "172.16.0.139",
                         "172.16.0.133",
                         "172.16.0.135",
                         "172.16.0.137"
]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-BDS"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-BDS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-STL"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-STL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.197"
]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-EU1-IPSET-DR276-LB-VIP2"
   nsx_id = "TF-EU1-IPSET-DR276-LB-VIP2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.175.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-EU1-IPSET-Kyndryl-DNS"
   nsx_id = "TF-EU1-IPSET-Kyndryl-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.1.31",
                         "130.103.1.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-EU1-IPSET-DR309-ESG-vNic_1"
   nsx_id = "TF-EU1-IPSET-DR309-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.13.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-EU1-IPSET-DR309-CPREM-SL1-COLLECTOR"
   nsx_id = "TF-EU1-IPSET-DR309-CPREM-SL1-COLLECTOR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.20.40.210/32",
                         "172.20.40.212/32",
                         "172.20.40.211/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpta2ssh2"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpta2ssh2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpgsntnp1"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpgsntnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.19"
]
      }
   }
}
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpta3ssh2"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpta3ssh2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-EU1-IPSET-DR34-LB-VIP2-NAT"
   nsx_id = "TF-EU1-IPSET-DR34-LB-VIP2-NAT"
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
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-PROD-BDS"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-PROD-BDS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-ARX"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-ARX"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.196"
]
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-EU1-IPSET-DRES296-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES296-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.208.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-EU1-IPSET-DR209-CPREM-SL1-COLLECTOR"
   nsx_id = "TF-EU1-IPSET-DR209-CPREM-SL1-COLLECTOR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.13.66.97",
                         "10.215.139.197"
]
      }
   }
}
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-EU1-IPSET-DR309-LB-VIP1"
   nsx_id = "TF-EU1-IPSET-DR309-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.229.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpta2hap2"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpta2hap2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-PROD-AD"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-PROD-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.1",
                         "172.16.0.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-ARX"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-ARX"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.68"
]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpta1hap1"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpta1hap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-EU1-IPSET-DR310-CPREM-SL1-COLLECTOR"
   nsx_id = "TF-EU1-IPSET-DR310-CPREM-SL1-COLLECTOR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.29.11.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-EU1-IPSET-DR306-CPREM-SL1-COLLECTOR"
   nsx_id = "TF-EU1-IPSET-DR306-CPREM-SL1-COLLECTOR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.11.4.128-10.11.4.130",
                         "10.11.68.96-10.11.68.98"
]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-EU1-IPSET-10-148-42-0-24"
   nsx_id = "TF-EU1-IPSET-10-148-42-0-24"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.148.42.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-EU1-IPSET-DR309-LB-VIP1-NAT"
   nsx_id = "TF-EU1-IPSET-DR309-LB-VIP1-NAT"
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
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpta1hap2"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpta1hap2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-EU1-IPSET-DR276-LB-VIP3-NAT"
   nsx_id = "TF-EU1-IPSET-DR276-LB-VIP3-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-EU1-IPSET-DR34-CPREM-CACF"
   nsx_id = "TF-EU1-IPSET-DR34-CPREM-CACF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "22.17.163.232",
                         "22.17.163.233"
]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlPsat4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlPsat4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.86"
]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-EU1-IPSET-DR310-ESG-vNic_1"
   nsx_id = "TF-EU1-IPSET-DR310-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.13.34"
]
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-AD"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.194",
                         "172.16.0.193"
]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-EU1-IPSET-DRES306-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES306-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.226.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-PROD-JH"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-PROD-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.138",
                         "172.16.0.139"
]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-EU1-IPSET-10-20-42-0-24"
   nsx_id = "TF-EU1-IPSET-10-20-42-0-24"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.20.42.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-EU1-IPSET-DR276-CPREM-NETCOOL-PROBES"
   nsx_id = "TF-EU1-IPSET-DR276-CPREM-NETCOOL-PROBES"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.133",
                         "172.16.0.197",
                         "172.16.0.69",
                         "172.16.0.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-PROD-ARX"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-PROD-ARX"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-BDS"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-BDS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-EU1-IPSET-IN1-in1sr1lpta1vip1"
   nsx_id = "TF-EU1-IPSET-IN1-in1sr1lpta1vip1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-EU1-IPSET-DR310-LB-VIP1"
   nsx_id = "TF-EU1-IPSET-DR310-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.231.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-EU1-IPSET-DR306-ESG-vNic_2"
   nsx_id = "TF-EU1-IPSET-DR306-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.13.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-EU1-IPSET-DR276-LB-VIP4-NAT"
   nsx_id = "TF-EU1-IPSET-DR276-LB-VIP4-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.244"
]
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-ALL"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-ALL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.197",
                         "172.16.0.193",
                         "172.16.0.201",
                         "172.16.0.194",
                         "172.16.0.195",
                         "172.16.0.199",
                         "172.16.0.198",
                         "172.16.0.200",
                         "172.16.0.202",
                         "172.16.0.204",
                         "172.16.0.196",
                         "172.16.0.203"
]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpta3ssh1"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpta3ssh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-PROD-BDS"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-PROD-BDS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.137"
]
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-EU1-IPSET-AG1-SRES-IAM-THY-PROXY-PROD"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-IAM-THY-PROXY-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.115"
]
      }
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-EU1-IPSET-SRES-SOSM21SNI-sni-ch-ibm-com"
   nsx_id = "TF-EU1-IPSET-SRES-SOSM21SNI-sni-ch-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "193.41.104.147"
]
      }
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-EU1-IPSET-DR276-LB-VIP5"
   nsx_id = "TF-EU1-IPSET-DR276-LB-VIP5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.175.245"
]
      }
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-EU1-IPSET-DR306-ESG-vNic_0"
   nsx_id = "TF-EU1-IPSET-DR306-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.64.211"
]
      }
   }
}
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-EU1-IPSET-DR276-LB-VIP5-NAT"
   nsx_id = "TF-EU1-IPSET-DR276-LB-VIP5-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.245"
]
      }
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-EU1-IPSET-Tanzu-Workload-03-Subnet"
   nsx_id = "TF-EU1-IPSET-Tanzu-Workload-03-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.135",
                         "100.79.242.64/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-PROD-AD"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-PROD-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.130",
                         "172.16.0.129"
]
      }
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpta1ssh1"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpta1ssh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-EU1-IPSET-AG1-SRES-OCP-Cluster06-VIP"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-OCP-Cluster06-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-STL"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-STL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.69"
]
      }
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-EU1-IPSET-MnEaaS-Event-Bisync-VIP-RITM0138533"
   nsx_id = "TF-EU1-IPSET-MnEaaS-Event-Bisync-VIP-RITM0138533"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.213",
                         "158.87.53.197",
                         "100.72.142.20",
                         "158.87.52.9",
                         "158.87.53.192",
                         "100.73.84.14",
                         "158.87.53.39",
                         "100.73.112.14",
                         "158.87.53.45",
                         "100.72.222.38",
                         "100.73.182.18",
                         "100.73.160.34",
                         "100.72.164.12",
                         "100.72.168.25",
                         "158.87.53.176",
                         "100.73.52.12",
                         "100.72.84.36",
                         "158.87.52.21",
                         "100.73.92.27",
                         "158.87.52.219",
                         "158.87.52.204",
                         "100.72.218.12",
                         "100.73.0.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-EU1-IPSET-DR276-LB-VIP4"
   nsx_id = "TF-EU1-IPSET-DR276-LB-VIP4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.175.244"
]
      }
   }
}
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-EU1-IPSET-SWIT-Gateway-zw2uspriv-app-kyndryl-net"
   nsx_id = "TF-EU1-IPSET-SWIT-Gateway-zw2uspriv-app-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.238.17",
                         "138.95.238.16",
                         "138.95.238.15",
                         "138.95.238.12",
                         "138.95.238.13",
                         "138.95.238.9",
                         "138.95.238.18",
                         "138.95.238.14",
                         "138.95.238.11",
                         "138.95.238.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-EU1-IPSET-SRES-eu1srwpmcmsOlk"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srwpmcmsOlk"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.232"
]
      }
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpta1ssh2"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpta1ssh2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-EU1-IPSET-DR306-ESG-vNic_1"
   nsx_id = "TF-EU1-IPSET-DR306-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.13.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-EU1-IPSET-10-20-43-0-24"
   nsx_id = "TF-EU1-IPSET-10-20-43-0-24"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.20.43.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-EU1-IPSET-DR306-LB-VIP1"
   nsx_id = "TF-EU1-IPSET-DR306-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.227.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpans01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpans01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.75"
]
      }
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-EU1-IPSET-DR309-ESG-vNic_0"
   nsx_id = "TF-EU1-IPSET-DR309-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.64.212"
]
      }
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-EU1-IPSET-DR306-CPREM-NETCOOL-PROBE"
   nsx_id = "TF-EU1-IPSET-DR306-CPREM-NETCOOL-PROBE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.11.4.131",
                         "10.11.68.99"
]
      }
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpgsntnp2"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpgsntnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-AD"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.66",
                         "172.16.0.65"
]
      }
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-PROD-STL"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-PROD-STL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-EU1-IPSET-DR276-LB-VIP2-NAT"
   nsx_id = "TF-EU1-IPSET-DR276-LB-VIP2-NAT"
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
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-EU1-IPSET-AP1-Netcool-Probe-IPs"
   nsx_id = "TF-EU1-IPSET-AP1-Netcool-Probe-IPs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.75",
                         "158.87.54.109",
                         "158.87.54.108",
                         "100.80.90.76"
]
      }
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-JH"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-NONPROD-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.203",
                         "172.16.0.202"
]
      }
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-EU1-IPSET-AG1-SRES-IAM-THY-RMQ-PROD"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-IAM-THY-RMQ-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.116"
]
      }
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-PROD-ARX"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-PROD-ARX"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-EU1-IPSET-DR34-LB-VIP2"
   nsx_id = "TF-EU1-IPSET-DR34-LB-VIP2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.119.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-EU1-IPSET-DR306-LB-VIP1-NAT"
   nsx_id = "TF-EU1-IPSET-DR306-LB-VIP1-NAT"
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
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-EU1-IPSET-DR310-LB-VIP1-NAT"
   nsx_id = "TF-EU1-IPSET-DR310-LB-VIP1-NAT"
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
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-EU1-IPSET-DR276-CLS-E-PROD-STL"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-E-PROD-STL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.133"
]
      }
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-EU1-IPSET-DR310-ESG-vNic_2"
   nsx_id = "TF-EU1-IPSET-DR310-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.13.41"
]
      }
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-EU1-IPSET-CISO-TOOLS-AWS"
   nsx_id = "TF-EU1-IPSET-CISO-TOOLS-AWS"
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
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-EU1-IPSET-DR309-ESG-vNic_2"
   nsx_id = "TF-EU1-IPSET-DR309-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.13.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-JH"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.74",
                         "172.16.0.75"
]
      }
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-PROD-JH"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-PROD-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.12",
                         "172.16.0.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-EU1-IPSET-DRES305-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES305-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.222.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-EU1-IPSET-AVI-HRES-SEs"
   nsx_id = "TF-EU1-IPSET-AVI-HRES-SEs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.250",
                         "100.79.240.251"
]
      }
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpta2hap1"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpta2hap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-EU1-IPSET-HRES-eu1hr1lpcacfovpn"
   nsx_id = "TF-EU1-IPSET-HRES-eu1hr1lpcacfovpn"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-EU1-IPSET-AG1-SRES-ag1sr1wpiamprra"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-ag1sr1wpiamprra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-EU1-IPSET-DR276-LB-VIP3"
   nsx_id = "TF-EU1-IPSET-DR276-LB-VIP3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.175.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-EU1-IPSET-DR310-ESG-vNic_0"
   nsx_id = "TF-EU1-IPSET-DR310-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.64.213"
]
      }
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-EU1-IPSET-HRES-eu1h1lpta2ssh1"
   nsx_id = "TF-EU1-IPSET-HRES-eu1h1lpta2ssh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.240.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmcmssysl"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmcmssysl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.233"
]
      }
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-PROD-ALL"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-PROD-ALL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.5",
                         "172.16.0.13",
                         "172.16.0.9",
                         "172.16.0.2",
                         "172.16.0.1",
                         "172.16.0.10",
                         "172.16.0.8",
                         "172.16.0.7",
                         "172.16.0.14",
                         "172.16.0.6",
                         "172.16.0.12",
                         "172.16.0.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-EU1-IPSET-SRES-RITM0144686-VMs"
   nsx_id = "TF-EU1-IPSET-SRES-RITM0144686-VMs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.188",
                         "158.87.53.219",
                         "158.87.52.180",
                         "158.87.52.181",
                         "158.87.52.176",
                         "158.87.52.232",
                         "158.87.52.177",
                         "158.87.52.185",
                         "158.87.52.171",
                         "158.87.52.187",
                         "158.87.52.166",
                         "158.87.52.173",
                         "158.87.52.172",
                         "158.87.52.178",
                         "158.87.52.203",
                         "158.87.52.179",
                         "158.87.52.186",
                         "158.87.52.183",
                         "158.87.52.184"
]
      }
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlPsat3"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlPsat3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.87"
]
      }
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-ALL"
   nsx_id = "TF-EU1-IPSET-DR276-CLS-D-NONPROD-ALL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.0.71",
                         "172.16.0.75",
                         "172.16.0.67",
                         "172.16.0.70",
                         "172.16.0.69",
                         "172.16.0.68",
                         "172.16.0.74",
                         "172.16.0.73",
                         "172.16.0.65",
                         "172.16.0.72",
                         "172.16.0.66"
]
      }
   }
}
