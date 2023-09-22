data "nsxt_policy_tier0_gateway" "select" {
  display_name = var.project
}

/*
resource "nsxt_policy_nat_rule" "dnat1" {
  display_name         = "DR-DNAT_1"
  action               = "DNAT"
  source_networks      = ["100.120.5.0/24"]
  destination_networks = ["158.87.104.50/32"]
  translated_networks  = ["100.80.130.50/32"]
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
  source_networks      = ["100.80.130.51/32"] #Ap1 Subnet 
  destination_networks = ["100.120.5.0/24"]
  translated_networks  = ["158.87.104.51"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

/*     
                        {
                            "ruleId": "204816",
                            "ruleTag": "204816",
                            "loggingEnabled": "true",
                            "enabled": "true",
                            "description": "CACF EU - GSNI CGN NAT",
                            "translatedAddress": "100.105.20.128", # translation address 
                            "ruleType": "user",
                            "action": "dnat",
                            "vnic": "1",
                            "originalAddress": "100.79.236.17", # original destination 
                            "dnatMatchSourceAddress": "any",
                            "protocol": "any",
                            "originalPort": "any",
                            "translatedPort": "any",
                            "dnatMatchSourcePort": "any"
                        },

resource "nsxt_policy_nat_rule" "dnat1" {
  display_name         = "TF-204816" # "ruleId": "204816",
  nsx_id               = "TF-204816" 
  action               = "DNAT"      # "action": "dnat",
#  source_networks      = ["100.120.5.0/24"]  ANY 
  destination_networks = ["158.87.104.50"] # "originalAddress": "100.79.236.17"
  translated_networks  = ["100.80.130.50"] # "translatedAddress": "100.105.20.128",
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
#  firewall_match       = "MATCH_INTERNAL_ADDRESS"
}

Snat Example 
                        {
                            "ruleId": "196618",
                            "ruleTag": "196618",
                            "loggingEnabled": "true",
                            "enabled": "true",
                            "description": "SNAT for eu1h1lpta2ssh1",
                            "translatedAddress": "158.87.57.2",
                            "ruleType": "user",
                            "action": "snat",
                            "originalAddress": "100.79.240.7",
                            "snatMatchDestinationAddress": "any",
                            "protocol": "any",
                            "originalPort": "any",
                            "translatedPort": "any",
                            "snatMatchDestinationPort": "any"
                        },

resource "nsxt_policy_nat_rule" "snat" {
  display_name         = "DR-DNAT_1"       # "ruleId": "196618",
  action               = "SNAT"            # "action": "snat",
  source_networks      = ["100.79.240.7"]  # "originalAddress": "100.79.240.7",
#  destination_networks = [""]             # "snatMatchDestinationAddress": "any",
  translated_networks  = ["158.87.57.2"]   # "translatedAddress": "158.87.57.2",
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
#  firewall_match       = "MATCH_INTERNAL_ADDRESS"
}
*/
