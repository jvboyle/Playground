data "nsxt_policy_tier1_gateway" "select" {
  display_name = var.customer
}

locals {
  ires_sg     = "/infra/domains/default/groups/93c4ae85-617f-4996-bd7c-0356e598833d"
  sres_sg     = "/infra/domains/default/groups/30ab3f2f-31d2-46fd-b368-ce4f1d99d0ea"
  pdr_sg      = "/infra/domains/default/groups/cf49e828-aeb5-4bfd-ac5b-c2fa60471214"
  dres_sg_all = "/infra/domains/default/groups/71be24aa-3b79-4a78-ab80-2679d0b06cf9"
}

resource "nsxt_policy_gateway_policy" "kstp_internal_e2w" {
  display_name    = "TF_AP1_internal-e2w"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 4
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "TF_AP1_shared_to_dres_cidr"
    destination_groups = ["${local.dres_sg_all}"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["${local.ires_sg}", "${local.sres_sg}", "${local.pdr_sg}"]
    scope              = [data.nsxt_policy_tier1_gateway.select.path]
  }

  rule {
    display_name       = "TF_AP1_dres_cidr_to_shared"
    destination_groups = ["${local.ires_sg}", "${local.sres_sg}", "${local.pdr_sg}"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["${local.dres_sg_all}"]
    scope              = [data.nsxt_policy_tier1_gateway.select.path]
  }
}
