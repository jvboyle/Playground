#####################################
# VM GROUPS
#
# Migration date: 08/09/2023 15:24
# Geography.....: EU1 
# Wave..........: eu_sres_wave5
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-EU1-HOST-eu1d62apprkrp3"
   nsx_id = "TF-EU1-HOST-eu1d62apprkrp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62apprkrp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-EU1-HOST-eu1d92lpfnatnp2"
   nsx_id = "TF-EU1-HOST-eu1d92lpfnatnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d92lpfnatnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.208.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-EU1-HOST-vCLS-ef551546-a6e7-47c2-b327-9198daa18445"
   nsx_id = "TF-EU1-HOST-vCLS-ef551546-a6e7-47c2-b327-9198daa18445"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-ef551546-a6e7-47c2-b327-9198daa18445"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["9.9.9.9"]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-EU1-HOST-NLS01GNABPPBB12"
   nsx_id = "TF-EU1-HOST-NLS01GNABPPBB12"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01GNABPPBB12"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.79.248.68"]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-EU1-HOST-eu1d35lpthwtnp1"
   nsx_id = "TF-EU1-HOST-eu1d35lpthwtnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d35lpthwtnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.120.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-EU1-HOST-eu1d92lpfnatnp1"
   nsx_id = "TF-EU1-HOST-eu1d92lpfnatnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d92lpfnatnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.208.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-EU1-HOST-eu1d35lpthwtnp2"
   nsx_id = "TF-EU1-HOST-eu1d35lpthwtnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d35lpthwtnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.120.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-EU1-HOST-eu1d62apprkrp4"
   nsx_id = "TF-EU1-HOST-eu1d62apprkrp4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62apprkrp4"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.27"]
      }
   }
}
#####################################
# IPSETs GROUPS
#
# Migration date: 08/09/2023 15:24
# Geography.....: EU1 
# Wave..........: eu_sres_wave5
#####################################
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-EU1-IPSET-SRES-nlasabuildm1e00p"
   nsx_id = "TF-EU1-IPSET-SRES-nlasabuildm1e00p"
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
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam96"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam96"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.109"
]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildi01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildi01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.104"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-EU1-IPSET-Host-DR337-eu1d337lpcacprx2"
   nsx_id = "TF-EU1-IPSET-Host-DR337-eu1d337lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.246.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-EU1-IPSET-DR280-ESG-vNic_1"
   nsx_id = "TF-EU1-IPSET-DR280-ESG-vNic_1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.11.146"
]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam20"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam20"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.130"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam80"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam80"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.120"
]
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidwhi"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidwhi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.106"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-EU1-IPSET-DR338-eu1d338lpmpctnp2"
   nsx_id = "TF-EU1-IPSET-DR338-eu1d338lpmpctnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.248.33"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildi90"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildi90"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.118"
]
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam22"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam22"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.132"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-EU1-IPSET-SDE_Vienna_APICs"
   nsx_id = "TF-EU1-IPSET-SDE_Vienna_APICs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "62.185.254.0/26"
]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbm95"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbm95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.113"
]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwai03"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwai03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.102"
]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-EU1-IPSET-AG1-SRES-ag1srlpsrmmgmt01"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-ag1srlpsrmmgmt01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.57"
]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildm80"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildm80"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.124"
]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwai02"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwai02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.101"
]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam30"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-EU1-IPSET-Host-DR336-eu1d336lpcacprx1"
   nsx_id = "TF-EU1-IPSET-Host-DR336-eu1d336lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.244.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-EU1-IPSET-DR20-Proxy-VIP"
   nsx_id = "TF-EU1-IPSET-DR20-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.90.50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwai90"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwai90"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.114"
]
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam83"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam83"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.123"
]
      }
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbm60"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbm60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.19"
]
      }
   }
}
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwai92"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwai92"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.116"
]
      }
   }
}
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisimail01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisimail01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.137"
]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-EU1-IPSET-NET-IBM-CLOUD-COS-Private-Endpoints"
   nsx_id = "TF-EU1-IPSET-NET-IBM-CLOUD-COS-Private-Endpoints"
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
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildm70"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildm70"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.96"
]
      }
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildm95"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildm95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.112"
]
      }
   }
}
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam50"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam50"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.150"
]
      }
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-EU1-IPSET-DR335-eu1d335lpcajtnp2"
   nsx_id = "TF-EU1-IPSET-DR335-eu1d335lpcajtnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.242.33"
]
      }
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-EU1-IPSET-AG1-SRES-agnsrlnetocdwas"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-agnsrlnetocdwas"
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
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-EU1-IPSET-DR338-eu1d338lpmpctnp1"
   nsx_id = "TF-EU1-IPSET-DR338-eu1d338lpmpctnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.248.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-EU1-IPSET-DR113-KSA-P3_MGMT_Splunk-FWDR"
   nsx_id = "TF-EU1-IPSET-DR113-KSA-P3_MGMT_Splunk-FWDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.131.32.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam97"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam97"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.110"
]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwai91"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwai91"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.115"
]
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-EU1-IPSET-DR113-Spain-Splunk-FWDR"
   nsx_id = "TF-EU1-IPSET-DR113-Spain-Splunk-FWDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.8.8.0/28"
]
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbm01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbm01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.62"
]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-EU1-IPSET-DR20-eu1dr20dajh-VIP"
   nsx_id = "TF-EU1-IPSET-DR20-eu1dr20dajh-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.90.14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlnisiwas01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlnisiwas01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.245"
]
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam95"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.108"
]
      }
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-EU1-IPSET-Host-DR337-eu1d337lpcacprx1"
   nsx_id = "TF-EU1-IPSET-Host-DR337-eu1d337lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.246.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-EU1-IPSET-Host-DR335-eu1d335lpcacprx1"
   nsx_id = "TF-EU1-IPSET-Host-DR335-eu1d335lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.242.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam98"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam98"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.111"
]
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-EU1-IPSET-DR113-ITALY-P3_MGMT_Splunk-FWDR"
   nsx_id = "TF-EU1-IPSET-DR113-ITALY-P3_MGMT_Splunk-FWDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.131.16.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-EU1-IPSET-DR113-ITALY-DCMIL_Splunk-FWDR"
   nsx_id = "TF-EU1-IPSET-DR113-ITALY-DCMIL_Splunk-FWDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.16.12.37/32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam71"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam71"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-EU1-IPSET-AP1-SRES-ap1srlpecmprod1"
   nsx_id = "TF-EU1-IPSET-AP1-SRES-ap1srlpecmprod1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.54.139"
]
      }
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwai93"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwai93"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.117"
]
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbm20"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbm20"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.135"
]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-EU1-IPSET-DR280-LB-VIP1-NAT"
   nsx_id = "TF-EU1-IPSET-DR280-LB-VIP1-NAT"
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
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildm30"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildm30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.75"
]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-EU1-IPSET-DR280-ESG-vNic_2"
   nsx_id = "TF-EU1-IPSET-DR280-ESG-vNic_2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.11.153"
]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam51"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam51"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.151"
]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-EU1-IPSET-SRES-eu1srwnisiwin01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srwnisiwin01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.247"
]
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildm50"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildm50"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.154"
]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam43"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam43"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.185"
]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-EU1-IPSET-AG1-SRES-ag1srlpetocwas1021"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-ag1srlpetocwas1021"
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
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildm60"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildm60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.18"
]
      }
   }
}
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-EU1-IPSET-Host-DR335-eu1d335lpcacprx2"
   nsx_id = "TF-EU1-IPSET-Host-DR335-eu1d335lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.242.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildap"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildap"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.83"
]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildap1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.249"
]
      }
   }
}
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam23"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam23"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.133"
]
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildm01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildm01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.61"
]
      }
   }
}
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-EU1-IPSET-DR113-ITALY-P3_RBR_Splunk-FWDR"
   nsx_id = "TF-EU1-IPSET-DR113-ITALY-P3_RBR_Splunk-FWDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.131.18.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam41"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam41"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.183"
]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam73"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam73"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.95"
]
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-EU1-IPSET-DR280-LB-VIP1"
   nsx_id = "TF-EU1-IPSET-DR280-LB-VIP1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.183.241"
]
      }
   }
}
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbi01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbi01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.105"
]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-EU1-IPSET-DR280-CPREM-EY-SL1-Collectors"
   nsx_id = "TF-EU1-IPSET-DR280-CPREM-EY-SL1-Collectors"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.174.108.130",
                         "10.174.108.133",
                         "10.174.108.132",
                         "10.174.108.129"
]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisimail02"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisimail02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.138"
]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbm40"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbm40"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.187"
]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-EU1-IPSET-AG1-SRES-ag1srlpetocwas1011"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-ag1srlpetocwas1011"
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
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam21"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam21"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.131"
]
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlnisildap1"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlnisildap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.246"
]
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam03"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.59"
]
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-EU1-IPSET-DR335-eu1d335lpcajtnp1"
   nsx_id = "TF-EU1-IPSET-DR335-eu1d335lpcajtnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.242.32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-EU1-IPSET-DR280-ESG-vNic_0"
   nsx_id = "TF-EU1-IPSET-DR280-ESG-vNic_0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.64.188"
]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam53"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam53"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.153"
]
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildm40"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildm40"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.186"
]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam60"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbm50"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbm50"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.155"
]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-EU1-IPSET-DR113-ITALY-P3_ZVM_Splunk-FWDR"
   nsx_id = "TF-EU1-IPSET-DR113-ITALY-P3_ZVM_Splunk-FWDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.131.17.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam40"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam40"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.182"
]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-EU1-IPSET-DR113-KSA-P3_ZVM_Splunk-FWDR"
   nsx_id = "TF-EU1-IPSET-DR113-KSA-P3_ZVM_Splunk-FWDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.131.33.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbm30"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbm30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.76"
]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam82"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam82"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.122"
]
      }
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbm70"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbm70"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.97"
]
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-EU1-IPSET-AG1-SRES-ag1srlpetocdb1021"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-ag1srlpetocdb1021"
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
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiasodb"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiasodb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.107"
]
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-EU1-IPSET-Host-DR342-eu1d342lpcacprx1"
   nsx_id = "TF-EU1-IPSET-Host-DR342-eu1d342lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.74.0.51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam52"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam52"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.152"
]
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam61"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam61"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwas01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwas01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.248"
]
      }
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam72"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam72"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.94"
]
      }
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwai01"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwai01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.100"
]
      }
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwai04"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwai04"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.103"
]
      }
   }
}
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbi90"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbi90"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.119"
]
      }
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam62"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam62"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam42"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam42"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.184"
]
      }
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisidbm80"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisidbm80"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.125"
]
      }
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-EU1-IPSET-AG1-SRES-ag1srlpetocdb1011"
   nsx_id = "TF-EU1-IPSET-AG1-SRES-ag1srlpetocdb1011"
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
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-EU1-IPSET-DRES280-CPREM-EY-SL1-Collectors"
   nsx_id = "TF-EU1-IPSET-DRES280-CPREM-EY-SL1-Collectors"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.174.108.129",
                         "10.151.139.191-10.151.139.193",
                         "10.226.100.61-10.226.100.63",
                         "10.174.104.51-10.174.104.53",
                         "10.174.108.130",
                         "10.152.138.61-10.152.138.62",
                         "10.174.108.133",
                         "10.174.108.132",
                         "10.146.214.91-10.146.214.92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisildm20"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisildm20"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.134"
]
      }
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam02"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.58"
]
      }
   }
}
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam63"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam63"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.17"
]
      }
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam32"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam32"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam81"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam81"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.121"
]
      }
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam70"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam70"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-EU1-IPSET-Host-DR342-eu1d342lpcacprx2"
   nsx_id = "TF-EU1-IPSET-Host-DR342-eu1d342lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.74.0.52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam31"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam31"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam04"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam04"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-EU1-IPSET-SRES-eu1srlpisiwam33"
   nsx_id = "TF-EU1-IPSET-SRES-eu1srlpisiwam33"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.53.74"
]
      }
   }
}
#####################################
# EMPTY GROUPS
#
# Migration date: 08/09/2023 15:24
# Geography.....: EU1 
# Wave..........: eu_sres_wave5
#####################################


