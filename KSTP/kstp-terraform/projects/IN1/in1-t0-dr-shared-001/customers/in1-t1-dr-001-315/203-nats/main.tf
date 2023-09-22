
data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

locals {
  internal_vip    = "100.126.165.50/32"
  external_vip    = "158.87.104.50/32"
  external_proxy1 = "158.87.104.51/32"
  external_proxy2 = "158.87.104.52/32"
  internal_proxy1 = "100.126.165.51/32"
  internal_proxy2 = "100.126.165.52/32"
}

resource "nsxt_policy_nat_rule" "dnat01" {
  display_name         = "${var.customer}-DNAT-01"
  action               = "DNAT"
  destination_networks = [local.external_vip]
  translated_networks  = [local.internal_vip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

resource "nsxt_policy_nat_rule" "snat01" {
  display_name        = "${var.customer}-SNAT-01"
  action              = "SNAT"
  destination_networks = ["10.0.1.91/32"]
  source_networks     = [local.internal_proxy1]
  translated_networks = [local.external_proxy1]
  gateway_path        = data.nsxt_policy_tier1_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

resource "nsxt_policy_nat_rule" "snat02" {
  display_name        = "${var.customer}-SNAT-02"
  action              = "SNAT"
  destination_networks = ["10.0.1.91/32"]
  source_networks     = [local.internal_proxy2]
  translated_networks = [local.external_proxy2]
  gateway_path        = data.nsxt_policy_tier1_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
