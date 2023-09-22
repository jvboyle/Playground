resource "nsxt_policy_nat_rule" "dnat_196630" {
  display_name         = "TF-196630"
  action               = "DNAT"
  destination_networks = ["169.51.163.5"]
  translated_networks  = ["169.51.163.5"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196631" {
  display_name         = "TF-196631"
  action               = "DNAT"
  destination_networks = ["169.51.163.5"]
  translated_networks  = ["169.51.163.5"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196632" {
  display_name         = "TF-196632"
  action               = "DNAT"
  destination_networks = ["169.51.163.5"]
  translated_networks  = ["169.51.163.5"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196613" {
  display_name        = "TF-196613"
  action              = "SNAT"
  source_networks     = ["100.79.240.4"]
  translated_networks = ["158.87.57.1"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196614" {
  display_name        = "TF-196614"
  action              = "SNAT"
  source_networks     = ["100.79.240.5"]
  translated_networks = ["158.87.57.1"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196618" {
  display_name        = "TF-196618"
  action              = "SNAT"
  source_networks     = ["100.79.240.7"]
  translated_networks = ["158.87.57.2"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196619" {
  display_name        = "TF-196619"
  action              = "SNAT"
  source_networks     = ["100.79.240.8"]
  translated_networks = ["158.87.57.2"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196620" {
  display_name        = "TF-196620"
  action              = "SNAT"
  source_networks     = ["100.79.240.10"]
  translated_networks = ["158.87.57.3"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196621" {
  display_name        = "TF-196621"
  action              = "SNAT"
  source_networks     = ["100.79.240.11"]
  translated_networks = ["158.87.57.3"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196612" {
  display_name         = "TF-196612"
  action               = "DNAT"
  destination_networks = ["100.79.236.11"]
  translated_networks  = ["100.112.9.6"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196615" {
  display_name         = "TF-196615"
  action               = "DNAT"
  destination_networks = ["100.79.236.12"]
  translated_networks  = ["100.112.9.7"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196616" {
  display_name         = "TF-196616"
  action               = "DNAT"
  destination_networks = ["100.79.236.13"]
  translated_networks  = ["100.107.17.69"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196617" {
  display_name         = "TF-196617"
  action               = "DNAT"
  destination_networks = ["100.79.236.14"]
  translated_networks  = ["100.107.17.71"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204814" {
  display_name         = "TF-204814"
  action               = "DNAT"
  destination_networks = ["100.79.236.15"]
  translated_networks  = ["100.105.20.100"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204815" {
  display_name         = "TF-204815"
  action               = "DNAT"
  destination_networks = ["100.79.236.16"]
  translated_networks  = ["100.105.20.101"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204816" {
  display_name         = "TF-204816"
  action               = "DNAT"
  destination_networks = ["100.79.236.17"]
  translated_networks  = ["100.105.20.128"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204817" {
  display_name         = "TF-204817"
  action               = "DNAT"
  destination_networks = ["100.79.236.18"]
  translated_networks  = ["100.105.20.129"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204818" {
  display_name         = "TF-204818"
  action               = "DNAT"
  destination_networks = ["100.79.236.19"]
  translated_networks  = ["100.105.20.106"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204819" {
  display_name         = "TF-204819"
  action               = "DNAT"
  destination_networks = ["100.79.236.20"]
  translated_networks  = ["100.105.20.107"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204820" {
  display_name         = "TF-204820"
  action               = "DNAT"
  destination_networks = ["100.79.236.21"]
  translated_networks  = ["100.105.20.126"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204821" {
  display_name         = "TF-204821"
  action               = "DNAT"
  destination_networks = ["100.79.236.22"]
  translated_networks  = ["100.105.20.127"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204822" {
  display_name         = "TF-204822"
  action               = "DNAT"
  destination_networks = ["100.79.236.23"]
  translated_networks  = ["100.105.20.59"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204823" {
  display_name         = "TF-204823"
  action               = "DNAT"
  destination_networks = ["100.79.236.24"]
  translated_networks  = ["100.105.20.71"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204824" {
  display_name         = "TF-204824"
  action               = "DNAT"
  destination_networks = ["100.79.236.25"]
  translated_networks  = ["100.105.20.3"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204825" {
  display_name         = "TF-204825"
  action               = "DNAT"
  destination_networks = ["100.79.236.26"]
  translated_networks  = ["100.105.20.4"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204826" {
  display_name         = "TF-204826"
  action               = "DNAT"
  destination_networks = ["100.79.236.27"]
  translated_networks  = ["100.87.98.18"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204827" {
  display_name         = "TF-204827"
  action               = "DNAT"
  destination_networks = ["100.79.236.28"]
  translated_networks  = ["100.87.98.19"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204828" {
  display_name         = "TF-204828"
  action               = "DNAT"
  destination_networks = ["100.79.236.29"]
  translated_networks  = ["100.87.2.92"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204829" {
  display_name         = "TF-204829"
  action               = "DNAT"
  destination_networks = ["100.79.236.30"]
  translated_networks  = ["100.87.2.99"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204830" {
  display_name         = "TF-204830"
  action               = "DNAT"
  destination_networks = ["100.79.236.31"]
  translated_networks  = ["100.87.2.106"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204831" {
  display_name         = "TF-204831"
  action               = "DNAT"
  destination_networks = ["100.79.236.32"]
  translated_networks  = ["100.87.2.107"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204832" {
  display_name         = "TF-204832"
  action               = "DNAT"
  destination_networks = ["100.79.236.33"]
  translated_networks  = ["100.87.34.32"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204833" {
  display_name         = "TF-204833"
  action               = "DNAT"
  destination_networks = ["100.79.236.34"]
  translated_networks  = ["100.87.34.33"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204834" {
  display_name         = "TF-204834"
  action               = "DNAT"
  destination_networks = ["100.79.236.35"]
  translated_networks  = ["100.87.130.120"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204835" {
  display_name         = "TF-204835"
  action               = "DNAT"
  destination_networks = ["100.79.236.36"]
  translated_networks  = ["100.87.130.121"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204836" {
  display_name         = "TF-204836"
  action               = "DNAT"
  destination_networks = ["100.79.236.37"]
  translated_networks  = ["100.87.130.122"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204837" {
  display_name         = "TF-204837"
  action               = "DNAT"
  destination_networks = ["100.79.236.38"]
  translated_networks  = ["100.87.130.224"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204838" {
  display_name         = "TF-204838"
  action               = "DNAT"
  destination_networks = ["100.79.236.39"]
  translated_networks  = ["100.87.130.225"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204839" {
  display_name         = "TF-204839"
  action               = "DNAT"
  destination_networks = ["100.79.236.40"]
  translated_networks  = ["100.87.98.161"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204840" {
  display_name         = "TF-204840"
  action               = "DNAT"
  destination_networks = ["100.79.236.41"]
  translated_networks  = ["100.87.130.99"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204841" {
  display_name         = "TF-204841"
  action               = "DNAT"
  destination_networks = ["100.79.236.42"]
  translated_networks  = ["100.87.130.97"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204842" {
  display_name         = "TF-204842"
  action               = "DNAT"
  destination_networks = ["100.79.236.43"]
  translated_networks  = ["100.87.130.98"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204843" {
  display_name         = "TF-204843"
  action               = "DNAT"
  destination_networks = ["100.79.236.44"]
  translated_networks  = ["100.112.9.106"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204844" {
  display_name         = "TF-204844"
  action               = "DNAT"
  destination_networks = ["100.79.236.45"]
  translated_networks  = ["100.112.9.107"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204845" {
  display_name         = "TF-204845"
  action               = "DNAT"
  destination_networks = ["100.79.236.46"]
  translated_networks  = ["100.112.9.4"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204846" {
  display_name         = "TF-204846"
  action               = "DNAT"
  destination_networks = ["100.79.236.47"]
  translated_networks  = ["100.112.9.5"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204847" {
  display_name         = "TF-204847"
  action               = "DNAT"
  destination_networks = ["100.79.236.48"]
  translated_networks  = ["100.112.9.111"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204848" {
  display_name         = "TF-204848"
  action               = "DNAT"
  destination_networks = ["100.79.236.49"]
  translated_networks  = ["100.112.9.112"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204849" {
  display_name         = "TF-204849"
  action               = "DNAT"
  destination_networks = ["100.79.236.50"]
  translated_networks  = ["100.66.50.30"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_204850" {
  display_name         = "TF-204850"
  action               = "DNAT"
  destination_networks = ["100.79.236.51"]
  translated_networks  = ["100.66.50.31"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213043" {
  display_name         = "TF-213043"
  action               = "DNAT"
  destination_networks = ["100.79.236.52"]
  translated_networks  = ["100.98.8.80"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213044" {
  display_name         = "TF-213044"
  action               = "DNAT"
  destination_networks = ["100.79.236.53"]
  translated_networks  = ["100.98.8.81"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213045" {
  display_name         = "TF-213045"
  action               = "DNAT"
  destination_networks = ["100.79.236.54"]
  translated_networks  = ["100.98.8.1"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213046" {
  display_name         = "TF-213046"
  action               = "DNAT"
  destination_networks = ["100.79.236.55"]
  translated_networks  = ["100.98.8.2"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213047" {
  display_name         = "TF-213047"
  action               = "DNAT"
  destination_networks = ["100.79.236.56"]
  translated_networks  = ["100.98.8.224"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213048" {
  display_name         = "TF-213048"
  action               = "DNAT"
  destination_networks = ["100.79.236.57"]
  translated_networks  = ["100.98.8.225"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213049" {
  display_name         = "TF-213049"
  action               = "DNAT"
  destination_networks = ["100.79.236.58"]
  translated_networks  = ["100.98.8.96"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213050" {
  display_name         = "TF-213050"
  action               = "DNAT"
  destination_networks = ["100.79.236.59"]
  translated_networks  = ["100.98.8.97"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213051" {
  display_name         = "TF-213051"
  action               = "DNAT"
  destination_networks = ["100.79.236.60"]
  translated_networks  = ["100.96.132.100"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213052" {
  display_name         = "TF-213052"
  action               = "DNAT"
  destination_networks = ["100.79.236.61"]
  translated_networks  = ["100.96.132.101"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213053" {
  display_name         = "TF-213053"
  action               = "DNAT"
  destination_networks = ["100.79.236.62"]
  translated_networks  = ["100.96.132.20"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213054" {
  display_name         = "TF-213054"
  action               = "DNAT"
  destination_networks = ["100.79.236.63"]
  translated_networks  = ["100.96.132.21"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213055" {
  display_name         = "TF-213055"
  action               = "DNAT"
  destination_networks = ["100.79.236.64"]
  translated_networks  = ["100.107.10.2"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213056" {
  display_name         = "TF-213056"
  action               = "DNAT"
  destination_networks = ["100.79.236.65"]
  translated_networks  = ["100.107.10.3"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213057" {
  display_name         = "TF-213057"
  action               = "DNAT"
  destination_networks = ["100.79.236.66"]
  translated_networks  = ["100.107.10.4"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213058" {
  display_name         = "TF-213058"
  action               = "DNAT"
  destination_networks = ["100.79.236.67"]
  translated_networks  = ["100.107.10.5"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213059" {
  display_name         = "TF-213059"
  action               = "DNAT"
  destination_networks = ["100.79.236.68"]
  translated_networks  = ["100.96.132.147"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_213060" {
  display_name         = "TF-213060"
  action               = "DNAT"
  destination_networks = ["100.79.236.69"]
  translated_networks  = ["100.96.132.148"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_221253" {
  display_name         = "TF-221253"
  action               = "DNAT"
  destination_networks = ["100.79.236.70"]
  translated_networks  = ["100.107.21.65"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_221254" {
  display_name         = "TF-221254"
  action               = "DNAT"
  destination_networks = ["100.79.236.71"]
  translated_networks  = ["100.107.21.66"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_221255" {
  display_name         = "TF-221255"
  action               = "DNAT"
  destination_networks = ["100.79.236.72"]
  translated_networks  = ["100.105.20.1"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_221256" {
  display_name         = "TF-221256"
  action               = "DNAT"
  destination_networks = ["100.79.236.73"]
  translated_networks  = ["100.105.20.2"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229449" {
  display_name         = "TF-229449"
  action               = "DNAT"
  destination_networks = ["100.79.236.74"]
  translated_networks  = ["100.107.16.65"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229450" {
  display_name         = "TF-229450"
  action               = "DNAT"
  destination_networks = ["100.79.236.75"]
  translated_networks  = ["100.107.16.66"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229451" {
  display_name         = "TF-229451"
  action               = "DNAT"
  destination_networks = ["158.87.57.4"]
  translated_networks  = ["100.79.240.12"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229452" {
  display_name         = "TF-229452"
  action               = "DNAT"
  destination_networks = ["100.79.236.76"]
  translated_networks  = ["100.105.20.137"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229453" {
  display_name         = "TF-229453"
  action               = "DNAT"
  destination_networks = ["100.79.236.77"]
  translated_networks  = ["100.105.20.138"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229454" {
  display_name         = "TF-229454"
  action               = "DNAT"
  destination_networks = ["100.79.236.78"]
  translated_networks  = ["100.105.20.133"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229455" {
  display_name         = "TF-229455"
  action               = "DNAT"
  destination_networks = ["100.79.236.79"]
  translated_networks  = ["100.105.20.134"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229456" {
  display_name         = "TF-229456"
  action               = "DNAT"
  destination_networks = ["100.79.236.80"]
  translated_networks  = ["100.107.10.6"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229457" {
  display_name        = "TF-229457"
  action              = "SNAT"
  source_networks     = ["100.107.10.6"]
  translated_networks = ["100.79.236.80"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229458" {
  display_name         = "TF-229458"
  action               = "DNAT"
  destination_networks = ["100.79.236.81"]
  translated_networks  = ["100.107.10.7"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229459" {
  display_name        = "TF-229459"
  action              = "SNAT"
  source_networks     = ["100.107.10.7"]
  translated_networks = ["100.79.236.81"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229460" {
  display_name         = "TF-229460"
  action               = "DNAT"
  destination_networks = ["100.79.236.82"]
  translated_networks  = ["100.105.20.60"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229461" {
  display_name        = "TF-229461"
  action              = "SNAT"
  source_networks     = ["100.105.20.60"]
  translated_networks = ["100.79.236.82"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229462" {
  display_name         = "TF-229462"
  action               = "DNAT"
  destination_networks = ["100.79.236.83"]
  translated_networks  = ["100.105.20.9"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229463" {
  display_name        = "TF-229463"
  action              = "SNAT"
  source_networks     = ["100.105.20.9"]
  translated_networks = ["100.79.236.83"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229464" {
  display_name         = "TF-229464"
  action               = "DNAT"
  destination_networks = ["100.79.236.84"]
  translated_networks  = ["100.107.4.1"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229465" {
  display_name        = "TF-229465"
  action              = "SNAT"
  source_networks     = ["100.107.4.1"]
  translated_networks = ["100.79.236.84"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229466" {
  display_name         = "TF-229466"
  action               = "DNAT"
  destination_networks = ["100.79.236.85"]
  translated_networks  = ["100.107.4.2"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229467" {
  display_name        = "TF-229467"
  action              = "SNAT"
  source_networks     = ["100.107.4.2"]
  translated_networks = ["100.79.236.85"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229468" {
  display_name        = "TF-229468"
  action              = "SNAT"
  source_networks     = ["100.79.240.16-100.79.240.17"]
  translated_networks = ["158.87.57.4"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229469" {
  display_name         = "TF-229469"
  action               = "DNAT"
  destination_networks = ["100.79.236.88"]
  translated_networks  = ["100.87.2.108"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229470" {
  display_name         = "TF-229470"
  action               = "DNAT"
  destination_networks = ["100.79.236.89"]
  translated_networks  = ["100.87.130.250"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229471" {
  display_name         = "TF-229471"
  action               = "DNAT"
  destination_networks = ["100.79.236.90"]
  translated_networks  = ["100.87.130.251"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229472" {
  display_name         = "TF-229472"
  action               = "DNAT"
  destination_networks = ["100.79.236.86"]
  translated_networks  = ["100.107.4.4"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229473" {
  display_name         = "TF-229473"
  action               = "DNAT"
  destination_networks = ["100.79.236.87"]
  translated_networks  = ["100.107.4.5"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229475" {
  display_name         = "TF-229475"
  action               = "DNAT"
  destination_networks = ["100.79.236.91"]
  translated_networks  = ["100.87.34.102"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229476" {
  display_name         = "TF-229476"
  action               = "DNAT"
  destination_networks = ["100.79.236.92"]
  translated_networks  = ["100.87.2.64"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229477" {
  display_name         = "TF-229477"
  action               = "DNAT"
  destination_networks = ["100.79.236.93"]
  translated_networks  = ["100.87.2.65"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229478" {
  display_name        = "TF-229478"
  action              = "SNAT"
  source_networks     = ["100.87.34.102"]
  translated_networks = ["100.79.236.91"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229479" {
  display_name        = "TF-229479"
  action              = "SNAT"
  source_networks     = ["100.87.2.64"]
  translated_networks = ["100.79.236.92"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229480" {
  display_name        = "TF-229480"
  action              = "SNAT"
  source_networks     = ["100.87.2.65"]
  translated_networks = ["100.79.236.93"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229481" {
  display_name         = "TF-229481"
  action               = "DNAT"
  destination_networks = ["158.87.57.254"]
  translated_networks  = ["100.72.31.242"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229482" {
  display_name         = "TF-229482"
  action               = "DNAT"
  destination_networks = ["100.79.236.94"]
  translated_networks  = ["100.87.98.126"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229483" {
  display_name         = "TF-229483"
  action               = "DNAT"
  destination_networks = ["100.79.236.95"]
  translated_networks  = ["100.87.98.127"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229484" {
  display_name        = "TF-229484"
  action              = "SNAT"
  source_networks     = ["100.87.98.126"]
  translated_networks = ["100.79.236.94"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229485" {
  display_name        = "TF-229485"
  action              = "SNAT"
  source_networks     = ["100.87.98.127"]
  translated_networks = ["100.79.236.95"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229486" {
  display_name         = "TF-229486"
  action               = "DNAT"
  destination_networks = ["100.79.236.96"]
  translated_networks  = ["100.87.34.112"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229487" {
  display_name         = "TF-229487"
  action               = "DNAT"
  destination_networks = ["100.79.236.97"]
  translated_networks  = ["100.87.34.113"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229488" {
  display_name         = "TF-229488"
  action               = "DNAT"
  destination_networks = ["100.79.236.98"]
  translated_networks  = ["100.87.34.120"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229489" {
  display_name         = "TF-229489"
  action               = "DNAT"
  destination_networks = ["100.79.236.99"]
  translated_networks  = ["100.87.34.121"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229494" {
  display_name         = "TF-229494"
  action               = "DNAT"
  destination_networks = ["100.79.236.100"]
  translated_networks  = ["100.87.34.75"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229495" {
  display_name         = "TF-229495"
  action               = "DNAT"
  destination_networks = ["100.79.236.101"]
  translated_networks  = ["100.87.34.77"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229496" {
  display_name         = "TF-229496"
  action               = "DNAT"
  destination_networks = ["100.79.236.102"]
  translated_networks  = ["100.87.98.66"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229490" {
  display_name        = "TF-229490"
  action              = "SNAT"
  source_networks     = ["100.87.34.112"]
  translated_networks = ["100.79.236.96"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229491" {
  display_name        = "TF-229491"
  action              = "SNAT"
  source_networks     = ["100.87.34.113"]
  translated_networks = ["100.79.236.97"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229492" {
  display_name        = "TF-229492"
  action              = "SNAT"
  source_networks     = ["100.87.34.120"]
  translated_networks = ["100.79.236.98"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229493" {
  display_name        = "TF-229493"
  action              = "SNAT"
  source_networks     = ["100.87.34.121"]
  translated_networks = ["100.79.236.99"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229497" {
  display_name        = "TF-229497"
  action              = "SNAT"
  source_networks     = ["100.87.98.75"]
  translated_networks = ["100.79.236.100"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229498" {
  display_name        = "TF-229498"
  action              = "SNAT"
  source_networks     = ["100.87.34.77"]
  translated_networks = ["100.79.236.101"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229499" {
  display_name        = "TF-229499"
  action              = "SNAT"
  source_networks     = ["100.87.98.66"]
  translated_networks = ["100.79.236.102"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229500" {
  display_name         = "TF-229500"
  action               = "DNAT"
  destination_networks = ["100.79.236.103"]
  translated_networks  = ["100.98.244.46"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229501" {
  display_name         = "TF-229501"
  action               = "DNAT"
  destination_networks = ["100.79.236.104"]
  translated_networks  = ["100.98.244.97"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229502" {
  display_name         = "TF-229502"
  action               = "DNAT"
  destination_networks = ["100.79.236.105"]
  translated_networks  = ["100.98.242.42"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229503" {
  display_name         = "TF-229503"
  action               = "DNAT"
  destination_networks = ["100.79.236.106"]
  translated_networks  = ["100.87.162.18"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229504" {
  display_name         = "TF-229504"
  action               = "DNAT"
  destination_networks = ["100.79.236.107"]
  translated_networks  = ["100.87.162.19"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229505" {
  display_name         = "TF-229505"
  action               = "DNAT"
  destination_networks = ["100.79.236.108"]
  translated_networks  = ["100.87.162.20"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229506" {
  display_name         = "TF-229506"
  action               = "DNAT"
  destination_networks = ["100.79.236.109"]
  translated_networks  = ["100.87.2.180"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229507" {
  display_name         = "TF-229507"
  action               = "DNAT"
  destination_networks = ["100.79.236.110"]
  translated_networks  = ["100.87.2.181"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229508" {
  display_name         = "TF-229508"
  action               = "DNAT"
  destination_networks = ["100.79.236.111"]
  translated_networks  = ["100.87.2.182"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229509" {
  display_name         = "TF-229509"
  action               = "DNAT"
  destination_networks = ["100.79.236.112"]
  translated_networks  = ["100.87.2.183"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229510" {
  display_name         = "TF-229510"
  action               = "DNAT"
  destination_networks = ["100.79.236.113"]
  translated_networks  = ["100.87.34.140"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229511" {
  display_name         = "TF-229511"
  action               = "DNAT"
  destination_networks = ["100.79.236.114"]
  translated_networks  = ["100.87.34.141"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229512" {
  display_name         = "TF-229512"
  action               = "DNAT"
  destination_networks = ["100.79.236.115"]
  translated_networks  = ["100.87.34.142"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229513" {
  display_name         = "TF-229513"
  action               = "DNAT"
  destination_networks = ["100.79.236.116"]
  translated_networks  = ["100.87.34.143"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229514" {
  display_name         = "TF-229514"
  action               = "DNAT"
  destination_networks = ["100.79.236.117"]
  translated_networks  = ["100.87.34.164"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229515" {
  display_name         = "TF-229515"
  action               = "DNAT"
  destination_networks = ["100.79.236.118"]
  translated_networks  = ["100.87.34.165"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229520" {
  display_name         = "TF-229520"
  action               = "DNAT"
  destination_networks = ["100.79.236.125"]
  translated_networks  = ["100.87.2.221"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229521" {
  display_name         = "TF-229521"
  action               = "DNAT"
  destination_networks = ["100.79.236.126"]
  translated_networks  = ["100.87.162.60"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229522" {
  display_name         = "TF-229522"
  action               = "DNAT"
  destination_networks = ["100.79.236.127"]
  translated_networks  = ["100.87.162.61"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229523" {
  display_name         = "TF-229523"
  action               = "DNAT"
  destination_networks = ["100.79.236.128"]
  translated_networks  = ["100.87.162.62"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229516" {
  display_name        = "TF-229516"
  action              = "SNAT"
  source_networks     = ["100.87.2.221"]
  translated_networks = ["100.79.236.125"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229517" {
  display_name        = "TF-229517"
  action              = "SNAT"
  source_networks     = ["100.87.162.60"]
  translated_networks = ["100.79.236.126"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229518" {
  display_name        = "TF-229518"
  action              = "SNAT"
  source_networks     = ["100.87.162.61"]
  translated_networks = ["100.79.236.127"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229519" {
  display_name        = "TF-229519"
  action              = "SNAT"
  source_networks     = ["100.87.162.62"]
  translated_networks = ["100.79.236.128"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229524" {
  display_name         = "TF-229524"
  action               = "DNAT"
  destination_networks = ["100.79.236.130"]
  translated_networks  = ["100.87.34.190"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229525" {
  display_name         = "TF-229525"
  action               = "DNAT"
  destination_networks = ["100.79.236.129"]
  translated_networks  = ["100.87.34.189"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229526" {
  display_name        = "TF-229526"
  action              = "SNAT"
  source_networks     = ["100.87.34.190"]
  translated_networks = ["100.79.236.130"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229527" {
  display_name        = "TF-229527"
  action              = "SNAT"
  source_networks     = ["100.87.34.189"]
  translated_networks = ["100.79.236.129"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229528" {
  display_name         = "TF-229528"
  action               = "DNAT"
  destination_networks = ["158.87.57.5"]
  translated_networks  = ["100.79.240.18"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229530" {
  display_name         = "TF-229530"
  action               = "DNAT"
  destination_networks = ["100.79.236.131"]
  translated_networks  = ["100.87.98.213"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229531" {
  display_name        = "TF-229531"
  action              = "SNAT"
  source_networks     = ["100.87.98.213"]
  translated_networks = ["100.79.236.131"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229532" {
  display_name         = "TF-229532"
  action               = "DNAT"
  destination_networks = ["100.79.236.119"]
  translated_networks  = ["100.96.127.39"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229533" {
  display_name         = "TF-229533"
  action               = "DNAT"
  destination_networks = ["100.79.236.120"]
  translated_networks  = ["100.96.170.27"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229534" {
  display_name         = "TF-229534"
  action               = "DNAT"
  destination_networks = ["100.79.236.121"]
  translated_networks  = ["100.96.170.28"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229535" {
  display_name         = "TF-229535"
  action               = "DNAT"
  destination_networks = ["100.79.236.122"]
  translated_networks  = ["100.100.127.39"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229536" {
  display_name         = "TF-229536"
  action               = "DNAT"
  destination_networks = ["100.79.236.123"]
  translated_networks  = ["100.100.127.27"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229537" {
  display_name         = "TF-229537"
  action               = "DNAT"
  destination_networks = ["100.79.236.124"]
  translated_networks  = ["100.100.127.28"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_229538" {
  display_name         = "TF-229538"
  action               = "DNAT"
  destination_networks = ["100.79.236.132"]
  translated_networks  = ["100.87.98.195"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_229539" {
  display_name        = "TF-229539"
  action              = "SNAT"
  source_networks     = ["100.87.98.195"]
  translated_networks = ["100.79.236.132"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_237732" {
  display_name         = "TF-237732"
  action               = "DNAT"
  destination_networks = ["100.79.236.133"]
  translated_networks  = ["100.87.130.226"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237733" {
  display_name        = "TF-237733"
  action              = "SNAT"
  source_networks     = ["100.87.130.224"]
  translated_networks = ["100.79.236.38"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237734" {
  display_name        = "TF-237734"
  action              = "SNAT"
  source_networks     = ["100.87.130.225"]
  translated_networks = ["100.79.236.39"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237735" {
  display_name        = "TF-237735"
  action              = "SNAT"
  source_networks     = ["100.87.130.226"]
  translated_networks = ["100.79.236.133"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_237736" {
  display_name         = "TF-237736"
  action               = "DNAT"
  destination_networks = ["100.79.236.134"]
  translated_networks  = ["100.87.130.192"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_237737" {
  display_name         = "TF-237737"
  action               = "DNAT"
  destination_networks = ["100.79.236.135"]
  translated_networks  = ["100.87.130.193"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_237738" {
  display_name         = "TF-237738"
  action               = "DNAT"
  destination_networks = ["100.79.236.136"]
  translated_networks  = ["100.87.130.194"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_237739" {
  display_name         = "TF-237739"
  action               = "DNAT"
  destination_networks = ["100.79.236.137"]
  translated_networks  = ["100.87.130.195"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_237740" {
  display_name         = "TF-237740"
  action               = "DNAT"
  destination_networks = ["100.79.236.138"]
  translated_networks  = ["100.87.130.196"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_237741" {
  display_name         = "TF-237741"
  action               = "DNAT"
  destination_networks = ["100.79.236.139"]
  translated_networks  = ["100.87.130.197"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_237742" {
  display_name         = "TF-237742"
  action               = "DNAT"
  destination_networks = ["100.79.236.140"]
  translated_networks  = ["100.87.130.198"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_237743" {
  display_name         = "TF-237743"
  action               = "DNAT"
  destination_networks = ["100.79.236.141"]
  translated_networks  = ["100.87.130.199"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237744" {
  display_name        = "TF-237744"
  action              = "SNAT"
  source_networks     = ["100.87.130.192"]
  translated_networks = ["100.79.236.134"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237745" {
  display_name        = "TF-237745"
  action              = "SNAT"
  source_networks     = ["100.87.130.193"]
  translated_networks = ["100.79.236.135"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237746" {
  display_name        = "TF-237746"
  action              = "SNAT"
  source_networks     = ["100.87.130.194"]
  translated_networks = ["100.79.236.136"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237747" {
  display_name        = "TF-237747"
  action              = "SNAT"
  source_networks     = ["100.87.130.195"]
  translated_networks = ["100.79.236.137"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237748" {
  display_name        = "TF-237748"
  action              = "SNAT"
  source_networks     = ["100.87.130.196"]
  translated_networks = ["100.79.236.138"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237749" {
  display_name        = "TF-237749"
  action              = "SNAT"
  source_networks     = ["100.87.130.197"]
  translated_networks = ["100.79.236.139"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237751" {
  display_name        = "TF-237751"
  action              = "SNAT"
  source_networks     = ["100.87.130.198"]
  translated_networks = ["100.79.236.140"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_237750" {
  display_name        = "TF-237750"
  action              = "SNAT"
  source_networks     = ["100.87.130.199"]
  translated_networks = ["100.79.236.141"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_245944" {
  display_name         = "TF-245944"
  action               = "DNAT"
  destination_networks = ["100.79.236.142"]
  translated_networks  = ["100.87.130.164"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_245945" {
  display_name         = "TF-245945"
  action               = "DNAT"
  destination_networks = ["100.79.236.143"]
  translated_networks  = ["100.87.130.165"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_245946" {
  display_name         = "TF-245946"
  action               = "DNAT"
  destination_networks = ["100.79.236.144"]
  translated_networks  = ["100.87.130.166"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_245947" {
  display_name         = "TF-245947"
  action               = "DNAT"
  destination_networks = ["100.79.236.145"]
  translated_networks  = ["100.87.130.167"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_245948" {
  display_name         = "TF-245948"
  action               = "DNAT"
  destination_networks = ["100.79.236.146"]
  translated_networks  = ["100.87.98.240"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_245949" {
  display_name         = "TF-245949"
  action               = "DNAT"
  destination_networks = ["100.79.236.147"]
  translated_networks  = ["100.87.98.241"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_245950" {
  display_name         = "TF-245950"
  action               = "DNAT"
  destination_networks = ["100.79.236.148"]
  translated_networks  = ["100.87.98.242"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_245951" {
  display_name         = "TF-245951"
  action               = "DNAT"
  destination_networks = ["100.79.236.149"]
  translated_networks  = ["100.87.98.243"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_245952" {
  display_name        = "TF-245952"
  action              = "SNAT"
  source_networks     = ["100.87.130.164"]
  translated_networks = ["100.79.236.142"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_245953" {
  display_name        = "TF-245953"
  action              = "SNAT"
  source_networks     = ["100.87.130.165"]
  translated_networks = ["100.79.236.143"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_245954" {
  display_name        = "TF-245954"
  action              = "SNAT"
  source_networks     = ["100.87.130.166"]
  translated_networks = ["100.79.236.144"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_245955" {
  display_name        = "TF-245955"
  action              = "SNAT"
  source_networks     = ["100.87.130.167"]
  translated_networks = ["100.79.236.145"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_245956" {
  display_name        = "TF-245956"
  action              = "SNAT"
  source_networks     = ["100.87.98.240"]
  translated_networks = ["100.79.236.146"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_245957" {
  display_name        = "TF-245957"
  action              = "SNAT"
  source_networks     = ["100.87.98.241"]
  translated_networks = ["100.79.236.147"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_245958" {
  display_name        = "TF-245958"
  action              = "SNAT"
  source_networks     = ["100.87.98.242"]
  translated_networks = ["100.79.236.148"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_245959" {
  display_name        = "TF-245959"
  action              = "SNAT"
  source_networks     = ["100.87.98.243"]
  translated_networks = ["100.79.236.149"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_254152" {
  display_name         = "TF-254152"
  action               = "DNAT"
  destination_networks = ["100.79.236.150"]
  translated_networks  = ["100.87.98.224"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_254154" {
  display_name         = "TF-254154"
  action               = "DNAT"
  destination_networks = ["100.79.236.119"]
  translated_networks  = ["100.96.170.26"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_254153" {
  display_name        = "TF-254153"
  action              = "SNAT"
  source_networks     = ["100.87.98.224"]
  translated_networks = ["100.79.236.150"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196622" {
  display_name        = "TF-196622"
  action              = "SNAT"
  source_networks     = ["100.87.97.28"]
  translated_networks = ["100.79.236.151"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196623" {
  display_name        = "TF-196623"
  action              = "SNAT"
  source_networks     = ["100.87.97.29"]
  translated_networks = ["100.79.236.152"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196624" {
  display_name        = "TF-196624"
  action              = "SNAT"
  source_networks     = ["100.87.34.204"]
  translated_networks = ["100.79.236.153"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196625" {
  display_name        = "TF-196625"
  action              = "SNAT"
  source_networks     = ["100.87.34.205"]
  translated_networks = ["100.79.236.154"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196626" {
  display_name         = "TF-196626"
  action               = "DNAT"
  destination_networks = ["100.79.236.151"]
  translated_networks  = ["100.87.97.28"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196627" {
  display_name         = "TF-196627"
  action               = "DNAT"
  destination_networks = ["100.79.236.152"]
  translated_networks  = ["100.87.97.29"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196628" {
  display_name         = "TF-196628"
  action               = "DNAT"
  destination_networks = ["100.79.236.153"]
  translated_networks  = ["100.87.34.204"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196629" {
  display_name         = "TF-196629"
  action               = "DNAT"
  destination_networks = ["100.79.236.154"]
  translated_networks  = ["100.87.34.205"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196633" {
  display_name         = "TF-196633"
  action               = "DNAT"
  destination_networks = ["100.79.236.155"]
  translated_networks  = ["100.87.129.64"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196634" {
  display_name         = "TF-196634"
  action               = "DNAT"
  destination_networks = ["100.79.236.156"]
  translated_networks  = ["100.87.129.65"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196635" {
  display_name         = "TF-196635"
  action               = "DNAT"
  destination_networks = ["100.79.236.157"]
  translated_networks  = ["100.87.129.66"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196636" {
  display_name         = "TF-196636"
  action               = "DNAT"
  destination_networks = ["100.79.236.158"]
  translated_networks  = ["100.87.129.67"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196637" {
  display_name         = "TF-196637"
  action               = "DNAT"
  destination_networks = ["100.79.236.159"]
  translated_networks  = ["100.87.129.68"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196638" {
  display_name         = "TF-196638"
  action               = "DNAT"
  destination_networks = ["100.79.236.160"]
  translated_networks  = ["100.87.129.69"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196639" {
  display_name        = "TF-196639"
  action              = "SNAT"
  source_networks     = ["100.87.129.64"]
  translated_networks = ["100.79.236.155"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196640" {
  display_name        = "TF-196640"
  action              = "SNAT"
  source_networks     = ["100.87.129.65"]
  translated_networks = ["100.79.236.156"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196641" {
  display_name        = "TF-196641"
  action              = "SNAT"
  source_networks     = ["100.87.129.66"]
  translated_networks = ["100.79.236.157"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196642" {
  display_name        = "TF-196642"
  action              = "SNAT"
  source_networks     = ["100.87.129.67"]
  translated_networks = ["100.79.236.158"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196643" {
  display_name        = "TF-196643"
  action              = "SNAT"
  source_networks     = ["100.87.129.68"]
  translated_networks = ["100.79.236.159"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196644" {
  display_name        = "TF-196644"
  action              = "SNAT"
  source_networks     = ["100.87.129.69"]
  translated_networks = ["100.79.236.160"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196645" {
  display_name         = "TF-196645"
  action               = "DNAT"
  destination_networks = ["100.79.236.161"]
  translated_networks  = ["100.87.2.240"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196646" {
  display_name         = "TF-196646"
  action               = "DNAT"
  destination_networks = ["100.79.236.162"]
  translated_networks  = ["100.87.2.241"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196647" {
  display_name        = "TF-196647"
  action              = "SNAT"
  source_networks     = ["100.87.2.240"]
  translated_networks = ["100.79.236.161"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196648" {
  display_name        = "TF-196648"
  action              = "SNAT"
  source_networks     = ["100.87.2.241"]
  translated_networks = ["100.79.236.162"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196609" {
  display_name        = "TF-196609"
  action              = "SNAT"
  source_networks     = ["100.87.98.18"]
  translated_networks = ["100.79.236.27"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196610" {
  display_name        = "TF-196610"
  action              = "SNAT"
  source_networks     = ["100.87.98.19"]
  translated_networks = ["100.79.236.28"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196611" {
  display_name        = "TF-196611"
  action              = "SNAT"
  source_networks     = ["100.87.130.52"]
  translated_networks = ["100.79.236.163"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196649" {
  display_name        = "TF-196649"
  action              = "SNAT"
  source_networks     = ["100.87.130.53"]
  translated_networks = ["100.79.236.164"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196650" {
  display_name        = "TF-196650"
  action              = "SNAT"
  source_networks     = ["100.87.130.54"]
  translated_networks = ["100.79.236.165"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196651" {
  display_name        = "TF-196651"
  action              = "SNAT"
  source_networks     = ["100.87.130.55"]
  translated_networks = ["100.79.236.166"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196652" {
  display_name         = "TF-196652"
  action               = "DNAT"
  destination_networks = ["100.79.236.163"]
  translated_networks  = ["100.87.130.52"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196653" {
  display_name         = "TF-196653"
  action               = "DNAT"
  destination_networks = ["100.79.236.164"]
  translated_networks  = ["100.87.130.53"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196654" {
  display_name         = "TF-196654"
  action               = "DNAT"
  destination_networks = ["100.79.236.165"]
  translated_networks  = ["100.87.130.54"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196655" {
  display_name         = "TF-196655"
  action               = "DNAT"
  destination_networks = ["100.79.236.166"]
  translated_networks  = ["100.87.130.55"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196656" {
  display_name        = "TF-196656"
  action              = "SNAT"
  source_networks     = ["100.87.34.57"]
  translated_networks = ["100.79.236.167"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "snat_196657" {
  display_name        = "TF-196657"
  action              = "SNAT"
  source_networks     = ["100.87.162.73"]
  translated_networks = ["100.79.236.168"]
  gateway_path        = data.nsxt_policy_tier0_gateway.select.path
  logging             = true
  firewall_match      = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196658" {
  display_name         = "TF-196658"
  action               = "DNAT"
  destination_networks = ["100.79.236.167"]
  translated_networks  = ["100.87.34.57"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196659" {
  display_name         = "TF-196659"
  action               = "DNAT"
  destination_networks = ["100.79.236.168"]
  translated_networks  = ["100.87.162.73"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
resource "nsxt_policy_nat_rule" "dnat_196660" {
  display_name         = "TF-196660"
  action               = "DNAT"
  destination_networks = ["158.87.57.21"]
  translated_networks  = ["100.79.240.21"]
  gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"
  scope = ["/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/f081009c-bf2e-49e9-9e28-1fc62c1878f9",
  "/infra/tier-0s/6af41f7e-144f-41aa-afda-0f4ff6dfa634/locale-services/default/interfaces/76bacfb2-672f-4a19-b425-3145ecdcf931"]
}
