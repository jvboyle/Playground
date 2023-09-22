

resource "nsxt_policy_gateway_policy" "dres_vpn_0193" {
  display_name    = "${local.customer_0193}-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "${local.customer_0193}-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_193_vpn_kstp_ip_168_1_103_232"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_193_vpn_peer_ip_169_60_150_171","/infra/domains/default/groups/dres_193_vpn_peer_ip_158_177_109_197","/infra/domains/default/groups/dres_193_vpn_peer_ip_203_251_21_53"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0193}-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_193_vpn_peer_ip_169_60_150_171","/infra/domains/default/groups/dres_193_vpn_peer_ip_158_177_109_197","/infra/domains/default/groups/dres_193_vpn_peer_ip_203_251_21_53"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_193_vpn_kstp_ip_168_1_103_232"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}