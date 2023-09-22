
resource "nsxt_policy_group" "vpn_dres_peer_0271" {
  display_name = "${local.customer_0271}-vpn-peer-ip"

  criteria {
    ipaddress_expression {
      ip_addresses = ["103.129.154.242"]
    }
  }
}

resource "nsxt_policy_group" "vpn_dres_local_0271" {
  display_name = "${local.customer_0271}-vpn-local-ip"

  criteria {
    ipaddress_expression {
      ip_addresses = ["168.1.103.242"]
    }
  }
}

resource "nsxt_policy_gateway_policy" "dres_vpn_0271" {
  display_name    = "${local.customer_0271}-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "${local.customer_0271}-vpn_in"
    destination_groups = [nsxt_policy_group.vpn_dres_local_0271.path]
    action             = "ALLOW"
    logged             = true
    source_groups      = [nsxt_policy_group.vpn_dres_peer_0271.path]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0271}-vpn_out"
    destination_groups = [nsxt_policy_group.vpn_dres_peer_0271.path]
    action             = "ALLOW"
    logged             = true
    source_groups      = [nsxt_policy_group.vpn_dres_local_0271.path]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}

