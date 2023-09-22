resource "nsxt_policy_gateway_policy" "dres_vpn_0127" {
  display_name    = "${local.customer_0127}-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "${local.customer_0127}-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_127_vpn_peer_ip_124_195_15_162"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_127_vpn_kstp_ip_168_1_103_228"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0127}-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_127_vpn_kstp_ip_168_1_103_228"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_127_vpn_peer_ip_124_195_15_162"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}