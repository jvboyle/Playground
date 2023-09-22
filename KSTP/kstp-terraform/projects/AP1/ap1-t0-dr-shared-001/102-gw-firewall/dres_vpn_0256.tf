resource "nsxt_policy_group" "vpn_dres_peer_0256" {
  display_name = "${local.customer_0256}-vpn-peer-ip"

  criteria {
    ipaddress_expression {
      ip_addresses = ["20.157.95.22"]
    }
  }
}

resource "nsxt_policy_group" "vpn_dres_local_0256" {
  display_name = "${local.customer_0256}-vpn-local-ip"

  criteria {
    ipaddress_expression {
      ip_addresses = ["168.1.103.237"]
    }
  }
}

resource "nsxt_policy_gateway_policy" "dres_vpn_0256" {
  display_name    = "${local.customer_0256}-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "${local.customer_0256}-vpn_in"
    destination_groups = [nsxt_policy_group.vpn_dres_local_0256.path]
    action             = "ALLOW"
    logged             = true
    source_groups      = [nsxt_policy_group.vpn_dres_peer_0256.path]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0256}-vpn_out"
    destination_groups = [nsxt_policy_group.vpn_dres_peer_0256.path]
    action             = "ALLOW"
    logged             = true
    source_groups      = [nsxt_policy_group.vpn_dres_local_0256.path]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}