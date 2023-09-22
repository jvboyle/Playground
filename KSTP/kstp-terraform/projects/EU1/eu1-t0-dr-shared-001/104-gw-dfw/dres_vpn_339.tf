resource "nsxt_policy_gateway_policy" "dres_vpn_339" {
  display_name    = "dres_339-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "dres_339-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_339_vpn_peer_ip_129_35_170_116"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_339_vpn_kstp_ip_169_51_163_81"]
    services           = ["/infra/services/IPSecVPN","/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "dres_339-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_339_vpn_kstp_ip_169_51_163_81"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_339_vpn_peer_ip_129_35_170_116"]
    services           = ["/infra/services/IPSecVPN","/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}