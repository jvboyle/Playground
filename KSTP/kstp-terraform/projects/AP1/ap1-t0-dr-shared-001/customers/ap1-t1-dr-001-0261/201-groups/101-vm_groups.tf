#####################################
# VM GROUPS
#
# Migration date: 05/05/2023 13:17
# Geography.....: AP1 
# Wave..........: DRES_261
#####################################

 resource "nsxt_policy_group" "grp_3" {
  display_name = "TF-AP1-VM-ap1d261lpcacpr1"
  nsx_id       = "TF-AP1-VM-ap1d261lpcacpr1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "ap1d261lpcacpr1"
    }
  }
}

resource "nsxt_policy_group" "grp_4" {
  display_name = "TF-AP1-VM-ap1d261lpcacpr2"
  nsx_id       = "TF-AP1-VM-ap1d261lpcacpr2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "ap1d261lpcacpr2"
    }
  }
}


#groups 
resource "nsxt_policy_group" "grp_5" {
  display_name = "TF-AP1-SG-DRES261-CACF-Proxy"
  nsx_id       = "TF-AP1-SG-DRES261-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr1",
        "/infra/domains/default/groups/TF-AP1-VM-ap1d261lpcacpr2"
      ]
    }
  }
}