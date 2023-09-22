#####################################
# VM GROUPS
#
# Migration date: 05/23/2023 12:54
# Geography.....: AG1 
# Wave..........: IAM_PHASE3
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AG1-HOST-ag1dr162lpfm_oldrhel8"
   nsx_id = "TF-AG1-HOST-ag1dr162lpfm_oldrhel8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1dr162lpfm_oldrhel8"
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
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AG1-HOST-ag1srlncacfxfr_old"
   nsx_id = "TF-AG1-HOST-ag1srlncacfxfr_old"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ag1srlncacfxfr_old"
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
#####################################
# IPSETs GROUPS
#
# Migration date: 05/23/2023 12:54
# Geography.....: AG1 
# Wave..........: IAM_PHASE3
#####################################
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.142"
]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AG1-IPSET-UAT-LA1"
   nsx_id = "TF-AG1-IPSET-UAT-LA1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.106.91"
]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AG1-IPSET-158-87-49-211"
   nsx_id = "TF-AG1-IPSET-158-87-49-211"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.211"
]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AG1-IPSET-Mexico-Dedicated-Netcool-Impact"
   nsx_id = "TF-AG1-IPSET-Mexico-Dedicated-Netcool-Impact"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.54.196"
]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-SECRET-UAT"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-SECRET-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.75",
                         "158.87.49.88",
                         "158.87.49.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lpiamprsdi1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lpiamprsdi1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.96"
]
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMDB"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMDB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.224",
                         "158.87.49.225"
]
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMMQ"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMMQ"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.220",
                         "158.87.49.221"
]
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-AG1-IPSET-RTP-KSTP"
   nsx_id = "TF-AG1-IPSET-RTP-KSTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.42.199.40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lniamuasdi"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lniamuasdi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.67"
]
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-AG1-IPSET-Argentina-Netcool-Impact"
   nsx_id = "TF-AG1-IPSET-Argentina-Netcool-Impact"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.182.40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-AG1-IPSET-EU1-Netcool"
   nsx_id = "TF-AG1-IPSET-EU1-Netcool"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.52.53",
                         "158.87.52.54"
]
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMMGMT01"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMMGMT01"
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
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-AG1-IPSET-EU"
   nsx_id = "TF-AG1-IPSET-EU"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.237.53",
                         "158.98.237.21",
                         "158.98.237.20",
                         "158.98.237.22",
                         "158.98.237.16",
                         "158.98.237.41",
                         "158.98.237.18",
                         "158.98.237.17",
                         "158.98.237.112"
]
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-AG1-IPSET-Host-SRES-IAMAAS-THY-UAT"
   nsx_id = "TF-AG1-IPSET-Host-SRES-IAMAAS-THY-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.72",
                         "158.87.49.75",
                         "158.87.49.77",
                         "158.87.49.73",
                         "158.87.49.82",
                         "158.87.49.76",
                         "158.87.49.81",
                         "158.87.49.78",
                         "158.87.49.74"
]
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-IPSET-ag1sr1lpiamciprx1"
   nsx_id = "TF-AG1-IPSET-ag1sr1lpiamciprx1"
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
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamptra"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamptra"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-AG1-IPSET-SRES-SRM-PROD"
   nsx_id = "TF-AG1-IPSET-SRES-SRM-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.221",
                         "158.87.49.228",
                         "158.87.49.230",
                         "158.87.49.225",
                         "158.87.49.222",
                         "158.87.49.220",
                         "158.87.49.229",
                         "158.87.49.219",
                         "158.87.49.224",
                         "158.87.49.226",
                         "158.87.49.223",
                         "158.87.49.216",
                         "158.87.49.217",
                         "158.87.49.215",
                         "158.87.49.227",
                         "158.87.49.218"
]
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamtsr1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamtsr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.41"
]
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamuep3"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamuep3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.141"
]
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lniamptsdi"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lniamptsdi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1lniamtssdi1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1lniamtssdi1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.34"
]
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-AG1-IPSET-Venezuela-Netcool-Reporter"
   nsx_id = "TF-AG1-IPSET-Venezuela-Netcool-Reporter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.168.94"
]
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-AG1-IPSET-Brazil-Maximo"
   nsx_id = "TF-AG1-IPSET-Brazil-Maximo"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.183.14"
]
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AG1-IPSET-Mexico-Dedicated-Netcool-Reporter"
   nsx_id = "TF-AG1-IPSET-Mexico-Dedicated-Netcool-Reporter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.54.202"
]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-AG1-IPSET-Ecuador-Netcool-Impact"
   nsx_id = "TF-AG1-IPSET-Ecuador-Netcool-Impact"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.73.70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMPPMQ01"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMPPMQ01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.226"
]
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-AG1-IPSET-Argentina-Maximo"
   nsx_id = "TF-AG1-IPSET-Argentina-Maximo"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.165.191"
]
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-AG1-IPSET-EU1-eu1d276lprevpxy"
   nsx_id = "TF-AG1-IPSET-EU1-eu1d276lprevpxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.174.12"
]
      }
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-AG1-IPSET-ag1lmssqr01_migration-to-splunk_nic-removed"
   nsx_id = "TF-AG1-IPSET-ag1lmssqr01_migration-to-splunk_nic-removed"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.9.9.9"
]
      }
   }
}
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamtse2"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamtse2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.44"
]
      }
   }
}
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-AG1-IPSET-Host-ag1srlptocdb03"
   nsx_id = "TF-AG1-IPSET-Host-ag1srlptocdb03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.87.87",
                         "158.87.48.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMPPWAS01"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMPPWAS01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-AG1-IPSET-Mexico-Shared-Netcool-Impact"
   nsx_id = "TF-AG1-IPSET-Mexico-Shared-Netcool-Impact"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.48.151"
]
      }
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-AG1-IPSET-WAS-Admin"
   nsx_id = "TF-AG1-IPSET-WAS-Admin"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.227",
                         "158.87.49.222",
                         "158.87.49.223"
]
      }
   }
}
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamuep2"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamuep2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.140"
]
      }
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamtsq1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamtsq1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.39"
]
      }
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamtst1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamtst1"
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
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-AG1-IPSET-Colombia-Netcool-Reporter"
   nsx_id = "TF-AG1-IPSET-Colombia-Netcool-Reporter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.55.94"
]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniampte1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniampte1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamtsfs"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamtsfs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.45"
]
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-AG1-IPSET-SMR-Prod-for-Blue-acess"
   nsx_id = "TF-AG1-IPSET-SMR-Prod-for-Blue-acess"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.227",
                         "158.87.49.222",
                         "158.87.49.223",
                         "158.87.49.229"
]
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-AG1-IPSET-ag1sr1sltestvm"
   nsx_id = "TF-AG1-IPSET-ag1sr1sltestvm"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.164"
]
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-AG1-IPSET-Chile-Netcool-Impact"
   nsx_id = "TF-AG1-IPSET-Chile-Netcool-Impact"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.87.79"
]
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamuae1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamuae1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.78"
]
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-AG1-IPSET-UAT-LA2"
   nsx_id = "TF-AG1-IPSET-UAT-LA2"
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
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-AG1-IPSET-Mexico-Shared-Netcool-Reporter"
   nsx_id = "TF-AG1-IPSET-Mexico-Shared-Netcool-Reporter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.48.153"
]
      }
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMWAS"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMWAS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.222",
                         "158.87.49.223"
]
      }
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-AG1-IPSET-ecmagpreprod-sl-bluecloud"
   nsx_id = "TF-AG1-IPSET-ecmagpreprod-sl-bluecloud"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "9.209.239.99"
]
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-AG1-IPSET-EU1-eu1d276wpDDE"
   nsx_id = "TF-AG1-IPSET-EU1-eu1d276wpDDE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.73.174.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-AG1-IPSET-Venezuela-Netcool-Impact"
   nsx_id = "TF-AG1-IPSET-Venezuela-Netcool-Impact"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.168.94"
]
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-AG1-IPSET-SRM-DB-Hosts"
   nsx_id = "TF-AG1-IPSET-SRM-DB-Hosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.224",
                         "158.87.49.228",
                         "158.87.49.225"
]
      }
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-AG1-IPSET-Peru-Maximo"
   nsx_id = "TF-AG1-IPSET-Peru-Maximo"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.178.95"
]
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamprra"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamprra"
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
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-AG1-IPSET-Azure-CIO"
   nsx_id = "TF-AG1-IPSET-Azure-CIO"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "138.95.238.0/24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wpiamuep1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wpiamuep1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.139"
]
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-SECRET-PEN"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-SECRET-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.92",
                         "158.87.49.22",
                         "158.87.49.20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-AG1-IPSET-Ecuador-Netcool-Reporter"
   nsx_id = "TF-AG1-IPSET-Ecuador-Netcool-Reporter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.73.72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-AG1-IPSET-AG1SRLPSRMPPDB01"
   nsx_id = "TF-AG1-IPSET-AG1SRLPSRMPPDB01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.228"
]
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamtse1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamtse1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-AG1-IPSET-SRM-WAS"
   nsx_id = "TF-AG1-IPSET-SRM-WAS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.223",
                         "158.87.49.222",
                         "158.87.49.227"
]
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamptr1"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamptr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-AG1-IPSET-Chile-Netcool-Reporter"
   nsx_id = "TF-AG1-IPSET-Chile-Netcool-Reporter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.87.80"
]
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-UAT"
   nsx_id = "TF-AG1-IPSET-SRES-IAM-THY-MSSQL-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.72",
                         "158.87.49.88",
                         "158.87.49.73",
                         "158.87.49.81",
                         "158.87.49.82"
]
      }
   }
}
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-AG1-IPSET-Host-ag1sr1wniamptr2"
   nsx_id = "TF-AG1-IPSET-Host-ag1sr1wniamptr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.87.49.23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-AG1-IPSET-Colombia-Netcool-Impact"
   nsx_id = "TF-AG1-IPSET-Colombia-Netcool-Impact"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.55.94"
]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-AG1-IPSET-Argentina-Netcool-Reporter"
   nsx_id = "TF-AG1-IPSET-Argentina-Netcool-Reporter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "129.39.182.13"
]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-AG1-IPSET-Mexico-Maximo"
   nsx_id = "TF-AG1-IPSET-Mexico-Maximo"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "158.98.60.10"
]
      }
   }
}
#####################################
# EMPTY GROUPS
#
# Migration date: 05/23/2023 12:54
# Geography.....: AG1 
# Wave..........: IAM_PHASE3
#####################################


# Nothing to migrate#####################################
# SGEM GROUPS
#
# Migration date: 05/23/2023 12:54
# Geography.....: AG1 
# Wave..........: IAM_PHASE3
#####################################


# Nothing to migrate#####################################
# DYNAMIC GROUPS
#
# Migration date: 05/23/2023 12:54
# Geography.....: AG1 
# Wave..........: IAM_PHASE3
#####################################
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-AG1-SG-LPW-TEST"
   nsx_id = "TF-AG1-SG-LPW-TEST"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "prx"
      }
   }
}
