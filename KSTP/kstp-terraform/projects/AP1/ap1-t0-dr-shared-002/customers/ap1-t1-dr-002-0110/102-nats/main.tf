data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

resource "nsxt_policy_nat_rule" "dnat1" {
  display_name         = "DR-DNAT_1"
  action               = "DNAT"
    destination_networks = ["158.87.104.11/32"]
  translated_networks  = ["100.80.90.50/32"]
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
  translated_networks  = ["100.80.90.51/32"]
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
  translated_networks  = ["100.80.90.52/32"]
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
  translated_networks  = ["100.80.90.11/32"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
   resource "nsxt_policy_nat_rule" "dnat5" {
  display_name         = "DR-DNAT_5"
  action               = "DNAT"
    destination_networks = ["158.87.104.70/32"]
  translated_networks  = ["100.80.90.70/32"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   }
     resource "nsxt_policy_nat_rule" "dnat6" {
  display_name         = "DR-DNAT_6"
  action               = "DNAT"
    destination_networks = ["158.87.104.71/32"]
  translated_networks  = ["100.80.90.71/32"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
     
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
     }
        resource "nsxt_policy_nat_rule" "dnat7" {
  display_name         = "DR-DNAT_7"
  action               = "DNAT"
    destination_networks = ["158.87.104.72/32"]
  translated_networks  = ["100.80.90.72/32"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
        
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
        }
           resource "nsxt_policy_nat_rule" "dnat8" {
  display_name         = "DR-DNAT_8"
  action               = "DNAT"
    destination_networks = ["158.87.104.72/32"]
  translated_networks  = ["100.80.90.72/32"]
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
  source_networks      = ["100.80.90.51/32"] #Ap1 Subnet 
  destination_networks = ["172.20.0.0/16"]
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
  source_networks      = ["100.80.90.52/32"] #Ap1 Subnet 
  destination_networks = ["172.20.0.0/16"]
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
  source_networks      = ["100.80.90.0/24"] #Ap1 Subnet 
  destination_networks = ["172.20.0.0/16"]
  translated_networks  = ["158.87.104.18"]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}