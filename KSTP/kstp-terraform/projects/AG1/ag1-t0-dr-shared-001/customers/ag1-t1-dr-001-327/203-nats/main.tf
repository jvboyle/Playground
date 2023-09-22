
data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

locals {
  change   = "CHGEU0200098-RITM0145085"
  dres     = "327"
  internal_subnet = "100.64.212"
  dc1_internal_ip   = "${local.internal_subnet}.3"
  dc2_internal_ip   = "${local.internal_subnet}.4"
  arx_internal_ip   = "${local.internal_subnet}.5"
  stw_internal_ip   = "${local.internal_subnet}.6"
  stl_internal_ip   = "${local.internal_subnet}.7"
  fm_internal_ip    = "${local.internal_subnet}.8"
  skl_internal_ip   = "${local.internal_subnet}.9"
  ocum_internal_ip  = "${local.internal_subnet}.10"
  dc1_external_ip   = "158.87.104.3"
  dc2_external_ip   = "158.87.104.4"
  arx_external_ip   = "158.87.104.5"
  stw_external_ip   = "158.87.104.6"
  stl_external_ip   = "158.87.104.7"
  fm_external_ip    = "158.87.104.8"
  skl_external_ip   = "158.87.104.9"
  ocum_external_ip  = "158.87.104.10"
}

#Domain Controllers DNAT
#dc1 DNAT
resource "nsxt_policy_nat_rule" "dnat01" {
#  for_each = local.dc1_external_ip == null ? [] : [1]
  display_name         = "${var.customer}-DNAT-01"
  action               = "DNAT"
  description          = local.change
  destination_networks = [local.dc1_external_ip]
  translated_networks  = [local.dc1_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
#dc2 DNAT
resource "nsxt_policy_nat_rule" "dnat02" {
  display_name         = "${var.customer}-DNAT-02"
  action               = "DNAT"
  description          = local.change
  destination_networks = [local.dc2_external_ip]
  translated_networks  = [local.dc2_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#arx DNAT
resource "nsxt_policy_nat_rule" "dnat03" {
  display_name         = "${var.customer}-DNAT-03"
  action               = "DNAT"
  description          = local.change
  destination_networks = [local.arx_external_ip]
  translated_networks  = [local.arx_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#stw DNAT
resource "nsxt_policy_nat_rule" "dnat04" {
  display_name         = "${var.customer}-DNAT-04"
  action               = "DNAT"
  description          = local.change
  destination_networks = [local.stw_external_ip]
  translated_networks  = [local.stw_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#stl DNAT
resource "nsxt_policy_nat_rule" "dnat05" {
  display_name         = "${var.customer}-DNAT-05"
  action               = "DNAT"
  description          = local.change
  destination_networks = [local.stl_external_ip]
  translated_networks  = [local.stl_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#fm DNAT
resource "nsxt_policy_nat_rule" "dnat06" {
  display_name         = "${var.customer}-DNAT-06"
  action               = "DNAT"
  description          = local.change
  destination_networks = [local.fm_external_ip]
  translated_networks  = [local.fm_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#skl DNAT
resource "nsxt_policy_nat_rule" "dnat07" {
  display_name         = "${var.customer}-DNAT-07"
  action               = "DNAT"
  description          = local.change
  destination_networks = [local.skl_external_ip]
  translated_networks  = [local.skl_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#ocum DNAT
resource "nsxt_policy_nat_rule" "dnat08" {
  display_name         = "${var.customer}-DNAT-08"
  action               = "DNAT"
  description          = local.change
  destination_networks = [local.ocum_external_ip]
  translated_networks  = [local.ocum_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}


#Domain Controllers SNAT
#dc1 SNAT
resource "nsxt_policy_nat_rule" "snat01" {
#  for_each = local.dc1_external_ip == null ? [] : [1]
  display_name         = "${var.customer}-SNAT-01"
  action               = "SNAT"
  description          = local.change
  translated_networks = [local.dc1_external_ip]
  source_networks  = [local.dc1_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
#dc2 SNAT
resource "nsxt_policy_nat_rule" "snat02" {
  display_name         = "${var.customer}-SNAT-02"
  action               = "SNAT"
  description          = local.change
  translated_networks = [local.dc2_external_ip]
  source_networks  = [local.dc2_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#arx SNAT
resource "nsxt_policy_nat_rule" "snat03" {
  display_name         = "${var.customer}-SNAT-03"
  action               = "SNAT"
  description          = local.change
  translated_networks = [local.arx_external_ip]
  source_networks  = [local.arx_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#stw SNAT
resource "nsxt_policy_nat_rule" "snat04" {
  display_name         = "${var.customer}-SNAT-04"
  action               = "SNAT"
  description          = local.change
  translated_networks = [local.stw_external_ip]
  source_networks  = [local.stw_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#stl SNAT
resource "nsxt_policy_nat_rule" "snat05" {
  display_name         = "${var.customer}-SNAT-05"
  action               = "SNAT"
  description          = local.change
  translated_networks = [local.stl_external_ip]
  source_networks  = [local.stl_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#fm SNAT
resource "nsxt_policy_nat_rule" "snat06" {
  display_name         = "${var.customer}-SNAT-06"
  action               = "SNAT"
  description          = local.change
  translated_networks = [local.fm_external_ip]
  source_networks  = [local.fm_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#skl SNAT
resource "nsxt_policy_nat_rule" "snat07" {
  display_name         = "${var.customer}-SNAT-07"
  action               = "SNAT"
  description          = local.change
  translated_networks = [local.skl_external_ip]
  source_networks  = [local.skl_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#ocum SNAT
resource "nsxt_policy_nat_rule" "snat08" {
  display_name         = "${var.customer}-SNAT-08"
  action               = "SNAT"
  description          = local.change
  translated_networks = [local.ocum_external_ip]
  source_networks  = [local.ocum_internal_ip]
  gateway_path         = data.nsxt_policy_tier1_gateway.select.path
  logging              = true
  firewall_match       = "MATCH_INTERNAL_ADDRESS"

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
