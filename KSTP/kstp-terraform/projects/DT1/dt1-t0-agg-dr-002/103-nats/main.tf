


data "nsxt_policy_tier0_gateway" "select" {
  display_name = var.project
}

resource "nsxt_policy_nat_rule" "dnat_221213" {
  display_name         = "TF-221213"
  action               = "DNAT"
  destination_networks = ["150.239.66.137"]
  translated_networks  = ["150.239.66.137"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  #policy_based_vpn_mode = "MATCH"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
    "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"
  ]
}

resource "nsxt_policy_nat_rule" "snat_229406" {
  display_name         = "TF-229406"
  action               = "SNAT"
  source_networks      = ["100.71.240.4"]
  destination_networks = ["158.87.159.0/25"]
  translated_networks  = ["158.87.56.1"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
    "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"
  ]
}
