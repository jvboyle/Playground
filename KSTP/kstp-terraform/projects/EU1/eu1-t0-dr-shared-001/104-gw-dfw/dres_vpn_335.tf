resource "nsxt_policy_gateway_policy" "dres_vpn_335" {
  display_name    = "dres_335-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "dres_335-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_335_vpn_peer_ip_195_76_110_196"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_335_vpn_kstp_ip_169_51_163_29"]
    services           = ["/infra/services/IPSecVPN","/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "dres_335-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_335_vpn_kstp_ip_169_51_163_29"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_335_vpn_peer_ip_195_76_110_196"]
    services           = ["/infra/services/IPSecVPN","/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}