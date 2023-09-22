resource "nsxt_policy_gateway_policy" "Dres_359_ipsec_vpn" {
  display_name    = "DRES359-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "DRES359-ipsec-vpn-in"
    destination_groups = ["/infra/domains/default/groups/dres_359_vpn_peer_ip_122_3_237_114"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_359_vpn_kstp_ip_168_1_103_209"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "DRES359-ipsec-vpn-out"
    destination_groups = ["/infra/domains/default/groups/dres_359_vpn_kstp_ip_168_1_103_209"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_359_vpn_peer_ip_122_3_237_114"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}