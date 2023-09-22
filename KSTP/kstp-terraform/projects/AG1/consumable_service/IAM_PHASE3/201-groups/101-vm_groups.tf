#####################################
# VM GROUPS
#
# Migration date: 05/23/2023 12:54
# Geography.....: AG1 
# Wave..........: IAM_PHASE3
#####################################
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-AG1-HOST-ag1dr162lpfm_oldrhel8"
  nsx_id       = "TF-AG1-HOST-ag1dr162lpfm_oldrhel8"
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
