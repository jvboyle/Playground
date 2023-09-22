
locals {
  customer_0127 = "ap1-t1-dr-001-0127"
  customer_0141 = "ap1-t1-dr-001-0141"
  customer_0193 = "ap1-t1-dr-001-0193"

}

data "nsxt_policy_tier0_gateway" "T0_0" {
  display_name = "ap1-t0-dr-shared-002"
}
