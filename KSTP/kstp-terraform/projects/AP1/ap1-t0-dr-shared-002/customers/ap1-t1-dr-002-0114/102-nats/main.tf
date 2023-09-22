data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

resource "nsxt_policy_nat_rule" "dnat1" {
  display_name         = "DR-DNAT_1"
  action               = "DNAT"
    destination_networks = ["158.87.104.50/32"]
  translated_networks  = ["100.80.92.11/32"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_nat_rule" "dnat4" {
  display_name         = "DR-DNAT_4"
  action               = "DNAT"
    destination_networks = ["158.87.104.11/32"]
  translated_networks  = ["100.80.92.11/32"]
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
  translated_networks  = ["100.80.92.51/32"]
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
  translated_networks  = ["100.80.92.52/32"]
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
  source_networks      = ["100.80.92.51/32"] #Ap1 Subnet 
  destination_networks = ["10.0.0.0/8"]
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
  source_networks      = ["100.80.92.52/32"] #Ap1 Subnet 
  destination_networks = ["10.0.0.0/8"]
  translated_networks  = ["158.87.104.52"]
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
  source_networks      = ["100.80.92.51/32"] #Ap1 Subnet 
  destination_networks = ["146.89.238.144/28"]
  translated_networks  = ["158.87.104.51"]
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
  source_networks      = ["100.80.92.52/32"] #Ap1 Subnet 
  destination_networks = ["146.89.238.144/28"]
  translated_networks  = ["158.87.104.52"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_nat_rule" "snat5" {
  display_name         = "DR-SNAT_5"
  action               = "SNAT"
  source_networks      = ["100.80.92.0/24"] #Ap1 Subnet 
  destination_networks = ["10.41.0.0/16"]
  translated_networks  = ["158.87.104.18"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_nat_rule" "snat6" {
  display_name         = "DR-SNAT_6"
  action               = "SNAT"
  source_networks      = ["100.80.92.0/24"] #Ap1 Subnet 
  destination_networks = ["10.42.0.0/16"]
  translated_networks  = ["158.87.104.18"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_nat_rule" "snat7" {
  display_name         = "DR-SNAT_7"
  action               = "SNAT"
  source_networks      = ["100.80.92.0/24"] #Ap1 Subnet 
  destination_networks = ["10.47.0.0/16"]
  translated_networks  = ["158.87.104.18"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_nat_rule" "snat8" {
  display_name         = "DR-SNAT_8"
  action               = "SNAT"
  source_networks      = ["100.80.92.0/24"] #Ap1 Subnet 
  destination_networks = ["10.10.0.0/16"]
  translated_networks  = ["158.87.104.18"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_nat_rule" "snat9" {
  display_name         = "DR-SNAT_9"
  action               = "SNAT"
  source_networks      = ["100.80.92.0/24"] #Ap1 Subnet 
  destination_networks = ["10.132.76.0/23"]
  translated_networks  = ["158.87.104.18"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}