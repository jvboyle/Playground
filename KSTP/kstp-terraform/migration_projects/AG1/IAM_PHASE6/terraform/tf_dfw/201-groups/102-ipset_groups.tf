#####################################
# IPSETs GROUPS
#
# Migration date: 07/12/2023 13:56
# Geography.....: AG1 
# Wave..........: IAM_PHASE6
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AG1-IPSET-DR217-LB-VIP1"
   nsx_id = "TF-AG1-IPSET-DR217-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.185.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AG1-IPSET-AP1-Host-dss-au-kyndryl-net"
   nsx_id = "TF-AG1-IPSET-AP1-Host-dss-au-kyndryl-net"
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
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AG1-IPSET-NET-DR217-ESG-VPN-transit1"
   nsx_id = "TF-AG1-IPSET-NET-DR217-ESG-VPN-transit1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.162/29"
]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AG1-IPSET-Host-Chile-129-39-87-15"
   nsx_id = "TF-AG1-IPSET-Host-Chile-129-39-87-15"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.87.15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AG1-IPSET-Host-ag1srwpsgesql01"
   nsx_id = "TF-AG1-IPSET-Host-ag1srwpsgesql01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.150"
]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AG1-IPSET-Ag1-Host-eu1srlptocdb03"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-eu1srlptocdb03"
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
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AG1-IPSET-STaaS-DR1-FS9200"
   nsx_id = "TF-AG1-IPSET-STaaS-DR1-FS9200"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.151.79.91-10.151.79.93",
                         "10.151.206.91-10.151.206.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AG1-IPSET-DR217-ESG-agg-vNic_0"
   nsx_id = "TF-AG1-IPSET-DR217-ESG-agg-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.64.61"
]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1srlpsatpxy-All"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1srlpsatpxy-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.127",
                         "158.87.49.128"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1sr1lpsecgw1"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1sr1lpsecgw1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.233"
]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AG1-IPSET-DR217-ESG-dlr-vNic_2"
   nsx_id = "TF-AG1-IPSET-DR217-ESG-dlr-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.3.169"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AG1-IPSET-DR217-LB-VIP1-NAT"
   nsx_id = "TF-AG1-IPSET-DR217-LB-VIP1-NAT"
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
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AG1-IPSET-AZURE-JMP"
   nsx_id = "TF-AG1-IPSET-AZURE-JMP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "20.163.127.175"
]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AG1-IPSET-DRES162-ag1dr162lpfm-NAT"
   nsx_id = "TF-AG1-IPSET-DRES162-ag1dr162lpfm-NAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.103.43.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-IPSET-DR217-CPREM"
   nsx_id = "TF-AG1-IPSET-DR217-CPREM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.253.77.99",
                         "10.253.141.103"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-OKTA-PDR-DNAT"
   nsx_id = "TF-AG1-IPSET-OKTA-PDR-DNAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "169.63.82.254",
                         "169.63.82.233"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1sr1wdns-All"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1sr1wdns-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.3",
                         "158.87.48.2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-IPSET-Ag1-SG-SRES-RPA-BP-GTS-GNA-Desktop-Pool"
   nsx_id = "TF-AG1-IPSET-Ag1-SG-SRES-RPA-BP-GTS-GNA-Desktop-Pool"
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
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AG1-IPSET-STaaS-DR162-Storage-Switch"
   nsx_id = "TF-AG1-IPSET-STaaS-DR162-Storage-Switch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.189.44.200-10.189.44.205",
                         "10.138.44.224-10.138.44.229",
                         "10.138.44.210-10.138.44.215",
                         "10.189.44.224-10.189.44.229",
                         "10.189.44.210-10.189.44.215",
                         "10.138.44.200-10.138.44.205"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AG1-IPSET-EMEA-dss-nl-kyndryl-net"
   nsx_id = "TF-AG1-IPSET-EMEA-dss-nl-kyndryl-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.168"
]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AG1-IPSET-DR217-ESG-vpn-vNic_3"
   nsx_id = "TF-AG1-IPSET-DR217-ESG-vpn-vNic_3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.185.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AG1-IPSET-Host-SAGE-KIS"
   nsx_id = "TF-AG1-IPSET-Host-SAGE-KIS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.22.91",
                         "146.89.125.151",
                         "146.89.125.149",
                         "158.87.22.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AG1-IPSET-Ag1-Host-ag1sr1wjmp-All"
   nsx_id = "TF-AG1-IPSET-Ag1-Host-ag1sr1wjmp-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.48.96",
                         "158.87.48.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-AG1-IPSET-DR334-CACF-Proxy"
   nsx_id = "TF-AG1-IPSET-DR334-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.216.51",
                         "100.64.216.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-AG1-IPSET-DR273-LB-VIP1"
   nsx_id = "TF-AG1-IPSET-DR273-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.203.242"
]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-AG1-IPSET-DR217-LB-VIP2"
   nsx_id = "TF-AG1-IPSET-DR217-LB-VIP2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.185.243"
]
      }
   }
}
