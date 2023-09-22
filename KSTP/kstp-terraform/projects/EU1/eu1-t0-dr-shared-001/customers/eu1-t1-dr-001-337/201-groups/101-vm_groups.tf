#####################################
# VM GROUPS
#
# Migration date: 17/07/2023
# Geography.....: EU1 
# Wave..........: DRES_337
#####################################

 resource "nsxt_policy_group" "grp_3" {
  display_name = "TF-EU1-VM-eu1d337lpcacprx1"
  nsx_id       = "TF-EU1-VM-eu1d337lpcacprx1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d337lpcacprx1"
    }
  }
}

resource "nsxt_policy_group" "grp_4" {
  display_name = "TF-EU1-VM-eu1d337lpcacprx2"
  nsx_id       = "TF-EU1-VM-eu1d337lpcacprx2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d337lpcacprx2"
    }
  }
}


#groups 
resource "nsxt_policy_group" "grp_5" {
  display_name = "TF-EU1-SG-DRES337-CACF-Proxy"
  nsx_id       = "TF-EU1-SG-DRES337-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-EU1-VM-eu1d337lpcacprx1",
        "/infra/domains/default/groups/TF-EU1-VM-eu1d337lpcacprx2"
      ]
    }
  }
}