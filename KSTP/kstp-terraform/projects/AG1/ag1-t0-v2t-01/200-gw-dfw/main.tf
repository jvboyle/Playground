data "nsxt_policy_tier0_gateway" "select" {
  display_name = var.customer
}

locals {
  gw_scope = data.nsxt_policy_tier0_gateway.select.path
}
