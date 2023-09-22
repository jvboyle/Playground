/*
data "nsxt_policy_gateway_policy" "default" {
  category = "Default"
}

resource "nsxt_policy_predefined_gateway_policy" "test" {
  path = nsxt_policy_tier0_gateway.tier0_gw.path

  default_rule {
    scope     = nsxt_policy_tier0_gateway.main.path
#    logged    = true
#    log_label = "orange default"
    action    = "ALLOW"
  }
}

/infra/domains/default/gateway-policies/Policy_Default_Infra-tier0-6e13aa05-9a10-49b8-b8ec-2e6258687c27/rules/default_rule
/infra/domains/default/gateway-policies/Policy_Default_Infra-tier1-ap1-t1-dr-001-0290
*/
