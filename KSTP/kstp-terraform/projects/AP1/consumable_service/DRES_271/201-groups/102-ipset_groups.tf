#####################################
# IPSETs GROUPS
#
# Migration date: 03/21/2023 16:38
# Geography.....: AP1 
# Wave..........: DRES_271
#####################################
resource "nsxt_policy_group" "grp_230" {
   display_name = "TF-AP1-IPSET-Host-b01zvi21899630-ahe-pok"
   nsx_id = "TF-AP1-IPSET-Host-b01zvi21899630-ahe-pok"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.56.22.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_231" {
   display_name = "TF-AP1-IPSET-PDR-SMTP-Emailserver"
   nsx_id = "TF-AP1-IPSET-PDR-SMTP-Emailserver"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.69.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_232" {
   display_name = "TF-AP1-IPSET-ap1rhel08"
   nsx_id = "TF-AP1-IPSET-ap1rhel08"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.90"
]
      }
   }
}
resource "nsxt_policy_group" "grp_233" {
   display_name = "TF-AP1-IPSET-NET-SYD-GSNI-subnet"
   nsx_id = "TF-AP1-IPSET-NET-SYD-GSNI-subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.0/23",
                         "158.87.60.128/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_234" {
   display_name = "TF-AP1-IPSET-IMI-KIWISyslog"
   nsx_id = "TF-AP1-IPSET-IMI-KIWISyslog"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.208.171"
]
      }
   }
}
resource "nsxt_policy_group" "grp_235" {
   display_name = "TF-AP1-IPSET-prdpcbmgwcms02-Secondary"
   nsx_id = "TF-AP1-IPSET-prdpcbmgwcms02-Secondary"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.45.90.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_236" {
   display_name = "TF-AP1-IPSET-nlasabuildm1e00p-sr1-eu1"
   nsx_id = "TF-AP1-IPSET-nlasabuildm1e00p-sr1-eu1"
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
resource "nsxt_policy_group" "grp_237" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-RAS-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-RAS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.180"
]
      }
   }
}
resource "nsxt_policy_group" "grp_238" {
   display_name = "TF-AP1-IPSET-ap1sr1bfrelay1-IRES-NAT"
   nsx_id = "TF-AP1-IPSET-ap1sr1bfrelay1-IRES-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.101"
]
      }
   }
}
resource "nsxt_policy_group" "grp_239" {
   display_name = "TF-AP1-IPSET-MCI-NZ-nzakptk01sr01rz"
   nsx_id = "TF-AP1-IPSET-MCI-NZ-nzakptk01sr01rz"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.163.66"
]
      }
   }
}
resource "nsxt_policy_group" "grp_240" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-All-VMs"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-All-VMs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.206",
                         "158.87.54.199",
                         "158.87.54.207",
                         "158.87.54.203",
                         "158.87.54.184",
                         "158.87.54.205",
                         "158.87.54.197",
                         "169.254.1.129",
                         "158.87.54.195",
                         "158.87.54.198",
                         "158.87.54.181",
                         "158.87.54.188",
                         "158.87.54.192",
                         "158.87.54.183",
                         "158.87.54.196",
                         "158.87.54.204",
                         "158.87.54.200",
                         "158.87.54.186",
                         "158.87.54.185",
                         "158.87.54.180",
                         "158.87.54.182",
                         "158.87.54.179",
                         "158.87.54.191",
                         "158.87.54.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_241" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1etnp2"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1etnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.109"
]
      }
   }
}
resource "nsxt_policy_group" "grp_242" {
   display_name = "TF-AP1-IPSET-SRES1-LB1-PrimaryIP"
   nsx_id = "TF-AP1-IPSET-SRES1-LB1-PrimaryIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_243" {
   display_name = "TF-AP1-IPSET-ap1srlpsatsts01"
   nsx_id = "TF-AP1-IPSET-ap1srlpsatsts01"
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
resource "nsxt_policy_group" "grp_244" {
   display_name = "TF-AP1-IPSET-ap1srlphwcls"
   nsx_id = "TF-AP1-IPSET-ap1srlphwcls"
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
resource "nsxt_policy_group" "grp_245" {
   display_name = "TF-AP1-IPSET-SRES-LB-OCP-Cluster03-VIP"
   nsx_id = "TF-AP1-IPSET-SRES-LB-OCP-Cluster03-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.82"
]
      }
   }
}
resource "nsxt_policy_group" "grp_246" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-STaaS-AD-DNS"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.151",
                         "158.87.54.150",
                         "158.87.54.152"
]
      }
   }
}
resource "nsxt_policy_group" "grp_247" {
   display_name = "TF-AP1-IPSET-SRES-MNEAAS-AP-MIG1-BC"
   nsx_id = "TF-AP1-IPSET-SRES-MNEAAS-AP-MIG1-BC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.135",
                         "158.87.54.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_248" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-RMQ-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-RMQ-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.203",
                         "158.87.54.205",
                         "158.87.54.204"
]
      }
   }
}
resource "nsxt_policy_group" "grp_249" {
   display_name = "TF-AP1-IPSET-NSX-T-vROPS"
   nsx_id = "TF-AP1-IPSET-NSX-T-vROPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.67.254"
]
      }
   }
}
resource "nsxt_policy_group" "grp_250" {
   display_name = "TF-AP1-IPSET-Tanzu-mgmt-subnet"
   nsx_id = "TF-AP1-IPSET-Tanzu-mgmt-subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.243.128/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_251" {
   display_name = "TF-AP1-IPSET-ap1sftp01"
   nsx_id = "TF-AP1-IPSET-ap1sftp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_252" {
   display_name = "TF-AP1-IPSET-Host-blue-hwsw360-w3-969"
   nsx_id = "TF-AP1-IPSET-Host-blue-hwsw360-w3-969"
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
resource "nsxt_policy_group" "grp_253" {
   display_name = "TF-AP1-IPSET-ap1sr1lpcacprx1-vip"
   nsx_id = "TF-AP1-IPSET-ap1sr1lpcacprx1-vip"
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
resource "nsxt_policy_group" "grp_254" {
   display_name = "TF-AP1-IPSET-NET-All-CGN-subnet"
   nsx_id = "TF-AP1-IPSET-NET-All-CGN-subnet"
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
resource "nsxt_policy_group" "grp_255" {
   display_name = "TF-AP1-IPSET-Host-blue-sl-bluecloud-ibm-com"
   nsx_id = "TF-AP1-IPSET-Host-blue-sl-bluecloud-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.239.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_256" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1icp1n02"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1icp1n02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.123"
]
      }
   }
}
resource "nsxt_policy_group" "grp_257" {
   display_name = "TF-AP1-IPSET-ap1d232lpwnzpr1-VIP"
   nsx_id = "TF-AP1-IPSET-ap1d232lpwnzpr1-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.112.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_258" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-SVG-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-SVG-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.186"
]
      }
   }
}
resource "nsxt_policy_group" "grp_259" {
   display_name = "TF-AP1-IPSET-HOSt-ap1d110lpbp1tnp"
   nsx_id = "TF-AP1-IPSET-HOSt-ap1d110lpbp1tnp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.76",
                         "100.80.90.75"
]
      }
   }
}
resource "nsxt_policy_group" "grp_260" {
   display_name = "TF-AP1-IPSET-SRES1-LB-OCP-Cluster1-VIP"
   nsx_id = "TF-AP1-IPSET-SRES1-LB-OCP-Cluster1-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.232.4",
                         "158.87.54.20",
                         "100.87.232.2",
                         "158.87.55.230"
]
      }
   }
}
resource "nsxt_policy_group" "grp_261" {
   display_name = "TF-AP1-IPSET-EU-Host-Nexus-Repo"
   nsx_id = "TF-AP1-IPSET-EU-Host-Nexus-Repo"
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
resource "nsxt_policy_group" "grp_262" {
   display_name = "TF-AP1-IPSET-AG1-Tanzu-Workload-03-NAT"
   nsx_id = "TF-AP1-IPSET-AG1-Tanzu-Workload-03-NAT"
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
resource "nsxt_policy_group" "grp_263" {
   display_name = "TF-AP1-IPSET-GACDW-Blue"
   nsx_id = "TF-AP1-IPSET-GACDW-Blue"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.217.0.113"
]
      }
   }
}
resource "nsxt_policy_group" "grp_264" {
   display_name = "TF-AP1-IPSET-DRES110-OCP-Cluster01-Temp"
   nsx_id = "TF-AP1-IPSET-DRES110-OCP-Cluster01-Temp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.13-100.80.90.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_265" {
   display_name = "TF-AP1-IPSET-DRES114-CPREM-Cyberark"
   nsx_id = "TF-AP1-IPSET-DRES114-CPREM-Cyberark"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.41.166.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_266" {
   display_name = "TF-AP1-IPSET-ap1sr1apiamprsvg1-secondary-IP"
   nsx_id = "TF-AP1-IPSET-ap1sr1apiamprsvg1-secondary-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.186"
]
      }
   }
}
resource "nsxt_policy_group" "grp_267" {
   display_name = "TF-AP1-IPSET-Host-Dres268-cacf-Proxy-VIP"
   nsx_id = "TF-AP1-IPSET-Host-Dres268-cacf-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.126.50",
                         "158.87.104.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_268" {
   display_name = "TF-AP1-IPSET-Host-GSNI-SR-AU-SHR-HTEMS"
   nsx_id = "TF-AP1-IPSET-Host-GSNI-SR-AU-SHR-HTEMS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.171.133",
                         "130.103.171.168"
]
      }
   }
}
resource "nsxt_policy_group" "grp_269" {
   display_name = "TF-AP1-IPSET-SNAT-to-DA"
   nsx_id = "TF-AP1-IPSET-SNAT-to-DA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.63.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_270" {
   display_name = "TF-AP1-IPSET-ap1spplusvsnap"
   nsx_id = "TF-AP1-IPSET-ap1spplusvsnap"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.60.130",
                         "10.63.60.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_271" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-WIN-DNS-NTP"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-WIN-DNS-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.3",
                         "158.87.54.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_272" {
   display_name = "TF-AP1-IPSET-DR271-ergsdplmivm03"
   nsx_id = "TF-AP1-IPSET-DR271-ergsdplmivm03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.72.8.23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_273" {
   display_name = "TF-AP1-IPSET-DR264-ESG-dlr-vNic_2"
   nsx_id = "TF-AP1-IPSET-DR264-ESG-dlr-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.1.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_274" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1lpcacprx1"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.82"
]
      }
   }
}
resource "nsxt_policy_group" "grp_275" {
   display_name = "TF-AP1-IPSET-prdpcbmgwcms02-Primary"
   nsx_id = "TF-AP1-IPSET-prdpcbmgwcms02-Primary"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.220.27.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_276" {
   display_name = "TF-AP1-IPSET-hres-lb1"
   nsx_id = "TF-AP1-IPSET-hres-lb1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.240.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_277" {
   display_name = "TF-AP1-IPSET-SL-IRES-SNAT-to-Internet"
   nsx_id = "TF-AP1-IPSET-SL-IRES-SNAT-to-Internet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.68.25/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_278" {
   display_name = "TF-AP1-IPSET-ag1srlphwcls01"
   nsx_id = "TF-AP1-IPSET-ag1srlphwcls01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.152"
]
      }
   }
}
resource "nsxt_policy_group" "grp_279" {
   display_name = "TF-AP1-IPSET-ap1irlpm1esldbp-secondary-IP"
   nsx_id = "TF-AP1-IPSET-ap1irlpm1esldbp-secondary-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.68.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_280" {
   display_name = "TF-AP1-IPSET-IPSET-SL-IRES-WIN-AD-DNS-NTP"
   nsx_id = "TF-AP1-IPSET-IPSET-SL-IRES-WIN-AD-DNS-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.75",
                         "10.63.9.76"
]
      }
   }
}
resource "nsxt_policy_group" "grp_281" {
   display_name = "TF-AP1-IPSET-SL-IRES-VSI-WIN-Jump-Servers"
   nsx_id = "TF-AP1-IPSET-SL-IRES-VSI-WIN-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.94",
                         "10.63.9.95",
                         "10.63.60.174",
                         "10.63.60.176"
]
      }
   }
}
resource "nsxt_policy_group" "grp_282" {
   display_name = "TF-AP1-IPSET-SL1LOREAL-CPREM"
   nsx_id = "TF-AP1-IPSET-SL1LOREAL-CPREM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.187.1.141",
                         "10.186.1.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_283" {
   display_name = "TF-AP1-IPSET-SL1-DB-Shared-VIP"
   nsx_id = "TF-AP1-IPSET-SL1-DB-Shared-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.96"
]
      }
   }
}
resource "nsxt_policy_group" "grp_284" {
   display_name = "TF-AP1-IPSET-HOst--MnE-Build-Source"
   nsx_id = "TF-AP1-IPSET-HOst--MnE-Build-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.6",
                         "158.87.54.4",
                         "158.87.54.5",
                         "100.80.90.74",
                         "158.87.54.108",
                         "158.87.54.109",
                         "158.87.52.32",
                         "100.80.90.76",
                         "100.80.90.71",
                         "100.80.90.73",
                         "100.80.90.72",
                         "100.80.90.77-100.80.90.84",
                         "100.80.90.70",
                         "100.80.90.75"
]
      }
   }
}
resource "nsxt_policy_group" "grp_285" {
   display_name = "TF-AP1-IPSET-pdr-esg01-LB-VIP-4"
   nsx_id = "TF-AP1-IPSET-pdr-esg01-LB-VIP-4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.198.112.247"
]
      }
   }
}
resource "nsxt_policy_group" "grp_286" {
   display_name = "TF-AP1-IPSET-SL-WSUS"
   nsx_id = "TF-AP1-IPSET-SL-WSUS"
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
resource "nsxt_policy_group" "grp_287" {
   display_name = "TF-AP1-IPSET-ap1irlpm1esldc01-secondary-IP"
   nsx_id = "TF-AP1-IPSET-ap1irlpm1esldc01-secondary-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.68.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_288" {
   display_name = "TF-AP1-IPSET-NSXT-VC"
   nsx_id = "TF-AP1-IPSET-NSXT-VC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.70.196"
]
      }
   }
}
resource "nsxt_policy_group" "grp_289" {
   display_name = "TF-AP1-IPSET-INTERNET-O365"
   nsx_id = "TF-AP1-IPSET-INTERNET-O365"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.96.0.0/14",
                         "191.234.140.0/22",
                         "204.79.197.215/32",
                         "132.245.0.0/16",
                         "23.103.160.0/20",
                         "13.107.128.0/22",
                         "40.96.0.0/13",
                         "40.104.0.0/15",
                         "13.107.6.152/31",
                         "131.253.33.215/32",
                         "150.171.32.0/22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_290" {
   display_name = "TF-AP1-IPSET-MCS-CPREM-Jump"
   nsx_id = "TF-AP1-IPSET-MCS-CPREM-Jump"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.4.2",
                         "172.16.4.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_291" {
   display_name = "TF-AP1-IPSET-AP1DR230LPLOETNP"
   nsx_id = "TF-AP1-IPSET-AP1DR230LPLOETNP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.108.33",
                         "100.80.108.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_292" {
   display_name = "TF-AP1-IPSET-ap1irlpm1esldc01"
   nsx_id = "TF-AP1-IPSET-ap1irlpm1esldc01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.60.175"
]
      }
   }
}
resource "nsxt_policy_group" "grp_293" {
   display_name = "TF-AP1-IPSET-AG1-IP-SET-AG1SRWPHWCS"
   nsx_id = "TF-AP1-IPSET-AG1-IP-SET-AG1SRWPHWCS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.150",
                         "158.87.49.148",
                         "158.87.49.149",
                         "158.87.48.8",
                         "158.87.49.151",
                         "158.87.49.153"
]
      }
   }
}
resource "nsxt_policy_group" "grp_294" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1lpiamnfs"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1lpiamnfs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.179"
]
      }
   }
}
resource "nsxt_policy_group" "grp_295" {
   display_name = "TF-AP1-IPSET-SL-NEW-AD-DNS-NTP"
   nsx_id = "TF-AP1-IPSET-SL-NEW-AD-DNS-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.70.195",
                         "10.63.70.194",
                         "10.63.70.196"
]
      }
   }
}
resource "nsxt_policy_group" "grp_296" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1esc1"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1esc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.100"
]
      }
   }
}
resource "nsxt_policy_group" "grp_297" {
   display_name = "TF-AP1-IPSET-ANZ_ICD_instance"
   nsx_id = "TF-AP1-IPSET-ANZ_ICD_instance"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.138.90.76"
]
      }
   }
}
resource "nsxt_policy_group" "grp_298" {
   display_name = "TF-AP1-IPSET-EU-eu1sr1pcacfgit1"
   nsx_id = "TF-AP1-IPSET-EU-eu1sr1pcacfgit1"
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
resource "nsxt_policy_group" "grp_299" {
   display_name = "TF-AP1-IPSET-Host-TEST-CP-SUBNET"
   nsx_id = "TF-AP1-IPSET-Host-TEST-CP-SUBNET"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.120.5.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_300" {
   display_name = "TF-AP1-IPSET-Omnibus"
   nsx_id = "TF-AP1-IPSET-Omnibus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.82",
                         "100.80.90.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_301" {
   display_name = "TF-AP1-IPSET-EnergyAustralia-Jumphost"
   nsx_id = "TF-AP1-IPSET-EnergyAustralia-Jumphost"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "202.81.27.204-202.81.27.205",
                         "202.81.27.194-202.81.27.197"
]
      }
   }
}
resource "nsxt_policy_group" "grp_302" {
   display_name = "TF-AP1-IPSET-Host-ap1srlphstp1ntcl"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlphstp1ntcl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.170"
]
      }
   }
}
resource "nsxt_policy_group" "grp_303" {
   display_name = "TF-AP1-IPSET-GSENBEU"
   nsx_id = "TF-AP1-IPSET-GSENBEU"
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
resource "nsxt_policy_group" "grp_304" {
   display_name = "TF-AP1-IPSET-ap1srlphsts1ntcl"
   nsx_id = "TF-AP1-IPSET-ap1srlphsts1ntcl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.171"
]
      }
   }
}
resource "nsxt_policy_group" "grp_305" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-RDP-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-RDP-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.206",
                         "158.87.54.199",
                         "158.87.54.207",
                         "158.87.54.203",
                         "158.87.54.184",
                         "158.87.54.205",
                         "158.87.54.197",
                         "169.254.1.129",
                         "158.87.54.198",
                         "158.87.54.181",
                         "158.87.54.192",
                         "158.87.54.183",
                         "158.87.54.204",
                         "158.87.54.200",
                         "158.87.54.185",
                         "158.87.54.180",
                         "169.254.2.152",
                         "158.87.54.182",
                         "158.87.54.179",
                         "158.87.54.191",
                         "158.87.54.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_306" {
   display_name = "TF-AP1-IPSET-IN1-KSTP-Lite-MGMT"
   nsx_id = "TF-AP1-IPSET-IN1-KSTP-Lite-MGMT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.162.101.192/26",
                         "10.162.173.192/26",
                         "10.162.63.192/26",
                         "10.162.42.0/26",
                         "10.162.152.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_307" {
   display_name = "TF-AP1-IPSET-OCP4-3-Cluster"
   nsx_id = "TF-AP1-IPSET-OCP4-3-Cluster"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.80",
                         "158.87.54.40-158.87.54.59",
                         "158.87.54.75"
]
      }
   }
}
resource "nsxt_policy_group" "grp_308" {
   display_name = "TF-AP1-IPSET-NET-AG1-GRES-subnet"
   nsx_id = "TF-AP1-IPSET-NET-AG1-GRES-subnet"
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
resource "nsxt_policy_group" "grp_309" {
   display_name = "TF-AP1-IPSET-Host-CPREM258-Ausgrid-JH-2"
   nsx_id = "TF-AP1-IPSET-Host-CPREM258-Ausgrid-JH-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "163.8.168.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_310" {
   display_name = "TF-AP1-IPSET-Netcool-MCI-Dev-Reporter-DB"
   nsx_id = "TF-AP1-IPSET-Netcool-MCI-Dev-Reporter-DB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.171.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_311" {
   display_name = "TF-AP1-IPSET-EU1-SRES-CACF-Proxy"
   nsx_id = "TF-AP1-IPSET-EU1-SRES-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.51",
                         "158.87.53.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_312" {
   display_name = "TF-AP1-IPSET-Host-Blue-pgawdcstetl01"
   nsx_id = "TF-AP1-IPSET-Host-Blue-pgawdcstetl01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.239.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_313" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1icp1n01"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1icp1n01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.122"
]
      }
   }
}
resource "nsxt_policy_group" "grp_314" {
   display_name = "TF-AP1-IPSET-Host-bjy7vr1-tms-stglab"
   nsx_id = "TF-AP1-IPSET-Host-bjy7vr1-tms-stglab"
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
resource "nsxt_policy_group" "grp_315" {
   display_name = "TF-AP1-IPSET-NET-SL-IRES-Primary-ESXi-vmk0"
   nsx_id = "TF-AP1-IPSET-NET-SL-IRES-Primary-ESXi-vmk0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.60.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_316" {
   display_name = "TF-AP1-IPSET-ap1srlpm1esc1"
   nsx_id = "TF-AP1-IPSET-ap1srlpm1esc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.100"
]
      }
   }
}
resource "nsxt_policy_group" "grp_317" {
   display_name = "TF-AP1-IPSET-bat-cz-ibm-com"
   nsx_id = "TF-AP1-IPSET-bat-cz-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.138.247.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_318" {
   display_name = "TF-AP1-IPSET-Host-ap1srwphwcetl"
   nsx_id = "TF-AP1-IPSET-Host-ap1srwphwcetl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.233"
]
      }
   }
}
resource "nsxt_policy_group" "grp_319" {
   display_name = "TF-AP1-IPSET-Asset_Management"
   nsx_id = "TF-AP1-IPSET-Asset_Management"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.220.132.40",
                         "9.220.132.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_320" {
   display_name = "TF-AP1-IPSET-DRES-VMS"
   nsx_id = "TF-AP1-IPSET-DRES-VMS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.232.66",
                         "100.80.90.102",
                         "100.87.242.3",
                         "100.80.92.102",
                         "100.87.232.67",
                         "100.87.243.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_321" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-PROXY-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-PROXY-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.192",
                         "158.87.54.191"
]
      }
   }
}
resource "nsxt_policy_group" "grp_322" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1ecni"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1ecni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.102"
]
      }
   }
}
resource "nsxt_policy_group" "grp_323" {
   display_name = "TF-AP1-IPSET-MHjumphost"
   nsx_id = "TF-AP1-IPSET-MHjumphost"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "24.100.100.3",
                         "10.178.172.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_324" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1wjmp01"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1wjmp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_325" {
   display_name = "TF-AP1-IPSET-NZ-shared"
   nsx_id = "TF-AP1-IPSET-NZ-shared"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.96.2.150",
                         "100.96.2.180",
                         "100.112.2.150"
]
      }
   }
}
resource "nsxt_policy_group" "grp_326" {
   display_name = "TF-AP1-IPSET-ap1d108lpcacpr-vip"
   nsx_id = "TF-AP1-IPSET-ap1d108lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.88.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_327" {
   display_name = "TF-AP1-IPSET-Net_dr114-app-internal1"
   nsx_id = "TF-AP1-IPSET-Net_dr114-app-internal1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_328" {
   display_name = "TF-AP1-IPSET-vpc-30-mneaas-prod-subnet1"
   nsx_id = "TF-AP1-IPSET-vpc-30-mneaas-prod-subnet1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.60.131",
                         "192.168.64.0/27",
                         "100.80.71.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_329" {
   display_name = "TF-AP1-IPSET-DRES164-OCP-Cluster01-Temp"
   nsx_id = "TF-AP1-IPSET-DRES164-OCP-Cluster01-Temp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.104.14-100.80.104.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_330" {
   display_name = "TF-AP1-IPSET-IMI-Solarwinds-IRES-NAT"
   nsx_id = "TF-AP1-IPSET-IMI-Solarwinds-IRES-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.100"
]
      }
   }
}
resource "nsxt_policy_group" "grp_331" {
   display_name = "TF-AP1-IPSET-CPREM-Netcool-Probe"
   nsx_id = "TF-AP1-IPSET-CPREM-Netcool-Probe"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.226.11.75-10.226.11.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_332" {
   display_name = "TF-AP1-IPSET-SLSydImpactnode01"
   nsx_id = "TF-AP1-IPSET-SLSydImpactnode01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.208.181"
]
      }
   }
}
resource "nsxt_policy_group" "grp_333" {
   display_name = "TF-AP1-IPSET-GSNI-SR-AU-SHR-HTEMS"
   nsx_id = "TF-AP1-IPSET-GSNI-SR-AU-SHR-HTEMS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.171.133",
                         "130.103.171.168"
]
      }
   }
}
resource "nsxt_policy_group" "grp_334" {
   display_name = "TF-AP1-IPSET-DRES-DNAT-to-vCenter"
   nsx_id = "TF-AP1-IPSET-DRES-DNAT-to-vCenter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.68.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_335" {
   display_name = "TF-AP1-IPSET-EU-DB2"
   nsx_id = "TF-AP1-IPSET-EU-DB2"
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
resource "nsxt_policy_group" "grp_336" {
   display_name = "TF-AP1-IPSET-CACF-tool"
   nsx_id = "TF-AP1-IPSET-CACF-tool"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.60.136.148",
                         "169.60.136.184",
                         "169.60.136.161",
                         "169.60.136.183"
]
      }
   }
}
resource "nsxt_policy_group" "grp_337" {
   display_name = "TF-AP1-IPSET-DRES110-LB-OCP-Cluster1-VIP-2"
   nsx_id = "TF-AP1-IPSET-DRES110-LB-OCP-Cluster1-VIP-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_338" {
   display_name = "TF-AP1-IPSET-IBM-NA-RELAY"
   nsx_id = "TF-AP1-IPSET-IBM-NA-RELAY"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.57.199.110",
                         "9.57.199.111",
                         "9.17.130.236",
                         "9.17.130.237",
                         "9.57.199.107",
                         "9.17.130.234",
                         "9.17.130.235",
                         "9.17.130.233",
                         "9.57.199.109",
                         "9.17.130.232",
                         "9.57.199.108",
                         "9.57.199.106"
]
      }
   }
}
resource "nsxt_policy_group" "grp_339" {
   display_name = "TF-AP1-IPSET-MCI-NZ-nzakptk01sr02rz"
   nsx_id = "TF-AP1-IPSET-MCI-NZ-nzakptk01sr02rz"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.163.68"
]
      }
   }
}
resource "nsxt_policy_group" "grp_340" {
   display_name = "TF-AP1-IPSET-Qantas-Jumphost"
   nsx_id = "TF-AP1-IPSET-Qantas-Jumphost"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "202.81.27.200-202.81.27.203"
]
      }
   }
}
resource "nsxt_policy_group" "grp_341" {
   display_name = "TF-AP1-IPSET-IBM-Sametime"
   nsx_id = "TF-AP1-IPSET-IBM-Sametime"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.16.19.207"
]
      }
   }
}
resource "nsxt_policy_group" "grp_342" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1wpiamprra"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1wpiamprra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.180"
]
      }
   }
}
resource "nsxt_policy_group" "grp_343" {
   display_name = "TF-AP1-IPSET-IN-IHOSTin1sr1wphwcdb"
   nsx_id = "TF-AP1-IPSET-IN-IHOSTin1sr1wphwcdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_344" {
   display_name = "TF-AP1-IPSET-SRES-IAM-THY-MSSQL-PROD-VIP"
   nsx_id = "TF-AP1-IPSET-SRES-IAM-THY-MSSQL-PROD-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.194",
                         "158.87.54.193"
]
      }
   }
}
resource "nsxt_policy_group" "grp_345" {
   display_name = "TF-AP1-IPSET-SRES-OCP-Cluster03-Temp"
   nsx_id = "TF-AP1-IPSET-SRES-OCP-Cluster03-Temp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.85-158.87.54.98"
]
      }
   }
}
resource "nsxt_policy_group" "grp_346" {
   display_name = "TF-AP1-IPSET-dnat-to-ap1sr1ljmp01"
   nsx_id = "TF-AP1-IPSET-dnat-to-ap1sr1ljmp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.68",
                         "158.87.54.5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_347" {
   display_name = "TF-AP1-IPSET-SL-IRES-vRLI"
   nsx_id = "TF-AP1-IPSET-SL-IRES-vRLI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.79"
]
      }
   }
}
resource "nsxt_policy_group" "grp_348" {
   display_name = "TF-AP1-IPSET-DAAP-OVPN-SSHProxy-146-89-203-200"
   nsx_id = "TF-AP1-IPSET-DAAP-OVPN-SSHProxy-146-89-203-200"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.203.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_349" {
   display_name = "TF-AP1-IPSET-in1sr1wphwcstr"
   nsx_id = "TF-AP1-IPSET-in1sr1wphwcstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_350" {
   display_name = "TF-AP1-IPSET-cngcgnoi"
   nsx_id = "TF-AP1-IPSET-cngcgnoi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.1.167",
                         "158.87.1.168"
]
      }
   }
}
resource "nsxt_policy_group" "grp_351" {
   display_name = "TF-AP1-IPSET-Integ-Svcs-Prod-AP"
   nsx_id = "TF-AP1-IPSET-Integ-Svcs-Prod-AP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.238.148-146.89.238.153"
]
      }
   }
}
resource "nsxt_policy_group" "grp_352" {
   display_name = "TF-AP1-IPSET-GSNI-SR-AU-SHR-BC-DEV"
   nsx_id = "TF-AP1-IPSET-GSNI-SR-AU-SHR-BC-DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.171.197"
]
      }
   }
}
resource "nsxt_policy_group" "grp_353" {
   display_name = "TF-AP1-IPSET-DR110-LB1-PrimaryIP"
   nsx_id = "TF-AP1-IPSET-DR110-LB1-PrimaryIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_354" {
   display_name = "TF-AP1-IPSET-ap1vmon"
   nsx_id = "TF-AP1-IPSET-ap1vmon"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_355" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1bfrelay1"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1bfrelay1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_356" {
   display_name = "TF-AP1-IPSET-ap1srlphstp1ntcl"
   nsx_id = "TF-AP1-IPSET-ap1srlphstp1ntcl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.170"
]
      }
   }
}
resource "nsxt_policy_group" "grp_357" {
   display_name = "TF-AP1-IPSET-IMI-Solarwinds"
   nsx_id = "TF-AP1-IPSET-IMI-Solarwinds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.208.164-168.1.208.166"
]
      }
   }
}
resource "nsxt_policy_group" "grp_358" {
   display_name = "TF-AP1-IPSET-in1sr1wpgrfdb"
   nsx_id = "TF-AP1-IPSET-in1sr1wpgrfdb"
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
resource "nsxt_policy_group" "grp_359" {
   display_name = "TF-AP1-IPSET-EU-Host-Execution-Node"
   nsx_id = "TF-AP1-IPSET-EU-Host-Execution-Node"
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
resource "nsxt_policy_group" "grp_360" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1epno"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1epno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.107"
]
      }
   }
}
resource "nsxt_policy_group" "grp_361" {
   display_name = "TF-AP1-IPSET-ISA-BDS-CPREM"
   nsx_id = "TF-AP1-IPSET-ISA-BDS-CPREM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.124.64.2-100.124.64.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_362" {
   display_name = "TF-AP1-IPSET-ap1irlpm1eslbak"
   nsx_id = "TF-AP1-IPSET-ap1irlpm1eslbak"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.60.135"
]
      }
   }
}
resource "nsxt_policy_group" "grp_363" {
   display_name = "TF-AP1-IPSET-pdr-esg01-LB-VIP-2"
   nsx_id = "TF-AP1-IPSET-pdr-esg01-LB-VIP-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.198.75.98"
]
      }
   }
}
resource "nsxt_policy_group" "grp_364" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1ecno"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1ecno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.106"
]
      }
   }
}
resource "nsxt_policy_group" "grp_365" {
   display_name = "TF-AP1-IPSET-IMI-CISCO-INTEGRATION"
   nsx_id = "TF-AP1-IPSET-IMI-CISCO-INTEGRATION"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.211.113-168.1.211.114"
]
      }
   }
}
resource "nsxt_policy_group" "grp_366" {
   display_name = "TF-AP1-IPSET-ap1d271lpcacpr1-VIP"
   nsx_id = "TF-AP1-IPSET-ap1d271lpcacpr1-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.128.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_367" {
   display_name = "TF-AP1-IPSET-Host-MnE-Build-Destination"
   nsx_id = "TF-AP1-IPSET-Host-MnE-Build-Destination"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.74",
                         "158.87.54.2",
                         "100.80.90.76",
                         "158.87.52.32",
                         "158.87.54.109",
                         "158.87.54.108",
                         "100.80.90.71",
                         "100.80.90.73",
                         "100.80.69.5",
                         "100.80.69.4",
                         "100.80.90.72",
                         "100.80.90.70",
                         "100.80.90.75",
                         "158.87.54.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_368" {
   display_name = "TF-AP1-IPSET-IMI-Netcool"
   nsx_id = "TF-AP1-IPSET-IMI-Netcool"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.208.190"
]
      }
   }
}
resource "nsxt_policy_group" "grp_369" {
   display_name = "TF-AP1-IPSET-SRES-WIN-Jump-Servers-VIP"
   nsx_id = "TF-AP1-IPSET-SRES-WIN-Jump-Servers-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_370" {
   display_name = "TF-AP1-IPSET-vserv-eu-sos-ibm-com"
   nsx_id = "TF-AP1-IPSET-vserv-eu-sos-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "159.8.231.231",
                         "169.50.33.166",
                         "159.8.100.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_371" {
   display_name = "TF-AP1-IPSET-ag1srlpgse1000"
   nsx_id = "TF-AP1-IPSET-ag1srlpgse1000"
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
resource "nsxt_policy_group" "grp_372" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-LINUX-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-LINUX-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.182",
                         "158.87.54.183",
                         "158.87.54.184",
                         "158.87.54.181",
                         "158.87.54.188",
                         "158.87.54.191",
                         "158.87.54.185",
                         "158.87.54.186",
                         "158.87.54.192"
]
      }
   }
}
resource "nsxt_policy_group" "grp_373" {
   display_name = "TF-AP1-IPSET-Host-Myer-CPREM-JH"
   nsx_id = "TF-AP1-IPSET-Host-Myer-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.95.30.137",
                         "10.95.30.138"
]
      }
   }
}
resource "nsxt_policy_group" "grp_374" {
   display_name = "TF-AP1-IPSET-GSENEU"
   nsx_id = "TF-AP1-IPSET-GSENEU"
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
resource "nsxt_policy_group" "grp_375" {
   display_name = "TF-AP1-IPSET-IN1SR1WPHWCETL"
   nsx_id = "TF-AP1-IPSET-IN1SR1WPHWCETL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_376" {
   display_name = "TF-AP1-IPSET-Host-blue-Chip-p"
   nsx_id = "TF-AP1-IPSET-Host-blue-Chip-p"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.45.90.158"
]
      }
   }
}
resource "nsxt_policy_group" "grp_377" {
   display_name = "TF-AP1-IPSET-ap1irlpm1esldc02-secondary-IP"
   nsx_id = "TF-AP1-IPSET-ap1irlpm1esldc02-secondary-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.68.133"
]
      }
   }
}
resource "nsxt_policy_group" "grp_378" {
   display_name = "TF-AP1-IPSET-Fortigate10G"
   nsx_id = "TF-AP1-IPSET-Fortigate10G"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.103.193"
]
      }
   }
}
resource "nsxt_policy_group" "grp_379" {
   display_name = "TF-AP1-IPSET-DRES110-OCP04-Cluster02"
   nsx_id = "TF-AP1-IPSET-DRES110-OCP04-Cluster02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.100-100.80.90.114",
                         "100.80.90.150-100.80.90.165",
                         "100.80.90.77",
                         "100.80.90.81",
                         "100.80.90.83",
                         "100.80.90.79"
]
      }
   }
}
resource "nsxt_policy_group" "grp_380" {
   display_name = "TF-AP1-IPSET-AP1SRWPHWCGADS1"
   nsx_id = "TF-AP1-IPSET-AP1SRWPHWCGADS1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.237"
]
      }
   }
}
resource "nsxt_policy_group" "grp_381" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1sql01"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1sql01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_382" {
   display_name = "TF-AP1-IPSET-ap1srlpm1esd1-vip"
   nsx_id = "TF-AP1-IPSET-ap1srlpm1esd1-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.96"
]
      }
   }
}
resource "nsxt_policy_group" "grp_383" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1wdns01"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1wdns01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_384" {
   display_name = "TF-AP1-IPSET-SRES-IAM-THY-RMQ-PROD-VIP"
   nsx_id = "TF-AP1-IPSET-SRES-IAM-THY-RMQ-PROD-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.202"
]
      }
   }
}
resource "nsxt_policy_group" "grp_385" {
   display_name = "TF-AP1-IPSET-SNAT-to-SL-SVC"
   nsx_id = "TF-AP1-IPSET-SNAT-to-SL-SVC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_386" {
   display_name = "TF-AP1-IPSET-INTERNET-GMAIL"
   nsx_id = "TF-AP1-IPSET-INTERNET-GMAIL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "207.126.144.0/20",
                         "216.239.32.0/19",
                         "216.58.192.0/19",
                         "64.233.160.0/19",
                         "108.177.8.0/21",
                         "173.194.0.0/16",
                         "108.177.96.0/19",
                         "66.249.80.0/20",
                         "209.85.128.0/17",
                         "74.125.0.0/16",
                         "66.102.0.0/20",
                         "64.18.0.0/20",
                         "72.14.192.0/18",
                         "172.217.0.0/19"
]
      }
   }
}
resource "nsxt_policy_group" "grp_387" {
   display_name = "TF-AP1-IPSET-ap1d114lpnab-vip2"
   nsx_id = "TF-AP1-IPSET-ap1d114lpnab-vip2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_388" {
   display_name = "TF-AP1-IPSET-NET-SL-IRES-vCenter-HA"
   nsx_id = "TF-AP1-IPSET-NET-SL-IRES-vCenter-HA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.255.136/29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_389" {
   display_name = "TF-AP1-IPSET-Fortigate"
   nsx_id = "TF-AP1-IPSET-Fortigate"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.67.4",
                         "130.198.75.97",
                         "130.198.72.145",
                         "130.198.112.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_390" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-DE-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-DE-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.206",
                         "158.87.54.207"
]
      }
   }
}
resource "nsxt_policy_group" "grp_391" {
   display_name = "TF-AP1-IPSET-in1-sres-tanzu-workload-02-ingress"
   nsx_id = "TF-AP1-IPSET-in1-sres-tanzu-workload-02-ingress"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.60.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_392" {
   display_name = "TF-AP1-IPSET-Host-ap1d114lpcacpr2"
   nsx_id = "TF-AP1-IPSET-Host-ap1d114lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_393" {
   display_name = "TF-AP1-IPSET-eu1srlpm1esldb-vip"
   nsx_id = "TF-AP1-IPSET-eu1srlpm1esldb-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_394" {
   display_name = "TF-AP1-IPSET-in1-sres-tanzu-mgmt-01"
   nsx_id = "TF-AP1-IPSET-in1-sres-tanzu-mgmt-01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.126.129.64/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_395" {
   display_name = "TF-AP1-IPSET-ap1d105lpcacpr-vip"
   nsx_id = "TF-AP1-IPSET-ap1d105lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.82.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_396" {
   display_name = "TF-AP1-IPSET-CDI-AP-Proxy"
   nsx_id = "TF-AP1-IPSET-CDI-AP-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.203.165",
                         "146.89.203.166",
                         "146.89.203.167"
]
      }
   }
}
resource "nsxt_policy_group" "grp_397" {
   display_name = "TF-AP1-IPSET-IBM-Bluepages"
   nsx_id = "TF-AP1-IPSET-IBM-Bluepages"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.17.186.253",
                         "9.15.48.48",
                         "9.23.210.79",
                         "9.15.0.48",
                         "9.57.182.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_398" {
   display_name = "TF-AP1-IPSET-bldbmsa-boulder-ibm-com"
   nsx_id = "TF-AP1-IPSET-bldbmsa-boulder-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.16.252.114"
]
      }
   }
}
resource "nsxt_policy_group" "grp_399" {
   display_name = "TF-AP1-IPSET-ap1d114lpcacpr-vip"
   nsx_id = "TF-AP1-IPSET-ap1d114lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_400" {
   display_name = "TF-AP1-IPSET-Host-Infra-Servers"
   nsx_id = "TF-AP1-IPSET-Host-Infra-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.4",
                         "158.87.54.71",
                         "158.87.54.73",
                         "158.87.54.130",
                         "158.87.54.81",
                         "158.87.54.8",
                         "158.87.54.12",
                         "158.87.54.2",
                         "158.87.54.3",
                         "158.87.54.76",
                         "158.87.54.5",
                         "158.87.54.77",
                         "158.87.54.72",
                         "158.87.54.6",
                         "158.87.54.69",
                         "158.87.54.87",
                         "158.87.54.70",
                         "158.87.54.10",
                         "158.87.54.90"
]
      }
   }
}
resource "nsxt_policy_group" "grp_401" {
   display_name = "TF-AP1-IPSET-SRES1-LB-OCP-Cluster2-VIP"
   nsx_id = "TF-AP1-IPSET-SRES1-LB-OCP-Cluster2-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_402" {
   display_name = "TF-AP1-IPSET-SL-IRES-vCenter"
   nsx_id = "TF-AP1-IPSET-SL-IRES-vCenter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.63.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_403" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1wsus01"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1wsus01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_404" {
   display_name = "TF-AP1-IPSET-DRES114-OCP-Cluster1-GSNI-NAT"
   nsx_id = "TF-AP1-IPSET-DRES114-OCP-Cluster1-GSNI-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.60.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_405" {
   display_name = "TF-AP1-IPSET-SG-SRES-OCP-Cluster04"
   nsx_id = "TF-AP1-IPSET-SG-SRES-OCP-Cluster04"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.232.32/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_406" {
   display_name = "TF-AP1-IPSET-IAMAAS-ZABBIX"
   nsx_id = "TF-AP1-IPSET-IAMAAS-ZABBIX"
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
resource "nsxt_policy_group" "grp_407" {
   display_name = "TF-AP1-IPSET-DR264-LB-vNIC_3"
   nsx_id = "TF-AP1-IPSET-DR264-LB-vNIC_3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.125.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_408" {
   display_name = "TF-AP1-IPSET-VM-AP1SRWPHWC"
   nsx_id = "TF-AP1-IPSET-VM-AP1SRWPHWC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.236",
                         "158.87.54.234",
                         "158.87.54.231",
                         "158.87.54.237",
                         "158.87.54.232",
                         "158.87.54.235",
                         "158.87.54.233",
                         "158.87.54.238"
]
      }
   }
}
resource "nsxt_policy_group" "grp_409" {
   display_name = "TF-AP1-IPSET-ICp-VRRP-IP"
   nsx_id = "TF-AP1-IPSET-ICp-VRRP-IP"
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
resource "nsxt_policy_group" "grp_410" {
   display_name = "TF-AP1-IPSET-ap1d103lpcacprx1-vip"
   nsx_id = "TF-AP1-IPSET-ap1d103lpcacprx1-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.80.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_411" {
   display_name = "TF-AP1-IPSET-ap1sr1lcacfjump02-IRES-NAT"
   nsx_id = "TF-AP1-IPSET-ap1sr1lcacfjump02-IRES-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.103"
]
      }
   }
}
resource "nsxt_policy_group" "grp_412" {
   display_name = "TF-AP1-IPSET-eu1srlpcarwas1000"
   nsx_id = "TF-AP1-IPSET-eu1srlpcarwas1000"
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
resource "nsxt_policy_group" "grp_413" {
   display_name = "TF-AP1-IPSET-CDI-AP-Proxy-New"
   nsx_id = "TF-AP1-IPSET-CDI-AP-Proxy-New"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.203.165",
                         "146.89.203.166",
                         "146.89.203.186"
]
      }
   }
}
resource "nsxt_policy_group" "grp_414" {
   display_name = "TF-AP1-IPSET-IBM_Github"
   nsx_id = "TF-AP1-IPSET-IBM_Github"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.60.70.162"
]
      }
   }
}
resource "nsxt_policy_group" "grp_415" {
   display_name = "TF-AP1-IPSET-ap1d110lpcacpr-vip"
   nsx_id = "TF-AP1-IPSET-ap1d110lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_416" {
   display_name = "TF-AP1-IPSET-Host-ap1d114lpcacpr1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d114lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_417" {
   display_name = "TF-AP1-IPSET-AG1-IP-SET-AG1SRWPHWCS-1"
   nsx_id = "TF-AP1-IPSET-AG1-IP-SET-AG1SRWPHWCS-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.149",
                         "158.87.49.153"
]
      }
   }
}
resource "nsxt_policy_group" "grp_418" {
   display_name = "TF-AP1-IPSET-NET-Internet-DUO"
   nsx_id = "TF-AP1-IPSET-NET-Internet-DUO"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "52.32.63.128/26",
                         "52.59.243.192/26",
                         "52.19.127.192/26",
                         "35.182.14.128/26",
                         "54.236.251.192/26",
                         "54.241.191.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_419" {
   display_name = "TF-AP1-IPSET-ap1irlpm1esldbs-secondary-IP"
   nsx_id = "TF-AP1-IPSET-ap1irlpm1esldbs-secondary-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.68.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_420" {
   display_name = "TF-AP1-IPSET-EU1-IP-EU1SRLPCARDB1000"
   nsx_id = "TF-AP1-IPSET-EU1-IP-EU1SRLPCARDB1000"
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
resource "nsxt_policy_group" "grp_421" {
   display_name = "TF-AP1-IPSET-NET-SL-Services"
   nsx_id = "TF-AP1-IPSET-NET-SL-Services"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.0.0.0/14",
                         "10.198.0.0/15",
                         "10.200.0.0/14",
                         "166.8.0.0/14",
                         "161.26.0.0/16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_422" {
   display_name = "TF-AP1-IPSET-Host-ap1srwphwcstr"
   nsx_id = "TF-AP1-IPSET-Host-ap1srwphwcstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.234"
]
      }
   }
}
resource "nsxt_policy_group" "grp_423" {
   display_name = "TF-AP1-IPSET-w3-ibm-com"
   nsx_id = "TF-AP1-IPSET-w3-ibm-com"
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
resource "nsxt_policy_group" "grp_424" {
   display_name = "TF-AP1-IPSET-KOREA-NETCOOL"
   nsx_id = "TF-AP1-IPSET-KOREA-NETCOOL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.56.67.69",
                         "169.56.67.70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_425" {
   display_name = "TF-AP1-IPSET-in1sr1lphwcls"
   nsx_id = "TF-AP1-IPSET-in1sr1lphwcls"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_426" {
   display_name = "TF-AP1-IPSET-IKS_Cluster_External_VIP-2"
   nsx_id = "TF-AP1-IPSET-IKS_Cluster_External_VIP-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.60.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_427" {
   display_name = "TF-AP1-IPSET-NET-ICp-ClusterIP-Service-Network"
   nsx_id = "TF-AP1-IPSET-NET-ICp-ClusterIP-Service-Network"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.127.128.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_428" {
   display_name = "TF-AP1-IPSET-SL-IRES-NSXM"
   nsx_id = "TF-AP1-IPSET-SL-IRES-NSXM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.63.133"
]
      }
   }
}
resource "nsxt_policy_group" "grp_429" {
   display_name = "TF-AP1-IPSET-eu1sr1lparmsisi"
   nsx_id = "TF-AP1-IPSET-eu1sr1lparmsisi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_430" {
   display_name = "TF-AP1-IPSET-dnat-to-PDR-Proxy-from-IRES"
   nsx_id = "TF-AP1-IPSET-dnat-to-PDR-Proxy-from-IRES"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_431" {
   display_name = "TF-AP1-IPSET-ap1spplusvsnap-secondary-IP"
   nsx_id = "TF-AP1-IPSET-ap1spplusvsnap-secondary-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.68.136"
]
      }
   }
}
resource "nsxt_policy_group" "grp_432" {
   display_name = "TF-AP1-IPSET-Integ-Svcs-Test-AP"
   nsx_id = "TF-AP1-IPSET-Integ-Svcs-Test-AP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.203.225-146.89.203.226",
                         "146.89.203.235-146.89.203.238"
]
      }
   }
}
resource "nsxt_policy_group" "grp_433" {
   display_name = "TF-AP1-IPSET-AP_Linux_Machines"
   nsx_id = "TF-AP1-IPSET-AP_Linux_Machines"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.0-158.87.54.255",
                         "100.87.240.0-100.87.240.255",
                         "10.63.9.73",
                         "100.80.69.0-100.80.69.255"
]
      }
   }
}
resource "nsxt_policy_group" "grp_434" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-DB2-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-DB2-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.181",
                         "158.87.54.182"
]
      }
   }
}
resource "nsxt_policy_group" "grp_435" {
   display_name = "TF-AP1-IPSET-NET-SYD-PDR-subnet"
   nsx_id = "TF-AP1-IPSET-NET-SYD-PDR-subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.69.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_436" {
   display_name = "TF-AP1-IPSET-HWSW-EU-SRES"
   nsx_id = "TF-AP1-IPSET-HWSW-EU-SRES"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.69",
                         "158.87.53.178"
]
      }
   }
}
resource "nsxt_policy_group" "grp_437" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1lpcacprx2"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.83"
]
      }
   }
}
resource "nsxt_policy_group" "grp_438" {
   display_name = "TF-AP1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
   nsx_id = "TF-AP1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.190"
]
      }
   }
}
resource "nsxt_policy_group" "grp_439" {
   display_name = "TF-AP1-IPSET-DRES-DNAT-to-vLi"
   nsx_id = "TF-AP1-IPSET-DRES-DNAT-to-vLi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.68.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_440" {
   display_name = "TF-AP1-IPSET-ap1irlpm1esldc-VIP"
   nsx_id = "TF-AP1-IPSET-ap1irlpm1esldc-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.68.135"
]
      }
   }
}
resource "nsxt_policy_group" "grp_441" {
   display_name = "TF-AP1-IPSET-IMI-DA-JH-1-2"
   nsx_id = "TF-AP1-IPSET-IMI-DA-JH-1-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.208.178",
                         "168.1.208.177"
]
      }
   }
}
resource "nsxt_policy_group" "grp_442" {
   display_name = "TF-AP1-IPSET-DR271-ergsdplmivm04"
   nsx_id = "TF-AP1-IPSET-DR271-ergsdplmivm04"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.72.8.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_443" {
   display_name = "TF-AP1-IPSET-SL-DNS"
   nsx_id = "TF-AP1-IPSET-SL-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.0.80.12",
                         "10.0.80.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_444" {
   display_name = "TF-AP1-IPSET-Host-blue-wdcdmyyz945126"
   nsx_id = "TF-AP1-IPSET-Host-blue-wdcdmyyz945126"
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
resource "nsxt_policy_group" "grp_445" {
   display_name = "TF-AP1-IPSET-EZOPS-DEV"
   nsx_id = "TF-AP1-IPSET-EZOPS-DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.115.1.175",
                         "9.115.3.175",
                         "9.115.5.175"
]
      }
   }
}
resource "nsxt_policy_group" "grp_446" {
   display_name = "TF-AP1-IPSET-SRES1-LB-VIP-OCP1"
   nsx_id = "TF-AP1-IPSET-SRES1-LB-VIP-OCP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.232.4",
                         "158.87.54.20",
                         "100.87.232.2",
                         "158.87.55.230"
]
      }
   }
}
resource "nsxt_policy_group" "grp_447" {
   display_name = "TF-AP1-IPSET-HRES-ap1h1lpta1ssh-VIP"
   nsx_id = "TF-AP1-IPSET-HRES-ap1h1lpta1ssh-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.240.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_448" {
   display_name = "TF-AP1-IPSET-DRES114-OCP-Cluster01-Temp"
   nsx_id = "TF-AP1-IPSET-DRES114-OCP-Cluster01-Temp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.13-100.80.92.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_449" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpgse1000"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpgse1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.91"
]
      }
   }
}
resource "nsxt_policy_group" "grp_450" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpcacfbds1"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpcacfbds1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.225"
]
      }
   }
}
resource "nsxt_policy_group" "grp_451" {
   display_name = "TF-AP1-IPSET-Tanzu-Workload-01"
   nsx_id = "TF-AP1-IPSET-Tanzu-Workload-01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.242.242",
                         "100.87.242.0/27",
                         "158.87.50.67"
]
      }
   }
}
resource "nsxt_policy_group" "grp_452" {
   display_name = "TF-AP1-IPSET-ap1irlpm1esldbp"
   nsx_id = "TF-AP1-IPSET-ap1irlpm1esldbp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.60.173",
                         "10.63.60.174",
                         "10.63.60.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_453" {
   display_name = "TF-AP1-IPSET-Host-DRES256-Proxy-VIP"
   nsx_id = "TF-AP1-IPSET-Host-DRES256-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.118.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_454" {
   display_name = "TF-AP1-IPSET-Host-Tanzu-Workload-01-NAT"
   nsx_id = "TF-AP1-IPSET-Host-Tanzu-Workload-01-NAT"
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
resource "nsxt_policy_group" "grp_455" {
   display_name = "TF-AP1-IPSET-DRES114-LB-OCP-Cluster1-VIP-2"
   nsx_id = "TF-AP1-IPSET-DRES114-LB-OCP-Cluster1-VIP-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_456" {
   display_name = "TF-AP1-IPSET-SRES01-ICP-Cluster01"
   nsx_id = "TF-AP1-IPSET-SRES01-ICP-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.117",
                         "158.87.54.115",
                         "158.87.54.118",
                         "158.87.54.111",
                         "158.87.54.120",
                         "158.87.54.125",
                         "158.87.54.128",
                         "158.87.54.113",
                         "158.87.54.114",
                         "158.87.54.121",
                         "158.87.54.123",
                         "158.87.54.127",
                         "158.87.54.119",
                         "158.87.54.129",
                         "158.87.54.112",
                         "158.87.54.122",
                         "158.87.54.126",
                         "158.87.54.110"
]
      }
   }
}
resource "nsxt_policy_group" "grp_457" {
   display_name = "TF-AP1-IPSET-DRES110-LB-OCP-Cluster1-VIP-TEMP"
   nsx_id = "TF-AP1-IPSET-DRES110-LB-OCP-Cluster1-VIP-TEMP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_458" {
   display_name = "TF-AP1-IPSET-SRES1-LB-VIP-OCP2"
   nsx_id = "TF-AP1-IPSET-SRES1-LB-VIP-OCP2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_459" {
   display_name = "TF-AP1-IPSET-ecmapprod-sl-bluecloud-ibm-com"
   nsx_id = "TF-AP1-IPSET-ecmapprod-sl-bluecloud-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.220.132.37"
]
      }
   }
}
resource "nsxt_policy_group" "grp_460" {
   display_name = "TF-AP1-IPSET-ap1sr1icp1p-vip"
   nsx_id = "TF-AP1-IPSET-ap1sr1icp1p-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.126"
]
      }
   }
}
resource "nsxt_policy_group" "grp_461" {
   display_name = "TF-AP1-IPSET-ap1srwpdwskms01"
   nsx_id = "TF-AP1-IPSET-ap1srwpdwskms01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.239"
]
      }
   }
}
resource "nsxt_policy_group" "grp_462" {
   display_name = "TF-AP1-IPSET-SRES-OCP-Cluster04-SNAT"
   nsx_id = "TF-AP1-IPSET-SRES-OCP-Cluster04-SNAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.232.32/27",
                         "158.87.54.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_463" {
   display_name = "TF-AP1-IPSET-Host-SRES-MNEAAS-AP-SHR1-NCO"
   nsx_id = "TF-AP1-IPSET-Host-SRES-MNEAAS-AP-SHR1-NCO"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.107",
                         "158.87.54.106"
]
      }
   }
}
resource "nsxt_policy_group" "grp_464" {
   display_name = "TF-AP1-IPSET-IRES-ap1irlptfa01"
   nsx_id = "TF-AP1-IPSET-IRES-ap1irlptfa01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.210.163"
]
      }
   }
}
resource "nsxt_policy_group" "grp_465" {
   display_name = "TF-AP1-IPSET-ap1srlpm1esbk1"
   nsx_id = "TF-AP1-IPSET-ap1srlpm1esbk1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.99"
]
      }
   }
}
resource "nsxt_policy_group" "grp_466" {
   display_name = "TF-AP1-IPSET-DR114-LB1-PrimaryIP"
   nsx_id = "TF-AP1-IPSET-DR114-LB1-PrimaryIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.10"
]
      }
   }
}
resource "nsxt_policy_group" "grp_467" {
   display_name = "TF-AP1-IPSET-NET-SL-Private-Service-Endpoints"
   nsx_id = "TF-AP1-IPSET-NET-SL-Private-Service-Endpoints"
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
resource "nsxt_policy_group" "grp_468" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-STaaS-AD-Clients"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.155",
                         "158.87.54.152",
                         "158.87.54.153",
                         "158.87.54.154"
]
      }
   }
}
resource "nsxt_policy_group" "grp_469" {
   display_name = "TF-AP1-IPSET-Host-blue-b01zvi21899631-ahe-pok"
   nsx_id = "TF-AP1-IPSET-Host-blue-b01zvi21899631-ahe-pok"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.56.22.231"
]
      }
   }
}
resource "nsxt_policy_group" "grp_470" {
   display_name = "TF-AP1-IPSET-IBM-BLUEID"
   nsx_id = "TF-AP1-IPSET-IBM-BLUEID"
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
resource "nsxt_policy_group" "grp_471" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpezoyess"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpezoyess"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.88"
]
      }
   }
}
resource "nsxt_policy_group" "grp_472" {
   display_name = "TF-AP1-IPSET-Host-blue-pgawdchwswu01"
   nsx_id = "TF-AP1-IPSET-Host-blue-pgawdchwswu01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.228.85"
]
      }
   }
}
resource "nsxt_policy_group" "grp_473" {
   display_name = "TF-AP1-IPSET-AG1-TANZU-WL04-NAT"
   nsx_id = "TF-AP1-IPSET-AG1-TANZU-WL04-NAT"
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
resource "nsxt_policy_group" "grp_474" {
   display_name = "TF-AP1-IPSET-HOst-pimpact2"
   nsx_id = "TF-AP1-IPSET-HOst-pimpact2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "24.100.100.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_475" {
   display_name = "TF-AP1-IPSET-NSXT-VC2-MGMT-Subnet"
   nsx_id = "TF-AP1-IPSET-NSXT-VC2-MGMT-Subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.70.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_476" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1epwg"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1epwg"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.101"
]
      }
   }
}
resource "nsxt_policy_group" "grp_477" {
   display_name = "TF-AP1-IPSET-Telstra-JumpCGNNAT"
   nsx_id = "TF-AP1-IPSET-Telstra-JumpCGNNAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.236.11-100.87.236.42"
]
      }
   }
}
resource "nsxt_policy_group" "grp_478" {
   display_name = "TF-AP1-IPSET-INDOSAT-NETCOOL-114-6-2-142"
   nsx_id = "TF-AP1-IPSET-INDOSAT-NETCOOL-114-6-2-142"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "114.6.2.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_479" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1cntrl1"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1cntrl1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_480" {
   display_name = "TF-AP1-IPSET-ap1srlpm1etnp2"
   nsx_id = "TF-AP1-IPSET-ap1srlpm1etnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.109"
]
      }
   }
}
resource "nsxt_policy_group" "grp_481" {
   display_name = "TF-AP1-IPSET-DRES164-LB-OCP-Cluster1-VIP-2"
   nsx_id = "TF-AP1-IPSET-DRES164-LB-OCP-Cluster1-VIP-2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.104.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_482" {
   display_name = "TF-AP1-IPSET-ap1sr1bfrelay2-IRES-NAT"
   nsx_id = "TF-AP1-IPSET-ap1sr1bfrelay2-IRES-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.102"
]
      }
   }
}
resource "nsxt_policy_group" "grp_483" {
   display_name = "TF-AP1-IPSET-gtscdi-ap-proxy-gacdw-sl-ibm-com"
   nsx_id = "TF-AP1-IPSET-gtscdi-ap-proxy-gacdw-sl-ibm-com"
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
resource "nsxt_policy_group" "grp_484" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-MSSQL-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-MSSQL-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.196",
                         "158.87.54.195"
]
      }
   }
}
resource "nsxt_policy_group" "grp_485" {
   display_name = "TF-AP1-IPSET-BigFix-Server"
   nsx_id = "TF-AP1-IPSET-BigFix-Server"
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
resource "nsxt_policy_group" "grp_486" {
   display_name = "TF-AP1-IPSET-hres1-lb1-PrimaryIP"
   nsx_id = "TF-AP1-IPSET-hres1-lb1-PrimaryIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.240.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_487" {
   display_name = "TF-AP1-IPSET-NET-SYD-CGN-Edge-DLR-Transit-subnet"
   nsx_id = "TF-AP1-IPSET-NET-SYD-CGN-Edge-DLR-Transit-subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.0.0/18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_488" {
   display_name = "TF-AP1-IPSET-sres1-esg1-inside"
   nsx_id = "TF-AP1-IPSET-sres1-esg1-inside"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.0.1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_489" {
   display_name = "TF-AP1-IPSET-DRES110-LB-OCP-Cluster1-VIP-1"
   nsx_id = "TF-AP1-IPSET-DRES110-LB-OCP-Cluster1-VIP-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_490" {
   display_name = "TF-AP1-IPSET-dnat-to-ap1sr1wjmp00"
   nsx_id = "TF-AP1-IPSET-dnat-to-ap1sr1wjmp00"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.69"
]
      }
   }
}
resource "nsxt_policy_group" "grp_491" {
   display_name = "TF-AP1-IPSET-HOST_NAT_CACF_Proxy"
   nsx_id = "TF-AP1-IPSET-HOST_NAT_CACF_Proxy"
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
resource "nsxt_policy_group" "grp_492" {
   display_name = "TF-AP1-IPSET-ap1sr1wpiamprt1"
   nsx_id = "TF-AP1-IPSET-ap1sr1wpiamprt1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.199"
]
      }
   }
}
resource "nsxt_policy_group" "grp_493" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1epni"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1epni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.104"
]
      }
   }
}
resource "nsxt_policy_group" "grp_494" {
   display_name = "TF-AP1-IPSET-HWSW-eu1sr1wphwcdb"
   nsx_id = "TF-AP1-IPSET-HWSW-eu1sr1wphwcdb"
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
resource "nsxt_policy_group" "grp_495" {
   display_name = "TF-AP1-IPSET-DRES264-LB-NAT"
   nsx_id = "TF-AP1-IPSET-DRES264-LB-NAT"
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
resource "nsxt_policy_group" "grp_496" {
   display_name = "TF-AP1-IPSET-pdr-esg01-LB-VIP-1"
   nsx_id = "TF-AP1-IPSET-pdr-esg01-LB-VIP-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.198.112.246"
]
      }
   }
}
resource "nsxt_policy_group" "grp_497" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1epdb"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1epdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.103"
]
      }
   }
}
resource "nsxt_policy_group" "grp_498" {
   display_name = "TF-AP1-IPSET-IBM-DNS"
   nsx_id = "TF-AP1-IPSET-IBM-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.0.144.50",
                         "9.0.146.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_499" {
   display_name = "TF-AP1-IPSET-ap1sppappliance"
   nsx_id = "TF-AP1-IPSET-ap1sppappliance"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.87"
]
      }
   }
}
resource "nsxt_policy_group" "grp_500" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpgsehst01"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpgsehst01"
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
resource "nsxt_policy_group" "grp_501" {
   display_name = "TF-AP1-IPSET-DRES164-LB-OCP-Cluster1-VIP-1"
   nsx_id = "TF-AP1-IPSET-DRES164-LB-OCP-Cluster1-VIP-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.104.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_502" {
   display_name = "TF-AP1-IPSET-NSXT-DRES114-OCP4-CLUSTER02"
   nsx_id = "TF-AP1-IPSET-NSXT-DRES114-OCP4-CLUSTER02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.100-100.80.92.113",
                         "100.80.92.150-100.80.92.165",
                         "100.80.92.114"
]
      }
   }
}
resource "nsxt_policy_group" "grp_503" {
   display_name = "TF-AP1-IPSET-Host-Blue-dgawdcdev01"
   nsx_id = "TF-AP1-IPSET-Host-Blue-dgawdcdev01"
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
resource "nsxt_policy_group" "grp_504" {
   display_name = "TF-AP1-IPSET-VPC-IKS-Cloud-Cluster"
   nsx_id = "TF-AP1-IPSET-VPC-IKS-Cloud-Cluster"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.64.0/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_505" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1etnp1"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1etnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.108"
]
      }
   }
}
resource "nsxt_policy_group" "grp_506" {
   display_name = "TF-AP1-IPSET-Host-ap1srwphwcweb"
   nsx_id = "TF-AP1-IPSET-Host-ap1srwphwcweb"
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
resource "nsxt_policy_group" "grp_507" {
   display_name = "TF-AP1-IPSET-IRES-QRADAR-NAT-IP"
   nsx_id = "TF-AP1-IPSET-IRES-QRADAR-NAT-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.243.193",
                         "100.80.68.3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_508" {
   display_name = "TF-AP1-IPSET-NET-MSS-Qradar-Console"
   nsx_id = "TF-AP1-IPSET-NET-MSS-Qradar-Console"
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
resource "nsxt_policy_group" "grp_509" {
   display_name = "TF-AP1-IPSET-NET-SL-IRES-VCS-MGMT"
   nsx_id = "TF-AP1-IPSET-NET-SL-IRES-VCS-MGMT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.63.128/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_510" {
   display_name = "TF-AP1-IPSET-NSXT-DRES114-OCP4-CLUSTER02-LB-VIP"
   nsx_id = "TF-AP1-IPSET-NSXT-DRES114-OCP4-CLUSTER02-LB-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_511" {
   display_name = "TF-AP1-IPSET-Host-ap1srlphsts1ntcl"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlphsts1ntcl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.171"
]
      }
   }
}
resource "nsxt_policy_group" "grp_512" {
   display_name = "TF-AP1-IPSET-MnE-Servers"
   nsx_id = "TF-AP1-IPSET-MnE-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.155",
                         "158.87.54.103",
                         "158.87.54.183",
                         "158.87.54.106",
                         "158.87.54.108",
                         "158.87.54.109",
                         "158.87.54.191",
                         "158.87.54.101",
                         "158.87.54.104",
                         "158.87.54.105",
                         "158.87.54.107",
                         "158.87.54.192",
                         "158.87.54.102",
                         "158.87.54.154"
]
      }
   }
}
resource "nsxt_policy_group" "grp_513" {
   display_name = "TF-AP1-IPSET-ap1sr1apiamprsvg2-secondary-IP"
   nsx_id = "TF-AP1-IPSET-ap1sr1apiamprsvg2-secondary-IP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.188"
]
      }
   }
}
resource "nsxt_policy_group" "grp_514" {
   display_name = "TF-AP1-IPSET-IBM-Blue-SRM"
   nsx_id = "TF-AP1-IPSET-IBM-Blue-SRM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.17.204.160",
                         "9.214.96.116-9.214.96.119",
                         "9.16.7.127",
                         "9.17.204.159",
                         "9.17.204.124",
                         "9.17.204.143",
                         "9.17.204.68",
                         "9.17.204.59",
                         "9.214.16.211-9.214.16.215",
                         "9.17.204.26",
                         "9.17.204.45"
]
      }
   }
}
resource "nsxt_policy_group" "grp_515" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1wjmp02"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1wjmp02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_516" {
   display_name = "TF-AP1-IPSET-vpc-30-dx-platform-prod-subnet1"
   nsx_id = "TF-AP1-IPSET-vpc-30-dx-platform-prod-subnet1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.71.1",
                         "192.168.64.32/27",
                         "100.80.71.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_517" {
   display_name = "TF-AP1-IPSET-uat-br-ibm-com"
   nsx_id = "TF-AP1-IPSET-uat-br-ibm-com"
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
resource "nsxt_policy_group" "grp_518" {
   display_name = "TF-AP1-IPSET-NET-All-RFC1918"
   nsx_id = "TF-AP1-IPSET-NET-All-RFC1918"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "192.168.0.0/16",
                         "172.16.0.0/12",
                         "10.0.0.0/8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_519" {
   display_name = "TF-AP1-IPSET-eu1sr1sepm1"
   nsx_id = "TF-AP1-IPSET-eu1sr1sepm1"
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
resource "nsxt_policy_group" "grp_520" {
   display_name = "TF-AP1-IPSET-in1sr1lpsssdb2"
   nsx_id = "TF-AP1-IPSET-in1sr1lpsssdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_521" {
   display_name = "TF-AP1-IPSET-DRES110-HOSTS"
   nsx_id = "TF-AP1-IPSET-DRES110-HOSTS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.77",
                         "100.80.90.81",
                         "100.80.90.76",
                         "100.80.90.82",
                         "100.80.90.78",
                         "100.80.90.80",
                         "100.80.90.79",
                         "100.80.90.83",
                         "100.80.90.75",
                         "100.80.90.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_522" {
   display_name = "TF-AP1-IPSET-SL-clouddriver"
   nsx_id = "TF-AP1-IPSET-SL-clouddriver"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.60.174"
]
      }
   }
}
resource "nsxt_policy_group" "grp_523" {
   display_name = "TF-AP1-IPSET-Host_ap1sr1lpiamprsdi1"
   nsx_id = "TF-AP1-IPSET-Host_ap1sr1lpiamprsdi1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.183"
]
      }
   }
}
resource "nsxt_policy_group" "grp_524" {
   display_name = "TF-AP1-IPSET-SL-IRES-ALL-SNAT"
   nsx_id = "TF-AP1-IPSET-SL-IRES-ALL-SNAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_525" {
   display_name = "TF-AP1-IPSET-NET-SYD-SRES-GSNI-subnet"
   nsx_id = "TF-AP1-IPSET-NET-SYD-SRES-GSNI-subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.0/23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_526" {
   display_name = "TF-AP1-IPSET-DR232-CPREM"
   nsx_id = "TF-AP1-IPSET-DR232-CPREM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.96.2.21",
                         "100.96.2.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_527" {
   display_name = "TF-AP1-IPSET-IKS_Cluster_External_VIP"
   nsx_id = "TF-AP1-IPSET-IKS_Cluster_External_VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.60.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_528" {
   display_name = "TF-AP1-IPSET-IBM--TOKYO"
   nsx_id = "TF-AP1-IPSET-IBM--TOKYO"
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
resource "nsxt_policy_group" "grp_529" {
   display_name = "TF-AP1-IPSET-NET-All-GSNI-routable"
   nsx_id = "TF-AP1-IPSET-NET-All-GSNI-routable"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.0/23",
                         "158.87.48.0/20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_530" {
   display_name = "TF-AP1-IPSET-SG-SRES-OCP-Cluster05"
   nsx_id = "TF-AP1-IPSET-SG-SRES-OCP-Cluster05"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.232.64/27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_531" {
   display_name = "TF-AP1-IPSET-EU1-Host-eu1sr1dxdev02"
   nsx_id = "TF-AP1-IPSET-EU1-Host-eu1sr1dxdev02"
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
resource "nsxt_policy_group" "grp_532" {
   display_name = "TF-AP1-IPSET-NET-SL-IRES-ISPW-MGMT"
   nsx_id = "TF-AP1-IPSET-NET-SL-IRES-ISPW-MGMT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.64/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_533" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1esbk1"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1esbk1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.99"
]
      }
   }
}
resource "nsxt_policy_group" "grp_534" {
   display_name = "TF-AP1-IPSET-DRES114-LB-OCP-Cluster1-VIP-1"
   nsx_id = "TF-AP1-IPSET-DRES114-LB-OCP-Cluster1-VIP-1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_535" {
   display_name = "TF-AP1-IPSET-UAT-AU"
   nsx_id = "TF-AP1-IPSET-UAT-AU"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.238.233"
]
      }
   }
}
resource "nsxt_policy_group" "grp_536" {
   display_name = "TF-AP1-IPSET-AG1-SRES-ICp-Cluster2-WorkerNodes"
   nsx_id = "TF-AP1-IPSET-AG1-SRES-ICp-Cluster2-WorkerNodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.55-158.87.48.60",
                         "158.87.48.17-158.87.48.19",
                         "158.87.48.45",
                         "158.87.48.82-158.87.48.84"
]
      }
   }
}
resource "nsxt_policy_group" "grp_537" {
   display_name = "TF-AP1-IPSET-eu1srlpgsenexgen"
   nsx_id = "TF-AP1-IPSET-eu1srlpgsenexgen"
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
resource "nsxt_policy_group" "grp_538" {
   display_name = "TF-AP1-IPSET-Host_DRES264-Client-premise-JH"
   nsx_id = "TF-AP1-IPSET-Host_DRES264-Client-premise-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.240.142.241",
                         "10.240.132.21",
                         "10.240.240.16",
                         "10.240.132.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_539" {
   display_name = "TF-AP1-IPSET-SRES-ICp-icp1-Ingress-VIP"
   nsx_id = "TF-AP1-IPSET-SRES-ICp-icp1-Ingress-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.111"
]
      }
   }
}
resource "nsxt_policy_group" "grp_540" {
   display_name = "TF-AP1-IPSET-EZOPS-ITM-hkgsni"
   nsx_id = "TF-AP1-IPSET-EZOPS-ITM-hkgsni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.226.177",
                         "146.89.226.178",
                         "146.89.226.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_541" {
   display_name = "TF-AP1-IPSET-IBM-Blue-ADE-ANZ"
   nsx_id = "TF-AP1-IPSET-IBM-Blue-ADE-ANZ"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.112.189.170"
]
      }
   }
}
resource "nsxt_policy_group" "grp_542" {
   display_name = "TF-AP1-IPSET-ag1srwphwcgrfds"
   nsx_id = "TF-AP1-IPSET-ag1srwphwcgrfds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.159"
]
      }
   }
}
resource "nsxt_policy_group" "grp_543" {
   display_name = "TF-AP1-IPSET-ap1d107lpcacpr-vip"
   nsx_id = "TF-AP1-IPSET-ap1d107lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.86.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_544" {
   display_name = "TF-AP1-IPSET-IBM-Blue-Sendmail"
   nsx_id = "TF-AP1-IPSET-IBM-Blue-Sendmail"
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
resource "nsxt_policy_group" "grp_545" {
   display_name = "TF-AP1-IPSET-Host-DRES258-Proxy-VIP"
   nsx_id = "TF-AP1-IPSET-Host-DRES258-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.120.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_546" {
   display_name = "TF-AP1-IPSET-ap1d127lpcacpr-vip"
   nsx_id = "TF-AP1-IPSET-ap1d127lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.94.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_547" {
   display_name = "TF-AP1-IPSET-KAFKA-SVC01-AU-SYD-EVENTSTREAMS-IBM-CLOUD"
   nsx_id = "TF-AP1-IPSET-KAFKA-SVC01-AU-SYD-EVENTSTREAMS-IBM-CLOUD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.90.66.243",
                         "168.1.1.227",
                         "130.198.87.170"
]
      }
   }
}
resource "nsxt_policy_group" "grp_548" {
   display_name = "TF-AP1-IPSET-PDR-Proxy-VIP"
   nsx_id = "TF-AP1-IPSET-PDR-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.69.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_549" {
   display_name = "TF-AP1-IPSET-SL-VCS-WIN-AD-DNS-NTP"
   nsx_id = "TF-AP1-IPSET-SL-VCS-WIN-AD-DNS-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.63.131",
                         "10.63.63.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_550" {
   display_name = "TF-AP1-IPSET-MSS-Qradar-Event-Collector"
   nsx_id = "TF-AP1-IPSET-MSS-Qradar-Event-Collector"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.81"
]
      }
   }
}
resource "nsxt_policy_group" "grp_551" {
   display_name = "TF-AP1-IPSET-Host-blue-b01zvi21899630-ahe-pok"
   nsx_id = "TF-AP1-IPSET-Host-blue-b01zvi21899630-ahe-pok"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.56.22.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_552" {
   display_name = "TF-AP1-IPSET-ICP-AP-Namespace"
   nsx_id = "TF-AP1-IPSET-ICP-AP-Namespace"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.110"
]
      }
   }
}
resource "nsxt_policy_group" "grp_553" {
   display_name = "TF-AP1-IPSET-in1sr1wpgrfds"
   nsx_id = "TF-AP1-IPSET-in1sr1wpgrfds"
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
resource "nsxt_policy_group" "grp_554" {
   display_name = "TF-AP1-IPSET-SRES-HWSW-PROD"
   nsx_id = "TF-AP1-IPSET-SRES-HWSW-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.231",
                         "158.87.54.234",
                         "158.87.54.232",
                         "158.87.54.233"
]
      }
   }
}
resource "nsxt_policy_group" "grp_555" {
   display_name = "TF-AP1-IPSET-NA-HWSW-ag1srlphwcmon01"
   nsx_id = "TF-AP1-IPSET-NA-HWSW-ag1srlphwcmon01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.178"
]
      }
   }
}
resource "nsxt_policy_group" "grp_556" {
   display_name = "TF-AP1-IPSET-DRES264-CACF-VIP-NAT"
   nsx_id = "TF-AP1-IPSET-DRES264-CACF-VIP-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.104.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_557" {
   display_name = "TF-AP1-IPSET-New-EU-JH-eu1srlpmcdjump"
   nsx_id = "TF-AP1-IPSET-New-EU-JH-eu1srlpmcdjump"
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
resource "nsxt_policy_group" "grp_558" {
   display_name = "TF-AP1-IPSET-ap1d128lpcacpr-vip"
   nsx_id = "TF-AP1-IPSET-ap1d128lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.96.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_559" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1wpiamprfs"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1wpiamprfs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_560" {
   display_name = "TF-AP1-IPSET-ap1srlpm1etnp1"
   nsx_id = "TF-AP1-IPSET-ap1srlpm1etnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.108"
]
      }
   }
}
resource "nsxt_policy_group" "grp_561" {
   display_name = "TF-AP1-IPSET-KAFKA"
   nsx_id = "TF-AP1-IPSET-KAFKA"
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
resource "nsxt_policy_group" "grp_562" {
   display_name = "TF-AP1-IPSET-ap1d114lpnab-vip1"
   nsx_id = "TF-AP1-IPSET-ap1d114lpnab-vip1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.92.11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_563" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-SDI-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-SDI-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.184",
                         "158.87.54.183",
                         "158.87.54.185"
]
      }
   }
}
resource "nsxt_policy_group" "grp_564" {
   display_name = "TF-AP1-IPSET-ap1irlpm1esldbs"
   nsx_id = "TF-AP1-IPSET-ap1irlpm1esldbs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.60.136",
                         "10.63.60.134"
]
      }
   }
}
resource "nsxt_policy_group" "grp_565" {
   display_name = "TF-AP1-IPSET-NET-ICp-Pod-Network"
   nsx_id = "TF-AP1-IPSET-NET-ICp-Pod-Network"
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
resource "nsxt_policy_group" "grp_566" {
   display_name = "TF-AP1-IPSET-ap1rhelreposerver"
   nsx_id = "TF-AP1-IPSET-ap1rhelreposerver"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_567" {
   display_name = "TF-AP1-IPSET-DA-NESSUS-146-89-203-216"
   nsx_id = "TF-AP1-IPSET-DA-NESSUS-146-89-203-216"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.203.216"
]
      }
   }
}
resource "nsxt_policy_group" "grp_568" {
   display_name = "TF-AP1-IPSET-ap1srwphwcstr"
   nsx_id = "TF-AP1-IPSET-ap1srwphwcstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.234"
]
      }
   }
}
resource "nsxt_policy_group" "grp_569" {
   display_name = "TF-AP1-IPSET-SL-SNMP-Proxy"
   nsx_id = "TF-AP1-IPSET-SL-SNMP-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.2.163.170"
]
      }
   }
}
resource "nsxt_policy_group" "grp_570" {
   display_name = "TF-AP1-IPSET-Host-SRES-MNEAAS-AP-SHR1-NCP"
   nsx_id = "TF-AP1-IPSET-Host-SRES-MNEAAS-AP-SHR1-NCP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.108",
                         "158.87.54.109"
]
      }
   }
}
resource "nsxt_policy_group" "grp_571" {
   display_name = "TF-AP1-IPSET-ap1sftp02-IRES-NAT"
   nsx_id = "TF-AP1-IPSET-ap1sftp02-IRES-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_572" {
   display_name = "TF-AP1-IPSET-Host-ap1srwphwcdb"
   nsx_id = "TF-AP1-IPSET-Host-ap1srwphwcdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.232"
]
      }
   }
}
resource "nsxt_policy_group" "grp_573" {
   display_name = "TF-AP1-IPSET-ap1sr1lpta1-vip"
   nsx_id = "TF-AP1-IPSET-ap1sr1lpta1-vip"
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
resource "nsxt_policy_group" "grp_574" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-NODB-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-NODB-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.206",
                         "158.87.54.183",
                         "158.87.54.199",
                         "158.87.54.207",
                         "158.87.54.204",
                         "158.87.54.203",
                         "158.87.54.184",
                         "158.87.54.205",
                         "158.87.54.200",
                         "158.87.54.185",
                         "158.87.54.201"
]
      }
   }
}
resource "nsxt_policy_group" "grp_575" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1wpiampre1"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1wpiampre1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.206"
]
      }
   }
}
resource "nsxt_policy_group" "grp_576" {
   display_name = "TF-AP1-IPSET-ap1irlpm1esldc02"
   nsx_id = "TF-AP1-IPSET-ap1irlpm1esldc02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.60.162"
]
      }
   }
}
resource "nsxt_policy_group" "grp_577" {
   display_name = "TF-AP1-IPSET-IMI-DAJumphosts"
   nsx_id = "TF-AP1-IPSET-IMI-DAJumphosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.208.178-168.1.208.180"
]
      }
   }
}
resource "nsxt_policy_group" "grp_578" {
   display_name = "TF-AP1-IPSET-s3-private-au-syd-cloud-object-storage-appdomain-cloud"
   nsx_id = "TF-AP1-IPSET-s3-private-au-syd-cloud-object-storage-appdomain-cloud"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.1.129.67"
]
      }
   }
}
resource "nsxt_policy_group" "grp_579" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1bfrelay2"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1bfrelay2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_580" {
   display_name = "TF-AP1-IPSET-SRES-LB-OCP-Cluster03-VIP1"
   nsx_id = "TF-AP1-IPSET-SRES-LB-OCP-Cluster03-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.83"
]
      }
   }
}
resource "nsxt_policy_group" "grp_581" {
   display_name = "TF-AP1-IPSET-ap1pdr1smtp01-IRES-NAT"
   nsx_id = "TF-AP1-IPSET-ap1pdr1smtp01-IRES-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_582" {
   display_name = "TF-AP1-IPSET-NET-IBM-Blue"
   nsx_id = "TF-AP1-IPSET-NET-IBM-Blue"
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
resource "nsxt_policy_group" "grp_583" {
   display_name = "TF-AP1-IPSET-SLSydImpactnode02"
   nsx_id = "TF-AP1-IPSET-SLSydImpactnode02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.208.182"
]
      }
   }
}
resource "nsxt_policy_group" "grp_584" {
   display_name = "TF-AP1-IPSET-SRES-DNS"
   nsx_id = "TF-AP1-IPSET-SRES-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.3",
                         "158.87.54.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_585" {
   display_name = "TF-AP1-IPSET-MCI-NZ-nzchctk01sr01rz"
   nsx_id = "TF-AP1-IPSET-MCI-NZ-nzchctk01sr01rz"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.163.67"
]
      }
   }
}
resource "nsxt_policy_group" "grp_586" {
   display_name = "TF-AP1-IPSET-ap1srwphwcgadb1"
   nsx_id = "TF-AP1-IPSET-ap1srwphwcgadb1"
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
resource "nsxt_policy_group" "grp_587" {
   display_name = "TF-AP1-IPSET-pdr-esg01-inside"
   nsx_id = "TF-AP1-IPSET-pdr-esg01-inside"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.64.253"
]
      }
   }
}
resource "nsxt_policy_group" "grp_588" {
   display_name = "TF-AP1-IPSET-Netcool-MCI-AU-Reporter-DB"
   nsx_id = "TF-AP1-IPSET-Netcool-MCI-AU-Reporter-DB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "130.103.171.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_589" {
   display_name = "TF-AP1-IPSET-NET-SYD-NAT-GSNI-subnet"
   nsx_id = "TF-AP1-IPSET-NET-SYD-NAT-GSNI-subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.60.128/25"
]
      }
   }
}
resource "nsxt_policy_group" "grp_590" {
   display_name = "TF-AP1-IPSET-Host-CPREM258-Ausgrid-JH"
   nsx_id = "TF-AP1-IPSET-Host-CPREM258-Ausgrid-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "163.8.72.198"
]
      }
   }
}
resource "nsxt_policy_group" "grp_591" {
   display_name = "TF-AP1-IPSET-NET-MSS-Qradar-Nextwatch"
   nsx_id = "TF-AP1-IPSET-NET-MSS-Qradar-Nextwatch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "209.134.187.16/29",
                         "209.134.187.8/29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_592" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-SECRET-PROD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-THY-SECRET-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.201",
                         "158.87.54.199",
                         "158.87.54.200"
]
      }
   }
}
resource "nsxt_policy_group" "grp_593" {
   display_name = "TF-AP1-IPSET-NET-Akamai-IBMID"
   nsx_id = "TF-AP1-IPSET-NET-Akamai-IBMID"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "23.202.230.73",
                         "23.202.230.75",
                         "192.201.218.0/24",
                         "192.201.219.0/24",
                         "23.32.5.48",
                         "23.32.5.55"
]
      }
   }
}
resource "nsxt_policy_group" "grp_594" {
   display_name = "TF-AP1-IPSET-SRES-IAM-THY-SVG-PROD"
   nsx_id = "TF-AP1-IPSET-SRES-IAM-THY-SVG-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.189",
                         "158.87.54.187"
]
      }
   }
}
resource "nsxt_policy_group" "grp_595" {
   display_name = "TF-AP1-IPSET-DR264-ESG-vpn-vNic_1"
   nsx_id = "TF-AP1-IPSET-DR264-ESG-vpn-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.1.194"
]
      }
   }
}
resource "nsxt_policy_group" "grp_596" {
   display_name = "TF-AP1-IPSET-ap1h1lpta1hap-vip"
   nsx_id = "TF-AP1-IPSET-ap1h1lpta1hap-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.240.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_597" {
   display_name = "TF-AP1-IPSET-Host-blue-b01zvi21899632-ahe-pok"
   nsx_id = "TF-AP1-IPSET-Host-blue-b01zvi21899632-ahe-pok"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.56.22.235"
]
      }
   }
}
resource "nsxt_policy_group" "grp_598" {
   display_name = "TF-AP1-IPSET-SRES-NAB-RDP-PROD"
   nsx_id = "TF-AP1-IPSET-SRES-NAB-RDP-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.69",
                         "158.87.54.70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_599" {
   display_name = "TF-AP1-IPSET-SRES-OCP-Cluster05-SNAT"
   nsx_id = "TF-AP1-IPSET-SRES-OCP-Cluster05-SNAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.232.64/27",
                         "158.87.54.27"
]
      }
   }
}
resource "nsxt_policy_group" "grp_600" {
   display_name = "TF-AP1-IPSET-esxc_esxm_CloudDevices"
   nsx_id = "TF-AP1-IPSET-esxc_esxm_CloudDevices"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.60.144",
                         "10.63.60.146",
                         "10.63.60.156",
                         "10.63.60.178",
                         "10.63.60.157",
                         "10.63.60.181",
                         "10.63.60.167",
                         "10.63.60.150",
                         "10.63.60.182",
                         "10.63.60.145",
                         "10.63.60.143",
                         "10.63.60.189",
                         "10.63.60.179",
                         "10.63.60.151",
                         "10.63.60.140",
                         "10.63.60.187",
                         "10.63.60.184",
                         "10.63.60.159",
                         "10.63.60.161",
                         "10.63.60.148",
                         "10.63.60.168",
                         "10.63.60.138",
                         "10.63.60.169"
]
      }
   }
}
resource "nsxt_policy_group" "grp_601" {
   display_name = "TF-AP1-IPSET-DR264-ESG-agg-vNic_0"
   nsx_id = "TF-AP1-IPSET-DR264-ESG-agg-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.64.31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_602" {
   display_name = "TF-AP1-IPSET-in1sr1wphwcweb"
   nsx_id = "TF-AP1-IPSET-in1sr1wphwcweb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.61.21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_603" {
   display_name = "TF-AP1-IPSET-GSENNA"
   nsx_id = "TF-AP1-IPSET-GSENNA"
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
resource "nsxt_policy_group" "grp_604" {
   display_name = "TF-AP1-IPSET-ap1srlpm1ecdb"
   nsx_id = "TF-AP1-IPSET-ap1srlpm1ecdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.105"
]
      }
   }
}
resource "nsxt_policy_group" "grp_605" {
   display_name = "TF-AP1-IPSET-HWSW-ap1srlphwcsssaz"
   nsx_id = "TF-AP1-IPSET-HWSW-ap1srlphwcsssaz"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.144"
]
      }
   }
}
resource "nsxt_policy_group" "grp_606" {
   display_name = "TF-AP1-IPSET-HWSW-GACDW-AP---DB"
   nsx_id = "TF-AP1-IPSET-HWSW-GACDW-AP---DB"
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
resource "nsxt_policy_group" "grp_607" {
   display_name = "TF-AP1-IPSET-ap1h1lpta2hap-vip"
   nsx_id = "TF-AP1-IPSET-ap1h1lpta2hap-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.87.240.15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_608" {
   display_name = "TF-AP1-IPSET-IBM-Blue-API-Connect"
   nsx_id = "TF-AP1-IPSET-IBM-Blue-API-Connect"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.44.14.146",
                         "9.131.50.167",
                         "9.17.253.233"
]
      }
   }
}
resource "nsxt_policy_group" "grp_609" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-STaaS-AD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-STaaS-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.151",
                         "158.87.54.150"
]
      }
   }
}
resource "nsxt_policy_group" "grp_610" {
   display_name = "TF-AP1-IPSET-ap1d97lpsiaprx-vip"
   nsx_id = "TF-AP1-IPSET-ap1d97lpsiaprx-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.76.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_611" {
   display_name = "TF-AP1-IPSET-ag1srwphwcetl01"
   nsx_id = "TF-AP1-IPSET-ag1srwphwcetl01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.149"
]
      }
   }
}
resource "nsxt_policy_group" "grp_612" {
   display_name = "TF-AP1-IPSET-slsydimpacttest01"
   nsx_id = "TF-AP1-IPSET-slsydimpacttest01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.211.97"
]
      }
   }
}
resource "nsxt_policy_group" "grp_613" {
   display_name = "TF-AP1-IPSET-SL-NTP"
   nsx_id = "TF-AP1-IPSET-SL-NTP"
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
resource "nsxt_policy_group" "grp_614" {
   display_name = "TF-AP1-IPSET-MSS-Admin-Access"
   nsx_id = "TF-AP1-IPSET-MSS-Admin-Access"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "209.134.191.18",
                         "207.231.156.67",
                         "207.231.156.68",
                         "209.134.191.19",
                         "206.253.234.197"
]
      }
   }
}
resource "nsxt_policy_group" "grp_615" {
   display_name = "TF-AP1-IPSET-ap1d101lpcacprx1-vip"
   nsx_id = "TF-AP1-IPSET-ap1d101lpcacprx1-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.78.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_616" {
   display_name = "TF-AP1-IPSET-Host-ap1sr1wpiampre2"
   nsx_id = "TF-AP1-IPSET-Host-ap1sr1wpiampre2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.207"
]
      }
   }
}
resource "nsxt_policy_group" "grp_617" {
   display_name = "TF-AP1-IPSET-NET-SL-IRES-Portable"
   nsx_id = "TF-AP1-IPSET-NET-SL-IRES-Portable"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.63.128/26",
                         "10.63.9.64/26",
                         "10.63.60.128/26",
                         "10.63.70.192/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_618" {
   display_name = "TF-AP1-IPSET-INDOSAT-NETCOOL"
   nsx_id = "TF-AP1-IPSET-INDOSAT-NETCOOL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "114.7.95.15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_619" {
   display_name = "TF-AP1-IPSET-Host-ap1srlpm1esdc1"
   nsx_id = "TF-AP1-IPSET-Host-ap1srlpm1esdc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.98"
]
      }
   }
}
resource "nsxt_policy_group" "grp_620" {
   display_name = "TF-AP1-IPSET-Host--pimpact1"
   nsx_id = "TF-AP1-IPSET-Host--pimpact1"
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
resource "nsxt_policy_group" "grp_621" {
   display_name = "TF-AP1-IPSET-ISA-CACF"
   nsx_id = "TF-AP1-IPSET-ISA-CACF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.118.10.27",
                         "10.118.10.21",
                         "10.118.10.20",
                         "10.118.10.29",
                         "100.124.64.2-100.124.64.13",
                         "10.118.10.11",
                         "10.118.10.13",
                         "10.118.10.18",
                         "10.118.10.28",
                         "10.162.236.131",
                         "10.118.10.17",
                         "10.118.10.19",
                         "10.118.10.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_622" {
   display_name = "TF-AP1-IPSET-AVI-NS1"
   nsx_id = "TF-AP1-IPSET-AVI-NS1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.50.66"
]
      }
   }
}
resource "nsxt_policy_group" "grp_623" {
   display_name = "TF-AP1-IPSET-IRES-ap1irlpipam01"
   nsx_id = "TF-AP1-IPSET-IRES-ap1irlpipam01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.210.151"
]
      }
   }
}
resource "nsxt_policy_group" "grp_624" {
   display_name = "TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
   nsx_id = "TF-AP1-IPSET-NET-CPREM-GSNI-NAT-range"
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
resource "nsxt_policy_group" "grp_625" {
   display_name = "TF-AP1-IPSET-IRES-VROPS-Server"
   nsx_id = "TF-AP1-IPSET-IRES-VROPS-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.63.9.80",
                         "10.63.9.97",
                         "10.63.9.96",
                         "10.63.9.82"
]
      }
   }
}
resource "nsxt_policy_group" "grp_626" {
   display_name = "TF-AP1-IPSET-EU1-SG-SRES-OCP-Cluster05-MOM"
   nsx_id = "TF-AP1-IPSET-EU1-SG-SRES-OCP-Cluster05-MOM"
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
resource "nsxt_policy_group" "grp_627" {
   display_name = "TF-AP1-IPSET-Host-Splunk-NAT"
   nsx_id = "TF-AP1-IPSET-Host-Splunk-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.68.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_628" {
   display_name = "TF-AP1-IPSET-Host-ecmapprod-sl-bluecloud-ibm-com"
   nsx_id = "TF-AP1-IPSET-Host-ecmapprod-sl-bluecloud-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.200.132.37"
]
      }
   }
}
resource "nsxt_policy_group" "grp_629" {
   display_name = "TF-AP1-IPSET-LA-UAT"
   nsx_id = "TF-AP1-IPSET-LA-UAT"
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
resource "nsxt_policy_group" "grp_630" {
   display_name = "TF-AP1-IPSET-IPSET-SRES-IAM-WINDOWS-PROD-AD"
   nsx_id = "TF-AP1-IPSET-IPSET-SRES-IAM-WINDOWS-PROD-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.206",
                         "158.87.54.198",
                         "169.254.2.152",
                         "158.87.54.199",
                         "158.87.54.207",
                         "158.87.54.204",
                         "158.87.54.231",
                         "158.87.54.203",
                         "158.87.54.205",
                         "158.87.54.200",
                         "158.87.54.197",
                         "169.254.1.129",
                         "158.87.54.201",
                         "158.87.54.180"
]
      }
   }
}
resource "nsxt_policy_group" "grp_631" {
   display_name = "TF-AP1-IPSET-Ausgrid-Jumphost"
   nsx_id = "TF-AP1-IPSET-Ausgrid-Jumphost"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "202.81.27.198-202.81.27.199"
]
      }
   }
}
resource "nsxt_policy_group" "grp_632" {
   display_name = "TF-AP1-IPSET-UAT-ANZ"
   nsx_id = "TF-AP1-IPSET-UAT-ANZ"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "146.89.238.228"
]
      }
   }
}
resource "nsxt_policy_group" "grp_633" {
   display_name = "TF-AP1-IPSET-tpysydecmap01-sl-bluecloud-ibm-com"
   nsx_id = "TF-AP1-IPSET-tpysydecmap01-sl-bluecloud-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.220.132.112"
]
      }
   }
}
resource "nsxt_policy_group" "grp_634" {
   display_name = "TF-AP1-IPSET-ap1srlpm1esdp1"
   nsx_id = "TF-AP1-IPSET-ap1srlpm1esdp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.97"
]
      }
   }
}
resource "nsxt_policy_group" "grp_635" {
   display_name = "TF-AP1-IPSET-ap1d130lpcacpr-vip"
   nsx_id = "TF-AP1-IPSET-ap1d130lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.100.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_636" {
   display_name = "TF-AP1-IPSET-pdr-esg01-LB-VIP-3"
   nsx_id = "TF-AP1-IPSET-pdr-esg01-LB-VIP-3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "168.1.103.204"
]
      }
   }
}
resource "nsxt_policy_group" "grp_637" {
   display_name = "TF-AP1-IPSET-ap1d141lpcacpr-vip"
   nsx_id = "TF-AP1-IPSET-ap1d141lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.102.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_638" {
   display_name = "TF-AP1-IPSET-ap1d193lpcacpr-vip"
   nsx_id = "TF-AP1-IPSET-ap1d193lpcacpr-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.106.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_639" {
   display_name = "TF-AP1-IPSET-smtp-sendgrid-net"
   nsx_id = "TF-AP1-IPSET-smtp-sendgrid-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.38.103.39",
                         "13.114.210.107",
                         "161.202.148.179",
                         "169.38.103.42",
                         "161.202.148.182",
                         "159.122.219.43",
                         "52.220.95.193",
                         "159.122.219.55"
]
      }
   }
}
resource "nsxt_policy_group" "grp_640" {
   display_name = "TF-AP1-IPSET-NET-SYD-CGN-subnet"
   nsx_id = "TF-AP1-IPSET-NET-SYD-CGN-subnet"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.0.0/13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_641" {
   display_name = "TF-AP1-IPSET-in1-sres-tanzu-workload-01-ingress"
   nsx_id = "TF-AP1-IPSET-in1-sres-tanzu-workload-01-ingress"
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
resource "nsxt_policy_group" "grp_642" {
   display_name = "TF-AP1-IPSET-portal-mneaas-ams-sp-ibm-com"
   nsx_id = "TF-AP1-IPSET-portal-mneaas-ams-sp-ibm-com"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.111"
]
      }
   }
}
resource "nsxt_policy_group" "grp_643" {
   display_name = "TF-AP1-IPSET-pjumplinux1"
   nsx_id = "TF-AP1-IPSET-pjumplinux1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.50.2.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_644" {
   display_name = "TF-AP1-IPSET-NET_dr110-app-internal1"
   nsx_id = "TF-AP1-IPSET-NET_dr110-app-internal1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.90.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_645" {
   display_name = "TF-AP1-IPSET-ap1srlpm1esdc1"
   nsx_id = "TF-AP1-IPSET-ap1srlpm1esdc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.98"
]
      }
   }
}
resource "nsxt_policy_group" "grp_646" {
   display_name = "TF-AP1-IPSET-gacdw-ap-w3cloud-ibm-com"
   nsx_id = "TF-AP1-IPSET-gacdw-ap-w3cloud-ibm-com"
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
