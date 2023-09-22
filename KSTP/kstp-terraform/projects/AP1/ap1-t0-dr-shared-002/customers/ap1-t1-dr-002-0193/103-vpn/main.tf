data "nsxt_policy_tier1_gateway" "tier1_router" {
  display_name = var.customer
}

data "nsxt_policy_tier0_gateway" "tier0_router" {
  display_name = "ap1-t0-dr-shared-002"
}

data "nsxt_policy_gateway_locale_service" "select" {
  gateway_path = data.nsxt_policy_tier1_gateway.tier1_router.path
}

resource "nsxt_policy_ipsec_vpn_service" "vpn_193" {
  display_name        = "${var.customer}-vpn1"
  description         = "${var.customer} dres193 service"
  locale_service_path = data.nsxt_policy_gateway_locale_service.select.path # /infra/tier-1s/ap1-t1-dr-002-0193
  enabled             = true
  ha_sync             = true
  ike_log_level       = "INFO"
}

resource "nsxt_policy_ipsec_vpn_local_endpoint" "local_ep" {
  display_name  = "${var.customer}-local_ep"
  service_path  = nsxt_policy_ipsec_vpn_service.vpn_193.path
  description   = "${var.customer} dres193 vpn1"
  local_address = "168.1.103.232"
}

resource "nsxt_policy_ipsec_vpn_session" "session1_Songdo" {
  display_name               = "${var.customer}-Songdo"
  description                = "Terraform-provisioned IPsec Policy-Based VPN"
  ike_profile_path           = "/infra/ipsec-vpn-ike-profiles/IKEv2_AES-GCM_SHA256_14_28800"
  tunnel_profile_path        = "/infra/ipsec-vpn-tunnel-profiles/nsx-default-l3vpn-tunnel-profile"
  local_endpoint_path        = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  dpd_profile_path           = "/infra/ipsec-vpn-dpd-profiles/nsx-default-l3vpn-dpd-profile"
  enabled                    = true
  service_path               = nsxt_policy_ipsec_vpn_service.vpn_193.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = "203.251.21.53"
  peer_id                    = "203.251.21.53"
  psk                        = "CHANGE_ME"
  connection_initiation_mode = "INITIATOR"
  rule {
    sources      = ["158.87.104.0/24"]
    destinations = ["10.100.34.56/32"]
    action       = "PROTECT"
  }
}

resource "nsxt_policy_ipsec_vpn_session" "session2_Dallas" {
  display_name               = "${var.customer}-Dallas"
  description                = "Terraform-provisioned IPsec Policy-Based VPN"
  ike_profile_path           = "/infra/ipsec-vpn-ike-profiles/IKEv2_AES-GCM_SHA256_14_28800"
  tunnel_profile_path        = "/infra/ipsec-vpn-tunnel-profiles/nsx-default-l3vpn-tunnel-profile"
  local_endpoint_path        = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  dpd_profile_path           = "/infra/ipsec-vpn-dpd-profiles/nsx-default-l3vpn-dpd-profile"
  enabled                    = true
  service_path               = nsxt_policy_ipsec_vpn_service.vpn_193.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = "169.60.150.171"
  peer_id                    = "169.60.150.171"
  psk                        = "CHANGE_ME"
  connection_initiation_mode = "INITIATOR"
  rule {
    sources      = ["158.87.104.0/24"]
    destinations = ["67.228.116.82/32"]
    action       = "PROTECT"
  }
}

resource "nsxt_policy_ipsec_vpn_session" "session3_Frankfurt" {
  display_name               = "${var.customer}-Frankfurt"
  description                = "Terraform-provisioned IPsec Policy-Based VPN"
  ike_profile_path           = "/infra/ipsec-vpn-ike-profiles/IKEv2_AES-GCM_SHA256_14_28800"
  tunnel_profile_path        = "/infra/ipsec-vpn-tunnel-profiles/nsx-default-l3vpn-tunnel-profile"
  local_endpoint_path        = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  dpd_profile_path           = "/infra/ipsec-vpn-dpd-profiles/nsx-default-l3vpn-dpd-profile"
  enabled                    = true
  service_path               = nsxt_policy_ipsec_vpn_service.vpn_193.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = "158.177.109.197"
  peer_id                    = "158.177.109.197"
  psk                        = "CHANGE_ME"
  connection_initiation_mode = "INITIATOR"
  rule {
    sources      = ["158.87.104.0/24"]
    destinations = ["158.177.100.109/32"]
    action       = "PROTECT"
  }
}

resource "nsxt_policy_static_route" "static_route_1" {
  description  = "Route provisioned with Terraform"
  display_name = "${var.customer}-peer-ip-static-route"
  gateway_path = data.nsxt_policy_tier0_gateway.tier0_router.path
  network      = "203.251.21.53/32"

  next_hop {
    ip_address     = "168.1.103.193"
    admin_distance = "1"
  }
}
resource "nsxt_policy_static_route" "static_route_2" {
  description  = "Route provisioned with Terraform"
  display_name = "${var.customer}-peer-ip-static-route"
  gateway_path = data.nsxt_policy_tier0_gateway.tier0_router.path
  network      = "169.60.150.171/32"

  next_hop {
    ip_address     = "168.1.103.193"
    admin_distance = "1"
  }
}
resource "nsxt_policy_static_route" "static_route_3" {
  description  = "Route provisioned with Terraform"
  display_name = "${var.customer}-peer-ip-static-route"
  gateway_path = data.nsxt_policy_tier0_gateway.tier0_router.path
  network      = "158.177.109.197/32"

  next_hop {
    ip_address     = "168.1.103.193"
    admin_distance = "1"
  }
}