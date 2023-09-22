resource "nsxt_policy_gateway_policy" "dres_vpn_0130" {
  display_name    = "${local.customer_0130}-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "${local.customer_0130}-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_130_vpn_peer1_ip_103_5_82_30","/infra/domains/default/groups/dres_130_vpn_peer2_ip_45_119_101_240"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_130_vpn_kstp_ip_168_1_103_230",]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0130}-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_130_vpn_kstp_ip_168_1_103_230"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_130_vpn_peer1_ip_103_5_82_30","/infra/domains/default/groups/dres_130_vpn_peer2_ip_45_119_101_240"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}