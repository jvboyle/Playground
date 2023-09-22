resource "nsxt_policy_group" "vpn_dres_peer_0268" {
  display_name = "${local.customer_0268}-vpn-peer-ip"

  criteria {
    ipaddress_expression {
      ip_addresses = ["203.35.0.38"]
    }
  }
}

resource "nsxt_policy_group" "vpn_dres_local_0268" {
  display_name = "${local.customer_0268}-vpn-local-ip"

  criteria {
    ipaddress_expression {
      ip_addresses = ["168.1.103.241"]
    }
  }
}

resource "nsxt_policy_gateway_policy" "dres_vpn_0268" {
  display_name    = "${local.customer_0268}-ipsec-vpn"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "${local.customer_0268}-vpn_in"
    destination_groups = [nsxt_policy_group.vpn_dres_local_0268.path]
    action             = "ALLOW"
    logged             = true
    source_groups      = [nsxt_policy_group.vpn_dres_peer_0268.path]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }

  rule {
    display_name       = "${local.customer_0268}-vpn_out"
    destination_groups = [nsxt_policy_group.vpn_dres_peer_0268.path]
    action             = "ALLOW"
    logged             = true
    source_groups      = [nsxt_policy_group.vpn_dres_local_0268.path]
    services           = ["/infra/services/IPSecVPN", "/infra/services/ICMP-GROUP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}
