
locals {
  ires_cidr = [
    "10.63.60.128/26",
    "10.63.70.192/26",
    "10.63.9.64/26",
    "10.63.63.128/26"
  ]
  sres_cidr = [
    "158.87.54.0/23",
    "158.87.50.64/26"
  ]
  pdr_cidr = [
    "100.80.69.0/24"
  ]
  dres_cidr_all = [
    "100.80.0.0/13"
  ]
}


resource "nsxt_policy_group" "e2w_ires_group" {
  display_name = "TF_AP1-SG-NET-IRES"

  criteria {
    ipaddress_expression {
      ip_addresses = local.ires_cidr
    }
  }
}

resource "nsxt_policy_group" "e2w_sres_group" {
  display_name = "TF_AP1-SG-NET-SRES"

  criteria {
    ipaddress_expression {
      ip_addresses = local.sres_cidr
    }
  }
}

resource "nsxt_policy_group" "e2w_pdr_group" {
  display_name = "TF_AP1-SG-NET-PDR"

  criteria {
    ipaddress_expression {
      ip_addresses = local.pdr_cidr
    }
  }
}

resource "nsxt_policy_group" "e2w_dres_all_group" {
  display_name = "TF_AP1-SG-NET-DRES-ALL"

  criteria {
    ipaddress_expression {
      ip_addresses = local.dres_cidr_all
    }
  }
}
