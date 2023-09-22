
data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

locals {
  change   = "CHGEU0212520/CTASKEU0413064"
  dres     = "302"
  internal_subnet = "100.64.210"
  external_subnet = "158.87.104"
  cprem_subnet1    = "135.41.0.0/16"
  cprem_subnet2    = "155.241.0.0/16"
  cprem_subnet3    = "135.31.0.0/16"
  cprem_subnet4    = "132.201.0.0/16"
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
  display_name         = "${var.customer}-DNAT-01"
  action               = "DNAT"
  description          = local.change
  destination_networks = [local.proxy-_vip_external_ip]
  translated_networks  = [local.proxy-_vip_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#SNAT
#Proxy1 cprem_subnet1
resource "nsxt_policy_nat_rule" "snat01" {
  display_name         = "${var.customer}-SNAT-01"
  action               = "SNAT"
  description          = local.change
  source_networks      = [local.lpcacpr1_internal_ip]
  translated_networks  = [local.lpcacpr1_external_ip]
  destination_networks = [local.cprem_subnet1]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#Proxy2 cprem_subnet1
resource "nsxt_policy_nat_rule" "snat02" {
  display_name         = "${var.customer}-SNAT-02"
  action               = "SNAT"
  description          = local.change
  source_networks      = [local.lpcacpr2_internal_ip]
  translated_networks  = [local.lpcacpr2_external_ip]
  destination_networks = [local.cprem_subnet1]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#Proxy1 cprem_subnet2
resource "nsxt_policy_nat_rule" "snat03" {
  display_name         = "${var.customer}-SNAT-03"
  action               = "SNAT"
  description          = local.change
  source_networks      = [local.lpcacpr1_internal_ip]
  translated_networks  = [local.lpcacpr1_external_ip]
  destination_networks = [local.cprem_subnet2]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#Proxy2 cprem_subnet2
resource "nsxt_policy_nat_rule" "snat04" {
  display_name         = "${var.customer}-SNAT-04"
  action               = "SNAT"
  description          = local.change
  source_networks      = [local.lpcacpr2_internal_ip]
  translated_networks  = [local.lpcacpr2_external_ip]
  destination_networks = [local.cprem_subnet2]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#Proxy1 cprem_subnet3
resource "nsxt_policy_nat_rule" "snat05" {
  display_name         = "${var.customer}-SNAT-05"
  action               = "SNAT"
  description          = local.change
  source_networks      = [local.lpcacpr1_internal_ip]
  translated_networks  = [local.lpcacpr1_external_ip]
  destination_networks = [local.cprem_subnet3]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#Proxy2 cprem_subnet3
resource "nsxt_policy_nat_rule" "snat06" {
  display_name         = "${var.customer}-SNAT-06"
  action               = "SNAT"
  description          = local.change
  source_networks      = [local.lpcacpr2_internal_ip]
  translated_networks  = [local.lpcacpr2_external_ip]
  destination_networks = [local.cprem_subnet3]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#Proxy1 cprem_subnet4
resource "nsxt_policy_nat_rule" "snat07" {
  display_name         = "${var.customer}-SNAT-07"
  action               = "SNAT"
  description          = local.change
  source_networks      = [local.lpcacpr1_internal_ip]
  translated_networks  = [local.lpcacpr1_external_ip]
  destination_networks = [local.cprem_subnet4]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#Proxy2 cprem_subnet4
resource "nsxt_policy_nat_rule" "snat08" {
  display_name         = "${var.customer}-SNAT-08"
  action               = "SNAT"
  description          = local.change
  source_networks      = [local.lpcacpr2_internal_ip]
  translated_networks  = [local.lpcacpr2_external_ip]
  destination_networks = [local.cprem_subnet4]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

