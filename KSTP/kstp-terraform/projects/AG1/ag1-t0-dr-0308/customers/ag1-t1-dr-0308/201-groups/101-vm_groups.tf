
#VMs
resource "nsxt_policy_group" "grp_1" {
  for_each = toset(local.VM_list)
  display_name = "TF-AG1-VM-${each.value}"
  nsx_id       = "TF-AG1-VM-${each.value}"
  description  = local.change
  tag {
    tag = "TF-${var.environment}-${var.project}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = each.value
    }
  }
}

#AD Group 
resource "nsxt_policy_group" "grp_10" {
  display_name = "TF-AG1-SG-DRES${local.dres}-AD-DNS"
  nsx_id       = "TF-AG1-SG-DRES${local.dres}-AD-DNS"
  description  = local.change
  tag {
    tag = "TF-${var.environment}-${var.project}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-AG1-VM-${local.lpecnsdc1_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.lpecnsdc2_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.lpecnsdc3_vm}"
      ]
    }
  }
  depends_on = [nsxt_policy_group.grp_1]
}

#Windows Clients 
resource "nsxt_policy_group" "grp_11" {
  display_name = "TF-AG1-SG-DRES${local.dres}-Windows-Clients"
  nsx_id       = "TF-AG1-SG-DRES${local.dres}-Windows-Clients"
  description  = local.change
  tag {
    tag = "TF-${var.environment}-${var.project}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-AG1-VM-${local.wpprkorp1_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.wpprkorp2_vm}"
      ]
    }
  }
  depends_on = [nsxt_policy_group.grp_1]
}

#PSN-ISE 
resource "nsxt_policy_group" "grp_12" {
  display_name = "TF-AG1-SG-DRES${local.dres}-PSN-ISE"
  nsx_id       = "TF-AG1-SG-DRES${local.dres}-PSN-ISE"
  description  = local.change
  tag {
    tag = "TF-${var.environment}-${var.project}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-AG1-VM-${local.apprkise1_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.apprkise2_vm}"
      ]
    }
  }
  depends_on = [nsxt_policy_group.grp_1]
}

#Restore Point 
resource "nsxt_policy_group" "grp_13" {
  display_name = "TF-AG1-SG-DRES${local.dres}-RestorePoint"
  nsx_id       = "TF-AG1-SG-DRES${local.dres}-RestorePoint"
  description  = local.change
  tag {
    tag = "TF-${var.environment}-${var.project}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-AG1-VM-${local.apprkrp1_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.apprkrp1_vm}"
      ]
    }
  }
  depends_on = [nsxt_policy_group.grp_1]
}

#Jumphost-NTP
resource "nsxt_policy_group" "grp_14" {
  display_name = "TF-AG1-SG-DRES${local.dres}-Jumphost-NTP"
  nsx_id       = "TF-AG1-SG-DRES${local.dres}-Jumphost-NTP"
  description  = local.change
  tag {
    tag = "TF-${var.environment}-${var.project}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-AG1-VM-${local.lpprkjmp1_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.lpprkjmp2_vm}"
      ]
    }
  }
  depends_on = [nsxt_policy_group.grp_1]
}
