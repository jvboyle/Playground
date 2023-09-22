
resource "nsxt_policy_gateway_policy" "dres_vpn_0101" {
  display_name    = "${local.customer_0101}-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "${local.customer_0101}-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_101_vpn_peer1_ip_168_1_97_148"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_101_vpn_kstp_ip_168_1_103_221"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0101}-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_101_vpn_kstp_ip_168_1_103_221"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_101_vpn_peer1_ip_168_1_97_148"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }


  rule {
    display_name       = "${local.customer_0101}-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_101_vpn_peer2_ip_168_1_11_38"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_101_vpn_kstp_ip_168_1_103_221"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0101}-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_101_vpn_kstp_ip_168_1_103_221"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_101_vpn_peer2_ip_168_1_11_38"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}