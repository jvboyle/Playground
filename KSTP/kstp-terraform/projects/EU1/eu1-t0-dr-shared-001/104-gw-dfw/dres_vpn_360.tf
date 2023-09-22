resource "nsxt_policy_gateway_policy" "dres_vpn_360" {
  display_name    = "dres_360-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "dres_360-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_360_vpn_peer_ip_193_108_101_15"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_360_vpn_kstp_ip_169_51_163_115"]
    services           = ["/infra/services/IPSecVPN","/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "dres_360-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_360_vpn_kstp_ip_169_51_163_115"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_360_vpn_peer_ip_193_108_101_15"]
    services           = ["/infra/services/IPSecVPN","/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}