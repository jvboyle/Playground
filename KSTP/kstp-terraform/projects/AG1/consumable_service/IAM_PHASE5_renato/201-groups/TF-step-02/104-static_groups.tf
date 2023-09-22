#####################################
# SGEM GROUPS
#
# Migration date: 06/21/2023 18:14
# Geography.....: AG1 
# Wave..........: IAM_PHASE5_renato
#####################################
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AG1-SG-DR299-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR299-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR299-ESG-vpn-vNic_1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR299-ESG-agg-vNic_0",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR299-ESG-dlr-vNic_2"
]
      }
   }
}
