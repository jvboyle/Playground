#####################################
# SGEM GROUPS
#
# Migration date: 04/20/2023 08:46
# Geography.....: AG1 
# Wave..........: IAM_PHASE1
#####################################
resource "nsxt_policy_group" "grp_210" {
   display_name = "TF-AG1-SG-CISO-TOOLS-KSTP"
   nsx_id = "TF-AG1-SG-CISO-TOOLS-KSTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-QRADAR-NAT-IP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1lsplunkfwd01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_213" {
   display_name = "TF-AG1-SG-DR299-CACF-Proxy"
   nsx_id = "TF-AG1-SG-DR299-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d299lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d299lpcacpr2"
]
      }
   }
}
