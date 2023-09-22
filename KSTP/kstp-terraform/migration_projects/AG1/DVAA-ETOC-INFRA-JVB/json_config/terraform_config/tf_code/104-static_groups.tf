#####################################
# SGEM GROUPS
#
# Migration date: 04/06/2023 10:25
# Geography.....: AG1 
# Wave..........: DVAA-ETOC-INFRA-JVB
#####################################
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-AG1-SG-DR273-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR273-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR273-ESG-dlr-vNic_2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR273-ESG-dlr-vNic_3",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR273-ESG-agg-vNic_0",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR273-ESG-vpn-vNic_1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-AG1-SG-EU1-SRES-GACDW-PROD"
   nsx_id = "TF-AG1-SG-EU1-SRES-GACDW-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwdb",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwisds",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srwpgacdwdsc",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwwas1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwwas2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwCognos2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpgacdwCognos1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-AG1-SG-EU1-SRES-GACDW-DEV"
   nsx_id = "TF-AG1-SG-EU1-SRES-GACDW-DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlngacdwdb",
                         "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlngacdwwas"
]
      }
   }
}
