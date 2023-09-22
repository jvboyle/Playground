#####################################
# SGEM GROUPS
#
# Migration date: 05/08/2023 13:39
# Geography.....: AP1 
# Wave..........: DRES_256
#####################################
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AP1-SG-SRES-ap1sr1lpcacprx"
   nsx_id = "TF-AP1-SG-SRES-ap1sr1lpcacprx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-ap1sr1lpcacprx1-vip",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1lpcacprx1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1lpcacprx2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-AP1-SG-SRES-MNEAAS-AP-SHR1-NCO"
   nsx_id = "TF-AP1-SG-SRES-MNEAAS-AP-SHR1-NCO"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-SRES-MNEAAS-AP-SHR1-NCO"
]
      }
   }
}
