resource "nsxt_policy_gateway_policy" "dres_vpn_0108" {
  display_name    = "${local.customer_0108}-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "${local.customer_0108}-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_108_vpn_peer_ip_110_165_25_132"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_108_vpn_kstp_ip_168_1_103_225"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0108}-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_108_vpn_kstp_ip_168_1_103_225"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_108_vpn_peer_ip_110_165_25_132"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}