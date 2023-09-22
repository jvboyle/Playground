terraform {
  required_providers {
    nsxt = {
      source  = "vmware/nsxt"
      version = ">= 3.0"
    }
  }
}

resource "nsxt_policy_ipsec_vpn_session" "session1" {
  display_name               = "TF-${var.customer}-${var.name}-session"
  description                = "TF-${var.customer}-${var.name}-session"
  dpd_profile_path           = nsxt_policy_ipsec_vpn_dpd_profile.dpd.path
  ike_profile_path           = nsxt_policy_ipsec_vpn_ike_profile.ike.path
  tunnel_profile_path        = nsxt_policy_ipsec_vpn_tunnel_profile.ipsec.path
  local_endpoint_path        = var.local_endpoint_path #nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  enabled                    = var.enalbed
  service_path               = var.vpn_service_path # nsxt_policy_ipsec_vpn_service.vpn.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = var.peer_address
  peer_id                    = var.peer_address
  psk                        = "CHANGE_ME"
  connection_initiation_mode = "INITIATOR"
  

  dynamic "rule" {
    for_each = var.bypass_rule_config == null ? [] : [1]
    content {
      sources      = lookup(var.bypass_rule_config, "sources", null)
      destinations = lookup(var.bypass_rule_config, "destinations", null)
      action       = "PROTECT"
    }
  }
}

resource "nsxt_policy_static_route" "static_route" {
  display_name = "TF-${var.customer}-${var.name}-static-route"
  description  = "TF-${var.customer}-${var.name}-static-route"
  gateway_path = var.static_gateway_path # path to T0 to add Route to peer to internet
  network      = "${var.peer_address}/32"

  next_hop {
    ip_address     = var.next_hop
    admin_distance = "1"
  }
}
