#####################################
# VM GROUPS
#
# Migration date: 05/05/2023 13:17
# Geography.....: EU1 
# Wave..........: DRES_335
#####################################

 resource "nsxt_policy_group" "grp_3" {
  display_name = "TF-EU1-VM-eu1d335lpcacprx1"
  nsx_id       = "TF-EU1-VM-eu1d335lpcacprx1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d335lpcacprx1"
    }
  }
}

resource "nsxt_policy_group" "grp_4" {
  display_name = "TF-EU1-VM-eu1d335lpcacprx2"
  nsx_id       = "TF-EU1-VM-eu1d335lpcacprx2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d335lpcacprx2"
    }
  }
}


#groups 
resource "nsxt_policy_group" "grp_5" {
  display_name = "TF-EU1-SG-DRES335-CACF-Proxy"
  nsx_id       = "TF-EU1-SG-DRES335-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpcacprx1",
        "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpcacprx2"
      ]
    }
  }
}
resource "nsxt_policy_group" "grp_7" {
  display_name = "TF-EU1-VM-eu1d335lpucjtnp1"
  nsx_id       = "TF-EU1-VM-eu1d335lpucjtnp1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d335lpcajtnp1"
    }
  }
}

resource "nsxt_policy_group" "grp_8" {
  display_name = "TF-EU1-VM-eu1d335lpucjtnp2"
  nsx_id       = "TF-EU1-VM-eu1d335lpucjtnp2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d335lpcajtnp2"
    }
  }
}
