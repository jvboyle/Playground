data "nsxt_policy_tier1_gateway" "T1_0" {
  display_name = var.customer
}

locals {
gw_scope = data.nsxt_policy_tier1_gateway.T1_0.path
}

