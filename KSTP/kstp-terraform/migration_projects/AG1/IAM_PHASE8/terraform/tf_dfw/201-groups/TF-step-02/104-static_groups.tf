#####################################
# SGEM GROUPS
#
# Migration date: 07/26/2023 14:28
# Geography.....: AG1 
# Wave..........: IAM_PHASE8
#####################################
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-AG1-Host-Argentina-CP-JH"
   nsx_id = "TF-AG1-Host-Argentina-CP-JH"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-Argentina-129-39-81-16",
                         "/infra/domains/default/groups/TF-AG1-IPSET-Argentina-129-39-81-17",
                         "/infra/domains/default/groups/TF-AG1-IPSET-Argentina-129-39-168-99"
]
      }
   }
}