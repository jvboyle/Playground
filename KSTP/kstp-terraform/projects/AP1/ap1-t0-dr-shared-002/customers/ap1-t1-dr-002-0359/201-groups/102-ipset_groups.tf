#####################################
# IPSETs GROUPS
#
# Migration date: 07/07/2023 15:38
# Geography.....: AP1 
# Wave..........: DRES359
#####################################
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AP1-IPSET-DRES359-CPREM-JH"
   nsx_id = "TF-AP1-IPSET-DRES359-CPREM-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "172.31.0.105"
]
      }
   }
}