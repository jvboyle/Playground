#####################################
# IPSETs GROUPS
#
# Migration date: 07/14/2023 08:59
# Geography.....: AP1 
# Wave..........: DRES114
#####################################
resource "nsxt_policy_group" "cprem_group_1" {
   display_name = "TF-AP1-IPSET-DRES114-cprem_netcool"
   nsx_id = "TF-AP1-IPSET-DRES114-cprem_netcool"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.10.142.68","10.47.75.134","10.10.8.14"

]
      }
   }
}
resource "nsxt_policy_group" "cprem_group_2" {
   display_name = "TF-AP1-IPSET-cprem_JH"
   nsx_id = "TF-AP1-IPSET-DRES114-cprem_JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.47.122.200","10.47.122.198","10.47.156.138","10.47.156.139"
]
      }
   }
}

resource "nsxt_policy_group" "cprem_group_3" {
   display_name = "TF-AP1-IPSET-cprem_Cyberark"
   nsx_id = "TF-AP1-IPSET-DRES114-cprem_Cyberark"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "10.41.166.7","10.42.164.15","10.42.164.16","10.132.76.0/23"
]
      }
   }
}