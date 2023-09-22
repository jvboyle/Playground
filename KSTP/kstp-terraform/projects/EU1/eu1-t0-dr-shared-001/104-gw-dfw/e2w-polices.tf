locals {
  ires_sg     = "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Portable"
  sres_sg     = "/infra/domains/default/groups/TF-EU1-IPSET-NET-All-GSNI-routable"
  pdr_sg      = "/infra/domains/default/groups/TF-EU1-IPSET-NET-AMS-PDR-subnets"
  dres_sg_all = "/infra/domains/default/groups/TF-EU1-IPSET-NET-AMS-CGN-subnets"
}

resource "nsxt_policy_gateway_policy" "kstp_internal_e2w" {
  display_name    = "TF_EU1_internal-e2w"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 4
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "TF_EU1_shared_to_dres_cidr"
    destination_groups = ["${local.dres_sg_all}"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["${local.ires_sg}", "${local.sres_sg}", "${local.pdr_sg}"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "TF_EU1_dres_cidr_to_shared"
    destination_groups = ["${local.ires_sg}", "${local.sres_sg}", "${local.pdr_sg}"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["${local.dres_sg_all}"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}
