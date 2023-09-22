
data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

locals {
  change   = "RITM0145058"
  dres     = "329"
  internal_subnet = "100.64.214"
  external_subnet = "158.87.104"
  cprem_subnet    = "10.25.50.0/24"
  proxy-_vip_internal_ip  = "${local.internal_subnet}.50"
  lpcacpr1_internal_ip    = "${local.internal_subnet}.51"
  lpcacpr2_internal_ip    = "${local.internal_subnet}.52"
  proxy-_vip_external_ip  = "${local.external_subnet}.50"
  lpcacpr1_external_ip    = "${local.external_subnet}.51"
  lpcacpr2_external_ip    = "${local.external_subnet}.52"
}

#DNAT
#Vip DNAT
resource "nsxt_policy_nat_rule" "dnat01" {
#  for_each = local.dc1_external_ip == null ? [] : [1]
  display_name         = "${var.customer}-DNAT-01"
  action               = "DNAT"
  description          = local.change
  destination_networks = [local.proxy-_vip_external_ip]
  translated_networks  = [local.proxy-_vip_internal_ip]
#  source_networks      = [local.cprem_subnet]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#SNAT
#Proxy1
resource "nsxt_policy_nat_rule" "snat01" {
  display_name         = "${var.customer}-SNAT-01"
  action               = "SNAT"
  description          = local.change
  source_networks      = [local.lpcacpr1_internal_ip]
  translated_networks  = [local.lpcacpr1_external_ip]
  destination_networks = [local.cprem_subnet]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
#Proxy2
resource "nsxt_policy_nat_rule" "snat02" {
  display_name         = "${var.customer}-SNAT-02"
  action               = "SNAT"
  description          = local.change
  source_networks      = [local.lpcacpr2_internal_ip]
  translated_networks  = [local.lpcacpr2_external_ip]
  destination_networks = [local.cprem_subnet]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
