#####################################
# IPSETs GROUPS
#
# Migration date: 04/17/2023 19:16
# Geography.....: EU1 
# Wave..........: EU1-HRES-wave2
#####################################
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-EU1-IPSET-DRES297-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES297-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.210.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1epnp4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1epnp4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.161"
]
      }
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpbzprod2"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpbzprod2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-EU1-IPSET-RITM0134127"
   nsx_id = "TF-EU1-IPSET-RITM0134127"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.137.105",
                         "158.98.137.109",
                         "158.98.137.108"
]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-79-236-142"
   nsx_id = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-79-236-142"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.130.164",
                         "100.79.236.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lnbzztest"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lnbzztest"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-EU1-IPSET-AG1-US-ONLY-GRF-DATABASE"
   nsx_id = "TF-EU1-IPSET-AG1-US-ONLY-GRF-DATABASE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.209"
]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-EU1-IPSET-AG1-HRES-ag1h1lpta1ssh1"
   nsx_id = "TF-EU1-IPSET-AG1-HRES-ag1h1lpta1ssh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-EU1-IPSET-DA-JP-XBX-jp01dsl01drslr4-158-87-222-209"
   nsx_id = "TF-EU1-IPSET-DA-JP-XBX-jp01dsl01drslr4-158-87-222-209"
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
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-EU1-IPSET-DA-JP-KOB-DA-JH-PROD-158-98-21-124"
   nsx_id = "TF-EU1-IPSET-DA-JP-KOB-DA-JH-PROD-158-98-21-124"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.21.124"
]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.50",
                         "158.87.53.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-EU1-IPSET-India-Payroll-zw2uspriv-app-kyndryl-net"
   nsx_id = "TF-EU1-IPSET-India-Payroll-zw2uspriv-app-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.238.20-138.95.238.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-EU1-IPSET-IN1-SRES-in1sr1wpgrfdb"
   nsx_id = "TF-EU1-IPSET-IN1-SRES-in1sr1wpgrfdb"
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
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1dxdev02"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1dxdev02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-EU1-IPSET-IN1-dp-elastic-in1-prod-int-kyndryl-net"
   nsx_id = "TF-EU1-IPSET-IN1-dp-elastic-in1-prod-int-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-EU1-IPSET-DRES298-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES298-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.212.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcarwas1000"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcarwas1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.252"
]
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-EU1-IPSET-gb46pdn01ir01fm-fab-esni-ibm-com"
   nsx_id = "TF-EU1-IPSET-gb46pdn01ir01fm-fab-esni-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.66.76"
]
      }
   }
}
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlphcs0001"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlphcs0001"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-EU1-IPSET-DA-GSNI-BDS-Clients"
   nsx_id = "TF-EU1-IPSET-DA-GSNI-BDS-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.71.166-158.98.71.167",
                         "100.79.236.119-100.79.236.124",
                         "195.75.20.44-195.75.20.45",
                         "129.39.157.230-129.39.157.231",
                         "195.183.78.74-195.183.78.75"
]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpcardb1000"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpcardb1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.253"
]
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-EU1-IPSET-DA-IPC-prodnljh02-146-89-167-216"
   nsx_id = "TF-EU1-IPSET-DA-IPC-prodnljh02-146-89-167-216"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.167.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-EU1-IPSET-DA-F2M-ilp-j124-146-192-227-176"
   nsx_id = "TF-EU1-IPSET-DA-F2M-ilp-j124-146-192-227-176"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.192.227.176"
]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-EU1-IPSET-CDI-GTSCDI-EU-Proxy01-02"
   nsx_id = "TF-EU1-IPSET-CDI-GTSCDI-EU-Proxy01-02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.76",
                         "146.89.187.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-EU1-IPSET-soapp22sil-sni-ch-ibm-com-9-159-217-155"
   nsx_id = "TF-EU1-IPSET-soapp22sil-sni-ch-ibm-com-9-159-217-155"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.159.217.155"
]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-EU1-IPSET-HRES-eu1hr1lpcacfbds-VIP"
   nsx_id = "TF-EU1-IPSET-HRES-eu1hr1lpcacfbds-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.57.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-EU1-IPSET-AG1-SRES-produsgrfdb01-usat01-com"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-produsgrfdb01-usat01-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-EU1-IPSET-SRES-eu1rhellic01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1rhellic01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.110"
]
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-79-236-146"
   nsx_id = "TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-79-236-146"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.98.240",
                         "100.79.236.146"
]
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-EU1-IPSET-AG1-SG-SRES-OCP-Cluster07-VIP"
   nsx_id = "TF-EU1-IPSET-AG1-SG-SRES-OCP-Cluster07-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.8",
                         "158.87.50.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-EU1-IPSET-SG-SRES-GACDW-PROD"
   nsx_id = "TF-EU1-IPSET-SG-SRES-GACDW-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.181",
                         "158.87.53.218",
                         "158.87.53.82",
                         "158.87.53.239",
                         "158.87.53.220",
                         "158.87.53.238",
                         "158.87.53.219",
                         "158.87.53.188-158.87.53.189",
                         "158.87.53.217"
]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1pcacfgit1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1pcacfgit1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.251"
]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp4"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpm1ecnp4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.163"
]
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-EU1-IPSET-DA-BVM-lvpapdynautmx02-150-100-195-164"
   nsx_id = "TF-EU1-IPSET-DA-BVM-lvpapdynautmx02-150-100-195-164"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "150.100.195.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-EU1-IPSET-DA-F2W-ilp-j128-146-192-227-86"
   nsx_id = "TF-EU1-IPSET-DA-F2W-ilp-j128-146-192-227-86"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.192.227.86"
]
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-EU1-IPSET-DRES301-CACF-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DRES301-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.216.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1lpbzzprod"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1lpbzzprod"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpgsenexgen"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpgsenexgen"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-EU1-IPSET-BLUEIDP1-zw2uspriv-app-kyndryl-net"
   nsx_id = "TF-EU1-IPSET-BLUEIDP1-zw2uspriv-app-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.238.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-EU1-IPSET-DA-F2M-ilp-j123-146-192-227-175"
   nsx_id = "TF-EU1-IPSET-DA-F2M-ilp-j123-146-192-227-175"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.192.227.175"
]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpmsatcld1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpmsatcld1"
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
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-EU1-IPSET-AP1-SRES-POC"
   nsx_id = "TF-EU1-IPSET-AP1-SRES-POC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.236"
]
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-EU1-IPSET-SL-IRES-MnEaaS-Dynatrace-Monitoring"
   nsx_id = "TF-EU1-IPSET-SL-IRES-MnEaaS-Dynatrace-Monitoring"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.137.124",
                         "10.175.137.67",
                         "10.175.137.115",
                         "10.175.137.74",
                         "10.175.137.93",
                         "10.175.137.66",
                         "10.175.137.68",
                         "10.175.137.79",
                         "10.175.137.117"
]
      }
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-EU1-IPSET-DA-F2W-ilp-j127-146-192-227-85"
   nsx_id = "TF-EU1-IPSET-DA-F2W-ilp-j127-146-192-227-85"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.192.227.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-EU1-IPSET-SRES-eu1sr1cntrl1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1sr1cntrl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-EU1-IPSET-AG1-DR12-LB-VIPs-NAT"
   nsx_id = "TF-EU1-IPSET-AG1-DR12-LB-VIPs-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.243",
                         "158.87.104.244",
                         "158.87.104.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-EU1-IPSET-RPA-AOCC-iaplfra6aocc007-8-9"
   nsx_id = "TF-EU1-IPSET-RPA-AOCC-iaplfra6aocc007-8-9"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "161.156.190.82",
                         "161.156.190.83",
                         "161.156.190.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-EU1-IPSET-M-EaaS-Proxy-100-72-69-4"
   nsx_id = "TF-EU1-IPSET-M-EaaS-Proxy-100-72-69-4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.69.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpgse1000"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpgse1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-EU1-IPSET-gb46pdn02ir01fm-fab-esni-ibm-com"
   nsx_id = "TF-EU1-IPSET-gb46pdn02ir01fm-fab-esni-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.66.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpgsenb01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpgsenb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.244"
]
      }
   }
}
