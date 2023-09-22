
resource "nsxt_policy_gateway_policy" "dres_vpn_0128" {
  display_name    = "${local.customer_0128}-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "${local.customer_0128}-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_128_vpn_peer_ip_103_23_219_90"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_128_vpn_kstp_ip_168_1_103_229"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0128}-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_128_vpn_kstp_ip_168_1_103_229"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_128_vpn_peer_ip_103_23_219_90"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }


  rule {
    display_name       = "${local.customer_0128}-vpn_in"
    destination_groups = ["/infra/domains/default/groups/dres_128_vpn_peer_ip_103_23_217_90"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_128_vpn_kstp_ip_168_1_103_229"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0128}-vpn_out"
    destination_groups = ["/infra/domains/default/groups/dres_128_vpn_kstp_ip_168_1_103_229"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/dres_128_vpn_peer_ip_103_23_217_90"]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}