resource "nsxt_policy_gateway_policy" "dres_vpn_337" {
  display_name    = "${local.customer_337}-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "${local.customer_337}-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_337_vpn_peer_ip_129_9_75_42"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_337_vpn_kstp_ip_169_51_163_73"]
    services           = ["/infra/services/IPSecVPN","/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_337}-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_337_vpn_kstp_ip_169_51_163_73"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_337_vpn_peer_ip_129_9_75_42"]
    services           = ["/infra/services/IPSecVPN","/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}