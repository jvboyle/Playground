 resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-EU1-VM-eu1d340lpcacprx1"
  nsx_id       = "TF-EU1-VM-eu1d340lpcacprx1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d340lpcacprx1"
    }
  }
}

resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-EU1-VM-eu1d340lpcacprx2"
  nsx_id       = "TF-EU1-VM-eu1d340lpcacprx2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d340lpcacprx2"
    }
  }
}


#groups 
resource "nsxt_policy_group" "grp_3" {
  display_name = "TF-EU1-SG-DRES340-CACF-Proxy"
  nsx_id       = "TF-EU1-SG-DRES340-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-EU1-VM-eu1d340lpcacprx1",
        "/infra/domains/default/groups/TF-EU1-VM-eu1d340lpcacprx2"
      ]
    }
  }
}