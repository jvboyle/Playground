resource "nsxt_policy_gateway_policy" "DRES_110_ipsec_vpn" {
  display_name    = "DRES110-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "DRES110-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_110_vpn_peer_ip_203_177_34_254"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_110_vpn_kstp_ip_168_1_103_226"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "DRES110-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_110_vpn_kstp_ip_168_1_103_226"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_110_vpn_peer_ip_203_177_34_254"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}