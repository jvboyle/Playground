#####################################
# IPSETs GROUPS
#
# Migration date: 05/16/2023 13:14
# Geography.....: AP1 
# Wave..........: DRES255
#####################################

resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AP1-IPSET-Host-ap1d255lpcacpr1"
   nsx_id = "TF-AP1-IPSET-Host-ap1d255lpcacpr1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.116.51"
]
      }
   }
}

resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AP1-IPSET-Host-ap1d255lpcacpr2"
   nsx_id = "TF-AP1-IPSET-Host-ap1d255lpcacpr2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.80.116.52"
]
      }
   }
}