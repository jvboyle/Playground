
locals {
  customer_0290 = "ap1-t1-dr-001-0290"
  customer_0231 = "ap1-t1-dr-001-0231"
  customer_0271 = "ap1-t1-dr-001-0271"
  customer_0256 = "ap1-t1-dr-001-0256"
  customer_0268 = "ap1-t1-dr-001-0268"
  customer_0103 = "ap1-t1-dr-001-0103"
  customer_0105 = "ap1-t1-dr-001-0105"
  customer_0130 = "ap1-t1-dr-001-0130"
  customer_0258 = "ap1-t1-dr-001-0258"
  customer_0101 = "ap1-t1-dr-001-0101"
  customer_0128 = "ap1-t1-dr-001-0128"
  customer_0107 = "ap1-t1-dr-001-0107"
  customer_0108 = "ap1-t1-dr-001-0108"
  customer_0261 = "ap1-t1-dr-001-0261"
}

data "nsxt_policy_tier0_gateway" "T0_0" {
  display_name = "ap1-t0-dr-shared-001"
}
