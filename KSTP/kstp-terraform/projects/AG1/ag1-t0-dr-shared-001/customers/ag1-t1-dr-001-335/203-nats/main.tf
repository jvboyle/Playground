
data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

locals {
  change   = "RITM0151221"
  dres     = "334"
  internal_subnet = "100.64.216"
  external_subnet = "158.87.104"
  proxyvip_internal_ip   = "${local.internal_subnet}.50"
  proxy1_internal_ip   = "${local.internal_subnet}.51"
  proxy2_internal_ip   = "${local.internal_subnet}.52"
  proxyvip_external_ip   = "${local.external_subnet}.50"
  proxy1_external_ip   = "${local.external_subnet}.51"
  proxy2_external_ip   = "${local.external_subnet}.52"
}

#DNAT
#Proxy1 DNAT
resource "nsxt_policy_nat_rule" "dnat01" {
#  for_each = local.dc1_external_ip == null ? [] : [1]
  display_name         = "${var.customer}-DNAT-01"
  action               = "DNAT"
  description          = local.change
  source_networks      = ["216.96.68.0/22"]
  destination_networks = [local.proxy1_external_ip]
  translated_networks  = [local.proxy1_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
#Proxy2 DNAT
resource "nsxt_policy_nat_rule" "dnat02" {
#  for_each = local.dc1_external_ip == null ? [] : [1]
  display_name         = "${var.customer}-DNAT-02"
  action               = "DNAT"
  description          = local.change
  source_networks      = ["216.96.68.0/22"]
  destination_networks = [local.proxy2_external_ip]
  translated_networks  = [local.proxy2_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}


#SNAT
#Proxy SNAT
resource "nsxt_policy_nat_rule" "snat01" {
#  for_each = local.dc1_external_ip == null ? [] : [1]
  display_name         = "${var.customer}-SNAT-01"
  action               = "SNAT"
  description          = local.change
  source_networks  = [local.proxyvip_internal_ip]
  translated_networks = [local.proxyvip_external_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
