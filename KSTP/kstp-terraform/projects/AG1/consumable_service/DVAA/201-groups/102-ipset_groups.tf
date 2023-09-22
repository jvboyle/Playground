#####################################
# IPSETs GROUPS
#
# Migration date: 03/22/2023 16:07
# Geography.....: AG1 
# Wave..........: DVAA
#####################################
resource "nsxt_policy_group" "grp_809" {
   display_name = "TF-AG1-IPSET-ag1pdr1smtp01-IRES-NAT"
   nsx_id = "TF-AG1-IPSET-ag1pdr1smtp01-IRES-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.167"
]
      }
   }
}
resource "nsxt_policy_group" "grp_810" {
   display_name = "TF-AG1-IPSET-DR201-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR201-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.172.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_811" {
   display_name = "TF-AG1-IPSET-STaaS-DR234-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR234-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.238.44.11",
                         "10.214.1.18",
                         "10.214.1.17",
                         "10.100.19.106",
                         "10.100.19.105",
                         "10.238.44.9",
                         "10.101.69.62",
                         "10.214.1.21",
                         "10.238.44.8",
                         "10.101.69.63",
                         "10.238.44.10",
                         "10.238.44.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_812" {
   display_name = "TF-AG1-IPSET-driamaasthy-Customer1-UNIX-EP"
   nsx_id = "TF-AG1-IPSET-driamaasthy-Customer1-UNIX-EP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.186.25.150"
]
      }
   }
}
resource "nsxt_policy_group" "grp_813" {
   display_name = "TF-AG1-IPSET-STaaS-DR100-Storage-NetApp"
   nsx_id = "TF-AG1-IPSET-STaaS-DR100-Storage-NetApp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.117.46.193-167.117.46.253",
                         "167.117.46.184-167.117.46.192",
                         "167.117.46.232-167.117.46.234"
]
      }
   }
}
resource "nsxt_policy_group" "grp_814" {
   display_name = "TF-AG1-IPSET-ag1nsxt-vc"
   nsx_id = "TF-AG1-IPSET-ag1nsxt-vc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.196"
]
      }
   }
}
resource "nsxt_policy_group" "grp_815" {
   display_name = "TF-AG1-IPSET-NET-DR47-10-190-20-128-26"
   nsx_id = "TF-AG1-IPSET-NET-DR47-10-190-20-128-26"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.190.20.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_816" {
   display_name = "TF-AG1-IPSET-DR112-Cprem-serviceit"
   nsx_id = "TF-AG1-IPSET-DR112-Cprem-serviceit"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.29.3.58"
]
      }
   }
}
resource "nsxt_policy_group" "grp_817" {
   display_name = "TF-AG1-IPSET-NAT-DRES256-CACF-Proxy"
   nsx_id = "TF-AG1-IPSET-NAT-DRES256-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.51",
                         "158.87.104.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_818" {
   display_name = "TF-AG1-IPSET-IBM-Blue-stutvs3a-de-ibm-com"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-stutvs3a-de-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.156.194.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_819" {
   display_name = "TF-AG1-IPSET-DR196-LB-VIP1-NAT"
   nsx_id = "TF-AG1-IPSET-DR196-LB-VIP1-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.254"
]
      }
   }
}
resource "nsxt_policy_group" "grp_820" {
   display_name = "TF-AG1-IPSET-PB-RPA-BP-3389"
   nsx_id = "TF-AG1-IPSET-PB-RPA-BP-3389"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "161.228.110.32",
                         "152.144.94.123"
]
      }
   }
}
resource "nsxt_policy_group" "grp_821" {
   display_name = "TF-AG1-IPSET-KSTPINDIA-GSNI"
   nsx_id = "TF-AG1-IPSET-KSTPINDIA-GSNI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_822" {
   display_name = "TF-AG1-IPSET-HWSW-EU-SRES-Servers"
   nsx_id = "TF-AG1-IPSET-HWSW-EU-SRES-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.65",
                         "158.87.52.151",
                         "158.87.52.153",
                         "158.87.52.152"
]
      }
   }
}
resource "nsxt_policy_group" "grp_823" {
   display_name = "TF-AG1-IPSET-HRES-HTTP-IN-VIP"
   nsx_id = "TF-AG1-IPSET-HRES-HTTP-IN-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_824" {
   display_name = "TF-AG1-IPSET-sanitarium-mssgdc-net"
   nsx_id = "TF-AG1-IPSET-sanitarium-mssgdc-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "149.131.76.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_825" {
   display_name = "TF-AG1-IPSET-BLUE-uid-urtext-aix1"
   nsx_id = "TF-AG1-IPSET-BLUE-uid-urtext-aix1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.212.149.186"
]
      }
   }
}
resource "nsxt_policy_group" "grp_826" {
   display_name = "TF-AG1-IPSET-CDI-JP-ProxyVIP"
   nsx_id = "TF-AG1-IPSET-CDI-JP-ProxyVIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.221.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_827" {
   display_name = "TF-AG1-IPSET-DR196-ESG-VPN-transit1"
   nsx_id = "TF-AG1-IPSET-DR196-ESG-VPN-transit1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_828" {
   display_name = "TF-AG1-IPSET-ag1nsxm1"
   nsx_id = "TF-AG1-IPSET-ag1nsxm1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.135"
]
      }
   }
}
resource "nsxt_policy_group" "grp_829" {
   display_name = "TF-AG1-IPSET-SRES-DNS"
   nsx_id = "TF-AG1-IPSET-SRES-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.2",
                         "158.87.48.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_830" {
   display_name = "TF-AG1-IPSET-STaaS-DR100-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR100-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.19.240.69-172.19.240.71",
                         "167.117.43.171-167.117.43.178",
                         "167.117.46.184-167.117.46.197",
                         "172.19.240.44-172.19.240.49",
                         "10.8.192.10-10.8.192.18",
                         "167.117.46.238-167.117.46.242",
                         "167.117.46.34-167.117.46.45",
                         "167.117.46.138-167.117.46.139",
                         "167.117.43.249-167.117.43.252",
                         "167.117.43.129-167.117.43.161",
                         "167.117.46.52-167.117.46.99",
                         "172.16.29.44-172.16.29.49",
                         "172.27.93.57-172.27.93.59",
                         "10.8.183.1-10.8.183.254",
                         "167.117.46.202-167.117.46.231",
                         "167.117.43.183-167.117.43.248",
                         "167.117.46.100-167.117.46.183",
                         "167.117.46.232-167.117.46.234",
                         "167.117.46.1-167.117.46.33",
                         "172.22.220.57-172.22.220.59",
                         "172.16.29.95-172.16.29.97",
                         "172.27.93.50-172.27.93.52",
                         "167.117.43.162-167.117.43.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_831" {
   display_name = "TF-AG1-IPSET-NET-SL-Services"
   nsx_id = "TF-AG1-IPSET-NET-SL-Services"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.198.0.0/15",
                         "10.200.0.0/14",
                         "10.0.0.0/14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_832" {
   display_name = "TF-AG1-IPSET-DR162-LB-VIP1-NAT2"
   nsx_id = "TF-AG1-IPSET-DR162-LB-VIP1-NAT2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.103.43.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_833" {
   display_name = "TF-AG1-IPSET-NET-OpaaS-Subnet5"
   nsx_id = "TF-AG1-IPSET-NET-OpaaS-Subnet5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.55.192.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_834" {
   display_name = "TF-AG1-IPSET-Host-NAT-CVL-Customer-JH"
   nsx_id = "TF-AG1-IPSET-Host-NAT-CVL-Customer-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.51",
                         "158.87.104.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_835" {
   display_name = "TF-AG1-IPSET-EU-SRES-nexus"
   nsx_id = "TF-AG1-IPSET-EU-SRES-nexus"
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
resource "nsxt_policy_group" "grp_836" {
   display_name = "TF-AG1-IPSET-CDI-THCAAS-API-NA-UAT"
   nsx_id = "TF-AG1-IPSET-CDI-THCAAS-API-NA-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.58"
]
      }
   }
}
resource "nsxt_policy_group" "grp_837" {
   display_name = "TF-AG1-IPSET-M&E-Lab-COFCA"
   nsx_id = "TF-AG1-IPSET-M&E-Lab-COFCA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.112",
                         "158.87.159.92",
                         "158.87.159.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_838" {
   display_name = "TF-AG1-IPSET-SOTC-prod-was-secondary"
   nsx_id = "TF-AG1-IPSET-SOTC-prod-was-secondary"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.36.0/25",
                         "100.124.0.128/26",
                         "169.254.36.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_839" {
   display_name = "TF-AG1-IPSET-STaaS-DR237-Storage-A9000-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR237-Storage-A9000-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.43.100.52",
                         "10.34.100.52",
                         "10.34.100.51",
                         "10.34.100.50",
                         "10.43.100.51",
                         "10.43.100.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_840" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-60000"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-60000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.63.49.50",
                         "9.11.106.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_841" {
   display_name = "TF-AG1-IPSET-Science-Logic-SaaS-database"
   nsx_id = "TF-AG1-IPSET-Science-Logic-SaaS-database"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "18.214.212.110",
                         "52.204.139.0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_842" {
   display_name = "TF-AG1-IPSET-DR112-Cprem-nmfdcrweb008058"
   nsx_id = "TF-AG1-IPSET-DR112-Cprem-nmfdcrweb008058"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.29.8.58"
]
      }
   }
}
resource "nsxt_policy_group" "grp_843" {
   display_name = "TF-AG1-IPSET-DR40-CPREM-CTRL-M-P"
   nsx_id = "TF-AG1-IPSET-DR40-CPREM-CTRL-M-P"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.107.85.113",
                         "135.107.85.134",
                         "135.107.85.108"
]
      }
   }
}
resource "nsxt_policy_group" "grp_844" {
   display_name = "TF-AG1-IPSET-KSTPINDIA-CGN"
   nsx_id = "TF-AG1-IPSET-KSTPINDIA-CGN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.126.128.0/18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_845" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-SVG-PEN"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-SVG-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.7",
                         "158.87.49.14",
                         "158.87.49.15",
                         "158.87.49.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_846" {
   display_name = "TF-AG1-IPSET-STaaS-DR100-Storage-A9000-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR100-Storage-A9000-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.117.43.132-167.117.43.134",
                         "167.117.46.177-167.117.46.179",
                         "167.117.46.232-167.117.46.234",
                         "167.117.46.238-167.117.46.242",
                         "167.117.46.34-167.117.46.45",
                         "167.117.46.120-167.117.46.137",
                         "167.117.46.142-167.117.46.170",
                         "10.8.183.1-10.8.183.254",
                         "167.117.46.195-167.117.46.197",
                         "167.117.46.202-167.117.46.231",
                         "167.117.46.100-167.117.46.117",
                         "167.117.46.52-167.117.46.99"
]
      }
   }
}
resource "nsxt_policy_group" "grp_847" {
   display_name = "TF-AG1-IPSET-DRES-IPS"
   nsx_id = "TF-AG1-IPSET-DRES-IPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.186.51",
                         "100.64.164.51",
                         "100.64.122.51",
                         "100.64.118.52",
                         "100.64.190.51",
                         "100.64.162.51",
                         "100.64.184.51",
                         "100.64.198.51",
                         "100.64.154.52",
                         "100.64.160.51",
                         "100.64.188.51",
                         "100.64.192.51",
                         "100.64.118.51",
                         "100.64.154.51",
                         "100.64.132.52",
                         "100.64.108.52",
                         "100.64.174.52",
                         "100.64.160.52",
                         "100.64.172.52",
                         "100.64.184.52",
                         "100.64.162.52",
                         "100.64.122.52",
                         "100.64.192.52",
                         "100.64.164.52",
                         "100.64.174.51",
                         "100.64.186.52",
                         "100.64.180.51",
                         "100.64.198.52",
                         "100.64.190.52",
                         "100.64.108.51",
                         "100.64.132.51",
                         "100.64.180.52",
                         "100.64.188.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_848" {
   display_name = "TF-AG1-IPSET-SRES-LB-OCP-Cluster2-dummyVIP"
   nsx_id = "TF-AG1-IPSET-SRES-LB-OCP-Cluster2-dummyVIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.175"
]
      }
   }
}
resource "nsxt_policy_group" "grp_849" {
   display_name = "TF-AG1-IPSET-DR40-CPREM-ctmdbp11"
   nsx_id = "TF-AG1-IPSET-DR40-CPREM-ctmdbp11"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "163.241.195.197"
]
      }
   }
}
resource "nsxt_policy_group" "grp_850" {
   display_name = "TF-AG1-IPSET-SL-IRES-NSXM"
   nsx_id = "TF-AG1-IPSET-SL-IRES-NSXM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.135"
]
      }
   }
}
resource "nsxt_policy_group" "grp_851" {
   display_name = "TF-AG1-IPSET-Brazil-Shared-Netcool---MessageBus"
   nsx_id = "TF-AG1-IPSET-Brazil-Shared-Netcool---MessageBus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.84.142",
                         "158.87.84.143"
]
      }
   }
}
resource "nsxt_policy_group" "grp_852" {
   display_name = "TF-AG1-IPSET-DR158-CPREM-SOLARWINDS"
   nsx_id = "TF-AG1-IPSET-DR158-CPREM-SOLARWINDS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.116.62.6",
                         "10.116.16.5",
                         "10.116.62.8",
                         "10.116.62.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_853" {
   display_name = "TF-AG1-IPSET-CACF-azure-devlab-jumphost"
   nsx_id = "TF-AG1-IPSET-CACF-azure-devlab-jumphost"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.124.61.32/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_854" {
   display_name = "TF-AG1-IPSET-pdr-esg01-lb-vip-5"
   nsx_id = "TF-AG1-IPSET-pdr-esg01-lb-vip-5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.116.104.82"
]
      }
   }
}
resource "nsxt_policy_group" "grp_855" {
   display_name = "TF-AG1-IPSET-CNS-Dallas-1"
   nsx_id = "TF-AG1-IPSET-CNS-Dallas-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.244.227",
                         "169.62.244.226",
                         "169.62.244.225"
]
      }
   }
}
resource "nsxt_policy_group" "grp_856" {
   display_name = "TF-AG1-IPSET-SRES-IAM-CIO-RMQ-PROD-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-CIO-RMQ-PROD-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.205"
]
      }
   }
}
resource "nsxt_policy_group" "grp_857" {
   display_name = "TF-AG1-IPSET-ppyfragat0101"
   nsx_id = "TF-AG1-IPSET-ppyfragat0101"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.224.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_858" {
   display_name = "TF-AG1-IPSET-SRES-NA-GR-SharedNetcool2"
   nsx_id = "TF-AG1-IPSET-SRES-NA-GR-SharedNetcool2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.23.87"
]
      }
   }
}
resource "nsxt_policy_group" "grp_859" {
   display_name = "TF-AG1-IPSET-DR160-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR160-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "206.195.28.153",
                         "206.195.28.55",
                         "206.195.28.154",
                         "206.195.28.54",
                         "206.195.31.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_860" {
   display_name = "TF-AG1-IPSET-STaaS-DR100-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR100-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.117.46.193-167.117.46.194",
                         "167.117.43.171-167.117.43.178",
                         "167.117.43.194-167.117.43.238",
                         "167.117.46.180-167.117.46.181",
                         "167.117.46.138-167.117.46.139",
                         "10.8.183.1-10.8.183.254",
                         "167.117.43.249-167.117.43.252"
]
      }
   }
}
resource "nsxt_policy_group" "grp_861" {
   display_name = "TF-AG1-IPSET-DRES96-pl044rtms"
   nsx_id = "TF-AG1-IPSET-DRES96-pl044rtms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.12.44"
]
      }
   }
}
resource "nsxt_policy_group" "grp_862" {
   display_name = "TF-AG1-IPSET-DR96-CPREM-DR-172-22-26-68"
   nsx_id = "TF-AG1-IPSET-DR96-CPREM-DR-172-22-26-68"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.22.26.68"
]
      }
   }
}
resource "nsxt_policy_group" "grp_863" {
   display_name = "TF-AG1-IPSET-ag1sr1ljmp01-dnat"
   nsx_id = "TF-AG1-IPSET-ag1sr1ljmp01-dnat"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.161"
]
      }
   }
}
resource "nsxt_policy_group" "grp_864" {
   display_name = "TF-AG1-IPSET-SRES-THY-IGI-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-THY-IGI-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.255",
                         "158.87.48.15",
                         "158.87.48.25",
                         "158.87.48.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_865" {
   display_name = "TF-AG1-IPSET-DR40-CPREM-CTRL-M-D"
   nsx_id = "TF-AG1-IPSET-DR40-CPREM-CTRL-M-D"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.107.21.187",
                         "135.107.21.112",
                         "135.107.21.175"
]
      }
   }
}
resource "nsxt_policy_group" "grp_866" {
   display_name = "TF-AG1-IPSET-EU-SRES-execution_node"
   nsx_id = "TF-AG1-IPSET-EU-SRES-execution_node"
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
resource "nsxt_policy_group" "grp_867" {
   display_name = "TF-AG1-IPSET-DR40-CPREM-DR-Site-SR50657673"
   nsx_id = "TF-AG1-IPSET-DR40-CPREM-DR-Site-SR50657673"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.107.72.135",
                         "135.107.72.138",
                         "135.107.72.131",
                         "192.46.174.180",
                         "135.107.72.134",
                         "146.71.219.9",
                         "135.107.72.130",
                         "163.241.21.18",
                         "148.174.165.44",
                         "135.107.72.137",
                         "135.107.72.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_868" {
   display_name = "TF-AG1-IPSET-DR192-ESG-dlr-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR192-ESG-dlr-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_869" {
   display_name = "TF-AG1-IPSET-STaaS-DR74-Storage-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR74-Storage-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.20.11-192.168.20.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_870" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-RMQ-UAT-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-RMQ-UAT-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.80"
]
      }
   }
}
resource "nsxt_policy_group" "grp_871" {
   display_name = "TF-AG1-IPSET-DR158-ESG-dlr-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR158-ESG-dlr-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.2.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_872" {
   display_name = "TF-AG1-IPSET-GCM-LAB"
   nsx_id = "TF-AG1-IPSET-GCM-LAB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.124.0.192/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_873" {
   display_name = "TF-AG1-IPSET-DRES16-ICp-Cluster01-MasterHA-VIP"
   nsx_id = "TF-AG1-IPSET-DRES16-ICp-Cluster01-MasterHA-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.78.23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_874" {
   display_name = "TF-AG1-IPSET-DR112-Cprem-nmfdcrweb008057"
   nsx_id = "TF-AG1-IPSET-DR112-Cprem-nmfdcrweb008057"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.29.8.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_875" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-RMQ-PEN-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-RMQ-PEN-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_876" {
   display_name = "TF-AG1-IPSET-BLUEID-TEST"
   nsx_id = "TF-AG1-IPSET-BLUEID-TEST"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.63.40.250"
]
      }
   }
}
resource "nsxt_policy_group" "grp_877" {
   display_name = "TF-AG1-IPSET-CDI-LA-Proxy"
   nsx_id = "TF-AG1-IPSET-CDI-LA-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.31.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_878" {
   display_name = "TF-AG1-IPSET-STaaS-DR77-Storage-A9000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR77-Storage-A9000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "150.172.177.139",
                         "150.172.177.110",
                         "150.172.220.151",
                         "150.172.220.157",
                         "150.172.220.128",
                         "150.172.177.100",
                         "150.172.177.137",
                         "150.172.177.99",
                         "150.172.177.111",
                         "150.172.177.138",
                         "150.172.220.129",
                         "150.172.220.150",
                         "150.172.220.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_879" {
   display_name = "TF-AG1-IPSET-STaaS-DR53-SVC"
   nsx_id = "TF-AG1-IPSET-STaaS-DR53-SVC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.20.36.99",
                         "10.20.36.158",
                         "10.21.1.117",
                         "10.20.36.167",
                         "10.20.36.149",
                         "10.20.36.176",
                         "10.21.1.113",
                         "10.21.1.106",
                         "10.21.1.236",
                         "10.21.1.116",
                         "10.21.1.216-10.21.1.223",
                         "10.21.2.88-10.21.2.96",
                         "10.21.1.105",
                         "10.21.2.142-10.21.2.150",
                         "10.21.1.108",
                         "10.20.36.185",
                         "10.21.1.118",
                         "10.21.1.111",
                         "10.21.1.100",
                         "10.21.1.114",
                         "10.21.1.33-10.21.1.40",
                         "10.20.37.1",
                         "10.21.1.109",
                         "10.21.1.77-10.21.1.80"
]
      }
   }
}
resource "nsxt_policy_group" "grp_880" {
   display_name = "TF-AG1-IPSET-SM-LA-IKS"
   nsx_id = "TF-AG1-IPSET-SM-LA-IKS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.123.183"
]
      }
   }
}
resource "nsxt_policy_group" "grp_881" {
   display_name = "TF-AG1-IPSET-PB-RPA-BP-443"
   nsx_id = "TF-AG1-IPSET-PB-RPA-BP-443"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "161.228.115.178",
                         "161.228.115.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_882" {
   display_name = "TF-AG1-IPSET-SOTC-prod-was-primary"
   nsx_id = "TF-AG1-IPSET-SOTC-prod-was-primary"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.254.36.15",
                         "158.87.36.0/25",
                         "100.124.0.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_883" {
   display_name = "TF-AG1-IPSET-DR162-CACF-CPREM-vRA8"
   nsx_id = "TF-AG1-IPSET-DR162-CACF-CPREM-vRA8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.170.128.163",
                         "10.170.128.157",
                         "10.189.136.124",
                         "170.49.34.36",
                         "10.170.128.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_884" {
   display_name = "TF-AG1-IPSET-RCP-PerfTest-Kafka"
   nsx_id = "TF-AG1-IPSET-RCP-PerfTest-Kafka"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.37.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_885" {
   display_name = "TF-AG1-IPSET-SRES-PROXY"
   nsx_id = "TF-AG1-IPSET-SRES-PROXY"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.52",
                         "158.87.49.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_886" {
   display_name = "TF-AG1-IPSET-Host-icdalpamhapxy01-cloudprivate-local"
   nsx_id = "TF-AG1-IPSET-Host-icdalpamhapxy01-cloudprivate-local"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.254.109",
                         "10.121.90.126"
]
      }
   }
}
resource "nsxt_policy_group" "grp_887" {
   display_name = "TF-AG1-IPSET-HWSW-IBM-9-HTTPS"
   nsx_id = "TF-AG1-IPSET-HWSW-IBM-9-HTTPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.214.128.111",
                         "9.208.6.16",
                         "9.71.52.40",
                         "9.71.52.62",
                         "9.131.50.197",
                         "9.208.59.234"
]
      }
   }
}
resource "nsxt_policy_group" "grp_888" {
   display_name = "TF-AG1-IPSET-eu1sr1wphwcweb"
   nsx_id = "TF-AG1-IPSET-eu1sr1wphwcweb"
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
resource "nsxt_policy_group" "grp_889" {
   display_name = "TF-AG1-IPSET-ag1d100lpcacpr1-vip"
   nsx_id = "TF-AG1-IPSET-ag1d100lpcacpr1-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.116.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_890" {
   display_name = "TF-AG1-IPSET-STaaS-DR197-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR197-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.30.43",
                         "10.160.7.20",
                         "10.160.7.21",
                         "10.160.7.22",
                         "10.1.30.42",
                         "10.160.7.23",
                         "10.1.30.44",
                         "10.160.7.24",
                         "10.1.30.40",
                         "10.1.30.41"
]
      }
   }
}
resource "nsxt_policy_group" "grp_891" {
   display_name = "TF-AG1-IPSET-DR158-CPREM-NETCOOL"
   nsx_id = "TF-AG1-IPSET-DR158-CPREM-NETCOOL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "165.216.57.72",
                         "216.99.78.188",
                         "165.216.57.70",
                         "164.155.7.36",
                         "151.163.242.57",
                         "216.99.78.189"
]
      }
   }
}
resource "nsxt_policy_group" "grp_892" {
   display_name = "TF-AG1-IPSET-HWSW-Retain-API"
   nsx_id = "TF-AG1-IPSET-HWSW-Retain-API"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.17.210.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_893" {
   display_name = "TF-AG1-IPSET-xforce-vm0121-pt"
   nsx_id = "TF-AG1-IPSET-xforce-vm0121-pt"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.189"
]
      }
   }
}
resource "nsxt_policy_group" "grp_894" {
   display_name = "TF-AG1-IPSET-DR251-CPREM-JHOSTS"
   nsx_id = "TF-AG1-IPSET-DR251-CPREM-JHOSTS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "147.108.50.10",
                         "147.108.50.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_895" {
   display_name = "TF-AG1-IPSET-STaaS-DR162-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR162-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.138.44.106-10.138.44.108",
                         "10.138.44.200-10.138.44.209",
                         "10.189.44.2-10.189.44.77",
                         "10.138.44.210-10.138.44.215",
                         "10.138.44.218-10.138.44.231",
                         "10.189.44.78-10.189.44.80",
                         "10.189.44.81-10.189.44.86",
                         "10.138.44.2-10.138.44.102",
                         "10.189.44.218-10.189.44.229",
                         "10.189.44.200-10.189.44.209",
                         "10.189.44.210-10.189.44.215",
                         "10.138.44.103-10.138.44.105"
]
      }
   }
}
resource "nsxt_policy_group" "grp_896" {
   display_name = "TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.2",
                         "158.87.48.175",
                         "158.87.48.176"
]
      }
   }
}
resource "nsxt_policy_group" "grp_897" {
   display_name = "TF-AG1-IPSET-EU1-SRES-nlaspnw000m1erms"
   nsx_id = "TF-AG1-IPSET-EU1-SRES-nlaspnw000m1erms"
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
resource "nsxt_policy_group" "grp_898" {
   display_name = "TF-AG1-IPSET-HRES-ag1hrlpcscproxy-NAT"
   nsx_id = "TF-AG1-IPSET-HRES-ag1hrlpcscproxy-NAT"
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
resource "nsxt_policy_group" "grp_899" {
   display_name = "TF-AG1-IPSET-NET-CPREM-DR78-NAT-Range"
   nsx_id = "TF-AG1-IPSET-NET-CPREM-DR78-NAT-Range"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.105.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_900" {
   display_name = "TF-AG1-IPSET-DR223-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR223-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.186.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_901" {
   display_name = "TF-AG1-IPSET-NET-OpaaS-Subnet6"
   nsx_id = "TF-AG1-IPSET-NET-OpaaS-Subnet6"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.60.136.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_902" {
   display_name = "TF-AG1-IPSET-CNICC-prod-dallas-10"
   nsx_id = "TF-AG1-IPSET-CNICC-prod-dallas-10"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.117.128.54",
                         "52.117.128.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_903" {
   display_name = "TF-AG1-IPSET-Host-DR162-CACF-Client-premise-Netcool-Impact-Secondary"
   nsx_id = "TF-AG1-IPSET-Host-DR162-CACF-Client-premise-Netcool-Impact-Secondary"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.170.160.79"
]
      }
   }
}
resource "nsxt_policy_group" "grp_904" {
   display_name = "TF-AG1-IPSET-IRES-uswhpsl1dcr1"
   nsx_id = "TF-AG1-IPSET-IRES-uswhpsl1dcr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.121.112"
]
      }
   }
}
resource "nsxt_policy_group" "grp_905" {
   display_name = "TF-AG1-IPSET-IRES-QRADAR-NAT-IP"
   nsx_id = "TF-AG1-IPSET-IRES-QRADAR-NAT-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_906" {
   display_name = "TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
   nsx_id = "TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.45",
                         "100.71.242.249",
                         "100.71.242.250",
                         "100.71.242.64/27",
                         "100.71.242.247"
]
      }
   }
}
resource "nsxt_policy_group" "grp_907" {
   display_name = "TF-AG1-IPSET-STaaS-DR19-Storage"
   nsx_id = "TF-AG1-IPSET-STaaS-DR19-Storage"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.151.79.5",
                         "10.151.206.7",
                         "10.151.206.6",
                         "10.151.79.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_908" {
   display_name = "TF-AG1-IPSET-ag1sr1aniamigi2-VIP"
   nsx_id = "TF-AG1-IPSET-ag1sr1aniamigi2-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_909" {
   display_name = "TF-AG1-IPSET-INFRA-ag1nsxm1-"
   nsx_id = "TF-AG1-IPSET-INFRA-ag1nsxm1-"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.135"
]
      }
   }
}
resource "nsxt_policy_group" "grp_910" {
   display_name = "TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
   nsx_id = "TF-AG1-IPSET-ag1sr1lpi1pprx-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_911" {
   display_name = "TF-AG1-IPSET-IBM-Bluepages"
   nsx_id = "TF-AG1-IPSET-IBM-Bluepages"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.15.48.48",
                         "9.23.210.79",
                         "9.17.186.253",
                         "9.15.0.48",
                         "9.57.182.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_912" {
   display_name = "TF-AG1-IPSET-STaaS-DR71-Storage---V7000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR71-Storage---V7000"
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
resource "nsxt_policy_group" "grp_913" {
   display_name = "TF-AG1-IPSET-ca1phwswdb01ra"
   nsx_id = "TF-AG1-IPSET-ca1phwswdb01ra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_914" {
   display_name = "TF-AG1-IPSET-NET-IRES-NSX-T"
   nsx_id = "TF-AG1-IPSET-NET-IRES-NSX-T"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.192/26",
                         "10.211.161.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_915" {
   display_name = "TF-AG1-IPSET-NET-STF-Mgmt"
   nsx_id = "TF-AG1-IPSET-NET-STF-Mgmt"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.212.4.128/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_916" {
   display_name = "TF-AG1-IPSET-service-pt-ibm-com"
   nsx_id = "TF-AG1-IPSET-service-pt-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.37.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_917" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-DevOps-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-DevOps-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_918" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-SMTP"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-SMTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.4.2.232",
                         "9.17.130.236",
                         "9.57.199.107",
                         "9.17.130.232",
                         "9.57.199.109",
                         "9.57.199.108",
                         "9.17.130.235",
                         "9.57.199.111",
                         "9.17.130.234",
                         "9.57.199.110",
                         "9.17.130.233",
                         "9.57.199.106",
                         "9.17.130.237"
]
      }
   }
}
resource "nsxt_policy_group" "grp_919" {
   display_name = "TF-AG1-IPSET-STaaS-DR19-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR19-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.151.206.236",
                         "10.151.206.183",
                         "10.151.206.153",
                         "10.151.79.71",
                         "10.151.79.45",
                         "10.151.79.122",
                         "10.151.206.152",
                         "10.151.79.42",
                         "10.151.79.123",
                         "10.151.79.69",
                         "10.151.206.233",
                         "10.151.206.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_920" {
   display_name = "TF-AG1-IPSET-agnsrwndvadeva2"
   nsx_id = "TF-AG1-IPSET-agnsrwndvadeva2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.134"
]
      }
   }
}
resource "nsxt_policy_group" "grp_921" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-bluezone"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-bluezone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.16.170.90",
                         "9.209.228.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_922" {
   display_name = "TF-AG1-IPSET-Host-IBM-K8"
   nsx_id = "TF-AG1-IPSET-Host-IBM-K8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.180",
                         "10.175.14.182",
                         "10.175.14.191",
                         "10.175.14.148",
                         "10.175.14.147"
]
      }
   }
}
resource "nsxt_policy_group" "grp_923" {
   display_name = "TF-AG1-IPSET-DANA-PerfTest-158-87-37-136"
   nsx_id = "TF-AG1-IPSET-DANA-PerfTest-158-87-37-136"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.37.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_924" {
   display_name = "TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster6-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster6-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_925" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-50002"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-50002"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.227.184"
]
      }
   }
}
resource "nsxt_policy_group" "grp_926" {
   display_name = "TF-AG1-IPSET-SRES-OCP-Cluster7-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-OCP-Cluster7-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.3",
                         "100.71.244.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_927" {
   display_name = "TF-AG1-IPSET-HWSW-SNI-NYHOST"
   nsx_id = "TF-AG1-IPSET-HWSW-SNI-NYHOST"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.228.115"
]
      }
   }
}
resource "nsxt_policy_group" "grp_928" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Storage-FS840-FS900-V5000-V7000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Storage-FS840-FS900-V5000-V7000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.69.160.121-10.69.160.122",
                         "10.64.10.20",
                         "10.69.160.117-10.69.160.119",
                         "10.69.161.219",
                         "10.69.161.64-10.69.161.65",
                         "10.69.160.43-10.69.160.48",
                         "10.69.161.76-10.69.161.77",
                         "10.64.118.33-10.64.118.44",
                         "10.69.160.220",
                         "10.69.160.223",
                         "10.64.119.125-10.64.119.130",
                         "10.69.161.67-10.69.161.68",
                         "10.64.90.28-10.64.90.45",
                         "10.64.118.231-10.64.118.233",
                         "10.69.161.123-10.69.161.135",
                         "10.68.118.192",
                         "10.69.161.73-10.69.161.74",
                         "10.69.160.107",
                         "10.64.189.184-10.64.189.192",
                         "10.64.118.192-10.64.118.194",
                         "10.69.160.39-10.69.160.40",
                         "10.64.189.168-10.64.189.171",
                         "10.69.161.47-10.69.161.52",
                         "10.64.188.198-10.64.188.200",
                         "10.69.160.109-10.69.160.111",
                         "10.69.160.150-10.69.160.152",
                         "10.64.189.177-10.64.189.179",
                         "10.68.118.25-10.68.118.36",
                         "10.69.160.154",
                         "10.64.118.28-10.64.118.30",
                         "10.69.160.113-10.69.160.115",
                         "10.64.118.122-10.64.118.124",
                         "10.69.160.69-10.69.160.71",
                         "10.68.119.4-10.68.119.5",
                         "10.69.160.172-10.69.160.174",
                         "10.69.161.119-10.69.161.120",
                         "10.64.11.87",
                         "10.69.160.187",
                         "10.69.160.194-10.69.160.196",
                         "10.64.11.164",
                         "10.64.118.235-10.64.118.236",
                         "10.69.161.61-10.69.161.62",
                         "10.69.161.70-10.69.161.71",
                         "10.64.118.221-10.64.118.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_929" {
   display_name = "TF-AG1-IPSET-NET-WDC-CGN-Edge-DLR-Transit-Subnets"
   nsx_id = "TF-AG1-IPSET-NET-WDC-CGN-Edge-DLR-Transit-Subnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.0/22",
                         "100.64.0.0/18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_930" {
   display_name = "TF-AG1-IPSET-IRES-ag1irlptfa01"
   nsx_id = "TF-AG1-IPSET-IRES-ag1irlptfa01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.121.68"
]
      }
   }
}
resource "nsxt_policy_group" "grp_931" {
   display_name = "TF-AG1-IPSET-STaaS-DR12-Storage-A9000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR12-Storage-A9000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.101.89.40-10.101.89.42",
                         "108.101.89.55",
                         "108.101.89.50",
                         "108.101.89.51",
                         "108.201.195.121",
                         "10.201.195.111-10.201.195.113",
                         "108.201.195.124",
                         "108.201.195.123",
                         "108.101.89.53",
                         "108.201.195.122",
                         "108.201.195.125",
                         "108.201.195.120",
                         "108.101.89.52",
                         "108.101.89.54"
]
      }
   }
}
resource "nsxt_policy_group" "grp_932" {
   display_name = "TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1"
   nsx_id = "TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.71.6",
                         "192.168.0.64/27",
                         "158.87.51.1",
                         "192.168.0.32/27",
                         "158.87.51.4",
                         "158.87.51.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_933" {
   display_name = "TF-AG1-IPSET-Host-sc-replica-xiv-ibm-com"
   nsx_id = "TF-AG1-IPSET-Host-sc-replica-xiv-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.151.140.36"
]
      }
   }
}
resource "nsxt_policy_group" "grp_934" {
   display_name = "TF-AG1-IPSET-IRES-BaaS-TSM"
   nsx_id = "TF-AG1-IPSET-IRES-BaaS-TSM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.120.165.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_935" {
   display_name = "TF-AG1-IPSET-CDI-EU-Proxy-VPC"
   nsx_id = "TF-AG1-IPSET-CDI-EU-Proxy-VPC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.76",
                         "146.89.187.73",
                         "146.89.187.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_936" {
   display_name = "TF-AG1-IPSET-DR162-LB-VIP1"
   nsx_id = "TF-AG1-IPSET-DR162-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.147.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_937" {
   display_name = "TF-AG1-IPSET-NET-DR40-DC1_range2"
   nsx_id = "TF-AG1-IPSET-NET-DR40-DC1_range2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "163.241.21.0/24",
                         "163.241.205.0/24",
                         "192.46.174.0/24",
                         "135.107.71.0/24",
                         "135.107.72.0/24",
                         "135.107.70.0/24",
                         "163.241.86.0/24",
                         "135.107.67.0/24",
                         "148.174.165.0/24",
                         "146.71.219.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_938" {
   display_name = "TF-AG1-IPSET-NSXT-Automation_Nodes"
   nsx_id = "TF-AG1-IPSET-NSXT-Automation_Nodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.211",
                         "10.211.12.212"
]
      }
   }
}
resource "nsxt_policy_group" "grp_939" {
   display_name = "TF-AG1-IPSET-DR111-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR111-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.118.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_940" {
   display_name = "TF-AG1-IPSET-GACDW-NA"
   nsx_id = "TF-AG1-IPSET-GACDW-NA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.104.143"
]
      }
   }
}
resource "nsxt_policy_group" "grp_941" {
   display_name = "TF-AG1-IPSET-ca1dhwswetl01ra"
   nsx_id = "TF-AG1-IPSET-ca1dhwswetl01ra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_942" {
   display_name = "TF-AG1-IPSET-NET-HST---NA-Cloud"
   nsx_id = "TF-AG1-IPSET-NET-HST---NA-Cloud"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.36.128/25",
                         "169.254.36.128-169.254.36.255",
                         "169.254.36.0-169.254.36.127",
                         "158.87.36.0/25",
                         "100.124.0.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_943" {
   display_name = "TF-AG1-IPSET-STaaS-DR162-Storage-NetApp"
   nsx_id = "TF-AG1-IPSET-STaaS-DR162-Storage-NetApp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.189.44.4",
                         "10.189.44.2",
                         "10.138.44.2",
                         "10.138.44.3",
                         "10.138.44.4",
                         "10.189.44.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_944" {
   display_name = "TF-AG1-IPSET-IBM-Blue-zcogcad2"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-zcogcad2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.17.159.143"
]
      }
   }
}
resource "nsxt_policy_group" "grp_945" {
   display_name = "TF-AG1-IPSET-STaaS-DR53-IBM_Storwize"
   nsx_id = "TF-AG1-IPSET-STaaS-DR53-IBM_Storwize"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.20.36.202",
                         "10.20.37.107",
                         "10.21.1.157",
                         "10.20.37.109",
                         "10.20.36.20",
                         "10.21.1.117",
                         "10.21.1.96",
                         "10.21.2.89",
                         "10.20.37.105",
                         "10.21.1.221",
                         "10.21.1.216",
                         "10.20.36.23",
                         "10.21.1.131",
                         "10.20.36.149",
                         "10.21.1.33",
                         "10.21.2.95",
                         "10.21.1.233",
                         "10.21.1.203",
                         "10.20.36.213",
                         "10.21.2.147",
                         "10.21.1.164",
                         "10.20.36.34",
                         "10.21.1.217",
                         "10.20.36.245",
                         "10.21.1.40",
                         "10.20.36.199",
                         "10.21.1.94",
                         "10.21.1.80",
                         "10.20.36.208",
                         "10.21.1.156",
                         "10.20.36.210",
                         "10.21.1.25",
                         "10.20.36.88",
                         "10.21.1.187",
                         "10.21.1.204",
                         "10.20.36.203",
                         "10.21.2.88",
                         "10.21.1.118",
                         "10.20.36.87",
                         "10.20.36.194",
                         "10.20.36.24",
                         "10.21.1.232",
                         "10.20.36.211",
                         "10.20.37.1",
                         "10.21.1.34",
                         "10.21.1.230",
                         "10.20.36.38",
                         "10.20.36.86",
                         "10.20.36.158",
                         "10.20.36.37",
                         "10.21.1.149",
                         "10.21.1.38",
                         "10.21.1.158",
                         "10.20.36.204",
                         "10.20.36.21",
                         "10.21.2.144",
                         "10.20.36.200",
                         "10.20.36.243",
                         "10.21.1.152",
                         "10.21.1.79",
                         "10.21.1.229",
                         "10.21.2.94",
                         "10.21.2.142",
                         "10.21.1.105",
                         "10.21.1.36",
                         "10.20.36.249",
                         "10.21.1.219",
                         "10.21.1.148",
                         "10.21.2.90",
                         "10.21.1.125",
                         "10.21.1.111",
                         "10.21.1.122",
                         "10.21.2.150",
                         "10.20.36.197",
                         "10.20.36.36",
                         "10.21.1.24",
                         "10.21.1.205",
                         "10.21.1.231",
                         "10.21.1.147",
                         "10.21.1.200",
                         "10.20.36.212",
                         "10.20.36.214",
                         "10.21.1.39",
                         "10.20.36.99",
                         "10.21.1.220",
                         "10.21.1.234",
                         "10.20.36.205",
                         "10.21.1.222",
                         "10.20.36.50",
                         "10.20.36.198",
                         "10.20.36.250",
                         "10.21.1.37",
                         "10.21.1.154",
                         "10.21.1.189",
                         "10.21.1.77",
                         "10.20.36.251",
                         "10.20.36.207",
                         "10.21.1.95",
                         "10.20.36.209",
                         "10.21.1.153",
                         "10.21.2.149",
                         "10.21.1.113",
                         "10.21.1.227",
                         "10.21.2.145",
                         "10.21.1.228",
                         "10.21.2.119",
                         "10.20.36.206",
                         "10.21.1.35",
                         "10.21.1.236",
                         "10.20.36.185",
                         "10.21.1.124",
                         "10.21.1.126",
                         "10.21.1.188",
                         "10.21.1.100",
                         "10.20.37.108",
                         "10.21.1.114",
                         "10.21.2.146",
                         "10.21.1.121",
                         "10.21.1.109",
                         "10.21.2.121",
                         "10.21.2.96",
                         "10.20.36.51",
                         "10.20.36.201",
                         "10.20.36.25",
                         "10.20.36.32",
                         "10.20.36.49",
                         "10.20.36.167",
                         "10.21.2.148",
                         "10.21.1.155",
                         "10.20.36.176",
                         "10.21.1.223",
                         "10.21.1.123",
                         "10.20.36.33",
                         "10.21.2.143",
                         "10.20.36.22",
                         "10.20.37.106",
                         "10.20.36.35",
                         "10.21.1.106",
                         "10.20.36.31",
                         "10.21.1.116",
                         "10.20.37.104",
                         "10.21.1.78",
                         "10.21.1.108",
                         "10.21.2.120",
                         "10.20.36.244",
                         "10.20.36.195",
                         "10.20.36.196",
                         "10.21.1.218",
                         "10.21.1.202",
                         "10.20.36.39",
                         "10.21.1.201",
                         "10.21.1.151",
                         "10.21.1.26",
                         "10.21.1.235",
                         "10.21.2.92",
                         "10.21.2.93",
                         "10.21.2.91",
                         "10.21.1.163"
]
      }
   }
}
resource "nsxt_policy_group" "grp_946" {
   display_name = "TF-AG1-IPSET-DR187-CPREM-JH-443"
   nsx_id = "TF-AG1-IPSET-DR187-CPREM-JH-443"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "162.95.224.1",
                         "30.230.14.182",
                         "10.152.128.33",
                         "10.152.0.195"
]
      }
   }
}
resource "nsxt_policy_group" "grp_947" {
   display_name = "TF-AG1-IPSET-NAT-ag1dr19arx"
   nsx_id = "TF-AG1-IPSET-NAT-ag1dr19arx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_948" {
   display_name = "TF-AG1-IPSET-STaaS-DR147-Storage-NetApp"
   nsx_id = "TF-AG1-IPSET-STaaS-DR147-Storage-NetApp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.40.64.153-10.40.64.157",
                         "10.101.69.96-10.101.69.100",
                         "10.100.19.166-10.100.19.170",
                         "10.170.125.84-10.170.125.89",
                         "10.171.125.84-10.171.125.89"
]
      }
   }
}
resource "nsxt_policy_group" "grp_949" {
   display_name = "TF-AG1-IPSET-NET-OpaaS-Subnet1"
   nsx_id = "TF-AG1-IPSET-NET-OpaaS-Subnet1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.60.136.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_950" {
   display_name = "TF-AG1-IPSET-Customer-AMX-NAT"
   nsx_id = "TF-AG1-IPSET-Customer-AMX-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.66.0.170",
                         "100.66.0.146",
                         "100.66.0.147",
                         "100.66.0.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_951" {
   display_name = "TF-AG1-IPSET-CDI-THCAAS-GTSCDI-LA-PROD"
   nsx_id = "TF-AG1-IPSET-CDI-THCAAS-GTSCDI-LA-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.31.239"
]
      }
   }
}
resource "nsxt_policy_group" "grp_952" {
   display_name = "TF-AG1-IPSET-Host-DR162-CACF-Client-premise-Netcool-Impact-Primary"
   nsx_id = "TF-AG1-IPSET-Host-DR162-CACF-Client-premise-Netcool-Impact-Primary"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.139.64.118"
]
      }
   }
}
resource "nsxt_policy_group" "grp_953" {
   display_name = "TF-AG1-IPSET-DRIAMAASTHY3-Customer1-UNIX-EP"
   nsx_id = "TF-AG1-IPSET-DRIAMAASTHY3-Customer1-UNIX-EP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.186.94.204"
]
      }
   }
}
resource "nsxt_policy_group" "grp_954" {
   display_name = "TF-AG1-IPSET-ag1sr1staas3-sr1-sp-ibm-local"
   nsx_id = "TF-AG1-IPSET-ag1sr1staas3-sr1-sp-ibm-local"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_955" {
   display_name = "TF-AG1-IPSET-DR40-CPrem-DR-Site-IP-Group"
   nsx_id = "TF-AG1-IPSET-DR40-CPrem-DR-Site-IP-Group"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.107.70.93",
                         "135.107.70.181",
                         "135.107.70.89",
                         "135.107.70.91",
                         "135.107.70.183",
                         "135.107.85.135"
]
      }
   }
}
resource "nsxt_policy_group" "grp_956" {
   display_name = "TF-AG1-IPSET-AG-1-NSXT-SRES-IP"
   nsx_id = "TF-AG1-IPSET-AG-1-NSXT-SRES-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.173"
]
      }
   }
}
resource "nsxt_policy_group" "grp_957" {
   display_name = "TF-AG1-IPSET-NET-CNICC-devRTP-Flex"
   nsx_id = "TF-AG1-IPSET-NET-CNICC-devRTP-Flex"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.31.199.160/29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_958" {
   display_name = "TF-AG1-IPSET-STaaS-DR11-Storage-V7000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR11-Storage-V7000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.10.5-10.1.10.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_959" {
   display_name = "TF-AG1-IPSET-NSXT-SRES-OCP-Cluster04-SNAT"
   nsx_id = "TF-AG1-IPSET-NSXT-SRES-OCP-Cluster04-SNAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.32/27",
                         "158.87.48.176"
]
      }
   }
}
resource "nsxt_policy_group" "grp_960" {
   display_name = "TF-AG1-IPSET-STaaS-DR144--V7k"
   nsx_id = "TF-AG1-IPSET-STaaS-DR144--V7k"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.101.240.30-10.101.240.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_961" {
   display_name = "TF-AG1-IPSET-DR204---Proxy---VIP"
   nsx_id = "TF-AG1-IPSET-DR204---Proxy---VIP"
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
resource "nsxt_policy_group" "grp_962" {
   display_name = "TF-AG1-IPSET-RAF-DEVLAB"
   nsx_id = "TF-AG1-IPSET-RAF-DEVLAB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.37.187.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_963" {
   display_name = "TF-AG1-IPSET-EU1-nlascdb000m1erms"
   nsx_id = "TF-AG1-IPSET-EU1-nlascdb000m1erms"
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
resource "nsxt_policy_group" "grp_964" {
   display_name = "TF-AG1-IPSET-STaaS-DR11-Storage-NetApp"
   nsx_id = "TF-AG1-IPSET-STaaS-DR11-Storage-NetApp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.10.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_965" {
   display_name = "TF-AG1-IPSET-STaaS-DR151-Storage-A9000-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR151-Storage-A9000-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "125.156.103.193-125.156.103.198",
                         "125.157.103.222-125.157.103.225",
                         "125.157.103.193-125.157.103.198",
                         "125.156.103.47-125.156.103.50",
                         "125.157.103.236-125.157.103.239",
                         "125.156.103.244-125.156.103.246",
                         "125.156.103.237-125.156.103.239",
                         "125.156.103.14-125.156.103.16",
                         "125.156.103.213-125.156.103.216",
                         "125.157.103.14-125.157.103.16",
                         "125.157.103.45-125.157.103.48",
                         "125.157.103.244-125.157.103.249",
                         "125.157.103.237-125.157.103.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_966" {
   display_name = "TF-AG1-IPSET-DR96-CPREM-172-22-25-4"
   nsx_id = "TF-AG1-IPSET-DR96-CPREM-172-22-25-4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.22.25.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_967" {
   display_name = "TF-AG1-IPSET-IBM-w3Intranet"
   nsx_id = "TF-AG1-IPSET-IBM-w3Intranet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.17.185.146"
]
      }
   }
}
resource "nsxt_policy_group" "grp_968" {
   display_name = "TF-AG1-IPSET-IBM-Blue-BACC-Prod"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-BACC-Prod"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.234.119",
                         "9.63.33.254",
                         "9.63.33.57",
                         "9.209.239.30",
                         "9.209.239.29",
                         "9.209.227.142",
                         "9.63.33.250",
                         "9.209.230.106",
                         "9.209.227.140",
                         "9.209.239.31",
                         "9.63.33.249",
                         "9.209.228.83",
                         "9.63.33.252",
                         "9.209.239.17",
                         "9.209.227.182",
                         "9.63.33.54",
                         "9.63.33.56",
                         "9.63.33.53",
                         "9.63.33.248",
                         "9.209.239.23",
                         "9.209.227.181",
                         "9.209.239.28",
                         "9.63.33.246",
                         "9.209.239.27",
                         "9.63.33.247",
                         "9.209.233.255",
                         "9.209.228.80",
                         "9.209.234.120",
                         "9.63.33.253"
]
      }
   }
}
resource "nsxt_policy_group" "grp_969" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Storage-SVC"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Storage-SVC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.64.118.251-10.64.118.255",
                         "10.64.119.0",
                         "10.64.90.62-10.64.90.101",
                         "10.64.10.62",
                         "10.64.10.220",
                         "10.69.160.59-10.69.160.67",
                         "10.64.11.34",
                         "10.64.11.184",
                         "10.64.11.186",
                         "10.69.161.21-10.69.161.26",
                         "10.69.160.49-10.69.160.57",
                         "10.64.118.247-10.64.118.249",
                         "10.64.11.180",
                         "10.64.10.84",
                         "10.69.160.227-10.69.160.229",
                         "10.64.11.188",
                         "10.64.10.90",
                         "10.64.10.217-10.64.10.218",
                         "10.69.160.231-10.69.160.236",
                         "10.64.10.64",
                         "10.64.11.182",
                         "10.64.11.16",
                         "10.64.10.81",
                         "10.64.11.42-10.64.11.43",
                         "10.64.11.178",
                         "10.64.10.87",
                         "10.64.11.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_970" {
   display_name = "TF-AG1-IPSET-KSTP-IN-HWSW"
   nsx_id = "TF-AG1-IPSET-KSTP-IN-HWSW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.22-158.87.61.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_971" {
   display_name = "TF-AG1-IPSET-STaaS-DR198-Storage-FS9200"
   nsx_id = "TF-AG1-IPSET-STaaS-DR198-Storage-FS9200"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.92.250.50-10.92.250.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_972" {
   display_name = "TF-AG1-IPSET-HOST_HWSW_IBM_servers"
   nsx_id = "TF-AG1-IPSET-HOST_HWSW_IBM_servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.56.22.229",
                         "9.209.227.176",
                         "9.56.22.235",
                         "9.220.27.85",
                         "9.56.22.231",
                         "9.209.242.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_973" {
   display_name = "TF-AG1-IPSET-ag1h1lpta1ssh2"
   nsx_id = "TF-AG1-IPSET-ag1h1lpta1ssh2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_974" {
   display_name = "TF-AG1-IPSET-IRES-IUS-TSM"
   nsx_id = "TF-AG1-IPSET-IRES-IUS-TSM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.120.47.154"
]
      }
   }
}
resource "nsxt_policy_group" "grp_975" {
   display_name = "TF-AG1-IPSET-Tanzu-mgmt-subnets"
   nsx_id = "TF-AG1-IPSET-Tanzu-mgmt-subnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.243.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_976" {
   display_name = "TF-AG1-IPSET-ap1sr1lpcacprx1-vip"
   nsx_id = "TF-AG1-IPSET-ap1sr1lpcacprx1-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_977" {
   display_name = "TF-AG1-IPSET-ag1sr1aniamigi-VIP"
   nsx_id = "TF-AG1-IPSET-ag1sr1aniamigi-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_978" {
   display_name = "TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1-nat"
   nsx_id = "TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1-nat"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.51.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_979" {
   display_name = "TF-AG1-IPSET-NET-DR40-DC2_range1"
   nsx_id = "TF-AG1-IPSET-NET-DR40-DC2_range1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.107.95.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_980" {
   display_name = "TF-AG1-IPSET-MSS-TFTP-NTP"
   nsx_id = "TF-AG1-IPSET-MSS-TFTP-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "209.134.186.208/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_981" {
   display_name = "TF-AG1-IPSET-DR162-ESG-agg-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR162-ESG-agg-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.42"
]
      }
   }
}
resource "nsxt_policy_group" "grp_982" {
   display_name = "TF-AG1-IPSET-Host-bsnconnect-broadcom-com"
   nsx_id = "TF-AG1-IPSET-Host-bsnconnect-broadcom-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.19.232.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_983" {
   display_name = "TF-AG1-IPSET-Host-nlaspnp000m1erms"
   nsx_id = "TF-AG1-IPSET-Host-nlaspnp000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.51",
                         "158.87.52.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_984" {
   display_name = "TF-AG1-IPSET-Host-anzproductionapp-hwsw-"
   nsx_id = "TF-AG1-IPSET-Host-anzproductionapp-hwsw-"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.231"
]
      }
   }
}
resource "nsxt_policy_group" "grp_985" {
   display_name = "TF-AG1-IPSET-NET-IBM-CLOUD-COS-Private-Endpoints"
   nsx_id = "TF-AG1-IPSET-NET-IBM-CLOUD-COS-Private-Endpoints"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.129.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_986" {
   display_name = "TF-AG1-IPSET-STaaS-DR144-Storage-FS9200"
   nsx_id = "TF-AG1-IPSET-STaaS-DR144-Storage-FS9200"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.101.240.8-10.101.240.13",
                         "10.1.240.5-10.1.240.10",
                         "10.101.240.5-10.101.240.7",
                         "10.111.10.15-10.111.10.20",
                         "10.8.162.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_987" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.79"
]
      }
   }
}
resource "nsxt_policy_group" "grp_988" {
   display_name = "TF-AG1-IPSET-HWSW-VISR16LDWH-01"
   nsx_id = "TF-AG1-IPSET-HWSW-VISR16LDWH-01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "62.185.134.80"
]
      }
   }
}
resource "nsxt_policy_group" "grp_989" {
   display_name = "TF-AG1-IPSET-MEaaS-Netcool-Probe"
   nsx_id = "TF-AG1-IPSET-MEaaS-Netcool-Probe"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.130",
                         "100.64.68.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_990" {
   display_name = "TF-AG1-IPSET-DR192-LB-VIP1-NAT"
   nsx_id = "TF-AG1-IPSET-DR192-LB-VIP1-NAT"
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
resource "nsxt_policy_group" "grp_991" {
   display_name = "TF-AG1-IPSET-NSX-T-vROPS"
   nsx_id = "TF-AG1-IPSET-NSX-T-vROPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.65.254"
]
      }
   }
}
resource "nsxt_policy_group" "grp_992" {
   display_name = "TF-AG1-IPSET-NAT-test-oc4q5-omnibus"
   nsx_id = "TF-AG1-IPSET-NAT-test-oc4q5-omnibus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_993" {
   display_name = "TF-AG1-IPSET-INTERNET-O365"
   nsx_id = "TF-AG1-IPSET-INTERNET-O365"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "131.253.33.215/32",
                         "132.245.0.0/16",
                         "13.107.6.152/31",
                         "23.103.160.0/20",
                         "40.104.0.0/15",
                         "150.171.32.0/22",
                         "13.107.128.0/22",
                         "52.109.0.0/16",
                         "129.42.38.0/24",
                         "40.96.0.0/13",
                         "52.96.0.0/14",
                         "204.79.197.215/32",
                         "13.107.18.10/31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_994" {
   display_name = "TF-AG1-IPSET-GTS-TIA-Jenkins"
   nsx_id = "TF-AG1-IPSET-GTS-TIA-Jenkins"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.208.88.147"
]
      }
   }
}
resource "nsxt_policy_group" "grp_995" {
   display_name = "TF-AG1-IPSET-DR192-LB-VIP1-NAT4"
   nsx_id = "TF-AG1-IPSET-DR192-LB-VIP1-NAT4"
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
resource "nsxt_policy_group" "grp_996" {
   display_name = "TF-AG1-IPSET-CDI-gtscdi-ag-proxy01"
   nsx_id = "TF-AG1-IPSET-CDI-gtscdi-ag-proxy01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.104.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_997" {
   display_name = "TF-AG1-IPSET-DR251-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR251-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.198.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_998" {
   display_name = "TF-AG1-IPSET-DR95-SSH-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR95-SSH-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.108.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_999" {
   display_name = "TF-AG1-IPSET-Host-ag-ilmtapdapp01"
   nsx_id = "TF-AG1-IPSET-Host-ag-ilmtapdapp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.9.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1000" {
   display_name = "TF-AG1-IPSET-MnE-Dev-meaas-noi-inn6y-wb"
   nsx_id = "TF-AG1-IPSET-MnE-Dev-meaas-noi-inn6y-wb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.104"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1001" {
   display_name = "TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP"
   nsx_id = "TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.120"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1002" {
   display_name = "TF-AG1-IPSET-DR203-Cprem-JH"
   nsx_id = "TF-AG1-IPSET-DR203-Cprem-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.19.6.97",
                         "10.89.31.32",
                         "10.91.22.71",
                         "10.91.22.115",
                         "10.19.6.96",
                         "10.91.22.72",
                         "10.89.31.54",
                         "10.89.31.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1003" {
   display_name = "TF-AG1-IPSET-NET-CPREM-DR162-NAT-Range_1"
   nsx_id = "TF-AG1-IPSET-NET-CPREM-DR162-NAT-Range_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.103.143.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1004" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-REMEDY-QA"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-REMEDY-QA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "152.144.148.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1005" {
   display_name = "TF-AG1-IPSET-STaaS-DR144-Storage-ALL"
   nsx_id = "TF-AG1-IPSET-STaaS-DR144-Storage-ALL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.101.240.30-10.101.240.32",
                         "10.1.240.5-10.1.240.16",
                         "10.101.240.5-10.101.240.7",
                         "10.111.10.15-10.111.10.20",
                         "10.101.240.8-10.101.240.19",
                         "10.101.240.20-10.101.240.22",
                         "10.8.162.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1006" {
   display_name = "TF-AG1-IPSET-Host-zCLD_LKD90_ASH"
   nsx_id = "TF-AG1-IPSET-Host-zCLD_LKD90_ASH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.172.103"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1007" {
   display_name = "TF-AG1-IPSET-pdr-esg01-lb-vip-1"
   nsx_id = "TF-AG1-IPSET-pdr-esg01-lb-vip-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.63.82.254"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1008" {
   display_name = "TF-AG1-IPSET-HRES-NAT-100-71-240-12"
   nsx_id = "TF-AG1-IPSET-HRES-NAT-100-71-240-12"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.56.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1009" {
   display_name = "TF-AG1-IPSET-ag1sr1aniamigi"
   nsx_id = "TF-AG1-IPSET-ag1sr1aniamigi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.255"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1010" {
   display_name = "TF-AG1-IPSET-meaas-noi-inn6y-nc2"
   nsx_id = "TF-AG1-IPSET-meaas-noi-inn6y-nc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.220"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1011" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-51000"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-51000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.106.112.71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1012" {
   display_name = "TF-AG1-IPSET-DR223-Cprem-JH"
   nsx_id = "TF-AG1-IPSET-DR223-Cprem-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.14.9.80",
                         "10.6.9.80"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1013" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
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
resource "nsxt_policy_group" "grp_1014" {
   display_name = "TF-AG1-IPSET-DR158-ESG-agg-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR158-ESG-agg-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1015" {
   display_name = "TF-AG1-IPSET-SRES-ag1irlpipam01"
   nsx_id = "TF-AG1-IPSET-SRES-ag1irlpipam01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.121.87",
                         "158.87.50.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1016" {
   display_name = "TF-AG1-IPSET-EU1-SRES-eu1srlphwcsss01"
   nsx_id = "TF-AG1-IPSET-EU1-SRES-eu1srlphwcsss01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.58"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1017" {
   display_name = "TF-AG1-IPSET-STaaS-DR53-SAN_Switches"
   nsx_id = "TF-AG1-IPSET-STaaS-DR53-SAN_Switches"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.21.1.11",
                         "10.21.1.51",
                         "10.20.37.140",
                         "10.21.1.237",
                         "10.20.37.56",
                         "10.20.37.138",
                         "10.20.37.142",
                         "10.21.1.180",
                         "10.21.2.31",
                         "10.21.1.50",
                         "10.21.1.184",
                         "10.21.1.17",
                         "10.20.37.43",
                         "10.21.1.127",
                         "10.20.37.21",
                         "10.20.37.49",
                         "10.21.1.182",
                         "10.20.37.19",
                         "10.20.37.59",
                         "10.20.37.115",
                         "10.20.37.165",
                         "10.20.37.61",
                         "10.20.37.154",
                         "10.20.37.150",
                         "10.20.37.39",
                         "10.20.37.31",
                         "10.20.37.18",
                         "10.21.1.176",
                         "10.20.37.52",
                         "10.20.37.131",
                         "10.21.1.19",
                         "10.21.1.27",
                         "10.21.2.43",
                         "10.20.37.53",
                         "10.21.2.40",
                         "10.20.37.44",
                         "10.21.2.47",
                         "10.20.37.168",
                         "10.20.37.46",
                         "10.21.1.28",
                         "10.20.37.42",
                         "10.20.37.167",
                         "10.21.1.9",
                         "10.21.1.185",
                         "10.20.37.160",
                         "10.20.37.149",
                         "10.20.36.93",
                         "10.21.2.57",
                         "10.21.1.32",
                         "10.20.37.145",
                         "10.21.1.30",
                         "10.21.2.37",
                         "10.21.2.44",
                         "10.21.1.136",
                         "10.20.37.128",
                         "10.21.1.242",
                         "10.20.37.132",
                         "10.21.1.18",
                         "10.20.37.156",
                         "10.20.37.50",
                         "10.20.37.155",
                         "10.20.37.141",
                         "10.20.37.33",
                         "10.21.1.128",
                         "10.20.37.27",
                         "10.21.1.20",
                         "10.21.1.186",
                         "10.21.1.29",
                         "10.21.1.31",
                         "10.20.37.117",
                         "10.20.37.158",
                         "10.20.37.133",
                         "10.21.1.56",
                         "10.20.37.24",
                         "10.20.37.36",
                         "10.20.37.164",
                         "10.20.37.146",
                         "10.21.1.52",
                         "10.20.37.40",
                         "10.20.37.55",
                         "10.21.2.38",
                         "10.20.37.25",
                         "10.20.37.151",
                         "10.20.37.137",
                         "10.21.1.138",
                         "10.21.1.55",
                         "10.20.37.127",
                         "10.21.2.56",
                         "10.20.37.159",
                         "10.21.1.13",
                         "10.20.36.82",
                         "10.20.37.126",
                         "10.21.2.46",
                         "10.20.37.136",
                         "10.20.37.51",
                         "10.21.1.239",
                         "10.21.1.58",
                         "10.20.37.129",
                         "10.20.37.163",
                         "10.20.37.130",
                         "10.20.37.26",
                         "10.21.1.175",
                         "10.20.37.135",
                         "10.21.1.238",
                         "10.21.2.33",
                         "10.21.1.177",
                         "10.20.37.22",
                         "10.20.37.20",
                         "10.21.2.32",
                         "10.20.36.95",
                         "10.21.1.240",
                         "10.20.36.98",
                         "10.21.1.10",
                         "10.21.1.183",
                         "10.20.37.120",
                         "10.20.37.125",
                         "10.21.1.53",
                         "10.21.1.59",
                         "10.20.37.121",
                         "10.21.1.169",
                         "10.21.1.172",
                         "10.20.37.122",
                         "10.21.2.41",
                         "10.21.1.168",
                         "10.20.36.94",
                         "10.21.2.36",
                         "10.20.36.83",
                         "10.21.1.241",
                         "10.20.37.144",
                         "10.21.2.34",
                         "10.21.1.57",
                         "10.21.1.60",
                         "10.21.2.35",
                         "10.20.37.116",
                         "10.20.37.153",
                         "10.21.1.171",
                         "10.20.37.34",
                         "10.21.1.54",
                         "10.21.1.178",
                         "10.20.37.57",
                         "10.20.37.157",
                         "10.21.1.170",
                         "10.20.37.54",
                         "10.20.37.134",
                         "10.20.37.23",
                         "10.20.37.166",
                         "10.20.37.169",
                         "10.21.2.39",
                         "10.21.1.16",
                         "10.20.36.97",
                         "10.20.37.58",
                         "10.21.1.179",
                         "10.21.1.167",
                         "10.20.37.37",
                         "10.20.37.30",
                         "10.21.2.45",
                         "10.20.37.47",
                         "10.20.37.45",
                         "10.20.37.28",
                         "10.21.1.15",
                         "10.20.37.161",
                         "10.20.37.118",
                         "10.20.37.60",
                         "10.20.37.123",
                         "10.21.1.14",
                         "10.21.1.181",
                         "10.20.37.41",
                         "10.20.37.143",
                         "10.21.2.42",
                         "10.21.2.30",
                         "10.20.37.139",
                         "10.20.37.35",
                         "10.21.1.49",
                         "10.20.37.148",
                         "10.20.37.38",
                         "10.20.36.96",
                         "10.20.37.162",
                         "10.20.37.29",
                         "10.21.1.12",
                         "10.20.37.119",
                         "10.20.37.32",
                         "10.20.37.124",
                         "10.20.37.152",
                         "10.20.37.170",
                         "10.20.37.147",
                         "10.20.37.48"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1018" {
   display_name = "TF-AG1-IPSET-EXT-Brazil-zCloud"
   nsx_id = "TF-AG1-IPSET-EXT-Brazil-zCloud"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.210.232.41-10.210.232.42",
                         "10.210.232.31-10.210.232.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1019" {
   display_name = "TF-AG1-IPSET-DR227-CPREM-1"
   nsx_id = "TF-AG1-IPSET-DR227-CPREM-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.23.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1020" {
   display_name = "TF-AG1-IPSET-dr112-ESG-vNic_1"
   nsx_id = "TF-AG1-IPSET-dr112-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.1.162"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1021" {
   display_name = "TF-AG1-IPSET-CA-HA-Proxy"
   nsx_id = "TF-AG1-IPSET-CA-HA-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1022" {
   display_name = "TF-AG1-IPSET-AG-SRES-NFS01"
   nsx_id = "TF-AG1-IPSET-AG-SRES-NFS01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.242.35"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1023" {
   display_name = "TF-AG1-IPSET-Pandora-EU-Prod"
   nsx_id = "TF-AG1-IPSET-Pandora-EU-Prod"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.151.238"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1024" {
   display_name = "TF-AG1-IPSET-HWSW-IBM-9-SERVERS-1"
   nsx_id = "TF-AG1-IPSET-HWSW-IBM-9-SERVERS-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.45.2.21",
                         "9.209.239.20",
                         "9.16.170.90",
                         "9.45.90.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1025" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-SVG-SIDT"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-SVG-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.42",
                         "158.87.49.37",
                         "158.87.49.62",
                         "158.87.49.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1026" {
   display_name = "TF-AG1-IPSET-MCMS_NetCool-IP"
   nsx_id = "TF-AG1-IPSET-MCMS_NetCool-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.116.0.92",
                         "172.27.16.0/24",
                         "52.117.46.44"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1027" {
   display_name = "TF-AG1-IPSET-SRES-LB-OCP-Cluster3-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-LB-OCP-Cluster3-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.2",
                         "158.87.48.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1028" {
   display_name = "TF-AG1-IPSET-STaaS-DR11-Storage-SVC"
   nsx_id = "TF-AG1-IPSET-STaaS-DR11-Storage-SVC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.10.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1029" {
   display_name = "TF-AG1-IPSET-agnsrlndvaweb01"
   nsx_id = "TF-AG1-IPSET-agnsrlndvaweb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.157"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1030" {
   display_name = "TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.102",
                         "100.71.244.4",
                         "158.87.49.230"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1031" {
   display_name = "TF-AG1-IPSET-Tanzu-Workload-04-Subnet"
   nsx_id = "TF-AG1-IPSET-Tanzu-Workload-04-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.242.96/27",
                         "100.71.242.246",
                         "158.87.50.44"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1032" {
   display_name = "TF-AG1-IPSET-HWSW-IBM-9-50000"
   nsx_id = "TF-AG1-IPSET-HWSW-IBM-9-50000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.63.9.142",
                         "9.178.216.156",
                         "9.209.239.20",
                         "9.209.238.98",
                         "9.45.2.21",
                         "9.209.228.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1033" {
   display_name = "TF-AG1-IPSET-CDI-AP-ProxyVIP"
   nsx_id = "TF-AG1-IPSET-CDI-AP-ProxyVIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.203.167"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1034" {
   display_name = "TF-AG1-IPSET-IP-Set-SG-SRES-OCP-Cluster07-NATIP"
   nsx_id = "TF-AG1-IPSET-IP-Set-SG-SRES-OCP-Cluster07-NATIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.3",
                         "100.71.244.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1035" {
   display_name = "TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster2-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-3SCALE-LB-OCP-Cluster2-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.2",
                         "158.87.48.176"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1036" {
   display_name = "TF-AG1-IPSET-IBM-Blue-database-connectivity"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-database-connectivity"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.16.170.90"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1037" {
   display_name = "TF-AG1-IPSET-RCP-RCP-Kafka"
   nsx_id = "TF-AG1-IPSET-RCP-RCP-Kafka"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.37.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1038" {
   display_name = "TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.121"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1039" {
   display_name = "TF-AG1-IPSET-NET-DR47-100-64-84-0-24"
   nsx_id = "TF-AG1-IPSET-NET-DR47-100-64-84-0-24"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.84.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1040" {
   display_name = "TF-AG1-IPSET-Host-bsnsupport-broadcom-com"
   nsx_id = "TF-AG1-IPSET-Host-bsnsupport-broadcom-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.19.232.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1041" {
   display_name = "TF-AG1-IPSET-DR204---CPREM---JH"
   nsx_id = "TF-AG1-IPSET-DR204---CPREM---JH"
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
resource "nsxt_policy_group" "grp_1042" {
   display_name = "TF-AG1-IPSET-MEaaS-IPM-Proxy"
   nsx_id = "TF-AG1-IPSET-MEaaS-IPM-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.60.217",
                         "100.64.68.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1043" {
   display_name = "TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers"
   nsx_id = "TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.150",
                         "10.65.60.222"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1044" {
   display_name = "TF-AG1-IPSET-Host-svcsupport-ssd-hursley-ibm-com"
   nsx_id = "TF-AG1-IPSET-Host-svcsupport-ssd-hursley-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.71.52.40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1045" {
   display_name = "TF-AG1-IPSET-DR162-STaaS-BNSF-Storage-Switch"
   nsx_id = "TF-AG1-IPSET-DR162-STaaS-BNSF-Storage-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.189.44.212",
                         "10.189.44.214",
                         "10.189.44.210",
                         "10.189.44.211",
                         "10.189.44.215",
                         "10.189.44.213"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1046" {
   display_name = "TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc"
   nsx_id = "TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1047" {
   display_name = "TF-AG1-IPSET-SL-NTP"
   nsx_id = "TF-AG1-IPSET-SL-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.0.77.54"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1048" {
   display_name = "TF-AG1-IPSET-DR47-10-190-20-188"
   nsx_id = "TF-AG1-IPSET-DR47-10-190-20-188"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.190.20.188"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1049" {
   display_name = "TF-AG1-IPSET-AP1-Tanzu-Workload-01-NAT"
   nsx_id = "TF-AG1-IPSET-AP1-Tanzu-Workload-01-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.67"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1050" {
   display_name = "TF-AG1-IPSET-INT-SVCS-PROD-DAL"
   nsx_id = "TF-AG1-IPSET-INT-SVCS-PROD-DAL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.22.99",
                         "158.87.22.73",
                         "158.87.22.71",
                         "158.87.35.218",
                         "158.87.22.72",
                         "158.87.22.69",
                         "158.87.22.88",
                         "158.87.22.95",
                         "158.87.22.101",
                         "158.87.22.68",
                         "158.87.22.100",
                         "158.87.22.70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1051" {
   display_name = "TF-AG1-IPSET-EITaaS-Jenkins"
   nsx_id = "TF-AG1-IPSET-EITaaS-Jenkins"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.173.122.44"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1052" {
   display_name = "TF-AG1-IPSET-NET-CNICC-Dow-Flex"
   nsx_id = "TF-AG1-IPSET-NET-CNICC-Dow-Flex"
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
resource "nsxt_policy_group" "grp_1053" {
   display_name = "TF-AG1-IPSET-Client-premise-JH-1-10"
   nsx_id = "TF-AG1-IPSET-Client-premise-JH-1-10"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.212.241.1",
                         "167.212.241.2",
                         "167.212.242.1",
                         "167.212.242.2",
                         "167.212.240.1",
                         "167.212.241.44",
                         "167.212.241.41",
                         "167.212.241.43",
                         "167.212.241.40",
                         "167.212.240.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1054" {
   display_name = "TF-AG1-IPSET-IBM-Blue-DNS"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.0.128.50",
                         "9.0.130.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1055" {
   display_name = "TF-AG1-IPSET-azure-devlab-OCP-Cluster06"
   nsx_id = "TF-AG1-IPSET-azure-devlab-OCP-Cluster06"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.124.65.64/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1056" {
   display_name = "TF-AG1-IPSET-eu1sr1icpb01"
   nsx_id = "TF-AG1-IPSET-eu1sr1icpb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1057" {
   display_name = "TF-AG1-IPSET-IBM-Blue-SMTP"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-SMTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.17.130.232-9.17.130.237",
                         "9.57.199.106-9.57.199.111"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1058" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.69.160.121-10.69.160.122",
                         "10.69.160.117-10.69.160.119",
                         "10.64.10.42-10.64.10.44",
                         "10.64.10.220",
                         "10.69.161.123-10.69.161.138",
                         "10.69.160.220",
                         "10.69.160.223",
                         "10.64.90.28-10.64.90.45",
                         "10.68.118.228",
                         "10.69.161.96-10.69.161.107",
                         "10.69.161.76-10.69.161.78",
                         "10.64.189.168-10.64.189.171",
                         "10.69.161.45-10.69.161.55",
                         "10.68.11.41-10.68.11.46",
                         "10.64.11.145-10.64.11.146",
                         "10.68.118.25-10.68.118.36",
                         "10.69.160.21-10.69.160.32",
                         "10.64.118.122-10.64.118.124",
                         "10.69.160.69-10.69.160.71",
                         "10.64.10.64",
                         "10.64.11.182",
                         "10.69.160.172-10.69.160.174",
                         "10.64.10.81",
                         "10.64.192.207-10.64.192.208",
                         "10.69.161.119-10.69.161.120",
                         "10.64.119.3",
                         "10.69.160.194-10.69.160.196",
                         "10.64.118.235-10.64.118.236",
                         "10.69.161.61-10.69.161.62",
                         "10.64.10.87",
                         "10.64.11.57",
                         "10.64.10.62",
                         "10.69.160.163-10.69.160.164",
                         "10.64.119.135-10.64.119.138",
                         "10.64.118.251-10.64.119.0",
                         "10.64.192.53-10.64.192.54",
                         "10.69.161.67-10.69.161.68",
                         "10.64.90.248-10.64.90.249",
                         "10.69.161.73-10.69.161.74",
                         "10.64.90.50-10.64.90.119",
                         "10.69.161.21-10.69.161.26",
                         "10.64.11.180",
                         "10.64.189.177-10.64.189.179",
                         "10.64.119.80-10.64.119.81",
                         "10.64.10.217-10.64.10.218",
                         "10.69.160.231-10.69.160.236",
                         "10.64.11.42-10.64.11.43",
                         "10.64.11.87",
                         "10.64.11.164",
                         "10.69.161.219",
                         "10.64.118.218",
                         "10.69.161.64-10.69.161.65",
                         "10.64.188.195",
                         "10.64.118.33-10.64.118.44",
                         "10.69.160.59-10.69.160.67",
                         "10.64.118.210-10.64.118.215",
                         "10.64.192.56-10.64.192.58",
                         "10.64.119.125-10.64.119.130",
                         "10.68.118.192",
                         "10.64.11.34",
                         "10.64.11.184",
                         "10.64.11.186",
                         "10.64.189.184-10.64.189.192",
                         "10.64.118.192-10.64.118.194",
                         "10.64.192.30-10.64.192.33",
                         "10.64.192.201",
                         "10.69.160.24-10.69.160.32",
                         "10.69.160.207-10.69.160.209",
                         "10.69.160.150-10.69.160.152",
                         "10.64.118.247-10.64.118.249",
                         "10.69.160.109-10.69.160.111",
                         "10.69.160.73-10.69.160.80",
                         "10.64.10.84",
                         "10.64.10.46-10.64.10.48",
                         "10.69.160.154",
                         "10.64.118.28-10.64.118.30",
                         "10.69.160.113-10.69.160.115",
                         "10.68.119.4-10.68.119.5",
                         "10.69.160.147",
                         "10.69.160.187",
                         "10.69.161.70-10.69.161.71",
                         "10.64.10.20",
                         "10.64.192.21",
                         "10.69.160.43-10.69.160.57",
                         "10.64.90.122-10.64.90.124",
                         "10.64.118.231-10.64.118.233",
                         "10.64.11.123-10.64.11.130",
                         "10.69.160.23",
                         "10.69.160.107",
                         "10.69.160.39-10.69.160.40",
                         "10.64.188.198-10.64.188.200",
                         "10.69.160.227-10.69.160.229",
                         "10.64.11.188",
                         "10.64.10.90",
                         "10.64.11.16",
                         "10.64.11.52-10.64.11.55",
                         "10.64.11.178",
                         "10.64.118.221-10.64.118.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1059" {
   display_name = "TF-AG1-IPSET-eu1srlpcardb1000"
   nsx_id = "TF-AG1-IPSET-eu1srlpcardb1000"
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
resource "nsxt_policy_group" "grp_1060" {
   display_name = "TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr2"
   nsx_id = "TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.199"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1061" {
   display_name = "TF-AG1-IPSET-Brazil-Maximo-Shared-Dev-QA"
   nsx_id = "TF-AG1-IPSET-Brazil-Maximo-Shared-Dev-QA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.183.39/32",
                         "158.98.183.54/32",
                         "158.98.183.40/32",
                         "158.98.183.53/32",
                         "158.98.183.213/32",
                         "158.98.183.41/32",
                         "158.98.183.38/32",
                         "158.98.183.11/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1062" {
   display_name = "TF-AG1-IPSET-Host-blueidp1-boulder-ibm-com"
   nsx_id = "TF-AG1-IPSET-Host-blueidp1-boulder-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.63.40.251"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1063" {
   display_name = "TF-AG1-IPSET-STaaS-DR234-Storage-A9000-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR234-Storage-A9000-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.238.44.11",
                         "10.214.1.17",
                         "10.214.1.28",
                         "10.238.44.9",
                         "10.214.1.21",
                         "10.238.44.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1064" {
   display_name = "TF-AG1-IPSET-smtp-sendgrid-net"
   nsx_id = "TF-AG1-IPSET-smtp-sendgrid-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.0.0.0/13",
                         "54.144.0.0/14",
                         "167.89.123.82",
                         "108.168.183.160",
                         "167.89.123.58",
                         "169.38.103.39",
                         "54.156.0.0/14",
                         "44.239.172.8",
                         "167.89.118.51",
                         "169.45.113.201",
                         "167.89.115.79",
                         "52.0.142.242",
                         "169.47.148.162",
                         "3.212.77.9",
                         "167.89.115.116",
                         "167.89.123.95",
                         "54.209.9.105",
                         "34.224.0.0/12",
                         "167.89.123.97",
                         "35.171.120.36",
                         "3.234.124.254",
                         "167.89.115.117",
                         "107.20.8.136",
                         "167.89.115.53",
                         "167.89.118.58",
                         "161.202.148.182",
                         "167.89.123.53",
                         "54.157.14.6",
                         "34.237.250.201",
                         "167.89.0.0/17",
                         "169.38.103.42",
                         "167.89.115.18",
                         "161.202.148.179",
                         "169.47.155.6",
                         "107.20.0.0/14",
                         "176.223.96.14",
                         "169.47.148.173",
                         "54.160.61.157",
                         "52.89.19.245"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1065" {
   display_name = "TF-AG1-IPSET-NSXT-SRES-OCP-Cluster05-SNAT"
   nsx_id = "TF-AG1-IPSET-NSXT-SRES-OCP-Cluster05-SNAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.64/26",
                         "158.87.48.108"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1066" {
   display_name = "TF-AG1-IPSET-pdr-esg01-lb-vip-2"
   nsx_id = "TF-AG1-IPSET-pdr-esg01-lb-vip-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.63.82.254"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1067" {
   display_name = "TF-AG1-IPSET-DRIAMAASTHY4-Customer2-UNIX-EP"
   nsx_id = "TF-AG1-IPSET-DRIAMAASTHY4-Customer2-UNIX-EP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.186.94.224"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1068" {
   display_name = "TF-AG1-IPSET-NET-MSS-Qradar-Console"
   nsx_id = "TF-AG1-IPSET-NET-MSS-Qradar-Console"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "206.253.234.192/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1069" {
   display_name = "TF-AG1-IPSET-STaaS-DR65-IBM-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR65-IBM-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.49.124.128/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1070" {
   display_name = "TF-AG1-IPSET-Tanzu-Workload-03-HOST"
   nsx_id = "TF-AG1-IPSET-Tanzu-Workload-03-HOST"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.45"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1071" {
   display_name = "TF-AG1-IPSET-UAT-Integration"
   nsx_id = "TF-AG1-IPSET-UAT-Integration"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1072" {
   display_name = "TF-AG1-IPSET-DR162-CPREM-NETCOOL-DEV"
   nsx_id = "TF-AG1-IPSET-DR162-CPREM-NETCOOL-DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.170.160.79"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1073" {
   display_name = "TF-AG1-IPSET-ESLS3-UAT1-5"
   nsx_id = "TF-AG1-IPSET-ESLS3-UAT1-5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.184.90-146.89.184.94"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1074" {
   display_name = "TF-AG1-IPSET-HWSW-Blue"
   nsx_id = "TF-AG1-IPSET-HWSW-Blue"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.63.66.29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1075" {
   display_name = "TF-AG1-IPSET-Mexico-GDL-UAT"
   nsx_id = "TF-AG1-IPSET-Mexico-GDL-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.60.16",
                         "10.15.5.13",
                         "15.128.86.29",
                         "15.128.86.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1076" {
   display_name = "TF-AG1-IPSET-NET-MSS-Qradar-Nextwatch"
   nsx_id = "TF-AG1-IPSET-NET-MSS-Qradar-Nextwatch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "209.134.187.8/29",
                         "209.134.187.16/29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1077" {
   display_name = "TF-AG1-IPSET-GACDW-AP"
   nsx_id = "TF-AG1-IPSET-GACDW-AP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.203.170"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1078" {
   display_name = "TF-AG1-IPSET-SL-DNS"
   nsx_id = "TF-AG1-IPSET-SL-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.0.80.11",
                         "10.0.80.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1079" {
   display_name = "TF-AG1-IPSET-STaaS-DR100-Storage-FS9150-PDC"
   nsx_id = "TF-AG1-IPSET-STaaS-DR100-Storage-FS9150-PDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.117.43.183-167.117.43.248",
                         "167.117.43.138-167.117.43.146",
                         "10.8.192.10-10.8.192.18",
                         "167.117.43.132-167.117.43.134"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1080" {
   display_name = "TF-AG1-IPSET-DR224-Cprem-BDS"
   nsx_id = "TF-AG1-IPSET-DR224-Cprem-BDS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.246.255.56",
                         "10.246.255.138"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1081" {
   display_name = "TF-AG1-IPSET-DR217-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR217-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.128.35",
                         "192.168.192.35"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1082" {
   display_name = "TF-AG1-IPSET-NET-sla-p-na-share-rcp"
   nsx_id = "TF-AG1-IPSET-NET-sla-p-na-share-rcp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.34.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1083" {
   display_name = "TF-AG1-IPSET-NSXT-ag1nsxt-vc-ag1"
   nsx_id = "TF-AG1-IPSET-NSXT-ag1nsxt-vc-ag1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.196"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1084" {
   display_name = "TF-AG1-IPSET-vpc-10-csc-subnet1-nat"
   nsx_id = "TF-AG1-IPSET-vpc-10-csc-subnet1-nat"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.51.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1085" {
   display_name = "TF-AG1-IPSET-HWSW-secure-file-service"
   nsx_id = "TF-AG1-IPSET-HWSW-secure-file-service"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.38.79.44"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1086" {
   display_name = "TF-AG1-IPSET-DR192-LB-VIP1-NAT3"
   nsx_id = "TF-AG1-IPSET-DR192-LB-VIP1-NAT3"
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
resource "nsxt_policy_group" "grp_1087" {
   display_name = "TF-AG1-IPSET-DR211-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR211-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.16.15.131",
                         "10.17.240.97"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1088" {
   display_name = "TF-AG1-IPSET-UAT-US"
   nsx_id = "TF-AG1-IPSET-UAT-US"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.102"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1089" {
   display_name = "TF-AG1-IPSET-NET-IBM-Blue"
   nsx_id = "TF-AG1-IPSET-NET-IBM-Blue"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.0.0.0/8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1090" {
   display_name = "TF-AG1-IPSET-PDR-ICP-agnplicp1"
   nsx_id = "TF-AG1-IPSET-PDR-ICP-agnplicp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.69.43/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1091" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-446"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-446"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.63.66.100",
                         "9.149.87.157"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1092" {
   display_name = "TF-AG1-IPSET-agnsrwndvaapp02"
   nsx_id = "TF-AG1-IPSET-agnsrwndvaapp02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.154"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1093" {
   display_name = "TF-AG1-IPSET-Host-bsnacc-broadcom-com"
   nsx_id = "TF-AG1-IPSET-Host-bsnacc-broadcom-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.146.127.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1094" {
   display_name = "TF-AG1-IPSET-IRES-uswhpsl1dcr1-NAT"
   nsx_id = "TF-AG1-IPSET-IRES-uswhpsl1dcr1-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.134"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1095" {
   display_name = "TF-AG1-IPSET-EU1-nlaspdb000m1erms"
   nsx_id = "TF-AG1-IPSET-EU1-nlaspdb000m1erms"
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
resource "nsxt_policy_group" "grp_1096" {
   display_name = "TF-AG1-IPSET-AIOps-Proxy-WDC"
   nsx_id = "TF-AG1-IPSET-AIOps-Proxy-WDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.104.141",
                         "146.89.104.142",
                         "146.89.104.143"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1097" {
   display_name = "TF-AG1-IPSET-DR227-ESG-vpn-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR227-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.210"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1098" {
   display_name = "TF-AG1-IPSET-SRES-LB-OCP-Cluster5-VIP-1"
   nsx_id = "TF-AG1-IPSET-SRES-LB-OCP-Cluster5-VIP-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1099" {
   display_name = "TF-AG1-IPSET-DR201-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR201-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.164.65.114",
                         "10.164.65.115"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1100" {
   display_name = "TF-AG1-IPSET-atl-prod-vault-proxy-virt-x-force-red-com"
   nsx_id = "TF-AG1-IPSET-atl-prod-vault-proxy-virt-x-force-red-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "12.181.65.157"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1101" {
   display_name = "TF-AG1-IPSET-HWSW-IBM-9-SERVERS-3"
   nsx_id = "TF-AG1-IPSET-HWSW-IBM-9-SERVERS-3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.228.88",
                         "9.209.228.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1102" {
   display_name = "TF-AG1-IPSET-DR59-ESG-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR59-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.0.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1103" {
   display_name = "TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.6",
                         "158.87.50.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1104" {
   display_name = "TF-AG1-IPSET-DR224-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR224-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.188.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1105" {
   display_name = "TF-AG1-IPSET-Brazil-Shared-Netcool---GSMAListener"
   nsx_id = "TF-AG1-IPSET-Brazil-Shared-Netcool---GSMAListener"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.84.141",
                         "158.87.84.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1106" {
   display_name = "TF-AG1-IPSET-DR162-VRA-FTW"
   nsx_id = "TF-AG1-IPSET-DR162-VRA-FTW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "170.49.34.36"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1107" {
   display_name = "TF-AG1-IPSET-NAT-meaas-noi-inn6y-nco"
   nsx_id = "TF-AG1-IPSET-NAT-meaas-noi-inn6y-nco"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.82"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1108" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-PROXY-POC-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-PROXY-POC-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1109" {
   display_name = "TF-AG1-IPSET-CNICC-AO-wash6-dev-lab2"
   nsx_id = "TF-AG1-IPSET-CNICC-AO-wash6-dev-lab2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.63.139.37"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1110" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-59000"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-59000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.214.96.143"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1111" {
   display_name = "TF-AG1-IPSET-NET-ICp-Pod-Network"
   nsx_id = "TF-AG1-IPSET-NET-ICp-Pod-Network"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.127.0.0/17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1112" {
   display_name = "TF-AG1-IPSET-Pandora-EU-UAT"
   nsx_id = "TF-AG1-IPSET-Pandora-EU-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.151.239"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1113" {
   display_name = "TF-AG1-IPSET-ppywdcmalmt01"
   nsx_id = "TF-AG1-IPSET-ppywdcmalmt01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.240.114"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1114" {
   display_name = "TF-AG1-IPSET-DR227-CPREM-4"
   nsx_id = "TF-AG1-IPSET-DR227-CPREM-4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.23.244"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1115" {
   display_name = "TF-AG1-IPSET-KAFKA-PROD02-MESSAGEHUB"
   nsx_id = "TF-AG1-IPSET-KAFKA-PROD02-MESSAGEHUB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.60.0.116",
                         "169.60.0.119",
                         "169.60.0.117",
                         "169.60.0.120",
                         "169.60.0.118"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1116" {
   display_name = "TF-AG1-IPSET-dr112-ESG-vNic_2"
   nsx_id = "TF-AG1-IPSET-dr112-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.1.169"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1117" {
   display_name = "TF-AG1-IPSET-Tanzu-Workload-04-HOST"
   nsx_id = "TF-AG1-IPSET-Tanzu-Workload-04-HOST"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.44"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1118" {
   display_name = "TF-AG1-IPSET-IMI-Solarwinds"
   nsx_id = "TF-AG1-IPSET-IMI-Solarwinds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.155.15-169.62.155.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1119" {
   display_name = "TF-AG1-IPSET-IRES-JUMP02"
   nsx_id = "TF-AG1-IPSET-IRES-JUMP02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.139"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1120" {
   display_name = "TF-AG1-IPSET-DR158-CPREM-NETCOOL-PROD-PRI"
   nsx_id = "TF-AG1-IPSET-DR158-CPREM-NETCOOL-PROD-PRI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "216.99.78.189"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1121" {
   display_name = "TF-AG1-IPSET-STaaS-DR100-Storage-FS9150-NDC"
   nsx_id = "TF-AG1-IPSET-STaaS-DR100-Storage-FS9150-NDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.8.192.10-10.8.192.18",
                         "167.117.43.129-167.117.43.131",
                         "167.117.43.150-167.117.43.155"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1122" {
   display_name = "TF-AG1-IPSET-STaaS-DR1-FS5200"
   nsx_id = "TF-AG1-IPSET-STaaS-DR1-FS5200"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "125.156.103.30-125.156.103.33",
                         "125.157.103.30-125.157.103.33"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1123" {
   display_name = "TF-AG1-IPSET-ag1sr1lniamprxy-vip"
   nsx_id = "TF-AG1-IPSET-ag1sr1lniamprxy-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1124" {
   display_name = "TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool1"
   nsx_id = "TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.23.55"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1125" {
   display_name = "TF-AG1-IPSET-ucdeploy6-swg-devops-com"
   nsx_id = "TF-AG1-IPSET-ucdeploy6-swg-devops-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.208.15.128"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1126" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1127" {
   display_name = "TF-AG1-IPSET-DR278-CPREM-JH-1"
   nsx_id = "TF-AG1-IPSET-DR278-CPREM-JH-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "198.99.40.92",
                         "198.50.74.81",
                         "10.130.164.92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1128" {
   display_name = "TF-AG1-IPSET-meaas-noi-inn6y-nc-Servers"
   nsx_id = "TF-AG1-IPSET-meaas-noi-inn6y-nc-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.220",
                         "10.175.14.167",
                         "158.87.159.92",
                         "158.87.159.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1129" {
   display_name = "TF-AG1-IPSET-Tanzu-WorkLoad03-New-NAT"
   nsx_id = "TF-AG1-IPSET-Tanzu-WorkLoad03-New-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.242.249",
                         "158.87.50.46",
                         "100.71.242.250"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1130" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-60084"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-60084"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.17.129.89"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1131" {
   display_name = "TF-AG1-IPSET-dr112-ESG-vNic_0"
   nsx_id = "TF-AG1-IPSET-dr112-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1132" {
   display_name = "TF-AG1-IPSET-DR227-LB-VIP1"
   nsx_id = "TF-AG1-IPSET-DR227-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.241",
                         "100.64.191.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1133" {
   display_name = "TF-AG1-IPSET-ag1h1lpta2hap-vip"
   nsx_id = "TF-AG1-IPSET-ag1h1lpta2hap-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1134" {
   display_name = "TF-AG1-IPSET-NA-HST-uswhpni001allra"
   nsx_id = "TF-AG1-IPSET-NA-HST-uswhpni001allra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.254.36.165",
                         "169.254.36.194",
                         "100.124.0.128/26",
                         "158.87.36.128/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1135" {
   display_name = "TF-AG1-IPSET-DR192-LB-VIP4"
   nsx_id = "TF-AG1-IPSET-DR192-LB-VIP4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.165.244"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1136" {
   display_name = "TF-AG1-IPSET-AMS-Netcool-OMNIbus"
   nsx_id = "TF-AG1-IPSET-AMS-Netcool-OMNIbus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.68.131",
                         "100.72.68.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1137" {
   display_name = "TF-AG1-IPSET-NET-EU-SRES-RPA-2"
   nsx_id = "TF-AG1-IPSET-NET-EU-SRES-RPA-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.244.0/22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1138" {
   display_name = "TF-AG1-IPSET-pdr-esg01-lb-vip-6"
   nsx_id = "TF-AG1-IPSET-pdr-esg01-lb-vip-6"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "150.239.66.139"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1139" {
   display_name = "TF-AG1-IPSET-STaaS-DR147-CISCO-FCIP-Switches"
   nsx_id = "TF-AG1-IPSET-STaaS-DR147-CISCO-FCIP-Switches"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.100.19.105-10.100.19.106",
                         "10.40.64.131-10.40.64.132",
                         "10.101.69.62-10.101.69.63"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1140" {
   display_name = "TF-AG1-IPSET-CDI-AP-ProxyServers"
   nsx_id = "TF-AG1-IPSET-CDI-AP-ProxyServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.203.165",
                         "146.89.203.166"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1141" {
   display_name = "TF-AG1-IPSET-STaaS-DR77-Storage-NetApp"
   nsx_id = "TF-AG1-IPSET-STaaS-DR77-Storage-NetApp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "150.172.220.139",
                         "150.172.220.131",
                         "150.172.177.87",
                         "150.172.220.137",
                         "150.172.177.89",
                         "150.172.220.130",
                         "150.172.220.138",
                         "150.172.177.78",
                         "150.172.177.88",
                         "150.172.177.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1142" {
   display_name = "TF-AG1-IPSET-DR40-CPREM-fctdbb01"
   nsx_id = "TF-AG1-IPSET-DR40-CPREM-fctdbb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "163.241.205.237"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1143" {
   display_name = "TF-AG1-IPSET-IKS-platform-non-prod2-priv-ingress-alb"
   nsx_id = "TF-AG1-IPSET-IKS-platform-non-prod2-priv-ingress-alb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.196.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1144" {
   display_name = "TF-AG1-IPSET-EU-SRES-LB"
   nsx_id = "TF-AG1-IPSET-EU-SRES-LB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.139"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1145" {
   display_name = "TF-AG1-IPSET-eu1sr1wphwcetl"
   nsx_id = "TF-AG1-IPSET-eu1sr1wphwcetl"
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
resource "nsxt_policy_group" "grp_1146" {
   display_name = "TF-AG1-IPSET-ag1d124lpcacpr-vip"
   nsx_id = "TF-AG1-IPSET-ag1d124lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.126.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1147" {
   display_name = "TF-AG1-IPSET-NET-CPREM-GSNI-NAT-Range"
   nsx_id = "TF-AG1-IPSET-NET-CPREM-GSNI-NAT-Range"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1148" {
   display_name = "TF-AG1-IPSET-w3-gdportal-am2-extnet-ibm-com"
   nsx_id = "TF-AG1-IPSET-w3-gdportal-am2-extnet-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.23.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1149" {
   display_name = "TF-AG1-IPSET-Blue-dev-aiops-elk"
   nsx_id = "TF-AG1-IPSET-Blue-dev-aiops-elk"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.208.58.49"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1150" {
   display_name = "TF-AG1-IPSET-DR180-ESG-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR180-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.2.169"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1151" {
   display_name = "TF-AG1-IPSET-Fortigate"
   nsx_id = "TF-AG1-IPSET-Fortigate"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.63.82.225",
                         "150.239.66.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1152" {
   display_name = "TF-AG1-IPSET-NET-PDR-Talos"
   nsx_id = "TF-AG1-IPSET-NET-PDR-Talos"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.254.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1153" {
   display_name = "TF-AG1-IPSET-IRES-NAT-ag1sr1staas2"
   nsx_id = "TF-AG1-IPSET-IRES-NAT-ag1sr1staas2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.169"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1154" {
   display_name = "TF-AG1-IPSET-DR278-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR278-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "7.127.244.236",
                         "7.127.244.240",
                         "7.127.244.234",
                         "7.127.244.239",
                         "7.127.244.235",
                         "7.127.244.237",
                         "7.127.244.238"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1155" {
   display_name = "TF-AG1-IPSET-ag1h1lpta1ssh1"
   nsx_id = "TF-AG1-IPSET-ag1h1lpta1ssh1"
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
resource "nsxt_policy_group" "grp_1156" {
   display_name = "TF-AG1-IPSET-STaaS-DR100-Storage-FS9150-SDC"
   nsx_id = "TF-AG1-IPSET-STaaS-DR100-Storage-FS9150-SDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.117.43.162-167.117.43.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1157" {
   display_name = "TF-AG1-IPSET-DR196-LB-VIP1"
   nsx_id = "TF-AG1-IPSET-DR196-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.167.254"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1158" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-REMEDY-DEV"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-REMEDY-DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "152.144.129.58"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1159" {
   display_name = "TF-AG1-IPSET-EU1-SG-SRES-OCP5-Cluster-MOM"
   nsx_id = "TF-AG1-IPSET-EU1-SG-SRES-OCP5-Cluster-MOM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.232.4",
                         "158.87.50.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1160" {
   display_name = "TF-AG1-IPSET-Tanzu-Workload-01-Host"
   nsx_id = "TF-AG1-IPSET-Tanzu-Workload-01-Host"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1161" {
   display_name = "TF-AG1-IPSET-STaaS-DR147-Storage-FS7200"
   nsx_id = "TF-AG1-IPSET-STaaS-DR147-Storage-FS7200"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.101.69.64-10.101.69.66",
                         "10.100.19.107-10.100.19.109",
                         "10.40.64.133-10.40.64.135"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1162" {
   display_name = "TF-AG1-IPSET-Host-Customer-CVL-JH"
   nsx_id = "TF-AG1-IPSET-Host-Customer-CVL-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.88.31.43",
                         "10.88.31.44"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1163" {
   display_name = "TF-AG1-IPSET-STaaS-DR237-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR237-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.34.100.62",
                         "10.43.100.62",
                         "10.43.100.61",
                         "10.34.100.61"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1164" {
   display_name = "TF-AG1-IPSET-Storage-GSE-Lab"
   nsx_id = "TF-AG1-IPSET-Storage-GSE-Lab"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.11.44.209"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1165" {
   display_name = "TF-AG1-IPSET-IAM-THY-UAT-GTSID-TOOL"
   nsx_id = "TF-AG1-IPSET-IAM-THY-UAT-GTSID-TOOL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1166" {
   display_name = "TF-AG1-IPSET-STaaS-DR162-Storage-Switch-Ft-Worth"
   nsx_id = "TF-AG1-IPSET-STaaS-DR162-Storage-Switch-Ft-Worth"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.189.44.200-10.189.44.215"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1167" {
   display_name = "TF-AG1-IPSET-DR285-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR285-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "207.131.204.54",
                         "207.131.204.92",
                         "207.131.204.93",
                         "207.131.204.99",
                         "207.131.204.53"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1168" {
   display_name = "TF-AG1-IPSET-NA-AIOPS"
   nsx_id = "TF-AG1-IPSET-NA-AIOPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.123.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1169" {
   display_name = "TF-AG1-IPSET-DRIAMAASTHY3-Customer1-Windows-EP"
   nsx_id = "TF-AG1-IPSET-DRIAMAASTHY3-Customer1-Windows-EP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.186.94.222"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1170" {
   display_name = "TF-AG1-IPSET-DR40-CPREM-edidbb11"
   nsx_id = "TF-AG1-IPSET-DR40-CPREM-edidbb11"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.107.67.205"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1171" {
   display_name = "TF-AG1-IPSET-Tanzu-Workload-01-Subnet"
   nsx_id = "TF-AG1-IPSET-Tanzu-Workload-01-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.242.0/27",
                         "158.87.50.43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1172" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-internet"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-internet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.228.115",
                         "125.56.199.41",
                         "23.77.16.97",
                         "185.235.236.201",
                         "146.89.104.148",
                         "103.116.4.201",
                         "185.235.236.197",
                         "65.9.83.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1173" {
   display_name = "TF-AG1-IPSET-NET-STF-Replication"
   nsx_id = "TF-AG1-IPSET-NET-STF-Replication"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.212.6.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1174" {
   display_name = "TF-AG1-IPSET-STaaS-DR11-Storage---V5000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR11-Storage---V5000"
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
resource "nsxt_policy_group" "grp_1175" {
   display_name = "TF-AG1-IPSET-NET-WDC-CGN-subnets"
   nsx_id = "TF-AG1-IPSET-NET-WDC-CGN-subnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.0.0/13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1176" {
   display_name = "TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP"
   nsx_id = "TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1177" {
   display_name = "TF-AG1-IPSET-DR112-Cprem-nmfdcrweb008025"
   nsx_id = "TF-AG1-IPSET-DR112-Cprem-nmfdcrweb008025"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.29.8.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1178" {
   display_name = "TF-AG1-IPSET-MCMS_NetCool-IP-2"
   nsx_id = "TF-AG1-IPSET-MCMS_NetCool-IP-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.116.0.80",
                         "52.117.46.44",
                         "10.121.230.179",
                         "172.27.16.56",
                         "172.27.16.57",
                         "52.116.0.81"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1179" {
   display_name = "TF-AG1-IPSET-MSS-Syslog"
   nsx_id = "TF-AG1-IPSET-MSS-Syslog"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "150.239.66.138",
                         "209.134.187.181/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1180" {
   display_name = "TF-AG1-IPSET-CDI-EU-Proxy"
   nsx_id = "TF-AG1-IPSET-CDI-EU-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1181" {
   display_name = "TF-AG1-IPSET-ag1d160lpprx--VIP"
   nsx_id = "TF-AG1-IPSET-ag1d160lpprx--VIP"
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
resource "nsxt_policy_group" "grp_1182" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-50012"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-50012"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.57.199.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1183" {
   display_name = "TF-AG1-IPSET-STaaS-DR237-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR237-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.43.100.52",
                         "10.34.100.62",
                         "10.34.100.52",
                         "10.34.100.61",
                         "10.34.100.51",
                         "10.34.100.50",
                         "10.43.100.51",
                         "10.43.100.62",
                         "10.43.100.61",
                         "10.43.100.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1184" {
   display_name = "TF-AG1-IPSET-test-oc4q5-omnibus"
   nsx_id = "TF-AG1-IPSET-test-oc4q5-omnibus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1185" {
   display_name = "TF-AG1-IPSET-ESLS4-UAT1-5"
   nsx_id = "TF-AG1-IPSET-ESLS4-UAT1-5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.205-146.89.187.209"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1186" {
   display_name = "TF-AG1-IPSET-ag1sr1wjmp01-dnat"
   nsx_id = "TF-AG1-IPSET-ag1sr1wjmp01-dnat"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.160"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1187" {
   display_name = "TF-AG1-IPSET-NET-NSXT-OCP07-NAT-VIP"
   nsx_id = "TF-AG1-IPSET-NET-NSXT-OCP07-NAT-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.3",
                         "100.71.244.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1188" {
   display_name = "TF-AG1-IPSET-DR192-LB-VIP1"
   nsx_id = "TF-AG1-IPSET-DR192-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.165.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1189" {
   display_name = "TF-AG1-IPSET-SRES-NA-GR-SharedNetcool1"
   nsx_id = "TF-AG1-IPSET-SRES-NA-GR-SharedNetcool1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.23.109"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1190" {
   display_name = "TF-AG1-IPSET-DR158-CPREM-JHOSTS"
   nsx_id = "TF-AG1-IPSET-DR158-CPREM-JHOSTS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "163.198.219.148",
                         "163.198.218.36",
                         "163.198.218.189",
                         "165.216.57.35",
                         "143.219.220.43",
                         "165.216.57.33"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1191" {
   display_name = "TF-AG1-IPSET-test-6zr58-impact"
   nsx_id = "TF-AG1-IPSET-test-6zr58-impact"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.240",
                         "158.87.159.112"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1192" {
   display_name = "TF-AG1-IPSET-DR162-ESG-vpn-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR162-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.2.114"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1193" {
   display_name = "TF-AG1-IPSET-STaaS-DR53-IBM_XIV_A9K"
   nsx_id = "TF-AG1-IPSET-STaaS-DR53-IBM_XIV_A9K"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.21.1.250",
                         "10.21.1.119",
                         "10.20.37.110",
                         "10.20.36.42",
                         "10.21.2.100",
                         "10.21.1.82",
                         "10.20.37.111",
                         "10.21.2.53",
                         "10.21.2.105",
                         "10.20.36.137",
                         "10.20.36.143",
                         "10.21.2.50",
                         "10.20.36.247",
                         "10.20.36.138",
                         "10.20.36.43",
                         "10.21.2.51",
                         "10.20.36.139",
                         "10.20.36.90",
                         "10.20.36.44",
                         "10.21.1.8",
                         "10.20.36.92",
                         "10.21.2.110",
                         "10.21.2.107",
                         "10.20.36.147",
                         "10.20.36.144",
                         "10.21.2.49",
                         "10.21.2.52",
                         "10.21.2.108",
                         "10.20.36.248",
                         "10.20.36.146",
                         "10.21.2.102",
                         "10.21.2.109",
                         "10.21.2.101",
                         "10.20.36.145",
                         "10.21.1.7",
                         "10.20.37.112",
                         "10.21.1.83",
                         "10.21.2.106",
                         "10.20.36.91",
                         "10.21.2.103",
                         "10.21.2.104",
                         "10.21.2.48",
                         "10.21.2.111",
                         "10.21.1.62",
                         "10.20.36.148",
                         "10.21.1.253",
                         "10.21.1.84",
                         "10.20.36.246"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1194" {
   display_name = "TF-AG1-IPSET-SRES01-OCP-Cluster02_46_TEMP"
   nsx_id = "TF-AG1-IPSET-SRES01-OCP-Cluster02_46_TEMP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.232"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1195" {
   display_name = "TF-AG1-IPSET-EU-SRES01-OCP-Cluster01-VIP"
   nsx_id = "TF-AG1-IPSET-EU-SRES01-OCP-Cluster01-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.165"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1196" {
   display_name = "TF-AG1-IPSET-NET-CPREM-DR162-NAT-Range"
   nsx_id = "TF-AG1-IPSET-NET-CPREM-DR162-NAT-Range"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.102.145.0/24",
                         "10.103.143.0/24",
                         "10.102.45.0/24",
                         "10.103.43.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1197" {
   display_name = "TF-AG1-IPSET-EU1-eu1srwdhwcgrfds"
   nsx_id = "TF-AG1-IPSET-EU1-eu1srwdhwcgrfds"
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
resource "nsxt_policy_group" "grp_1198" {
   display_name = "TF-AG1-IPSET-HCMS-DevOps"
   nsx_id = "TF-AG1-IPSET-HCMS-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.154.15.0/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1199" {
   display_name = "TF-AG1-IPSET-Host-ag1d162LPDRbg2"
   nsx_id = "TF-AG1-IPSET-Host-ag1d162LPDRbg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.64.146.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1200" {
   display_name = "TF-AG1-IPSET-DANA-OVPN-SSHProxy-158-87-31-101"
   nsx_id = "TF-AG1-IPSET-DANA-OVPN-SSHProxy-158-87-31-101"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.31.111",
                         "158.87.31.101"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1201" {
   display_name = "TF-AG1-IPSET-STaaS-DR71-Storage-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR71-Storage-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.206.16.20-10.206.16.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1202" {
   display_name = "TF-AG1-IPSET-test-rdszz-omnibus"
   nsx_id = "TF-AG1-IPSET-test-rdszz-omnibus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.221"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1203" {
   display_name = "TF-AG1-IPSET-DR227-CPREM-2"
   nsx_id = "TF-AG1-IPSET-DR227-CPREM-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.23.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1204" {
   display_name = "TF-AG1-IPSET-Host-DR162-CACF-Ft-Worth-Client-premise-JH"
   nsx_id = "TF-AG1-IPSET-Host-DR162-CACF-Ft-Worth-Client-premise-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.102.45.1",
                         "10.102.145.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1205" {
   display_name = "TF-AG1-IPSET-DR196-ESG-dlr-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR196-ESG-dlr-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1206" {
   display_name = "TF-AG1-IPSET-DR40-CPREM-ctmdbb01"
   nsx_id = "TF-AG1-IPSET-DR40-CPREM-ctmdbb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "163.241.205.197"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1207" {
   display_name = "TF-AG1-IPSET-NET-SL-IRES-Portable"
   nsx_id = "TF-AG1-IPSET-NET-SL-IRES-Portable"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1208" {
   display_name = "TF-AG1-IPSET-DR180-LB-VIP1"
   nsx_id = "TF-AG1-IPSET-DR180-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.153.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1209" {
   display_name = "TF-AG1-IPSET-MnE-Dev-meaas01-o4mpw-webgui"
   nsx_id = "TF-AG1-IPSET-MnE-Dev-meaas01-o4mpw-webgui"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1210" {
   display_name = "TF-AG1-IPSET-CDI-GTSCDI-EU-Proxy02"
   nsx_id = "TF-AG1-IPSET-CDI-GTSCDI-EU-Proxy02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1211" {
   display_name = "TF-AG1-IPSET-MCMS_SH-JH"
   nsx_id = "TF-AG1-IPSET-MCMS_SH-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.53.35.198",
                         "169.53.35.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1212" {
   display_name = "TF-AG1-IPSET-SL-SNMP-Proxy"
   nsx_id = "TF-AG1-IPSET-SL-SNMP-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.3.131.154"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1213" {
   display_name = "TF-AG1-IPSET-DRES259-CACF-VIP"
   nsx_id = "TF-AG1-IPSET-DRES259-CACF-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.200.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1214" {
   display_name = "TF-AG1-IPSET-ag1d116lpcacpr-vip"
   nsx_id = "TF-AG1-IPSET-ag1d116lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.122.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1215" {
   display_name = "TF-AG1-IPSET-AMS-UCD-Relay"
   nsx_id = "TF-AG1-IPSET-AMS-UCD-Relay"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.68.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1216" {
   display_name = "TF-AG1-IPSET-DR40-CPREM-ctmdbp22"
   nsx_id = "TF-AG1-IPSET-DR40-CPREM-ctmdbp22"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "163.241.195.71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1217" {
   display_name = "TF-AG1-IPSET-STaaS-DR147-Storage-New"
   nsx_id = "TF-AG1-IPSET-STaaS-DR147-Storage-New"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.40.64.153-10.40.64.157",
                         "10.100.19.166-10.100.19.170",
                         "10.40.64.158-10.40.64.160",
                         "10.100.19.171-10.100.19.173",
                         "10.101.69.96-10.101.69.99",
                         "10.101.69.100-10.101.69.103"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1218" {
   display_name = "TF-AG1-IPSET-CACF-CANADA"
   nsx_id = "TF-AG1-IPSET-CACF-CANADA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1219" {
   display_name = "TF-AG1-IPSET-Sendgrid"
   nsx_id = "TF-AG1-IPSET-Sendgrid"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "108.168.183.160",
                         "167.89.123.53",
                         "167.89.115.53"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1220" {
   display_name = "TF-AG1-IPSET-HWSW-Prod-DB1-INTERNET"
   nsx_id = "TF-AG1-IPSET-HWSW-Prod-DB1-INTERNET"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.104.148",
                         "146.89.104.143"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1221" {
   display_name = "TF-AG1-IPSET-DR158-CPREM-NETCOOL-189"
   nsx_id = "TF-AG1-IPSET-DR158-CPREM-NETCOOL-189"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "216.99.78.189"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1222" {
   display_name = "TF-AG1-IPSET-NET-AMS-SRES-subnet"
   nsx_id = "TF-AG1-IPSET-NET-AMS-SRES-subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.0/23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1223" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-UAT-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-UAT-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.82"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1224" {
   display_name = "TF-AG1-IPSET-AMS-eu1sr1sepm1"
   nsx_id = "TF-AG1-IPSET-AMS-eu1sr1sepm1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1225" {
   display_name = "TF-AG1-IPSET-STaaS-DR53-A9K"
   nsx_id = "TF-AG1-IPSET-STaaS-DR53-A9K"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.21.2.100-10.21.2.111"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1226" {
   display_name = "TF-AG1-IPSET-DR59-ESG-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR59-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.0.194"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1227" {
   display_name = "TF-AG1-IPSET-IBM-Connect-to-ECM"
   nsx_id = "TF-AG1-IPSET-IBM-Connect-to-ECM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.239.100",
                         "9.208.6.16",
                         "9.17.210.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1228" {
   display_name = "TF-AG1-IPSET-NAT-sg-sres-tanzu-workload-01"
   nsx_id = "TF-AG1-IPSET-NAT-sg-sres-tanzu-workload-01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1229" {
   display_name = "TF-AG1-IPSET-HRES-CACF"
   nsx_id = "TF-AG1-IPSET-HRES-CACF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.0/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1230" {
   display_name = "TF-AG1-IPSET-NET-All-GSNI-routable"
   nsx_id = "TF-AG1-IPSET-NET-All-GSNI-routable"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.0/20",
                         "158.87.104.0/23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1231" {
   display_name = "TF-AG1-IPSET-STaaS-DR11-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR11-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.10.8",
                         "10.1.10.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1232" {
   display_name = "TF-AG1-IPSET-DR40-CPrem-Prod-Site-IP-Group"
   nsx_id = "TF-AG1-IPSET-DR40-CPrem-Prod-Site-IP-Group"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.107.6.113",
                         "135.107.6.100-135.107.6.103",
                         "135.107.6.207",
                         "135.107.6.107",
                         "135.107.6.218",
                         "135.107.6.112",
                         "135.107.6.209",
                         "135.107.6.119",
                         "135.107.6.211",
                         "135.107.6.106",
                         "135.107.6.220",
                         "135.107.6.120"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1233" {
   display_name = "TF-AG1-IPSET-NSXT-ADNSnsxt1"
   nsx_id = "TF-AG1-IPSET-NSXT-ADNSnsxt1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.194"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1234" {
   display_name = "TF-AG1-IPSET-azure-devlab-jumphost"
   nsx_id = "TF-AG1-IPSET-azure-devlab-jumphost"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.124.65.36"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1235" {
   display_name = "TF-AG1-IPSET-MCMS-NA-ROKS"
   nsx_id = "TF-AG1-IPSET-MCMS-NA-ROKS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.116.0.80/28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1236" {
   display_name = "TF-AG1-IPSET-CA-DRES1-NAT-for-JH"
   nsx_id = "TF-AG1-IPSET-CA-DRES1-NAT-for-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.129",
                         "158.87.86.110"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1237" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-PEN-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-PEN-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.9",
                         "158.87.49.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1238" {
   display_name = "TF-AG1-IPSET-IAMssS-UAT-QA-IE"
   nsx_id = "TF-AG1-IPSET-IAMssS-UAT-QA-IE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1239" {
   display_name = "TF-AG1-IPSET-kaps-service-kyndryl-net"
   nsx_id = "TF-AG1-IPSET-kaps-service-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.208.24.120"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1240" {
   display_name = "TF-AG1-IPSET-EU-SRES-VM"
   nsx_id = "TF-AG1-IPSET-EU-SRES-VM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.253.20",
                         "10.175.253.2",
                         "10.175.10.132",
                         "10.175.253.53",
                         "10.175.253.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1241" {
   display_name = "TF-AG1-IPSET-EU-eu1sr1pcacfgit1"
   nsx_id = "TF-AG1-IPSET-EU-eu1sr1pcacfgit1"
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
resource "nsxt_policy_group" "grp_1242" {
   display_name = "TF-AG1-IPSET-AP-ap1srlpgsehst01"
   nsx_id = "TF-AG1-IPSET-AP-ap1srlpgsehst01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1243" {
   display_name = "TF-AG1-IPSET-mneaas-master02-ams-sl-mem-ibm-com"
   nsx_id = "TF-AG1-IPSET-mneaas-master02-ams-sl-mem-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.38"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1244" {
   display_name = "TF-AG1-IPSET-INT-SVCS-NONPROD-DAL"
   nsx_id = "TF-AG1-IPSET-INT-SVCS-NONPROD-DAL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.22.91",
                         "158.87.22.92",
                         "158.87.22.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1245" {
   display_name = "TF-AG1-IPSET-DR192-ESG-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR192-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1246" {
   display_name = "TF-AG1-IPSET-AP1-ap1srlphwcls"
   nsx_id = "TF-AG1-IPSET-AP1-ap1srlphwcls"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.235"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1247" {
   display_name = "TF-AG1-IPSET-DR162-CPREM-NETCOOL-PROD"
   nsx_id = "TF-AG1-IPSET-DR162-CPREM-NETCOOL-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.139.64.118"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1248" {
   display_name = "TF-AG1-IPSET-DR212-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR212-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.180.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1249" {
   display_name = "TF-AG1-IPSET-eu1sr1wphwccog"
   nsx_id = "TF-AG1-IPSET-eu1sr1wphwccog"
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
resource "nsxt_policy_group" "grp_1250" {
   display_name = "TF-AG1-IPSET-NET-NSXT-OCP07-Subnet"
   nsx_id = "TF-AG1-IPSET-NET-NSXT-OCP07-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.3",
                         "100.71.244.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1251" {
   display_name = "TF-AG1-IPSET-Maximo-ESLS4"
   nsx_id = "TF-AG1-IPSET-Maximo-ESLS4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.212"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1252" {
   display_name = "TF-AG1-IPSET-US-CACF-OCP-VIP"
   nsx_id = "TF-AG1-IPSET-US-CACF-OCP-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.31.103"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1253" {
   display_name = "TF-AG1-IPSET-SRES-TALOS-b03avi11810411"
   nsx_id = "TF-AG1-IPSET-SRES-TALOS-b03avi11810411"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.16.6.103"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1254" {
   display_name = "TF-AG1-IPSET-EU-SRES01-OCP-Cluster02-VIP"
   nsx_id = "TF-AG1-IPSET-EU-SRES01-OCP-Cluster02-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.210"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1255" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-PROD-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-PROD-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.117",
                         "158.87.49.118"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1256" {
   display_name = "TF-AG1-IPSET-DR192-ESG-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR192-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1257" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-DB2"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-DB2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.53.172.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1258" {
   display_name = "TF-AG1-IPSET-DR40-CPREM-meddbb01"
   nsx_id = "TF-AG1-IPSET-DR40-CPREM-meddbb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "163.241.205.125"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1259" {
   display_name = "TF-AG1-IPSET-9-212-149-17"
   nsx_id = "TF-AG1-IPSET-9-212-149-17"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.212.149.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1260" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Storage---V5000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Storage---V5000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.69.161.21-10.69.161.26",
                         "10.64.90.122",
                         "10.64.90.116",
                         "10.64.90.119",
                         "10.64.90.117",
                         "10.69.161.137",
                         "10.64.90.118",
                         "10.64.90.124",
                         "10.64.90.123",
                         "10.69.161.138",
                         "10.64.90.115",
                         "10.69.161.136",
                         "10.64.90.114"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1261" {
   display_name = "TF-AG1-IPSET-STaaS-DR151Client-HSM"
   nsx_id = "TF-AG1-IPSET-STaaS-DR151Client-HSM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "125.157.103.207",
                         "125.156.103.184",
                         "125.157.103.184"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1262" {
   display_name = "TF-AG1-IPSET-STaaS-DR144-Storage-NetApp"
   nsx_id = "TF-AG1-IPSET-STaaS-DR144-Storage-NetApp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.101.240.5-10.101.240.7",
                         "10.1.240.5-10.1.240.10",
                         "10.111.10.15-10.111.10.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1263" {
   display_name = "TF-AG1-IPSET-STaaS-DR156-Storage-Markham"
   nsx_id = "TF-AG1-IPSET-STaaS-DR156-Storage-Markham"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.200.72.148-10.200.72.153",
                         "10.200.72.24-10.200.72.29",
                         "10.200.251.23-10.200.251.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1264" {
   display_name = "TF-AG1-IPSET-STaaS-DR162-Storage-Switch-Topeka"
   nsx_id = "TF-AG1-IPSET-STaaS-DR162-Storage-Switch-Topeka"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.138.44.200-10.138.44.215"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1265" {
   display_name = "TF-AG1-IPSET-STaaS-DR151Client-SATHC"
   nsx_id = "TF-AG1-IPSET-STaaS-DR151Client-SATHC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "125.156.110.27",
                         "125.157.110.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1266" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-JHOSTS"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-JHOSTS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "161.228.110.62",
                         "152.144.94.165",
                         "152.144.94.20",
                         "161.228.110.192"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1267" {
   display_name = "TF-AG1-IPSET-DR187-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR187-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.160.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1268" {
   display_name = "TF-AG1-IPSET-STaaS-DR151-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR151-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "125.157.103.222-125.157.103.225",
                         "125.156.103.47-125.156.103.50",
                         "125.156.103.237-125.156.103.246",
                         "125.157.103.236-125.157.103.239",
                         "125.157.103.244-125.157.103.249",
                         "125.156.103.14-125.156.103.20",
                         "125.157.103.30-125.157.103.33",
                         "125.156.103.193-125.156.103.206",
                         "125.156.103.213-125.156.103.216",
                         "125.157.103.45-125.157.103.48",
                         "125.157.103.14-125.157.103.20",
                         "125.156.103.30-125.156.103.33",
                         "125.157.103.235-125.157.103.249",
                         "125.157.103.193-125.157.103.206"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1269" {
   display_name = "TF-AG1-IPSET-NET-DR47-10-190-236-192-26"
   nsx_id = "TF-AG1-IPSET-NET-DR47-10-190-236-192-26"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.190.236.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1270" {
   display_name = "TF-AG1-IPSET-CPREM-CATRQNI021BNCXA"
   nsx_id = "TF-AG1-IPSET-CPREM-CATRQNI021BNCXA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.68.118.40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1271" {
   display_name = "TF-AG1-IPSET-DR96-CPREM-172-22-25-30"
   nsx_id = "TF-AG1-IPSET-DR96-CPREM-172-22-25-30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.22.25.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1272" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Storage-XIV"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Storage-XIV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.69.160.147",
                         "10.69.160.207-10.69.160.209",
                         "10.69.160.73-10.69.160.80",
                         "10.64.118.218",
                         "10.64.188.195"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1273" {
   display_name = "TF-AG1-IPSET-CPREM-CAMRQNI011BNCXA"
   nsx_id = "TF-AG1-IPSET-CPREM-CAMRQNI011BNCXA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.64.118.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1274" {
   display_name = "TF-AG1-IPSET-PDR-ICp-Cluster02-Ingress-VIP"
   nsx_id = "TF-AG1-IPSET-PDR-ICp-Cluster02-Ingress-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.69.44"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1275" {
   display_name = "TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02"
   nsx_id = "TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.170"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1276" {
   display_name = "TF-AG1-IPSET-NET-OpaaS-Subnet4"
   nsx_id = "TF-AG1-IPSET-NET-OpaaS-Subnet4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.60.136.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1277" {
   display_name = "TF-AG1-IPSET-GACDW-DB-test"
   nsx_id = "TF-AG1-IPSET-GACDW-DB-test"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.195.63.112"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1278" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-bluewashington"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-bluewashington"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.228.88"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1279" {
   display_name = "TF-AG1-IPSET-STaaS-DR12-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR12-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "108.101.89.228",
                         "108.101.89.230",
                         "108.101.89.53",
                         "108.101.89.231",
                         "108.101.89.111-108.101.89.115",
                         "108.201.195.122",
                         "108.201.195.227",
                         "108.201.195.240-108.201.195.243",
                         "108.101.89.226",
                         "108.201.195.120",
                         "10.201.195.240-10.201.195.243",
                         "108.101.89.101",
                         "108.101.89.227",
                         "10.101.89.130-10.101.89.133",
                         "108.201.195.124",
                         "108.201.195.123",
                         "108.201.195.51-108.201.195.68",
                         "10.201.195.165-10.201.195.167",
                         "108.201.195.111-108.201.195.115",
                         "108.201.143.59",
                         "108.101.89.40-108.101.89.42",
                         "108.201.195.226",
                         "108.101.89.55",
                         "108.201.195.121",
                         "108.101.89.51",
                         "108.201.195.232",
                         "108.201.195.233",
                         "108.101.70.122",
                         "108.201.195.230",
                         "108.201.195.102",
                         "108.101.89.52",
                         "108.101.89.229",
                         "108.201.195.101",
                         "108.101.89.54",
                         "10.201.195.230",
                         "10.101.89.151-10.101.89.153",
                         "108.101.89.232",
                         "108.101.89.50",
                         "108.101.89.130-108.101.89.133",
                         "108.201.195.228",
                         "108.201.195.125",
                         "108.201.195.229",
                         "108.101.89.102",
                         "108.101.89.225",
                         "108.201.195.231",
                         "108.101.89.10-108.101.89.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1280" {
   display_name = "TF-AG1-IPSET-NET-All-RFC1918"
   nsx_id = "TF-AG1-IPSET-NET-All-RFC1918"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.0.0/16",
                         "10.0.0.0/8",
                         "172.16.0.0/12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1281" {
   display_name = "TF-AG1-IPSET-NET-OpaaS-Subnet2"
   nsx_id = "TF-AG1-IPSET-NET-OpaaS-Subnet2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.142.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1282" {
   display_name = "TF-AG1-IPSET-SOTC-uat-sccd-shared-was1"
   nsx_id = "TF-AG1-IPSET-SOTC-uat-sccd-shared-was1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.254.36.141",
                         "158.87.36.128/25",
                         "100.124.0.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1283" {
   display_name = "TF-AG1-IPSET-NET-SRES-APP-INTERNAL"
   nsx_id = "TF-AG1-IPSET-NET-SRES-APP-INTERNAL"
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
resource "nsxt_policy_group" "grp_1284" {
   display_name = "TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network"
   nsx_id = "TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.127.128.0/23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1285" {
   display_name = "TF-AG1-IPSET-CACF-CA-OCP-VIP"
   nsx_id = "TF-AG1-IPSET-CACF-CA-OCP-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1286" {
   display_name = "TF-AG1-IPSET-CACF-US-Client-DRES-Jumphosts"
   nsx_id = "TF-AG1-IPSET-CACF-US-Client-DRES-Jumphosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.59.218.251",
                         "129.42.192.249",
                         "216.96.68.179",
                         "216.96.68.178",
                         "144.78.64.1",
                         "192.59.218.252",
                         "208.196.3.108",
                         "159.102.254.41",
                         "159.102.254.37",
                         "12.1.48.208",
                         "170.61.53.225-170.61.53.254",
                         "129.42.192.250",
                         "170.61.54.225-170.61.54.254",
                         "144.78.64.0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1287" {
   display_name = "TF-AG1-IPSET-AG1D53LPIGATPC1"
   nsx_id = "TF-AG1-IPSET-AG1D53LPIGATPC1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.88.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1288" {
   display_name = "TF-AG1-IPSET-NET-Southbury-Prod-Mgmt"
   nsx_id = "TF-AG1-IPSET-NET-Southbury-Prod-Mgmt"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "125.255.180.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1289" {
   display_name = "TF-AG1-IPSET-IRES-ag1irlpipam01"
   nsx_id = "TF-AG1-IPSET-IRES-ag1irlpipam01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.121.87"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1290" {
   display_name = "TF-AG1-IPSET-STaaS-DR147-CISCO-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR147-CISCO-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.100.19.94-10.100.19.106",
                         "10.101.69.51-10.101.69.63",
                         "10.40.64.120-10.40.64.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1291" {
   display_name = "TF-AG1-IPSET-HWSW-SNI-NYHOST1"
   nsx_id = "TF-AG1-IPSET-HWSW-SNI-NYHOST1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.229.170"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1292" {
   display_name = "TF-AG1-IPSET-CPREM-CAMRQNI010BNCXA"
   nsx_id = "TF-AG1-IPSET-CPREM-CAMRQNI010BNCXA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.64.118.49"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1293" {
   display_name = "TF-AG1-IPSET-DR192-LB-VIP3"
   nsx_id = "TF-AG1-IPSET-DR192-LB-VIP3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.165.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1294" {
   display_name = "TF-AG1-IPSET-Host-DR162-3SCALE-Topeka-Client-premise-JH"
   nsx_id = "TF-AG1-IPSET-Host-DR162-3SCALE-Topeka-Client-premise-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.170.128.163",
                         "10.170.128.157",
                         "10.170.128.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1295" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-SSH"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-SSH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.220.149.245",
                         "9.209.239.100",
                         "9.209.227.176",
                         "9.45.126.100",
                         "9.45.2.21",
                         "9.209.239.20",
                         "9.220.132.37"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1296" {
   display_name = "TF-AG1-IPSET-ca1dhwswdb01ra"
   nsx_id = "TF-AG1-IPSET-ca1dhwswdb01ra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1297" {
   display_name = "TF-AG1-IPSET-zCloud-Storage-All"
   nsx_id = "TF-AG1-IPSET-zCloud-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.31.220",
                         "167.210.172.92",
                         "167.210.172.13",
                         "129.41.43.20",
                         "129.39.31.202",
                         "167.210.172.65",
                         "129.39.31.221",
                         "129.39.31.205",
                         "129.39.21.14",
                         "129.39.31.219",
                         "129.39.21.22",
                         "129.41.43.19",
                         "129.41.43.22",
                         "129.41.43.21",
                         "129.39.31.204",
                         "129.39.31.203",
                         "129.39.31.218",
                         "129.39.21.15",
                         "167.210.172.66",
                         "167.210.172.43",
                         "129.41.43.17",
                         "129.39.21.21",
                         "167.210.172.14",
                         "129.41.43.18",
                         "167.210.172.91"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1298" {
   display_name = "TF-AG1-IPSET-DR211-CPREM-NETCOOL"
   nsx_id = "TF-AG1-IPSET-DR211-CPREM-NETCOOL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.4.41.251",
                         "10.4.46.198",
                         "10.4.30.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1299" {
   display_name = "TF-AG1-IPSET-MSS-Group1"
   nsx_id = "TF-AG1-IPSET-MSS-Group1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "209.134.191.19",
                         "209.134.191.18",
                         "209.134.191.7",
                         "209.134.190.201-209.134.190.210"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1300" {
   display_name = "TF-AG1-IPSET-AMS-SRES-nlaspia000m1ermp"
   nsx_id = "TF-AG1-IPSET-AMS-SRES-nlaspia000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1301" {
   display_name = "TF-AG1-IPSET-DR47-10-190-236-202"
   nsx_id = "TF-AG1-IPSET-DR47-10-190-236-202"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.190.236.202"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1302" {
   display_name = "TF-AG1-IPSET-AP1SRLPSATSTS01"
   nsx_id = "TF-AG1-IPSET-AP1SRLPSATSTS01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.161"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1303" {
   display_name = "TF-AG1-IPSET-Host-icamspamhapxy01-cloudprivate"
   nsx_id = "TF-AG1-IPSET-Host-icamspamhapxy01-cloudprivate"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.137.158.10",
                         "169.50.134.139"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1304" {
   display_name = "TF-AG1-IPSET-IN1-SAT-in1srlpmsatcld1"
   nsx_id = "TF-AG1-IPSET-IN1-SAT-in1srlpmsatcld1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1305" {
   display_name = "TF-AG1-IPSET-NET-WDC-SRES-GSNI-subnets"
   nsx_id = "TF-AG1-IPSET-NET-WDC-SRES-GSNI-subnets"
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
resource "nsxt_policy_group" "grp_1306" {
   display_name = "TF-AG1-IPSET-STaaS-DR53-DS8K"
   nsx_id = "TF-AG1-IPSET-STaaS-DR53-DS8K"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.20.36.9",
                         "10.20.36.47",
                         "10.21.1.120",
                         "10.20.36.8",
                         "10.20.36.89",
                         "10.20.36.7",
                         "10.21.1.159",
                         "10.21.1.160",
                         "10.20.36.11",
                         "10.21.1.161",
                         "10.20.36.45",
                         "10.21.1.81",
                         "10.21.1.61"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1307" {
   display_name = "TF-AG1-IPSET-icdalldb01"
   nsx_id = "TF-AG1-IPSET-icdalldb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.254.96"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1308" {
   display_name = "TF-AG1-IPSET-SRES-TKG-BASE"
   nsx_id = "TF-AG1-IPSET-SRES-TKG-BASE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.243.66",
                         "100.71.242.35",
                         "100.71.242.66",
                         "100.71.243.2",
                         "100.71.243.34"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1309" {
   display_name = "TF-AG1-IPSET-SRES01-OCP-Cluster01_46_TEMP"
   nsx_id = "TF-AG1-IPSET-SRES01-OCP-Cluster01_46_TEMP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.230"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1310" {
   display_name = "TF-AG1-IPSET-CDI-THCAAS-GTSSDI-AG-PROD"
   nsx_id = "TF-AG1-IPSET-CDI-THCAAS-GTSSDI-AG-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.104.153"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1311" {
   display_name = "TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr0"
   nsx_id = "TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.197"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1312" {
   display_name = "TF-AG1-IPSET-MnE-Dev-test-6zr58-webgui"
   nsx_id = "TF-AG1-IPSET-MnE-Dev-test-6zr58-webgui"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1313" {
   display_name = "TF-AG1-IPSET-STaaS-DR77-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR77-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "150.172.177.139",
                         "150.172.177.137",
                         "150.172.220.131",
                         "150.172.177.87",
                         "150.172.177.111",
                         "150.172.220.138",
                         "150.172.177.88",
                         "150.172.220.158",
                         "150.172.177.77",
                         "150.172.220.139",
                         "150.172.177.99",
                         "150.172.220.137",
                         "150.172.177.89",
                         "150.172.177.110",
                         "150.172.220.130",
                         "150.172.220.150",
                         "150.172.220.151",
                         "150.172.220.157",
                         "150.172.220.128",
                         "150.172.177.100",
                         "150.172.177.138",
                         "150.172.220.129",
                         "150.172.177.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1314" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-PROXY-DevOps-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-PROXY-DevOps-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1315" {
   display_name = "TF-AG1-IPSET-DR158-CPREM-NETCOOL-LAB"
   nsx_id = "TF-AG1-IPSET-DR158-CPREM-NETCOOL-LAB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "164.155.7.36"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1316" {
   display_name = "TF-AG1-IPSET-STaaS-DR71-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR71-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.206.16.20-10.206.16.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1317" {
   display_name = "TF-AG1-IPSET-DR278-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR278-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.204.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1318" {
   display_name = "TF-AG1-IPSET-DR227-CPREM-3"
   nsx_id = "TF-AG1-IPSET-DR227-CPREM-3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.23.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1319" {
   display_name = "TF-AG1-IPSET-MnE-Dev-meaas01-deploy-03"
   nsx_id = "TF-AG1-IPSET-MnE-Dev-meaas01-deploy-03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.61"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1320" {
   display_name = "TF-AG1-IPSET-STaaS-DR198-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR198-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.92.250.20-10.92.250.21",
                         "10.92.250.50-10.92.250.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1321" {
   display_name = "TF-AG1-IPSET-DR192-LB-VIP2"
   nsx_id = "TF-AG1-IPSET-DR192-LB-VIP2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.165.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1322" {
   display_name = "TF-AG1-IPSET-SOTC-uat-sccd-shared-was2"
   nsx_id = "TF-AG1-IPSET-SOTC-uat-sccd-shared-was2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.254.36.142",
                         "158.87.36.128/25",
                         "100.124.0.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1323" {
   display_name = "TF-AG1-IPSET-EU-eu1sr1dxdev02"
   nsx_id = "TF-AG1-IPSET-EU-eu1sr1dxdev02"
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
resource "nsxt_policy_group" "grp_1324" {
   display_name = "TF-AG1-IPSET-DR201-CPREM-NETCOOL"
   nsx_id = "TF-AG1-IPSET-DR201-CPREM-NETCOOL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.164.65.10",
                         "10.164.65.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1325" {
   display_name = "TF-AG1-IPSET-NSXT-ADNSnsxt2"
   nsx_id = "TF-AG1-IPSET-NSXT-ADNSnsxt2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.195"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1326" {
   display_name = "TF-AG1-IPSET-Host-ag1d162LPDRbg1"
   nsx_id = "TF-AG1-IPSET-Host-ag1d162LPDRbg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.64.146.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1327" {
   display_name = "TF-AG1-IPSET-ag1d182lpcacpr-VIP"
   nsx_id = "TF-AG1-IPSET-ag1d182lpcacpr-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.154.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1328" {
   display_name = "TF-AG1-IPSET-STaaS-DR70-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR70-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.210.172.65",
                         "129.39.31.204",
                         "167.210.172.66",
                         "129.39.31.205",
                         "167.210.172.43",
                         "129.39.31.219",
                         "129.39.31.203",
                         "129.39.31.220",
                         "129.39.31.221",
                         "129.39.31.218",
                         "129.39.21.21",
                         "167.210.172.14",
                         "167.210.172.13",
                         "129.39.21.22",
                         "129.39.31.202"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1329" {
   display_name = "TF-AG1-IPSET-ag1sr1bfrelay1-IRES-NAT"
   nsx_id = "TF-AG1-IPSET-ag1sr1bfrelay1-IRES-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.165"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1330" {
   display_name = "TF-AG1-IPSET-IMI-KIWISyslog"
   nsx_id = "TF-AG1-IPSET-IMI-KIWISyslog"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.61.57.253"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1331" {
   display_name = "TF-AG1-IPSET-nlaspno000iswrm"
   nsx_id = "TF-AG1-IPSET-nlaspno000iswrm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.68.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1332" {
   display_name = "TF-AG1-IPSET-STaaS-DR151Client-BRR_V5000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR151Client-BRR_V5000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "125.157.103.207"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1333" {
   display_name = "TF-AG1-IPSET-nlascno000iswrm"
   nsx_id = "TF-AG1-IPSET-nlascno000iswrm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.68.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1334" {
   display_name = "TF-AG1-IPSET-AVI-NS1"
   nsx_id = "TF-AG1-IPSET-AVI-NS1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.58"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1335" {
   display_name = "TF-AG1-IPSET-IAMAAS-iGI-PIM"
   nsx_id = "TF-AG1-IPSET-IAMAAS-iGI-PIM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "161.202.246.1-161.202.246.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1336" {
   display_name = "TF-AG1-IPSET-NET-DR158-ESG-VPN-transit1"
   nsx_id = "TF-AG1-IPSET-NET-DR158-ESG-VPN-transit1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.2.65"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1337" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-LDAP"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-LDAP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.15.48.48",
                         "9.23.210.79",
                         "9.17.186.253",
                         "9.15.0.48",
                         "9.57.182.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1338" {
   display_name = "TF-AG1-IPSET-DR227-ESG-agg-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR227-ESG-agg-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.64"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1339" {
   display_name = "TF-AG1-IPSET-Host-DR162-CACF-Topeka-Client-premise-JH"
   nsx_id = "TF-AG1-IPSET-Host-DR162-CACF-Topeka-Client-premise-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.102.45.2",
                         "10.102.145.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1340" {
   display_name = "TF-AG1-IPSET-STaaS-DR156-Storage-Barrie"
   nsx_id = "TF-AG1-IPSET-STaaS-DR156-Storage-Barrie"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.208.72.210-10.208.72.211",
                         "10.208.72.120-10.208.72.121",
                         "10.208.72.91-10.208.72.94",
                         "10.208.72.38-10.208.72.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1341" {
   display_name = "TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1"
   nsx_id = "TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.0.64/27",
                         "100.64.71.4",
                         "158.87.51.4",
                         "158.87.51.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1342" {
   display_name = "TF-AG1-IPSET-STaaS-DR53-FlashSystem"
   nsx_id = "TF-AG1-IPSET-STaaS-DR53-FlashSystem"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.21.1.203-10.21.1.205",
                         "10.21.1.227-10.21.1.229",
                         "10.21.1.121-10.21.1.123",
                         "10.20.36.49-10.20.36.51",
                         "10.20.36.20-10.20.36.25",
                         "10.20.36.31-10.20.36.39",
                         "10.20.37.104-10.20.37.106",
                         "10.21.1.230-10.21.1.235",
                         "10.20.36.86-10.20.36.88"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1343" {
   display_name = "TF-AG1-IPSET-NET-WDC-GSNI-subnets"
   nsx_id = "TF-AG1-IPSET-NET-WDC-GSNI-subnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.0/22",
                         "158.87.50.0/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1344" {
   display_name = "TF-AG1-IPSET-Host-Splunk-NAT-IP"
   nsx_id = "TF-AG1-IPSET-Host-Splunk-NAT-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1345" {
   display_name = "TF-AG1-IPSET-MCMS-DALLAS-NETCOOL-PROXY"
   nsx_id = "TF-AG1-IPSET-MCMS-DALLAS-NETCOOL-PROXY"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.117.46.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1346" {
   display_name = "TF-AG1-IPSET-CDI-GTSCDI-EU-Proxy01"
   nsx_id = "TF-AG1-IPSET-CDI-GTSCDI-EU-Proxy01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.76"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1347" {
   display_name = "TF-AG1-IPSET-DR144-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR144-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.132.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1348" {
   display_name = "TF-AG1-IPSET-Host-zCLD_LRM50_BLD"
   nsx_id = "TF-AG1-IPSET-Host-zCLD_LRM50_BLD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.41.51.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1349" {
   display_name = "TF-AG1-IPSET-DR162-CACF-CPREM-vRA1"
   nsx_id = "TF-AG1-IPSET-DR162-CACF-CPREM-vRA1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.170.128.29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1350" {
   display_name = "TF-AG1-IPSET-CNICC-devRTP-SW"
   nsx_id = "TF-AG1-IPSET-CNICC-devRTP-SW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.209.141.52",
                         "10.4.1.234"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1351" {
   display_name = "TF-AG1-IPSET-SL-IRES-vCenter"
   nsx_id = "TF-AG1-IPSET-SL-IRES-vCenter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.1",
                         "10.65.55.134"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1352" {
   display_name = "TF-AG1-IPSET-UAT-Shared"
   nsx_id = "TF-AG1-IPSET-UAT-Shared"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.64/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1353" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-REMEDY-TDC"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-REMEDY-TDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "152.144.148.38",
                         "152.144.180.203",
                         "161.228.206.61",
                         "161.228.115.53",
                         "161.228.62.58",
                         "161.228.206.68",
                         "152.144.180.205",
                         "152.144.129.58",
                         "152.144.180.204",
                         "152.144.129.62",
                         "161.228.115.156",
                         "152.144.180.206",
                         "161.228.115.125",
                         "161.228.206.62"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1354" {
   display_name = "TF-AG1-IPSET-SAT-ZCLOUD-BRAZIL"
   nsx_id = "TF-AG1-IPSET-SAT-ZCLOUD-BRAZIL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.210.233.6",
                         "10.210.233.10",
                         "10.210.233.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1355" {
   display_name = "TF-AG1-IPSET-DR212-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR212-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.201.211.218",
                         "10.201.177.14",
                         "10.201.211.96",
                         "10.201.111.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1356" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.64.11.52-10.64.11.55",
                         "10.64.90.248-10.64.90.249",
                         "10.68.11.41-10.68.11.46",
                         "10.64.11.123-10.64.11.130",
                         "10.64.10.42-10.64.10.44",
                         "10.64.10.46-10.64.10.48",
                         "10.64.11.145-10.64.11.146",
                         "10.64.119.80-10.64.119.81",
                         "10.69.160.163-10.69.160.164",
                         "10.69.160.21-10.69.160.32",
                         "10.64.119.135-10.64.119.138",
                         "10.69.161.53-10.69.161.55",
                         "10.69.161.78",
                         "10.64.118.210-10.64.118.215",
                         "10.69.161.45-10.69.161.46"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1357" {
   display_name = "TF-AG1-IPSET-secure-file-service-cloudapps"
   nsx_id = "TF-AG1-IPSET-secure-file-service-cloudapps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.38.79.34",
                         "169.38.79.44"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1358" {
   display_name = "TF-AG1-IPSET-HWSW-AP-SRES-Servers"
   nsx_id = "TF-AG1-IPSET-HWSW-AP-SRES-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.234",
                         "158.87.54.235",
                         "158.87.54.232",
                         "158.87.54.233",
                         "158.87.54.231"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1359" {
   display_name = "TF-AG1-IPSET-TaaS-UCD"
   nsx_id = "TF-AG1-IPSET-TaaS-UCD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.55.61.141",
                         "169.55.61.110",
                         "169.55.61.106",
                         "169.48.184.174",
                         "169.55.61.104"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1360" {
   display_name = "TF-AG1-IPSET-EITaaS-ICD"
   nsx_id = "TF-AG1-IPSET-EITaaS-ICD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.173.122.58"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1361" {
   display_name = "TF-AG1-IPSET-NET-EU-SRES-RPA-1"
   nsx_id = "TF-AG1-IPSET-NET-EU-SRES-RPA-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.248.0/22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1362" {
   display_name = "TF-AG1-IPSET-NET-CPREM-DR162-NAT-Range_2"
   nsx_id = "TF-AG1-IPSET-NET-CPREM-DR162-NAT-Range_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.103.43.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1363" {
   display_name = "TF-AG1-IPSET-DR59-ESG-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR59-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1364" {
   display_name = "TF-AG1-IPSET-NET-DR162-ESG-VPN-transit1"
   nsx_id = "TF-AG1-IPSET-NET-DR162-ESG-VPN-transit1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.2.112/29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1365" {
   display_name = "TF-AG1-IPSET-OpaaS-JumpHosts"
   nsx_id = "TF-AG1-IPSET-OpaaS-JumpHosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.60.136.183",
                         "169.60.136.161",
                         "169.60.136.148",
                         "169.60.136.184"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1366" {
   display_name = "TF-AG1-IPSET-DR187-CPREM-JH-8081"
   nsx_id = "TF-AG1-IPSET-DR187-CPREM-JH-8081"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "162.95.224.1",
                         "162.95.230.73",
                         "162.95.230.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1367" {
   display_name = "TF-AG1-IPSET-DR211-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR211-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.178.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1368" {
   display_name = "TF-AG1-IPSET-HOSTna-rpt-atl-x-force-red-com"
   nsx_id = "TF-AG1-IPSET-HOSTna-rpt-atl-x-force-red-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "12.181.65.133"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1369" {
   display_name = "TF-AG1-IPSET-DR96-CPREM-DR-172-22-26-78"
   nsx_id = "TF-AG1-IPSET-DR96-CPREM-DR-172-22-26-78"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.22.26.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1370" {
   display_name = "TF-AG1-IPSET-SL-WSUS"
   nsx_id = "TF-AG1-IPSET-SL-WSUS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.0.77.53"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1371" {
   display_name = "TF-AG1-IPSET-driamaas2-Customer1-UNIX-EP"
   nsx_id = "TF-AG1-IPSET-driamaas2-Customer1-UNIX-EP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.2.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1372" {
   display_name = "TF-AG1-IPSET-DR162-ESG-dlr-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR162-ESG-dlr-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.2.121"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1373" {
   display_name = "TF-AG1-IPSET-DR180-ESG-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR180-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.2.162"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1374" {
   display_name = "TF-AG1-IPSET-NET-SL-Private-Service-Endpoints"
   nsx_id = "TF-AG1-IPSET-NET-SL-Private-Service-Endpoints"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "166.8.0.0/14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1375" {
   display_name = "TF-AG1-IPSET-BigFix-Server"
   nsx_id = "TF-AG1-IPSET-BigFix-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.182.134"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1376" {
   display_name = "TF-AG1-IPSET-IBMCLOUD-MONGODB-CHATOPS-DEV"
   nsx_id = "TF-AG1-IPSET-IBMCLOUD-MONGODB-CHATOPS-DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "166.9.12.33",
                         "166.9.16.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1377" {
   display_name = "TF-AG1-IPSET-dr19-esg-vpn-transit1"
   nsx_id = "TF-AG1-IPSET-dr19-esg-vpn-transit1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.0.98"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1378" {
   display_name = "TF-AG1-IPSET-HWSW-ILTM-ag-ilmtapdapp01"
   nsx_id = "TF-AG1-IPSET-HWSW-ILTM-ag-ilmtapdapp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.9.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1379" {
   display_name = "TF-AG1-IPSET-EU-SRES-RPA-BP-GBS-GBS-IP-Pools"
   nsx_id = "TF-AG1-IPSET-EU-SRES-RPA-BP-GBS-GBS-IP-Pools"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.248.0/22",
                         "100.79.244.0/22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1380" {
   display_name = "TF-AG1-IPSET-DR227-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR227-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.6.131.245",
                         "167.6.131.244"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1381" {
   display_name = "TF-AG1-IPSET-MCMS-Tools"
   nsx_id = "TF-AG1-IPSET-MCMS-Tools"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.54.209.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1382" {
   display_name = "TF-AG1-IPSET-CNICC-AO-prod-sanjose-s3"
   nsx_id = "TF-AG1-IPSET-CNICC-AO-prod-sanjose-s3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.42.19.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1383" {
   display_name = "TF-AG1-IPSET-CNICC-Dow-SW"
   nsx_id = "TF-AG1-IPSET-CNICC-Dow-SW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.116.62.0/23",
                         "10.14.104.192/27",
                         "163.198.110.0/24",
                         "10.116.1.16/28",
                         "10.116.64.0/28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1384" {
   display_name = "TF-AG1-IPSET-NET-NSXT-OCP06-Subnet"
   nsx_id = "TF-AG1-IPSET-NET-NSXT-OCP06-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.128/27",
                         "158.87.50.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1385" {
   display_name = "TF-AG1-IPSET-ag1sr1bfrelay2-IRES-NAT"
   nsx_id = "TF-AG1-IPSET-ag1sr1bfrelay2-IRES-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.166"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1386" {
   display_name = "TF-AG1-IPSET-NAT-CACF-APPSCAN"
   nsx_id = "TF-AG1-IPSET-NAT-CACF-APPSCAN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.37.136",
                         "158.87.37.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1387" {
   display_name = "TF-AG1-IPSET-NET-CPREM-DR196-NAT-Range"
   nsx_id = "TF-AG1-IPSET-NET-CPREM-DR196-NAT-Range"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1388" {
   display_name = "TF-AG1-IPSET-Host-PDR-BDS"
   nsx_id = "TF-AG1-IPSET-Host-PDR-BDS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.47.188.128/26",
                         "169.47.156.112/28",
                         "169.63.115.160/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1389" {
   display_name = "TF-AG1-IPSET-HWSW-IBM-9-50001"
   nsx_id = "TF-AG1-IPSET-HWSW-IBM-9-50001"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.63.40.251",
                         "9.56.22.229",
                         "9.56.22.235"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1390" {
   display_name = "TF-AG1-IPSET-CPREM-CATRQNI020BNCXA"
   nsx_id = "TF-AG1-IPSET-CPREM-CATRQNI020BNCXA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.68.118.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1391" {
   display_name = "TF-AG1-IPSET-SRES-OCP-Cluster06"
   nsx_id = "TF-AG1-IPSET-SRES-OCP-Cluster06"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.102",
                         "100.71.244.4",
                         "158.87.49.230",
                         "158.87.48.201",
                         "100.71.244.2",
                         "158.87.48.176"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1392" {
   display_name = "TF-AG1-IPSET-DR196-CPREM-JHOSTS"
   nsx_id = "TF-AG1-IPSET-DR196-CPREM-JHOSTS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "11.72.26.152",
                         "11.72.26.151"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1393" {
   display_name = "TF-AG1-IPSET-NET-NSXT-OCP05-Subnet"
   nsx_id = "TF-AG1-IPSET-NET-NSXT-OCP05-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.64/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1394" {
   display_name = "TF-AG1-IPSET-CDI-JP-ProxyServers"
   nsx_id = "TF-AG1-IPSET-CDI-JP-ProxyServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.221.4-158.87.221.5",
                         "158.87.221.1-158.87.221.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1395" {
   display_name = "TF-AG1-IPSET-snat-to-SL-SVC"
   nsx_id = "TF-AG1-IPSET-snat-to-SL-SVC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.148"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1396" {
   display_name = "TF-AG1-IPSET-Tanzu-AVI-VIP-Subnet"
   nsx_id = "TF-AG1-IPSET-Tanzu-AVI-VIP-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.243.0/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1397" {
   display_name = "TF-AG1-IPSET-IRES-uswhpsl1dcr2-NAT"
   nsx_id = "TF-AG1-IPSET-IRES-uswhpsl1dcr2-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.135"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1398" {
   display_name = "TF-AG1-IPSET-Host-Ag1srlpSATZcld"
   nsx_id = "TF-AG1-IPSET-Host-Ag1srlpSATZcld"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.230"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1399" {
   display_name = "TF-AG1-IPSET-NET-OpaaS-Subnet3"
   nsx_id = "TF-AG1-IPSET-NET-OpaaS-Subnet3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.212.64/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1400" {
   display_name = "TF-AG1-IPSET-DRIAMAASTHY4-Customer2-Windows-EP"
   nsx_id = "TF-AG1-IPSET-DRIAMAASTHY4-Customer2-Windows-EP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.186.94.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1401" {
   display_name = "TF-AG1-IPSET-AMS-SRES-Autobuild-nlasabuildm1e00"
   nsx_id = "TF-AG1-IPSET-AMS-SRES-Autobuild-nlasabuildm1e00"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1402" {
   display_name = "TF-AG1-IPSET-ag1sr1wniamsql-vip"
   nsx_id = "TF-AG1-IPSET-ag1sr1wniamsql-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1403" {
   display_name = "TF-AG1-IPSET-IRES-uswhpsl1dcr3-NAT"
   nsx_id = "TF-AG1-IPSET-IRES-uswhpsl1dcr3-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1404" {
   display_name = "TF-AG1-IPSET-meaas-noi-inn6y-nco"
   nsx_id = "TF-AG1-IPSET-meaas-noi-inn6y-nco"
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
resource "nsxt_policy_group" "grp_1405" {
   display_name = "TF-AG1-IPSET-DR196-ESG-vpn-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR196-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1406" {
   display_name = "TF-AG1-IPSET-Host-GACDW-AG-DB"
   nsx_id = "TF-AG1-IPSET-Host-GACDW-AG-DB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.95.180/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1407" {
   display_name = "TF-AG1-IPSET-STaaS-DR151-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR151-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "125.156.103.199-125.156.103.206",
                         "125.157.103.17-125.157.103.20",
                         "125.157.103.235-125.157.103.242",
                         "125.157.103.199-125.157.103.206",
                         "125.156.103.17-125.156.103.20",
                         "125.156.103.240-125.156.103.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1408" {
   display_name = "TF-AG1-IPSET-STaaS-DR52-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR52-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.29.200.10-172.29.200.13",
                         "135.40.62.90-135.40.62.101",
                         "172.29.192.10-172.29.192.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1409" {
   display_name = "TF-AG1-IPSET-DA-OpenVPN-VM"
   nsx_id = "TF-AG1-IPSET-DA-OpenVPN-VM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.120.55.50/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1410" {
   display_name = "TF-AG1-IPSET-CNICC-AO-prod-dallas-S1"
   nsx_id = "TF-AG1-IPSET-CNICC-AO-prod-dallas-S1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.42.18.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1411" {
   display_name = "TF-AG1-IPSET-STaaS-DR52-Storage-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR52-Storage-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.29.192.10-172.29.192.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1412" {
   display_name = "TF-AG1-IPSET-Host--CNICC-Dow-Flex"
   nsx_id = "TF-AG1-IPSET-Host--CNICC-Dow-Flex"
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
resource "nsxt_policy_group" "grp_1413" {
   display_name = "TF-AG1-IPSET-SRES-LB1-PrimaryIP"
   nsx_id = "TF-AG1-IPSET-SRES-LB1-PrimaryIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1414" {
   display_name = "TF-AG1-IPSET-pdr-esg01-inside"
   nsx_id = "TF-AG1-IPSET-pdr-esg01-inside"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.253"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1415" {
   display_name = "TF-AG1-IPSET-ansible-tower-web-svc-tower-apps-ocp3"
   nsx_id = "TF-AG1-IPSET-ansible-tower-web-svc-tower-apps-ocp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1416" {
   display_name = "TF-AG1-IPSET-STaaS-DR74-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR74-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.20.11-192.168.20.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1417" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Storage-NetApp"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Storage-NetApp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.64.192.30-10.64.192.33",
                         "10.69.161.21-10.69.161.26",
                         "10.64.192.207-10.64.192.208",
                         "10.64.192.201",
                         "10.64.192.53-10.64.192.54",
                         "10.64.192.21",
                         "10.64.119.3",
                         "10.68.118.228",
                         "10.64.192.56-10.64.192.58"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1418" {
   display_name = "TF-AG1-IPSET-ESLS-UAT"
   nsx_id = "TF-AG1-IPSET-ESLS-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.151.232/29",
                         "146.89.187.192/26",
                         "146.89.184.64/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1419" {
   display_name = "TF-AG1-IPSET-prod-sdms01-gacdw-sl-ibm-com"
   nsx_id = "TF-AG1-IPSET-prod-sdms01-gacdw-sl-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.104.141-146.89.104.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1420" {
   display_name = "TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr1"
   nsx_id = "TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1421" {
   display_name = "TF-AG1-IPSET-STaaS-DR100-Storage-FS9150-BDC"
   nsx_id = "TF-AG1-IPSET-STaaS-DR100-Storage-FS9150-BDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "167.117.43.159-167.117.43.161",
                         "167.117.43.135-167.117.43.137",
                         "10.8.192.10-10.8.192.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1422" {
   display_name = "TF-AG1-IPSET-driamaas2-Customer1-Windows-EP-1"
   nsx_id = "TF-AG1-IPSET-driamaas2-Customer1-Windows-EP-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.2.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1423" {
   display_name = "TF-AG1-IPSET-NET-DR40-DC1_range1"
   nsx_id = "TF-AG1-IPSET-NET-DR40-DC1_range1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.107.8.0/24",
                         "135.107.254.0/24",
                         "135.107.3.0/24",
                         "162.109.77.0/24",
                         "198.175.153.0/24",
                         "135.107.14.0/24",
                         "163.241.195.0/24",
                         "135.107.6.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1424" {
   display_name = "TF-AG1-IPSET-EU-SRES01-OCP-Cluster03-VIP"
   nsx_id = "TF-AG1-IPSET-EU-SRES01-OCP-Cluster03-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.190"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1425" {
   display_name = "TF-AG1-IPSET-Netcool-usbd0p0nomssxa"
   nsx_id = "TF-AG1-IPSET-Netcool-usbd0p0nomssxa"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "149.131.76.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1426" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-RDP"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-RDP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.45.126.100",
                         "9.45.2.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1427" {
   display_name = "TF-AG1-IPSET-STaaS-DR53-Storage-SAN_Switches_ALL"
   nsx_id = "TF-AG1-IPSET-STaaS-DR53-Storage-SAN_Switches_ALL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.21.1.51",
                         "10.20.37.56",
                         "10.21.1.50",
                         "10.21.1.61",
                         "10.20.36.149",
                         "10.20.37.105",
                         "10.21.1.131",
                         "10.20.37.21",
                         "10.20.36.213",
                         "10.21.2.147",
                         "10.21.2.52",
                         "10.21.2.108",
                         "10.21.1.217",
                         "10.20.36.245",
                         "10.20.37.61",
                         "10.21.1.40",
                         "10.20.37.31",
                         "10.21.1.187",
                         "10.21.1.176",
                         "10.21.1.27",
                         "10.20.36.203",
                         "10.20.37.53",
                         "10.21.2.40",
                         "10.20.37.168",
                         "10.20.36.87",
                         "10.20.37.1",
                         "10.20.37.160",
                         "10.21.1.185",
                         "10.21.1.34",
                         "10.20.36.38",
                         "10.21.1.32",
                         "10.20.36.86",
                         "10.21.1.30",
                         "10.20.36.158",
                         "10.20.36.37",
                         "10.21.2.37",
                         "10.21.1.136",
                         "10.21.2.105",
                         "10.21.1.38",
                         "10.21.1.158",
                         "10.21.2.50",
                         "10.20.37.50",
                         "10.20.37.155",
                         "10.20.36.144",
                         "10.21.1.20",
                         "10.21.1.29",
                         "10.20.36.248",
                         "10.20.37.117",
                         "10.21.1.31",
                         "10.20.37.24",
                         "10.20.37.36",
                         "10.21.1.52",
                         "10.21.1.36",
                         "10.20.37.55",
                         "10.20.37.25",
                         "10.21.1.138",
                         "10.20.37.127",
                         "10.20.36.82",
                         "10.20.36.246",
                         "10.21.1.147",
                         "10.21.1.234",
                         "10.20.36.198",
                         "10.20.37.163",
                         "10.20.37.26",
                         "10.20.36.251",
                         "10.20.36.207",
                         "10.21.1.238",
                         "10.20.36.44",
                         "10.21.1.160",
                         "10.21.2.32",
                         "10.21.1.240",
                         "10.21.2.49",
                         "10.20.36.98",
                         "10.20.37.120",
                         "10.20.36.145",
                         "10.21.1.169",
                         "10.21.2.106",
                         "10.21.1.100",
                         "10.20.37.108",
                         "10.21.2.36",
                         "10.21.2.96",
                         "10.21.1.60",
                         "10.21.1.178",
                         "10.20.37.57",
                         "10.20.36.45",
                         "10.21.1.179",
                         "10.21.1.123",
                         "10.20.36.22",
                         "10.20.37.37",
                         "10.20.36.35",
                         "10.21.2.45",
                         "10.20.37.45",
                         "10.21.2.102",
                         "10.20.37.104",
                         "10.20.37.123",
                         "10.21.1.78",
                         "10.21.2.120",
                         "10.20.36.244",
                         "10.20.37.41",
                         "10.20.37.35",
                         "10.20.37.38",
                         "10.20.37.124",
                         "10.21.2.91",
                         "10.21.1.163",
                         "10.20.37.48",
                         "10.20.36.202",
                         "10.20.36.20",
                         "10.21.2.89",
                         "10.20.37.43",
                         "10.21.1.182",
                         "10.20.36.34",
                         "10.20.37.115",
                         "10.21.1.94",
                         "10.20.37.165",
                         "10.21.2.109",
                         "10.20.36.88",
                         "10.20.37.131",
                         "10.21.2.43",
                         "10.20.37.44",
                         "10.21.2.47",
                         "10.20.37.42",
                         "10.21.1.232",
                         "10.21.1.250",
                         "10.21.2.57",
                         "10.21.1.119",
                         "10.21.1.242",
                         "10.20.36.204",
                         "10.20.36.21",
                         "10.21.2.144",
                         "10.20.36.200",
                         "10.20.36.243",
                         "10.21.1.79",
                         "10.21.2.94",
                         "10.20.37.158",
                         "10.20.37.133",
                         "10.21.1.219",
                         "10.21.1.81",
                         "10.21.2.38",
                         "10.21.1.83",
                         "10.21.1.148",
                         "10.21.2.103",
                         "10.21.1.125",
                         "10.20.36.36",
                         "10.21.1.205",
                         "10.20.36.148",
                         "10.20.37.126",
                         "10.20.36.212",
                         "10.20.36.99",
                         "10.20.36.205",
                         "10.21.1.222",
                         "10.20.37.110",
                         "10.21.1.37",
                         "10.20.36.247",
                         "10.21.1.189",
                         "10.21.1.175",
                         "10.21.1.177",
                         "10.21.1.8",
                         "10.20.37.22",
                         "10.20.36.92",
                         "10.21.2.107",
                         "10.21.2.110",
                         "10.21.1.113",
                         "10.21.1.227",
                         "10.20.36.146",
                         "10.21.1.236",
                         "10.20.37.122",
                         "10.20.36.185",
                         "10.21.1.114",
                         "10.20.36.94",
                         "10.21.2.146",
                         "10.21.2.34",
                         "10.20.36.83",
                         "10.20.37.144",
                         "10.21.1.121",
                         "10.20.36.8",
                         "10.20.36.32",
                         "10.20.36.42",
                         "10.21.1.54",
                         "10.20.37.111",
                         "10.20.36.137",
                         "10.20.37.157",
                         "10.20.36.89",
                         "10.20.37.54",
                         "10.20.36.90",
                         "10.20.37.58",
                         "10.21.1.167",
                         "10.20.37.106",
                         "10.20.36.11",
                         "10.20.37.47",
                         "10.21.1.106",
                         "10.21.1.15",
                         "10.21.1.116",
                         "10.20.37.60",
                         "10.20.37.143",
                         "10.20.36.196",
                         "10.21.1.218",
                         "10.20.36.39",
                         "10.21.2.104",
                         "10.20.36.96",
                         "10.20.37.162",
                         "10.21.1.151",
                         "10.21.1.12",
                         "10.20.37.32",
                         "10.20.37.170",
                         "10.20.37.147",
                         "10.21.1.180",
                         "10.20.37.140",
                         "10.21.1.237",
                         "10.20.37.138",
                         "10.21.1.157",
                         "10.20.37.107",
                         "10.20.37.142",
                         "10.21.2.31",
                         "10.20.36.143",
                         "10.21.1.96",
                         "10.21.1.184",
                         "10.21.1.216",
                         "10.21.1.221",
                         "10.21.1.127",
                         "10.20.36.23",
                         "10.21.1.33",
                         "10.20.37.49",
                         "10.21.1.203",
                         "10.20.36.147",
                         "10.20.37.19",
                         "10.20.37.59",
                         "10.20.36.199",
                         "10.21.1.80",
                         "10.20.37.150",
                         "10.21.1.156",
                         "10.20.36.210",
                         "10.21.1.7",
                         "10.20.37.52",
                         "10.20.37.18",
                         "10.21.2.88",
                         "10.20.37.46",
                         "10.21.1.28",
                         "10.20.36.211",
                         "10.20.37.167",
                         "10.21.1.84",
                         "10.21.1.9",
                         "10.20.37.149",
                         "10.21.1.230",
                         "10.20.37.145",
                         "10.21.2.44",
                         "10.20.37.128",
                         "10.21.1.149",
                         "10.20.37.132",
                         "10.20.37.141",
                         "10.21.1.128",
                         "10.21.1.186",
                         "10.21.1.229",
                         "10.21.2.142",
                         "10.21.2.101",
                         "10.21.1.56",
                         "10.21.1.105",
                         "10.20.37.164",
                         "10.20.37.146",
                         "10.20.37.137",
                         "10.20.36.47",
                         "10.21.2.111",
                         "10.21.2.46",
                         "10.21.2.150",
                         "10.20.37.159",
                         "10.21.2.56",
                         "10.21.1.239",
                         "10.21.1.58",
                         "10.21.1.82",
                         "10.21.2.53",
                         "10.20.37.130",
                         "10.21.1.77",
                         "10.20.37.135",
                         "10.21.1.183",
                         "10.20.36.206",
                         "10.20.37.125",
                         "10.21.1.35",
                         "10.20.37.121",
                         "10.20.36.91",
                         "10.21.1.124",
                         "10.21.1.188",
                         "10.21.1.241",
                         "10.21.1.159",
                         "10.21.2.35",
                         "10.20.36.51",
                         "10.20.36.201",
                         "10.20.37.153",
                         "10.20.37.34",
                         "10.20.36.49",
                         "10.20.36.167",
                         "10.21.2.148",
                         "10.20.37.166",
                         "10.20.36.43",
                         "10.20.37.23",
                         "10.20.37.169",
                         "10.21.2.39",
                         "10.21.1.16",
                         "10.21.1.223",
                         "10.21.2.143",
                         "10.20.37.30",
                         "10.20.37.28",
                         "10.21.1.108",
                         "10.20.36.195",
                         "10.20.37.112",
                         "10.21.2.42",
                         "10.21.1.202",
                         "10.21.1.201",
                         "10.20.37.148",
                         "10.20.37.29",
                         "10.21.2.93",
                         "10.21.1.11",
                         "10.20.37.109",
                         "10.21.2.100",
                         "10.21.1.117",
                         "10.21.1.17",
                         "10.21.2.95",
                         "10.21.1.233",
                         "10.21.1.164",
                         "10.20.37.154",
                         "10.20.36.208",
                         "10.20.37.39",
                         "10.21.1.25",
                         "10.21.1.204",
                         "10.21.1.19",
                         "10.21.1.118",
                         "10.20.36.194",
                         "10.20.36.24",
                         "10.21.1.253",
                         "10.20.36.7",
                         "10.20.36.93",
                         "10.21.1.18",
                         "10.20.37.156",
                         "10.20.37.33",
                         "10.21.1.120",
                         "10.21.1.152",
                         "10.20.37.27",
                         "10.20.36.9",
                         "10.20.36.249",
                         "10.20.37.40",
                         "10.20.37.151",
                         "10.21.2.90",
                         "10.21.1.111",
                         "10.21.1.122",
                         "10.21.1.55",
                         "10.21.1.24",
                         "10.20.36.197",
                         "10.21.1.13",
                         "10.21.1.231",
                         "10.20.37.136",
                         "10.21.1.200",
                         "10.21.1.39",
                         "10.20.36.214",
                         "10.21.1.220",
                         "10.20.37.51",
                         "10.20.36.50",
                         "10.20.36.250",
                         "10.20.37.129",
                         "10.21.1.154",
                         "10.20.36.138",
                         "10.21.2.51",
                         "10.20.36.139",
                         "10.21.1.95",
                         "10.20.36.209",
                         "10.21.2.33",
                         "10.21.1.153",
                         "10.21.2.149",
                         "10.20.37.20",
                         "10.20.36.95",
                         "10.21.2.145",
                         "10.21.1.228",
                         "10.21.1.10",
                         "10.21.2.119",
                         "10.21.1.53",
                         "10.21.1.59",
                         "10.21.1.172",
                         "10.21.2.41",
                         "10.21.1.168",
                         "10.21.1.126",
                         "10.21.1.161",
                         "10.21.1.109",
                         "10.21.2.121",
                         "10.21.1.57",
                         "10.20.37.116",
                         "10.20.36.25",
                         "10.21.1.171",
                         "10.21.1.170",
                         "10.20.37.134",
                         "10.20.36.176",
                         "10.20.36.97",
                         "10.21.1.155",
                         "10.20.36.33",
                         "10.20.36.31",
                         "10.20.37.161",
                         "10.20.37.118",
                         "10.21.1.14",
                         "10.21.1.181",
                         "10.21.1.49",
                         "10.20.37.139",
                         "10.21.2.30",
                         "10.21.2.48",
                         "10.21.1.26",
                         "10.21.1.235",
                         "10.21.2.92",
                         "10.20.37.119",
                         "10.21.1.62",
                         "10.20.37.152"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1428" {
   display_name = "TF-AG1-IPSET-SL-IRES-Netcool_Probes_Primary"
   nsx_id = "TF-AG1-IPSET-SL-IRES-Netcool_Probes_Primary"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.60.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1429" {
   display_name = "TF-AG1-IPSET-NET-SL-IRES-Portable-NSX-T"
   nsx_id = "TF-AG1-IPSET-NET-SL-IRES-Portable-NSX-T"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1430" {
   display_name = "TF-AG1-IPSET-IBM-Blue-CDH"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-CDH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.220.2.216",
                         "9.220.2.221",
                         "9.220.5.123"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1431" {
   display_name = "TF-AG1-IPSET-STaaS-DR53-V7000"
   nsx_id = "TF-AG1-IPSET-STaaS-DR53-V7000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.21.1.151-10.21.1.158",
                         "10.20.36.249-10.20.36.251",
                         "10.21.1.164",
                         "10.21.1.187-10.21.1.189",
                         "10.20.37.107-10.20.37.109",
                         "10.21.1.131",
                         "10.20.36.194-10.20.36.214",
                         "10.20.36.243-10.20.36.245",
                         "10.21.1.94-10.21.1.96",
                         "10.21.1.124-10.21.1.126",
                         "10.21.1.24-10.21.1.26",
                         "10.21.2.119-10.21.2.121",
                         "10.21.1.163",
                         "10.21.1.147-10.21.1.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1432" {
   display_name = "TF-AG1-IPSET-DR227-ESG-dlr-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR227-ESG-dlr-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.217"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1433" {
   display_name = "TF-AG1-IPSET-MSS-Admin-Access"
   nsx_id = "TF-AG1-IPSET-MSS-Admin-Access"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "209.134.191.19",
                         "209.134.191.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1434" {
   display_name = "TF-AG1-IPSET-DR227-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR227-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.190.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1435" {
   display_name = "TF-AG1-IPSET-NET-WDC-PDR-subnets"
   nsx_id = "TF-AG1-IPSET-NET-WDC-PDR-subnets"
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
resource "nsxt_policy_group" "grp_1436" {
   display_name = "TF-AG1-IPSET-Host-ap1srwphwcgadb1"
   nsx_id = "TF-AG1-IPSET-Host-ap1srwphwcgadb1"
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
resource "nsxt_policy_group" "grp_1437" {
   display_name = "TF-AG1-IPSET-STaaS-DR59-Storage-A9000-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR59-Storage-A9000-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.69.161.97",
                         "10.64.90.106",
                         "10.64.90.108",
                         "10.64.90.104",
                         "10.69.161.98",
                         "10.64.90.113",
                         "10.69.161.101",
                         "10.64.90.110",
                         "10.64.90.111",
                         "10.69.161.107",
                         "10.69.161.100",
                         "10.69.161.21-10.69.161.26",
                         "10.64.90.112",
                         "10.64.90.103",
                         "10.69.161.106",
                         "10.64.90.109",
                         "10.64.90.107",
                         "10.69.161.103",
                         "10.64.90.105",
                         "10.69.161.104",
                         "10.69.161.99",
                         "10.64.90.102",
                         "10.69.161.105",
                         "10.69.161.96",
                         "10.69.161.102"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1438" {
   display_name = "TF-AG1-IPSET-NET-CPREM-DR158-NAT-Range"
   nsx_id = "TF-AG1-IPSET-NET-CPREM-DR158-NAT-Range"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.105.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1439" {
   display_name = "TF-AG1-IPSET-DR162-CACF-CPREM-vRA2"
   nsx_id = "TF-AG1-IPSET-DR162-CACF-CPREM-vRA2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.170.128.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1440" {
   display_name = "TF-AG1-IPSET-ag1sr1lpansb-sr1-sp-ibm-local"
   nsx_id = "TF-AG1-IPSET-ag1sr1lpansb-sr1-sp-ibm-local"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.196"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1441" {
   display_name = "TF-AG1-IPSET-CNS-Dallas-2"
   nsx_id = "TF-AG1-IPSET-CNS-Dallas-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.254.98",
                         "169.62.254.97",
                         "169.62.254.99"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1442" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-RMQ-PROD-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-RMQ-PROD-VIP"
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
resource "nsxt_policy_group" "grp_1443" {
   display_name = "TF-AG1-IPSET-NAT-ag1dr19stl"
   nsx_id = "TF-AG1-IPSET-NAT-ag1dr19stl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1444" {
   display_name = "TF-AG1-IPSET-INT-SVCS-PROD-WDC"
   nsx_id = "TF-AG1-IPSET-INT-SVCS-PROD-WDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.125.156",
                         "146.89.125.150",
                         "146.89.125.149",
                         "146.89.125.151",
                         "146.89.125.153",
                         "146.89.125.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1445" {
   display_name = "TF-AG1-IPSET-DR187-CPREM-TICKET-API"
   nsx_id = "TF-AG1-IPSET-DR187-CPREM-TICKET-API"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.152.148.126",
                         "162.95.228.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1446" {
   display_name = "TF-AG1-IPSET-EXT-BLUEPAGES"
   nsx_id = "TF-AG1-IPSET-EXT-BLUEPAGES"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.15.48.48",
                         "9.23.210.79",
                         "9.17.186.253",
                         "9.15.0.48",
                         "9.57.182.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1447" {
   display_name = "TF-AG1-IPSET-IMI-Solarwinds-IRES-NAT"
   nsx_id = "TF-AG1-IPSET-IMI-Solarwinds-IRES-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.168"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1448" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-REMEDY--PROD1"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-REMEDY--PROD1"
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
resource "nsxt_policy_group" "grp_1449" {
   display_name = "TF-AG1-IPSET-NET-All-CGN-Subnets"
   nsx_id = "TF-AG1-IPSET-NET-All-CGN-Subnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.0.0/10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1450" {
   display_name = "TF-AG1-IPSET-M&E-Lab-10_175_14_129"
   nsx_id = "TF-AG1-IPSET-M&E-Lab-10_175_14_129"
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
resource "nsxt_policy_group" "grp_1451" {
   display_name = "TF-AG1-IPSET-IRES-VROPS-Server"
   nsx_id = "TF-AG1-IPSET-IRES-VROPS-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.159",
                         "10.65.55.142",
                         "10.65.55.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1452" {
   display_name = "TF-AG1-IPSET-DR192-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR192-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.164.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1453" {
   display_name = "TF-AG1-IPSET-DR158-CPREM-NETCOOL-PROD-STBY"
   nsx_id = "TF-AG1-IPSET-DR158-CPREM-NETCOOL-PROD-STBY"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "165.216.57.72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1454" {
   display_name = "TF-AG1-IPSET-DR180-ESG-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR180-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.45"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1455" {
   display_name = "TF-AG1-IPSET-DR158-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR158-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.140.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1456" {
   display_name = "TF-AG1-IPSET-STaaS-DR147-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR147-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.170.125.72-10.170.125.84",
                         "10.171.125.72-10.171.125.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1457" {
   display_name = "TF-AG1-IPSET-STaaS-DR144-Storage-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR144-Storage-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.101.240.14-10.101.240.19",
                         "10.1.240.11-10.1.240.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1458" {
   display_name = "TF-AG1-IPSET-CIO-JHOSTS"
   nsx_id = "TF-AG1-IPSET-CIO-JHOSTS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "142.88.22.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1459" {
   display_name = "TF-AG1-IPSET-STaaS-DR147-Storage-A9000-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR147-Storage-A9000-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.170.125.90-10.170.125.95",
                         "10.171.125.90-10.171.125.95",
                         "10.40.64.158-10.40.64.160",
                         "10.100.19.171-10.100.19.173",
                         "10.101.69.101-10.101.69.103"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1460" {
   display_name = "TF-AG1-IPSET-NET-SL-IRES-Primary-ESXi-vmk0"
   nsx_id = "TF-AG1-IPSET-NET-SL-IRES-Primary-ESXi-vmk0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.121.128/25",
                         "10.211.102.160/27",
                         "10.65.60.192/26",
                         "10.211.121.0/25",
                         "10.211.12.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1461" {
   display_name = "TF-AG1-IPSET-DR233-PROXY-VIP"
   nsx_id = "TF-AG1-IPSET-DR233-PROXY-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.192.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1462" {
   display_name = "TF-AG1-IPSET-CDI-NA-Proxy"
   nsx_id = "TF-AG1-IPSET-CDI-NA-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.104.143"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1463" {
   display_name = "TF-AG1-IPSET-ag1sr1wpiamcifs"
   nsx_id = "TF-AG1-IPSET-ag1sr1wpiamcifs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.184"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1464" {
   display_name = "TF-AG1-IPSET-AMS-IPM8-SaaS"
   nsx_id = "TF-AG1-IPSET-AMS-IPM8-SaaS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "159.8.20.242",
                         "159.8.20.241",
                         "159.8.20.240"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1465" {
   display_name = "TF-AG1-IPSET-NAT-ag1dr19lpskl"
   nsx_id = "TF-AG1-IPSET-NAT-ag1dr19lpskl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1466" {
   display_name = "TF-AG1-IPSET-MSS-Group3"
   nsx_id = "TF-AG1-IPSET-MSS-Group3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "209.134.187.16/29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1467" {
   display_name = "TF-AG1-IPSET-ag1srwpdvaapp02"
   nsx_id = "TF-AG1-IPSET-ag1srwpdvaapp02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.146"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1468" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-SVG-UAT"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-SVG-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.69",
                         "158.87.49.83",
                         "158.87.49.84",
                         "158.87.49.68"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1469" {
   display_name = "TF-AG1-IPSET-NET-CPREM-DR1211-NAT-Range"
   nsx_id = "TF-AG1-IPSET-NET-CPREM-DR1211-NAT-Range"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.2.162.48/28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1470" {
   display_name = "TF-AG1-IPSET-pdywdchmc0101-sl-bluecloud-ibm-com"
   nsx_id = "TF-AG1-IPSET-pdywdchmc0101-sl-bluecloud-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.229.208"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1471" {
   display_name = "TF-AG1-IPSET-NAT-me-test-e4v7g-netcool"
   nsx_id = "TF-AG1-IPSET-NAT-me-test-e4v7g-netcool"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.37"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1472" {
   display_name = "TF-AG1-IPSET-SRES-IAM-CIO-PROXY-PROD-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-CIO-PROXY-PROD-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.204"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1473" {
   display_name = "TF-AG1-IPSET-MX-GDL-PROD"
   nsx_id = "TF-AG1-IPSET-MX-GDL-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.48.154",
                         "158.98.48.151",
                         "10.15.5.12",
                         "15.128.86.15",
                         "158.98.54.196",
                         "15.128.86.11",
                         "15.128.6.235",
                         "158.98.60.11",
                         "158.98.60.15",
                         "158.98.54.192",
                         "15.128.86.12",
                         "15.128.86.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1474" {
   display_name = "TF-AG1-IPSET-pgasydaic0101"
   nsx_id = "TF-AG1-IPSET-pgasydaic0101"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.220.132.14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1475" {
   display_name = "TF-AG1-IPSET-ESLS2-UAT1-5"
   nsx_id = "TF-AG1-IPSET-ESLS2-UAT1-5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.184.69-146.89.184.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1476" {
   display_name = "TF-AG1-IPSET-in1sr1wpgrfds"
   nsx_id = "TF-AG1-IPSET-in1sr1wpgrfds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1477" {
   display_name = "TF-AG1-IPSET-INT-SVCS-NONPROD-WDC"
   nsx_id = "TF-AG1-IPSET-INT-SVCS-NONPROD-WDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.125.148",
                         "146.89.125.147",
                         "146.89.125.130",
                         "146.89.125.132",
                         "146.89.125.134",
                         "146.89.125.133",
                         "146.89.125.152",
                         "146.89.125.135",
                         "158.87.35.210",
                         "146.89.125.155"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1478" {
   display_name = "TF-AG1-IPSET-STaaS-DR147-CISCO-iSCSI-Switches"
   nsx_id = "TF-AG1-IPSET-STaaS-DR147-CISCO-iSCSI-Switches"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.101.69.51-10.101.69.58",
                         "10.100.19.94-10.100.19.101",
                         "10.40.64.120-10.40.64.127"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1479" {
   display_name = "TF-AG1-IPSET-DR224-Cprem-JH"
   nsx_id = "TF-AG1-IPSET-DR224-Cprem-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.247.254.3",
                         "10.246.255.138"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1480" {
   display_name = "TF-AG1-IPSET-BLUEID-PROD"
   nsx_id = "TF-AG1-IPSET-BLUEID-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.63.40.251"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1481" {
   display_name = "TF-AG1-IPSET-Host-ppywdclalmt01"
   nsx_id = "TF-AG1-IPSET-Host-ppywdclalmt01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.230.196"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1482" {
   display_name = "TF-AG1-IPSET-driamaasthy-Customer1-Windows-EP-2"
   nsx_id = "TF-AG1-IPSET-driamaasthy-Customer1-Windows-EP-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.186.25.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1483" {
   display_name = "TF-AG1-IPSET-SRES-OCP-Cluster05-Temp"
   nsx_id = "TF-AG1-IPSET-SRES-OCP-Cluster05-Temp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.3-158.87.49.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1484" {
   display_name = "TF-AG1-IPSET-IRES-uswhpsl1dcr4"
   nsx_id = "TF-AG1-IPSET-IRES-uswhpsl1dcr4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.121.53"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1485" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-REMEDY-KDC"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-REMEDY-KDC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "152.144.148.38",
                         "152.144.180.203",
                         "161.228.115.18",
                         "161.228.115.105",
                         "161.228.62.58",
                         "161.228.115.53",
                         "161.228.206.68",
                         "152.144.180.205",
                         "152.144.129.58",
                         "152.144.180.204",
                         "152.144.129.62",
                         "161.228.206.63",
                         "161.228.115.156",
                         "152.144.180.206",
                         "161.228.115.125",
                         "161.228.206.64"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1486" {
   display_name = "TF-AG1-IPSET-STaaS-DR11-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR11-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.10.5-10.1.10.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1487" {
   display_name = "TF-AG1-IPSET-SRES-Window-Linux-JumpHost"
   nsx_id = "TF-AG1-IPSET-SRES-Window-Linux-JumpHost"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.5",
                         "158.87.48.96",
                         "158.87.48.4",
                         "158.87.48.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1488" {
   display_name = "TF-AG1-IPSET-AP1-IP-AP1SRWPHWC"
   nsx_id = "TF-AG1-IPSET-AP1-IP-AP1SRWPHWC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.234",
                         "158.87.54.232",
                         "158.87.54.233"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1489" {
   display_name = "TF-AG1-IPSET-AMS-SRES-Icp-icp2"
   nsx_id = "TF-AG1-IPSET-AMS-SRES-Icp-icp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.132-158.87.52.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1490" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-IBM-9-DB2"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-IBM-9-DB2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.149.87.165"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1491" {
   display_name = "TF-AG1-IPSET-HOST:icd-was-us-gtsaas-softlayer"
   nsx_id = "TF-AG1-IPSET-HOST:icd-was-us-gtsaas-softlayer"
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
resource "nsxt_policy_group" "grp_1492" {
   display_name = "TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2"
   nsx_id = "TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1493" {
   display_name = "TF-AG1-IPSET-ca1phwswstr01ra"
   nsx_id = "TF-AG1-IPSET-ca1phwswstr01ra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.19"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1494" {
   display_name = "TF-AG1-IPSET-SL-IRES-PSC"
   nsx_id = "TF-AG1-IPSET-SL-IRES-PSC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.55.132",
                         "10.65.55.133"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1495" {
   display_name = "TF-AG1-IPSET-HRES-RCP-VIP"
   nsx_id = "TF-AG1-IPSET-HRES-RCP-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.19"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1496" {
   display_name = "TF-AG1-IPSET-NAT-test-rdszz-omnibus"
   nsx_id = "TF-AG1-IPSET-NAT-test-rdszz-omnibus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1497" {
   display_name = "TF-AG1-IPSET-DR78-SSH-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR78-SSH-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.106.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1498" {
   display_name = "TF-AG1-IPSET-NET-VMSUBNETS-EU-SRES"
   nsx_id = "TF-AG1-IPSET-NET-VMSUBNETS-EU-SRES"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.231.0/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1499" {
   display_name = "TF-AG1-IPSET-DR187-CPREM-TICKET-DB"
   nsx_id = "TF-AG1-IPSET-DR187-CPREM-TICKET-DB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "162.95.228.35",
                         "10.155.12.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1500" {
   display_name = "TF-AG1-IPSET-mopbzp174187"
   nsx_id = "TF-AG1-IPSET-mopbzp174187"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.212.159.187"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1501" {
   display_name = "TF-AG1-IPSET-XFORCE"
   nsx_id = "TF-AG1-IPSET-XFORCE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "12.181.65.133",
                         "169.50.86.220",
                         "144.121.29.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1502" {
   display_name = "TF-AG1-IPSET-DRES16-ICp-Cluster01-Ingress-VIP"
   nsx_id = "TF-AG1-IPSET-DRES16-ICp-Cluster01-Ingress-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.78.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1503" {
   display_name = "TF-AG1-IPSET-NSXT-ag1nsxt-vc-sp"
   nsx_id = "TF-AG1-IPSET-NSXT-ag1nsxt-vc-sp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1504" {
   display_name = "TF-AG1-IPSET-CA1-CA1PHWSWLSO1RA"
   nsx_id = "TF-AG1-IPSET-CA1-CA1PHWSWLSO1RA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1505" {
   display_name = "TF-AG1-IPSET-bjy7vr1-tms-stglabs"
   nsx_id = "TF-AG1-IPSET-bjy7vr1-tms-stglabs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.19.151.124"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1506" {
   display_name = "TF-AG1-IPSET-DR227-CPREM-ACCESS-VMS"
   nsx_id = "TF-AG1-IPSET-DR227-CPREM-ACCESS-VMS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.23.242",
                         "192.168.23.241",
                         "192.168.23.244",
                         "192.168.23.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1507" {
   display_name = "TF-AG1-IPSET-ppywdchflmt02"
   nsx_id = "TF-AG1-IPSET-ppywdchflmt02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.225.192"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1508" {
   display_name = "TF-AG1-IPSET-HWSW-IBM-9-SERVERS-2"
   nsx_id = "TF-AG1-IPSET-HWSW-IBM-9-SERVERS-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.56.22.229",
                         "9.209.242.186",
                         "9.209.227.176",
                         "9.56.22.235",
                         "9.220.27.85",
                         "9.56.22.231"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1509" {
   display_name = "TF-AG1-IPSET-ag1sr1lniamigi1-vip"
   nsx_id = "TF-AG1-IPSET-ag1sr1lniamigi1-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1510" {
   display_name = "TF-AG1-IPSET-me-test-e4v7g-netcool"
   nsx_id = "TF-AG1-IPSET-me-test-e4v7g-netcool"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.165"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1511" {
   display_name = "TF-AG1-IPSET-DR144-CPREM-JH"
   nsx_id = "TF-AG1-IPSET-DR144-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "204.74.199.113",
                         "204.74.199.112"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1512" {
   display_name = "TF-AG1-IPSET-Host-MNE-Dev-Test"
   nsx_id = "TF-AG1-IPSET-Host-MNE-Dev-Test"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.74",
                         "158.87.159.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1513" {
   display_name = "TF-AG1-IPSET-Host-ag1srlpgse1000"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlpgse1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.235"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1514" {
   display_name = "TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
   nsx_id = "TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.87",
                         "158.87.106.86"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1515" {
   display_name = "TF-AG1-IPSET-DR192-ESG-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR192-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1516" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-3306"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-3306"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.19.93.130",
                         "9.151.140.36"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1517" {
   display_name = "TF-AG1-IPSET-HWSW-BlueCloud-SanJose"
   nsx_id = "TF-AG1-IPSET-HWSW-BlueCloud-SanJose"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.104.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1518" {
   display_name = "TF-AG1-IPSET-eu1srlpm1ecnp"
   nsx_id = "TF-AG1-IPSET-eu1srlpm1ecnp"
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
resource "nsxt_policy_group" "grp_1519" {
   display_name = "TF-AG1-IPSET-BPMOC"
   nsx_id = "TF-AG1-IPSET-BPMOC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.60.61.161",
                         "169.60.61.162",
                         "169.60.61.163",
                         "169.60.61.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1520" {
   display_name = "TF-AG1-IPSET-AMS-MEaaS-Proxy"
   nsx_id = "TF-AG1-IPSET-AMS-MEaaS-Proxy"
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
resource "nsxt_policy_group" "grp_1521" {
   display_name = "TF-AG1-IPSET-IBM-Blue-w3-01"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-w3-01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.57.61.80"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1522" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-pages"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-pages"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "23.49.29.137",
                         "23.74.170.214",
                         "141.193.213.20",
                         "125.56.199.41",
                         "23.74.210.123",
                         "35.189.113.159",
                         "129.42.42.224",
                         "74.201.172.176",
                         "23.74.210.88",
                         "54.69.234.59",
                         "23.75.23.168",
                         "23.77.16.97",
                         "103.116.4.201",
                         "23.74.168.192"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1523" {
   display_name = "TF-AG1-IPSET-DR187-CPREM-BIGFIX"
   nsx_id = "TF-AG1-IPSET-DR187-CPREM-BIGFIX"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "162.95.228.37",
                         "30.236.135.23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1524" {
   display_name = "TF-AG1-IPSET-IBM-Blue-Sendmail"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-Sendmail"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.44.14.14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1525" {
   display_name = "TF-AG1-IPSET-DR59-LB-VIP-1"
   nsx_id = "TF-AG1-IPSET-DR59-LB-VIP-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.93.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1526" {
   display_name = "TF-AG1-IPSET-DR158-ESG-vpn-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR158-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.2.66"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1527" {
   display_name = "TF-AG1-IPSET-IRES-uswhpsl1dcr3"
   nsx_id = "TF-AG1-IPSET-IRES-uswhpsl1dcr3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.121.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1528" {
   display_name = "TF-AG1-IPSET-NET-DR40-DC1_range5"
   nsx_id = "TF-AG1-IPSET-NET-DR40-DC1_range5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.81.10.0/23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1529" {
   display_name = "TF-AG1-IPSET-ag1srwpdvaapp"
   nsx_id = "TF-AG1-IPSET-ag1srwpdvaapp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.154",
                         "158.87.49.134",
                         "158.87.48.146"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1530" {
   display_name = "TF-AG1-IPSET-PB-RPA-BP-80"
   nsx_id = "TF-AG1-IPSET-PB-RPA-BP-80"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "161.228.110.19",
                         "161.228.110.200",
                         "161.228.110.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1531" {
   display_name = "TF-AG1-IPSET-STaaS-DR112-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR112-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.232.66",
                         "172.29.38.57",
                         "172.29.38.40",
                         "172.29.26.120",
                         "172.18.46.17",
                         "172.28.2.73",
                         "172.29.38.47",
                         "172.29.46.47",
                         "172.29.46.45",
                         "172.19.9.228",
                         "172.28.46.30",
                         "172.28.2.52",
                         "172.28.2.44",
                         "172.29.46.49",
                         "172.29.3.34",
                         "172.28.2.45",
                         "172.29.26.116",
                         "172.28.2.37",
                         "172.16.232.77",
                         "172.16.232.83",
                         "172.29.46.30",
                         "172.16.232.82",
                         "172.28.2.51",
                         "172.29.1.24",
                         "172.18.46.16",
                         "172.29.38.44",
                         "172.29.2.40",
                         "172.29.46.42",
                         "172.28.2.31",
                         "172.29.46.51",
                         "172.16.232.62",
                         "172.29.26.118",
                         "172.16.232.78",
                         "172.29.38.48",
                         "172.28.1.21",
                         "172.19.9.218",
                         "172.29.46.40",
                         "172.29.2.32",
                         "172.28.2.70",
                         "172.29.2.68",
                         "172.16.232.76",
                         "172.28.2.72",
                         "172.29.46.34",
                         "172.16.232.68",
                         "172.29.26.115",
                         "172.29.38.42",
                         "172.16.232.74",
                         "172.29.2.33",
                         "172.28.2.38",
                         "172.29.38.74",
                         "172.29.38.41",
                         "172.28.2.21",
                         "172.16.232.41",
                         "172.29.38.45",
                         "172.28.2.50",
                         "172.29.38.46",
                         "172.23.200.9",
                         "172.29.38.50",
                         "172.16.232.39",
                         "172.28.2.40",
                         "172.16.232.79",
                         "172.29.46.50",
                         "172.28.2.41",
                         "172.29.46.43",
                         "172.29.46.48",
                         "172.29.2.31",
                         "172.29.38.49",
                         "172.23.200.10",
                         "172.29.46.35",
                         "172.16.232.64",
                         "172.29.46.31",
                         "172.29.1.25",
                         "172.29.2.34",
                         "172.29.2.39",
                         "172.29.38.43",
                         "172.29.46.32",
                         "172.29.38.73",
                         "172.28.46.32",
                         "172.29.38.75",
                         "172.28.2.43",
                         "172.29.46.41",
                         "172.19.9.219",
                         "172.29.26.117",
                         "172.16.231.29",
                         "172.28.2.42",
                         "172.16.232.75",
                         "172.29.46.33",
                         "172.29.38.56",
                         "172.29.46.46",
                         "172.28.46.31",
                         "172.29.3.35",
                         "172.19.9.227",
                         "172.29.46.44",
                         "172.29.2.24",
                         "172.28.2.53",
                         "172.28.2.15",
                         "172.16.231.31",
                         "172.29.38.54",
                         "172.28.2.71",
                         "172.29.2.25",
                         "172.29.26.119"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1532" {
   display_name = "TF-AG1-IPSET-IRES-uswhpsl1dcr2"
   nsx_id = "TF-AG1-IPSET-IRES-uswhpsl1dcr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.121.77"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1533" {
   display_name = "TF-AG1-IPSET-MnE-Dev-meaas01-o4mpw-omnibus"
   nsx_id = "TF-AG1-IPSET-MnE-Dev-meaas01-o4mpw-omnibus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.36"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1534" {
   display_name = "TF-AG1-IPSET-SRES-TALOS-b01avi11810416"
   nsx_id = "TF-AG1-IPSET-SRES-TALOS-b01avi11810416"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.56.20.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1535" {
   display_name = "TF-AG1-IPSET-ag1srlpsatpxy-vip"
   nsx_id = "TF-AG1-IPSET-ag1srlpsatpxy-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.129"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1536" {
   display_name = "TF-AG1-IPSET-IBM-NA-RELAY"
   nsx_id = "TF-AG1-IPSET-IBM-NA-RELAY"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.17.130.236",
                         "9.57.199.107",
                         "9.17.130.232",
                         "9.57.199.109",
                         "9.57.199.108",
                         "9.17.130.235",
                         "9.57.199.111",
                         "9.57.199.110",
                         "9.17.130.234",
                         "9.17.130.233",
                         "9.57.199.106",
                         "9.17.130.237"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1537" {
   display_name = "TF-AG1-IPSET-HWSW-GACDW-AP---DB"
   nsx_id = "TF-AG1-IPSET-HWSW-GACDW-AP---DB"
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
resource "nsxt_policy_group" "grp_1538" {
   display_name = "TF-AG1-IPSET-DR162-CPREM-NETCOOL"
   nsx_id = "TF-AG1-IPSET-DR162-CPREM-NETCOOL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.139.64.118",
                         "10.170.160.79"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1539" {
   display_name = "TF-AG1-IPSET-ICp-VRRP-IP"
   nsx_id = "TF-AG1-IPSET-ICp-VRRP-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "224.0.0.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1540" {
   display_name = "TF-AG1-IPSET-SL-NSXT-VC_MGMT-Subnet"
   nsx_id = "TF-AG1-IPSET-SL-NSXT-VC_MGMT-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.211.12.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1541" {
   display_name = "TF-AG1-IPSET-SRES-TKG-MGMTs"
   nsx_id = "TF-AG1-IPSET-SRES-TKG-MGMTs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.243.0/27",
                         "100.71.243.64/27",
                         "100.71.243.32/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1542" {
   display_name = "TF-AG1-IPSET-SRES-Win-Jump-Servers-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-Win-Jump-Servers-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1543" {
   display_name = "TF-AG1-IPSET-agnsrlnicp1p-vip"
   nsx_id = "TF-AG1-IPSET-agnsrlnicp1p-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.121"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1544" {
   display_name = "TF-AG1-IPSET-ESLS5-UAT1-5"
   nsx_id = "TF-AG1-IPSET-ESLS5-UAT1-5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.187.227-146.89.187.228",
                         "146.89.187.230",
                         "146.89.187.192-146.89.187.193"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1545" {
   display_name = "TF-AG1-IPSET-ca1phwswetl01ra"
   nsx_id = "TF-AG1-IPSET-ca1phwswetl01ra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1546" {
   display_name = "TF-AG1-IPSET-ag1dr158lpprx-VIP"
   nsx_id = "TF-AG1-IPSET-ag1dr158lpprx-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.140.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1547" {
   display_name = "TF-AG1-IPSET-NET-NSXT-OCP04-Subnet"
   nsx_id = "TF-AG1-IPSET-NET-NSXT-OCP04-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.2",
                         "100.71.244.32/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1548" {
   display_name = "TF-AG1-IPSET-DR203-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR203-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.174.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1549" {
   display_name = "TF-AG1-IPSET-KAFKA-MH-VZFKDLFLPYDMPMRPRWXT"
   nsx_id = "TF-AG1-IPSET-KAFKA-MH-VZFKDLFLPYDMPMRPRWXT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.47.26.90"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1550" {
   display_name = "TF-AG1-IPSET-DR19-Forwarding-IP"
   nsx_id = "TF-AG1-IPSET-DR19-Forwarding-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.0.97"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1551" {
   display_name = "TF-AG1-IPSET-DRES96-pl025nco"
   nsx_id = "TF-AG1-IPSET-DRES96-pl025nco"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.12.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1552" {
   display_name = "TF-AG1-IPSET-SL-IRES-Netcool_Probes_Secondary"
   nsx_id = "TF-AG1-IPSET-SL-IRES-Netcool_Probes_Secondary"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.65.60.212"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1553" {
   display_name = "TF-AG1-IPSET-hres1-lb1-PrimaryIP"
   nsx_id = "TF-AG1-IPSET-hres1-lb1-PrimaryIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1554" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-SVG-PROD"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-SVG-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.119",
                         "158.87.49.120",
                         "158.87.49.99",
                         "158.87.49.100"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1555" {
   display_name = "TF-AG1-IPSET-IMI-Netcool"
   nsx_id = "TF-AG1-IPSET-IMI-Netcool"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.155.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1556" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-POC-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-POC-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.97",
                         "158.87.48.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1557" {
   display_name = "TF-AG1-IPSET-SRES-LB-OCP-Cluster03-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-LB-OCP-Cluster03-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.2",
                         "158.87.48.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1558" {
   display_name = "TF-AG1-IPSET-dr112-LB-VIP1-NAT"
   nsx_id = "TF-AG1-IPSET-dr112-LB-VIP1-NAT"
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
resource "nsxt_policy_group" "grp_1559" {
   display_name = "TF-AG1-IPSET-DR233-CLIENT-JH"
   nsx_id = "TF-AG1-IPSET-DR233-CLIENT-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.129.6.1",
                         "10.129.6.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1560" {
   display_name = "TF-AG1-IPSET-eu1sr1wphwcdb"
   nsx_id = "TF-AG1-IPSET-eu1sr1wphwcdb"
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
resource "nsxt_policy_group" "grp_1561" {
   display_name = "TF-AG1-IPSET-NAT-ag1dr19stw"
   nsx_id = "TF-AG1-IPSET-NAT-ag1dr19stw"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1562" {
   display_name = "TF-AG1-IPSET-SRES-IAM-CIO-MSSQL-PROD-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-CIO-MSSQL-PROD-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.206",
                         "158.87.49.203"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1563" {
   display_name = "TF-AG1-IPSET-SRES-ICp-icp2-Ingress-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-ICp-icp2-Ingress-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1564" {
   display_name = "TF-AG1-IPSET-pdr-esg01-inside-2"
   nsx_id = "TF-AG1-IPSET-pdr-esg01-inside-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.0.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1565" {
   display_name = "TF-AG1-IPSET-ddydalssdev01"
   nsx_id = "TF-AG1-IPSET-ddydalssdev01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.235.212"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1566" {
   display_name = "TF-AG1-IPSET-IBM-Blue-API-Connect"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-API-Connect"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.44.14.146",
                         "9.17.253.233",
                         "9.131.50.167"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1567" {
   display_name = "TF-AG1-IPSET-DRES96-pl022tmsfe"
   nsx_id = "TF-AG1-IPSET-DRES96-pl022tmsfe"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.12.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1568" {
   display_name = "TF-AG1-IPSET-ESLS1-UAT"
   nsx_id = "TF-AG1-IPSET-ESLS1-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.151.232"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1569" {
   display_name = "TF-AG1-IPSET-SRES-LB-OCP-Cluster1"
   nsx_id = "TF-AG1-IPSET-SRES-LB-OCP-Cluster1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.244.64/26",
                         "158.87.48.108"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1570" {
   display_name = "TF-AG1-IPSET-IBM-w3id"
   nsx_id = "TF-AG1-IPSET-IBM-w3id"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "104.70.50.225"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1571" {
   display_name = "TF-AG1-IPSET-NAT-ag1h1lpta1ssh"
   nsx_id = "TF-AG1-IPSET-NAT-ag1h1lpta1ssh"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.56.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1572" {
   display_name = "TF-AG1-IPSET-CACF-LAB-ROCHESTER-MN-USA"
   nsx_id = "TF-AG1-IPSET-CACF-LAB-ROCHESTER-MN-USA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.10.229.63-9.10.229.67"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1573" {
   display_name = "TF-AG1-IPSET-DSS-Sitest"
   nsx_id = "TF-AG1-IPSET-DSS-Sitest"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1574" {
   display_name = "TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool2"
   nsx_id = "TF-AG1-IPSET-SRES-NA-nonGR-SharedNetcool2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.23.98"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1575" {
   display_name = "TF-AG1-IPSET-DR192-ESG-agg-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR192-ESG-agg-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1576" {
   display_name = "TF-AG1-IPSET-ag1sr1lniamigi2-vip"
   nsx_id = "TF-AG1-IPSET-ag1sr1lniamigi2-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1577" {
   display_name = "TF-AG1-IPSET-HWSW-IBM"
   nsx_id = "TF-AG1-IPSET-HWSW-IBM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.208.59.234"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1578" {
   display_name = "TF-AG1-IPSET-DR285-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR285-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.206.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1579" {
   display_name = "TF-AG1-IPSET-MSS-FortiManager"
   nsx_id = "TF-AG1-IPSET-MSS-FortiManager"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "209.134.190.208/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1580" {
   display_name = "TF-AG1-IPSET-DR47-ICp1-Ingress-VIP"
   nsx_id = "TF-AG1-IPSET-DR47-ICp1-Ingress-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.84.15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1581" {
   display_name = "TF-AG1-IPSET-KAFKA-SVC01-US-EAST-EVENTSTREAMS-IBM-CLOUD"
   nsx_id = "TF-AG1-IPSET-KAFKA-SVC01-US-EAST-EVENTSTREAMS-IBM-CLOUD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.63.149.250",
                         "169.45.251.251",
                         "169.62.6.94"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1582" {
   display_name = "TF-AG1-IPSET-Brazil-Maximo-Shared-Prod"
   nsx_id = "TF-AG1-IPSET-Brazil-Maximo-Shared-Prod"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.183.10/32",
                         "158.98.183.49/32",
                         "158.98.183.50/32",
                         "158.98.183.232/32",
                         "158.98.183.51/32",
                         "158.98.183.52/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1583" {
   display_name = "TF-AG1-IPSET-STaaS-DR12-Storage-FS9150"
   nsx_id = "TF-AG1-IPSET-STaaS-DR12-Storage-FS9150"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "108.201.195.141",
                         "108.201.195.142",
                         "108.201.195.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1584" {
   display_name = "TF-AG1-IPSET-Tanzu-Workload-02-Subnet"
   nsx_id = "TF-AG1-IPSET-Tanzu-Workload-02-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.242.32/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1585" {
   display_name = "TF-AG1-IPSET-DR158-LB-VIP1"
   nsx_id = "TF-AG1-IPSET-DR158-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.141.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1586" {
   display_name = "TF-AG1-IPSET-IBM-Blue-CAR-DEV"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-CAR-DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.30.4.163"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1587" {
   display_name = "TF-AG1-IPSET-STaaS-DR147-CISCO-APIC"
   nsx_id = "TF-AG1-IPSET-STaaS-DR147-CISCO-APIC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.100.19.102-10.100.19.104",
                         "10.40.64.128-10.40.64.130",
                         "10.101.69.59-10.101.69.61"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1588" {
   display_name = "TF-AG1-IPSET-ag1srlniuadb01"
   nsx_id = "TF-AG1-IPSET-ag1srlniuadb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.173"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1589" {
   display_name = "TF-AG1-IPSET-pdr-esg01-LB-VIP-4"
   nsx_id = "TF-AG1-IPSET-pdr-esg01-LB-VIP-4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.116.104.68"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1590" {
   display_name = "TF-AG1-IPSET-dgawdchwswa01"
   nsx_id = "TF-AG1-IPSET-dgawdchwswa01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.228.87"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1591" {
   display_name = "TF-AG1-IPSET-HRES-ag1h1lpta1ssh-VIP"
   nsx_id = "TF-AG1-IPSET-HRES-ag1h1lpta1ssh-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1592" {
   display_name = "TF-AG1-IPSET-NET-GSELAB"
   nsx_id = "TF-AG1-IPSET-NET-GSELAB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.124.0.32/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1593" {
   display_name = "TF-AG1-IPSET-HWSW-IBM-9-wdcdmyyz945126"
   nsx_id = "TF-AG1-IPSET-HWSW-IBM-9-wdcdmyyz945126"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.45.126.100"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1594" {
   display_name = "TF-AG1-IPSET-STaaS-DR12-Storage-NetApp"
   nsx_id = "TF-AG1-IPSET-STaaS-DR12-Storage-NetApp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "108.201.143.59",
                         "108.101.89.101",
                         "108.201.195.51-108.201.195.68",
                         "108.101.70.122",
                         "108.101.89.102",
                         "108.201.195.102",
                         "108.201.195.101",
                         "108.101.89.10-108.101.89.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1595" {
   display_name = "TF-AG1-IPSET-NAT-DR19-STaaS-AD-DNS"
   nsx_id = "TF-AG1-IPSET-NAT-DR19-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.3",
                         "158.87.104.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1596" {
   display_name = "TF-AG1-IPSET-MCMS-Dallas-Proxy"
   nsx_id = "TF-AG1-IPSET-MCMS-Dallas-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.62.254.102"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1597" {
   display_name = "TF-AG1-IPSET-ca1dhwswstr01ra"
   nsx_id = "TF-AG1-IPSET-ca1dhwswstr01ra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.86.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1598" {
   display_name = "TF-AG1-IPSET-driamaasthy-Customer1-Windows-EP--1"
   nsx_id = "TF-AG1-IPSET-driamaasthy-Customer1-Windows-EP--1"
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
resource "nsxt_policy_group" "grp_1599" {
   display_name = "TF-AG1-IPSET-NET-CPREM-DR192-NAT-Range"
   nsx_id = "TF-AG1-IPSET-NET-CPREM-DR192-NAT-Range"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1600" {
   display_name = "TF-AG1-IPSET-MnE-Dev-meaas01-deploy-01"
   nsx_id = "TF-AG1-IPSET-MnE-Dev-meaas01-deploy-01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.159.97"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1601" {
   display_name = "TF-AG1-IPSET-PB-RPA-BP-Hyperion-Multiple"
   nsx_id = "TF-AG1-IPSET-PB-RPA-BP-Hyperion-Multiple"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "161.228.110.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1602" {
   display_name = "TF-AG1-IPSET-SL-IRES-vRLI"
   nsx_id = "TF-AG1-IPSET-SL-IRES-vRLI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.2",
                         "10.65.55.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1603" {
   display_name = "TF-AG1-IPSET-EU1-SG-SRES-OCP-Cluster05-MOM"
   nsx_id = "TF-AG1-IPSET-EU1-SG-SRES-OCP-Cluster05-MOM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.79.232.4",
                         "158.87.50.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1604" {
   display_name = "TF-AG1-IPSET-NET-WDC-GRES-GSNI-subnets"
   nsx_id = "TF-AG1-IPSET-NET-WDC-GRES-GSNI-subnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1605" {
   display_name = "TF-AG1-IPSET-HWSW-w3-969"
   nsx_id = "TF-AG1-IPSET-HWSW-w3-969"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.220.27.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1606" {
   display_name = "TF-AG1-IPSET-STaaS-DR234-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR234-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.100.19.106",
                         "10.100.19.105",
                         "10.101.69.62",
                         "10.101.69.63",
                         "10.238.44.10",
                         "10.238.44.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1607" {
   display_name = "TF-AG1-IPSET-EU1-eu1srlpelk1001"
   nsx_id = "TF-AG1-IPSET-EU1-eu1srlpelk1001"
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
resource "nsxt_policy_group" "grp_1608" {
   display_name = "TF-AG1-IPSET-NET-WDC-NAT-GSNI-subnets"
   nsx_id = "TF-AG1-IPSET-NET-WDC-NAT-GSNI-subnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.51.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1609" {
   display_name = "TF-AG1-IPSET-DR192-CPREM-REMEDY--PROD2"
   nsx_id = "TF-AG1-IPSET-DR192-CPREM-REMEDY--PROD2"
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
resource "nsxt_policy_group" "grp_1610" {
   display_name = "TF-AG1-IPSET-ag1dr59lppr1-VIP"
   nsx_id = "TF-AG1-IPSET-ag1dr59lppr1-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.92.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1611" {
   display_name = "TF-AG1-IPSET-IBM-Blue-zcogcad1"
   nsx_id = "TF-AG1-IPSET-IBM-Blue-zcogcad1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.17.159.47"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1612" {
   display_name = "TF-AG1-IPSET-STaaS-DR52-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR52-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.40.62.90-135.40.62.101"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1613" {
   display_name = "TF-AG1-IPSET-dr112-LB-VIP1"
   nsx_id = "TF-AG1-IPSET-dr112-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.121.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1614" {
   display_name = "TF-AG1-IPSET-ZXGCA-VIPA-UK-IBM-COM"
   nsx_id = "TF-AG1-IPSET-ZXGCA-VIPA-UK-IBM-COM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.149.88.209"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1615" {
   display_name = "TF-AG1-IPSET-DR196-ESG-agg-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR196-ESG-agg-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1616" {
   display_name = "TF-AG1-IPSET-ag1sr1aniamigi2"
   nsx_id = "TF-AG1-IPSET-ag1sr1aniamigi2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1617" {
   display_name = "TF-AG1-IPSET-DR40-CPREM-PR-Site-SR50657673"
   nsx_id = "TF-AG1-IPSET-DR40-CPREM-PR-Site-SR50657673"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "198.175.153.160",
                         "135.107.8.137",
                         "135.107.8.131",
                         "135.107.14.55",
                         "135.107.8.139",
                         "135.107.8.133",
                         "135.107.254.7",
                         "135.107.8.138",
                         "162.109.77.7",
                         "135.107.8.130",
                         "135.107.8.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1618" {
   display_name = "TF-AG1-IPSET-ppywdcigaag01"
   nsx_id = "TF-AG1-IPSET-ppywdcigaag01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.243.139"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1619" {
   display_name = "TF-AG1-IPSET-US-GRF-SSS"
   nsx_id = "TF-AG1-IPSET-US-GRF-SSS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.44.83.137"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1620" {
   display_name = "TF-AG1-IPSET-vpc-10-csc-subnet1"
   nsx_id = "TF-AG1-IPSET-vpc-10-csc-subnet1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.0.0/27",
                         "100.64.71.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1621" {
   display_name = "TF-AG1-IPSET-eu1srlpmcdjump"
   nsx_id = "TF-AG1-IPSET-eu1srlpmcdjump"
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
resource "nsxt_policy_group" "grp_1622" {
   display_name = "TF-AG1-IPSET-DR217-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR217-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.184.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1623" {
   display_name = "TF-AG1-IPSET-DR162-LB-VIP1-NAT1"
   nsx_id = "TF-AG1-IPSET-DR162-LB-VIP1-NAT1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.103.143.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1624" {
   display_name = "TF-AG1-IPSET-Meaas-noi-inn6y-wb"
   nsx_id = "TF-AG1-IPSET-Meaas-noi-inn6y-wb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.175.14.232",
                         "158.87.159.104"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1625" {
   display_name = "TF-AG1-IPSET-SRES-OCP-Cluster03-Temp"
   nsx_id = "TF-AG1-IPSET-SRES-OCP-Cluster03-Temp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.201-158.87.48.220"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1626" {
   display_name = "TF-AG1-IPSET-DOW-customer-Solarwinds---CNICC"
   nsx_id = "TF-AG1-IPSET-DOW-customer-Solarwinds---CNICC"
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
resource "nsxt_policy_group" "grp_1627" {
   display_name = "TF-AG1-IPSET-NET-Akamai-IBMID"
   nsx_id = "TF-AG1-IPSET-NET-Akamai-IBMID"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.201.218.0/24",
                         "92.123.212.0/24",
                         "104.76.198.0/24",
                         "192.201.219.0/24",
                         "23.55.57.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1628" {
   display_name = "TF-AG1-IPSET-STaaS-DR156-Storage-All"
   nsx_id = "TF-AG1-IPSET-STaaS-DR156-Storage-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.208.72.120-10.208.72.121",
                         "10.200.72.24-10.200.72.29",
                         "10.200.251.23-10.200.251.24",
                         "10.208.72.38-10.208.72.39",
                         "10.208.72.91-10.208.72.94",
                         "10.208.72.210-10.208.72.211",
                         "10.200.72.148-10.200.72.153"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1629" {
   display_name = "TF-AG1-IPSET-DR162-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-IPSET-DR162-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.146.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1630" {
   display_name = "TF-AG1-IPSET-NET-DR192-ESG-VPN-transit1"
   nsx_id = "TF-AG1-IPSET-NET-DR192-ESG-VPN-transit1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1631" {
   display_name = "TF-AG1-IPSET-EDR-CarbonBlack"
   nsx_id = "TF-AG1-IPSET-EDR-CarbonBlack"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.57.84.202",
                         "3.120.123.80",
                         "3.120.77.229",
                         "52.58.2.11",
                         "3.120.155.236",
                         "52.29.170.152",
                         "35.156.209.8",
                         "35.157.136.127"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1632" {
   display_name = "TF-AG1-IPSET-STaaS-DR147-Storage-ALL"
   nsx_id = "TF-AG1-IPSET-STaaS-DR147-Storage-ALL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.171.125.72-10.171.125.95",
                         "10.100.19.94-10.100.19.180",
                         "10.170.125.72-10.170.125.95",
                         "10.170.125.97-10.170.125.99",
                         "10.101.69.51-10.101.69.110",
                         "10.40.64.120-10.40.64.160"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1633" {
   display_name = "TF-AG1-IPSET-AG-DR59-LB-VIP3"
   nsx_id = "TF-AG1-IPSET-AG-DR59-LB-VIP3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.93.243"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1634" {
   display_name = "TF-AG1-IPSET-SRES-vSME-Ingress-VIP"
   nsx_id = "TF-AG1-IPSET-SRES-vSME-Ingress-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.74",
                         "158.87.48.75"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1635" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-52000"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-52000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.4.174.214"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1636" {
   display_name = "TF-AG1-IPSET-DR158-LB-VIP1-NAT"
   nsx_id = "TF-AG1-IPSET-DR158-LB-VIP1-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.102"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1637" {
   display_name = "TF-AG1-IPSET-AG-DR59-LB-VIP2"
   nsx_id = "TF-AG1-IPSET-AG-DR59-LB-VIP2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.93.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1638" {
   display_name = "TF-AG1-IPSET-secure-file-service-ocp1"
   nsx_id = "TF-AG1-IPSET-secure-file-service-ocp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.102"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1639" {
   display_name = "TF-AG1-IPSET-DRES96-pl026itnmip"
   nsx_id = "TF-AG1-IPSET-DRES96-pl026itnmip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.12.26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1640" {
   display_name = "TF-AG1-IPSET-HWSW-IBM-9300"
   nsx_id = "TF-AG1-IPSET-HWSW-IBM-9300"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.242.186"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1641" {
   display_name = "TF-AG1-IPSET-w3-gdportal-am-extnet-ibm-com"
   nsx_id = "TF-AG1-IPSET-w3-gdportal-am-extnet-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.23.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1642" {
   display_name = "TF-AG1-IPSET-EITaaS-UCD"
   nsx_id = "TF-AG1-IPSET-EITaaS-UCD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.173.122.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1643" {
   display_name = "TF-AG1-IPSET-Host-ag1h1lpta1hap"
   nsx_id = "TF-AG1-IPSET-Host-ag1h1lpta1hap"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.71.240.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1644" {
   display_name = "TF-AG1-IPSET-AMS-BigFix-Relay"
   nsx_id = "TF-AG1-IPSET-AMS-BigFix-Relay"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.71",
                         "158.87.52.72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1645" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-SVG-POC"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-SVG-POC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.255",
                         "158.87.48.15",
                         "158.87.48.25",
                         "158.87.48.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1646" {
   display_name = "TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1-nat"
   nsx_id = "TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1-nat"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.51.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1647" {
   display_name = "TF-AG1-IPSET-NET-Southbury-Replication"
   nsx_id = "TF-AG1-IPSET-NET-Southbury-Replication"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.66.191.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1648" {
   display_name = "TF-AG1-IPSET-MSS-Group2"
   nsx_id = "TF-AG1-IPSET-MSS-Group2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "209.134.187.8/29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1649" {
   display_name = "TF-AG1-IPSET-AG-DR59-LB-VIP4"
   nsx_id = "TF-AG1-IPSET-AG-DR59-LB-VIP4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.93.244"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1650" {
   display_name = "TF-AG1-IPSET-IRES-uswhpsl1dcr4-NAT"
   nsx_id = "TF-AG1-IPSET-IRES-uswhpsl1dcr4-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.68.137"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1651" {
   display_name = "TF-AG1-IPSET-PDR-ICp1-Ingress-VIP"
   nsx_id = "TF-AG1-IPSET-PDR-ICp1-Ingress-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.69.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1652" {
   display_name = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-60004"
   nsx_id = "TF-AG1-IPSET-HWSW-ibmcloud-DB2-60004"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.63.8.64"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1653" {
   display_name = "TF-AG1-IPSET-DR192-ESG-vpn-vNic_1"
   nsx_id = "TF-AG1-IPSET-DR192-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.2"
]
      }
   }
}
