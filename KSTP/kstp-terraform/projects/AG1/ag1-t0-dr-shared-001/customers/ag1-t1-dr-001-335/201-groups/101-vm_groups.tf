
#VMs
resource "nsxt_policy_group" "grp_1" {
  for_each = toset(local.VM_list)
  display_name = "TF-${var.environment}-VM-${each.value}"
  nsx_id       = "TF-${var.environment}-VM-${each.value}"
  description  = local.change
  tag {
    tag = "TF-${var.customer}"
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

#Proxy
resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-${var.environment}-SG-DR${local.dres}-${local.consumable_service}-Proxy"
  nsx_id       = "TF-${var.environment}-SG-DR${local.dres}-${local.consumable_service}-Proxy"
  description  = local.change
  tag {
    tag = "TF-${var.customer}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-${var.environment}-VM-${local.lpcacpr1_vm}",
        "/infra/domains/default/groups/TF-${var.environment}-VM-${local.lpcacpr2_vm}"
      ]
    }
  }
  depends_on = [nsxt_policy_group.grp_1]
}
