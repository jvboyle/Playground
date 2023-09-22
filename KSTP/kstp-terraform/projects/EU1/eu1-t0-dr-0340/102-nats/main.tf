data "nsxt_policy_tier0_gateway" "select" {
  display_name = var.customer
}

resource "nsxt_policy_nat_rule" "dnat1" {
  display_name         = "DR-DNAT_1"
  action               = "DNAT"
    destination_networks = ["158.87.104.50/32"]
  translated_networks  = ["100.73.252.50/32"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_nat_rule" "snat1" {
  display_name         = "DR-SNAT_1"
  action               = "SNAT"
  source_networks      = ["100.73.252.51/32"] #Ap1 Subnet 
  destination_networks = ["10.15.151.0/24"]
  translated_networks  = ["158.87.104.51"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}

resource "nsxt_policy_nat_rule" "snat2" {
  display_name         = "DR-SNAT_2"
  action               = "SNAT"
  source_networks      = ["100.73.252.52/32"] #Ap1 Subnet 
  destination_networks = ["10.15.151.0/24"]
  translated_networks  = ["158.87.104.52"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}