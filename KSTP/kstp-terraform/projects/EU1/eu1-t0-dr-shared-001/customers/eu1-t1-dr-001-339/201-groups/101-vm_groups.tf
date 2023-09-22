#####################################
# VM GROUPS
#
#
# Geography.....: EU1 
# Wave..........: DRES_339
#####################################

 resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-EU1-VM-eu1d339lpmh0tnp1"
  nsx_id       = "TF-EU1-VM-eu1d339lpmh0tnp1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d339lpmh0tnp1"
    }
  }
}

resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-EU1-VM-eu1d339lpmh0tnp2"
  nsx_id       = "TF-EU1-VM-eu1d339lpmh0tnp2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d339lpmh0tnp2"
    }
  }
}