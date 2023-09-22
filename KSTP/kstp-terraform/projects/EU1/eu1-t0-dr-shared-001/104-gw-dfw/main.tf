
locals {
  customer_335 = "eu1-t0-dr-001-335"
  customer_336 = "eu1-t0-dr-001-336"
  customer_337 = "eu1-t0-dr-001-337"
  customer_339 = "eu1-t0-dr-001-339"
}

data "nsxt_policy_tier0_gateway" "T0_0" {
  display_name = "eu1-t0-dr-shared-001"
}