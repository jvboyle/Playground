
data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}


resource "nsxt_policy_nat_rule" "dnat1" {
  display_name         = "DR-DNAT"
  action               = "DNAT"
  source_networks      = ["10.0.0.0/24"]
  destination_networks = ["158.87.104.0/24"]
  translated_networks  = ["100.120.7.0/24"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

resource "nsxt_policy_nat_rule" "snat1" {
  display_name         = "DR-SNAT"
  action               = "SNAT"
  source_networks      = ["100.120.7.0/24"]
  destination_networks = ["10.0.0.0/24"]
  translated_networks  = ["158.87.104.0/24"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
