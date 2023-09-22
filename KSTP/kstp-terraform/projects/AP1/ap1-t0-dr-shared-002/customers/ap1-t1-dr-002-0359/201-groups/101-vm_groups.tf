#####################################
# VM GROUPS
#
# Migration date: 16/08/2023 15:38
# Geography.....: AP1 
# Wave..........: DRES359
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AP1-HOST-ap1d359lpcacprx1"
   nsx_id = "TF-AP1-HOST-ap1d359lpcacprx1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d359lpcacprx1"
      }
   }
}

resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AP1-HOST-ap1d359lpcacprx2"
   nsx_id = "TF-AP1-HOST-ap1d359lpcacprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d359lpcacprx2"
      }
   }
}

resource "nsxt_policy_group" "grp_5" {
  display_name = "TF-AP1-SG-DRES359-CACF-Proxy"
  nsx_id       = "TF-AP1-SG-DRES359-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-AP1-HOST-ap1d359lpcacprx1",
        "/infra/domains/default/groups/TF-AP1-HOST-ap1d359lpcacprx2"
      ]
    }
  }
}