# Nothing to migrate#####################################
# SGEM GROUPS
#
# Migration date: 08/09/2023 15:24
# Geography.....: EU1 
# Wave..........: eu_sres_wave5
#####################################
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm30"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm30"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam03"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam03"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam03"
]
      }
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam62"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam62"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam62"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam62"
]
      }
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam20"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam20"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam20"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm60"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm60"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam70"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam70"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam70"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam96"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam96"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam96"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam96"
]
      }
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam97"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam97"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam97"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam97"
]
      }
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam31"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam31"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam31"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam41"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam41"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam41"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam41"
]
      }
   }
}
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai90"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai90"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai90"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai90"
]
      }
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam50"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam50"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam50"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm70"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm70"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm70"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam95"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam95"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam95"
]
      }
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm40"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm40"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm40"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-EU1-SG-DR280-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-DR280-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR280-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR280-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR280-ESG-vNic_2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srwnisiwin01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srwnisiwin01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srwnisiwin01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srwnisiwin01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildap"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildap"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildap"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildap"
]
      }
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai03"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai03"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai03"
]
      }
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm95"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm95"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm95"
]
      }
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildi01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildi01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildi01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildi01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm95"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm95"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm95"
]
      }
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam52"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam52"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam52"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam42"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam42"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam42"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam42"
]
      }
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiasodb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiasodb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiasodb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiasodb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbi01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbi01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbi01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbi01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam82"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam82"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam82"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam82"
]
      }
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam40"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam40"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam40"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam33"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam33"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam33"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam33"
]
      }
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm30"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm30"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai04"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai04"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai04"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai04"
]
      }
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam22"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam22"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam22"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam83"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam83"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam83"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam83"
]
      }
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam63"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam63"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam63"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam63"
]
      }
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam21"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam21"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam21"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlnisildap1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlnisildap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlnisildap1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlnisildap1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildap1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildap1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildap1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai93"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai93"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai93"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam60"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam60"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlnisiwas01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlnisiwas01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlnisiwas01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlnisiwas01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm80"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm80"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm80"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm80"
]
      }
   }
}
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm60"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm60"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisimail02"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisimail02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisimail02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisimail02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai92"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai92"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai92"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-EU1-SG-DR62-SDDC-RP"
   nsx_id = "TF-EU1-SG-DR62-SDDC-RP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkrp4",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkrp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam81"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam81"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam81"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam81"
]
      }
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbi90"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbi90"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbi90"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbi90"
]
      }
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam61"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam61"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam61"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam61"
]
      }
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm50"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm50"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm50"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidwhi"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidwhi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidwhi"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidwhi"
]
      }
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam72"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam72"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam72"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam98"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam98"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam98"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam98"
]
      }
   }
}
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwas01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwas01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwas01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwas01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai02"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm80"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm80"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm80"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm80"
]
      }
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam02"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam04"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam04"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam04"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam04"
]
      }
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam43"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam43"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam43"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam51"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam51"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam51"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_184" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildi90"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildi90"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildi90"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildi90"
]
      }
   }
}
resource "nsxt_policy_group" "grp_185" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam23"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam23"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam23"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_186" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam71"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam71"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam71"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_187" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_188" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam73"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam73"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam73"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_189" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisimail01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisimail01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisimail01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisimail01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_190" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm50"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm50"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm50"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_191" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam32"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam32"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam32"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_192" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam30"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam30"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_193" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm40"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm40"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm40"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_194" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai91"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai91"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai91"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai91"
]
      }
   }
}
resource "nsxt_policy_group" "grp_195" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm20"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm20"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm20"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_196" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm20"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm20"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm20"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_197" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam53"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam53"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam53"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam53"
]
      }
   }
}
resource "nsxt_policy_group" "grp_198" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam80"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam80"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam80"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam80"
]
      }
   }
}
#####################################
# DYNAMIC GROUPS
#
# Migration date: 08/09/2023 15:24
# Geography.....: EU1 
# Wave..........: eu_sres_wave5
#####################################
resource "nsxt_policy_group" "grp_199" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm70"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm70"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm70"
      }
   }
}
resource "nsxt_policy_group" "grp_200" {
   display_name = "TF-EU1-SG-SRES-nlasabuildm1e00p"
   nsx_id = "TF-EU1-SG-SRES-nlasabuildm1e00p"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlasabuildm1e00p"
      }
   }
}
