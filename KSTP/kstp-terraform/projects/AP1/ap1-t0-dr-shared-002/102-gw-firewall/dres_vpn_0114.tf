resource "nsxt_policy_gateway_policy" "DRES_114_ipsec_vpn" {
  display_name    = "DRES114-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "DRES114-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_114_vpn_peer_ip_168_1_21_170"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_114_vpn_kstp_ip_168_1_103_227"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "DRES114-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_114_vpn_kstp_ip_168_1_103_227"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_114_vpn_peer_ip_168_1_21_170"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}