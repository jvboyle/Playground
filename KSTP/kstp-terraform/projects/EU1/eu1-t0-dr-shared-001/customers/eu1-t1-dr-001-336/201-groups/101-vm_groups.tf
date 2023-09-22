 resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-EU1-VM-eu1d336lpcacprx1"
  nsx_id       = "TF-EU1-VM-eu1d336lpcacprx1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "eu1d336lpcacprx1"
    }
  }
}