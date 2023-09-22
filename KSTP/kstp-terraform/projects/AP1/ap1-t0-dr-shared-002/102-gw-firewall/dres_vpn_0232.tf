resource "nsxt_policy_gateway_policy" "dres_232_ipsec_vpn" {
  display_name    = "dres-232-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "dres-232-WNZ-ipsec-vpn-in"
    destination_groups = ["/infra/domains/default/groups/dres_232_vpn_peer_ip_202_7_37_4"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_232_vpn_kstp_ip_168_1_103_233"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "dres-232-WNZ-ipsec-vpn-out"
    destination_groups = ["/infra/domains/default/groups/dres_232_vpn_kstp_ip_168_1_103_233"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_232_vpn_peer_ip_202_7_37_4"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
 rule {
    display_name       = "dres-232-MCI-ipsec-vpn-in"
    destination_groups = ["/infra/domains/default/groups/dres_232_vpn_peer_ip_103_5_81_47"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_232_vpn_kstp_ip_168_1_103_233"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "dres-232-MCI-ipsec-vpn-out"
    destination_groups = ["/infra/domains/default/groups/dres_232_vpn_kstp_ip_168_1_103_233"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_232_vpn_peer_ip_103_5_81_47"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}