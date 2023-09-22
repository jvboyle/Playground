

data "nsxt_policy_tier1_gateway" "tier1_router" {
  display_name = var.customer
}

data "nsxt_policy_tier0_gateway" "tier0_router" {
  display_name = "ap1-t0-dr-shared-002"
}

data "nsxt_policy_gateway_locale_service" "select" {
  gateway_path = data.nsxt_policy_tier1_gateway.tier1_router.path
}

resource "nsxt_policy_ipsec_vpn_service" "vpn_114" {
  display_name        = "${var.customer}-vpn1"
  description         = "${var.customer} dres114 service"
  locale_service_path = data.nsxt_policy_gateway_locale_service.select.path # /infra/tier-1s/ap1-t1-dr-002-0114
  enabled             = true
  ha_sync             = true
  ike_log_level       = "INFO"
}

resource "nsxt_policy_ipsec_vpn_local_endpoint" "local_ep" {
  display_name  = "${var.customer}-local_ep"
  service_path  = nsxt_policy_ipsec_vpn_service.vpn_114.path
  description   = "${var.customer} dres114 vpn1"
  local_address = "168.1.103.227"
}

resource "nsxt_policy_ipsec_vpn_session" "session1" {
  display_name               = "${var.customer}-NAB-session"
  description                = "Terraform-provisioned IPsec Policy-Based VPN"
  ike_profile_path           = "/infra/ipsec-vpn-ike-profiles/ikev2_aes256_sha2256_14_28800"
  tunnel_profile_path        = "/infra/ipsec-vpn-tunnel-profiles/esp_aes256_sha256_14"
  local_endpoint_path        = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  dpd_profile_path           = "/infra/ipsec-vpn-dpd-profiles/nsx-default-l3vpn-dpd-profile"
  enabled                    = true
  service_path               = nsxt_policy_ipsec_vpn_service.vpn_114.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = "168.1.21.170"
  peer_id                    = "168.1.21.170"
  psk                        = "CHANGE_ME"
  connection_initiation_mode = "INITIATOR"
  rule {
    sources      = ["158.87.104.0/24"]
    destinations = ["10.132.76.0/23","10.47.156.139/32","10.41.166.7/32","10.47.122.200/32","10.47.156.140/32","10.10.8.14/32","146.89.238.144/28","10.47.75.134/32","10.42.164.15/32","10.42.164.16/32","10.47.122.175/32","10.47.156.138/32","10.10.142.68/32","10.41.164.15/32","10.47.122.198/32","10.41.164.16/32"]
    action       = "PROTECT"
  }
}

resource "nsxt_policy_static_route" "static_route" {
  description  = "Route provisioned with Terraform"
  display_name = "${var.customer}-peer-ip-static-route"
  gateway_path = data.nsxt_policy_tier0_gateway.tier0_router.path
  network      = "168.1.21.170/32"

  next_hop {
    ip_address     = "168.1.103.193"
    admin_distance = "1"
  }
}


