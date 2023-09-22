
data "nsxt_policy_tier1_gateway" "tier1_router" {
  display_name = var.customer
}

data "nsxt_policy_tier0_gateway" "tier0_router" {
  display_name = "ap1-t0-dr-shared-001"
}

data "nsxt_policy_gateway_locale_service" "select" {
  gateway_path = data.nsxt_policy_tier1_gateway.tier1_router.path
}

resource "nsxt_policy_ipsec_vpn_service" "vpn_107" {
  display_name        = "${var.customer}-vpn1"
  description         = "${var.customer} dres107 service"
  locale_service_path = data.nsxt_policy_gateway_locale_service.select.path # /infra/tier-1s/ap1-t1-dr-001-0107
  enabled             = true
  ha_sync             = true
  ike_log_level       = "INFO"
}

resource "nsxt_policy_ipsec_vpn_local_endpoint" "local_ep" {
  display_name  = "${var.customer}-local_ep"
  service_path  = nsxt_policy_ipsec_vpn_service.vpn_107.path
  description   = "${var.customer} dres107 vpn1"
  local_address = "168.1.103.224"
}

resource "nsxt_policy_ipsec_vpn_session" "session1" {
  display_name               = "${var.customer}-session1"
  description                = "Terraform-provisioned IPsec Policy-Based VPN"
  ike_profile_path           = "/infra/ipsec-vpn-ike-profiles/foundation-ipsec-ike-profile"
  tunnel_profile_path        = "/infra/ipsec-vpn-tunnel-profiles/foundation-ipsec-tunnel-profile"
  local_endpoint_path        = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  dpd_profile_path           = "/infra/ipsec-vpn-dpd-profiles/nsx-default-l3vpn-dpd-profile"
  enabled                    = true
  service_path               = nsxt_policy_ipsec_vpn_service.vpn_107.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = "220.64.140.212"
  peer_id                    = "220.64.140.212"
  psk                        = "CHANGE_ME"
  connection_initiation_mode = "INITIATOR"
  rule {
    sources      = ["158.87.104.0/24"]
    destinations = ["10.129.31.149/32"]
    action       = "PROTECT"
  }
}

resource "nsxt_policy_static_route" "static_route" {
  description  = "Route provisioned with Terraform"
  display_name = "${var.customer}-peer-ip-static-route"
  gateway_path = data.nsxt_policy_tier0_gateway.tier0_router.path
  network      = "220.64.140.212/32"

  next_hop {
    ip_address     = "168.1.103.193"
    admin_distance = "1"
  }
}
