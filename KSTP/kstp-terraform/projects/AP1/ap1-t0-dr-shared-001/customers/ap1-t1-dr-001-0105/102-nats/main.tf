data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

resource "nsxt_policy_nat_rule" "dnat1" {
  display_name         = "DR-DNAT_1"
  action               = "DNAT"
  destination_networks = ["158.87.104.50/32"]
  translated_networks  = ["100.80.82.50/32"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_nat_rule" "dnat2" {
  display_name         = "DR-DNAT_2"
  action               = "DNAT"
  destination_networks = ["158.87.104.51/32"]
  translated_networks  = ["100.80.82.51/32"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_nat_rule" "dnat3" {
  display_name         = "DR-DNAT_3"
  action               = "DNAT"
  destination_networks = ["158.87.104.52/32"]
  translated_networks  = ["100.80.82.52/32"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}

resource "nsxt_policy_nat_rule" "snat1" {
  display_name         = "DR-SNAT_1"
  action               = "SNAT"
  source_networks      = ["100.80.82.51/32"] #Ap1 Subnet
  destination_networks = ["130.103.192.0/27"]
  translated_networks  = ["158.87.104.51"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}

resource "nsxt_policy_nat_rule" "snat2" {
  display_name         = "DR-SNAT_2"
  action               = "SNAT"
  source_networks      = ["100.80.82.52/32"] #Ap1 Subnet 
  translated_networks  = ["158.87.104.52"]
  destination_networks = ["130.103.192.0/27"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}

resource "nsxt_policy_nat_rule" "snat3" {
  display_name         = "DR-SNAT_3"
  action               = "SNAT"
  source_networks      = ["100.80.82.51/32"] #Ap1 Subnet 
  translated_networks  = ["158.87.104.51"]
  destination_networks = ["130.103.171.192/26"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}

resource "nsxt_policy_nat_rule" "snat4" {
  display_name         = "DR-SNAT_4"
  action               = "SNAT"
  source_networks      = ["100.80.82.52/32"] #Ap1 Subnet 
  destination_networks = ["130.103.171.192/26"]
  translated_networks  = ["158.87.104.52"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}