resource "nsxt_policy_gateway_policy" "dres_vpn_342" {
  display_name    = "dres_342-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "dres_342-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_342_vpn_peer_ip_193_108_101_15"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_342_vpn_kstp_ip_169_51_163_21"]
    services           = ["/infra/services/IPSecVPN","/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "dres_342-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_342_vpn_kstp_ip_169_51_163_21"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_342_vpn_peer_ip_193_108_101_15"]
    services           = ["/infra/services/IPSecVPN","/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}