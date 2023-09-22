

data "nsxt_policy_tier1_gateway" "tier1_router" {
  display_name = var.customer
}

data "nsxt_policy_tier0_gateway" "tier0_router" {
  display_name = "ap1-t0-dr-shared-001"
}

data "nsxt_policy_gateway_locale_service" "select" {
  gateway_path = data.nsxt_policy_tier1_gateway.tier1_router.path
}

resource "nsxt_policy_ipsec_vpn_service" "vpn_130" {
  display_name        = "${var.customer}-vpn1"
  description         = "${var.customer} dres130 service"
  locale_service_path = data.nsxt_policy_gateway_locale_service.select.path # /infra/tier-1s/ap1-t1-dr-001-0130
  enabled             = true
  ha_sync             = true
  ike_log_level       = "INFO"
}

resource "nsxt_policy_ipsec_vpn_local_endpoint" "local_ep" {
  display_name  = "${var.customer}-local_ep"
  service_path  = nsxt_policy_ipsec_vpn_service.vpn_130.path
  description   = "${var.customer} dres130 vpn1"
  local_address = "168.1.103.230"
}

resource "nsxt_policy_ipsec_vpn_session" "NZ_Goverment_Cloud_ADC" {
  display_name               = "${var.customer}-NZ_Goverment_Cloud_ADC"
  description                = "Terraform-provisioned IPsec Policy-Based VPN"
  ike_profile_path           = "/infra/ipsec-vpn-ike-profiles/IKEv1_aes256_sha256_14_28800"
  tunnel_profile_path        = "/infra/ipsec-vpn-tunnel-profiles/esp_aes256_sha256_14"
  local_endpoint_path        = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  dpd_profile_path           = "/infra/ipsec-vpn-dpd-profiles/nsx-default-l3vpn-dpd-profile"
  enabled                    = true
  service_path               = nsxt_policy_ipsec_vpn_service.vpn_130.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = "103.5.82.30"
  peer_id                    = "103.5.82.30"
  psk                        = "CHANGE_ME"
  connection_initiation_mode = "INITIATOR"
  rule {
    sources      = ["158.87.104.0/24"]
    destinations = ["172.16.32.0/25"]
    action       = "PROTECT"
  }
}

resource "nsxt_policy_ipsec_vpn_session" "session2" {
  display_name               = "${var.customer}-session2"
  description                = "Terraform-provisioned IPsec Policy-Based VPN"
  ike_profile_path           = "/infra/ipsec-vpn-ike-profiles/IKEv1_aes256_sha256_14_28800"
  tunnel_profile_path        = "/infra/ipsec-vpn-tunnel-profiles/esp_aes256_sha256_14"
  local_endpoint_path        = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  dpd_profile_path           = "/infra/ipsec-vpn-dpd-profiles/nsx-default-l3vpn-dpd-profile"
  enabled                    = true
  service_path               = nsxt_policy_ipsec_vpn_service.vpn_130.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = "45.119.101.240"
  peer_id                    = "45.119.101.240"
  psk                        = "CHANGE_ME"
  connection_initiation_mode = "INITIATOR"
  rule {
    sources      = ["158.87.104.0/24"]
    destinations = ["172.26.32.0/25"]
    action       = "PROTECT"
  }
}



resource "nsxt_policy_static_route" "static_route_VPN_1" {
  description  = "Route provisioned with Terraform"
  display_name = "${var.customer}-peer-ip-static-route"
  gateway_path = data.nsxt_policy_tier0_gateway.tier0_router.path
  network      = "103.5.82.30/32"

  next_hop {
    ip_address     = "168.1.103.193"
    admin_distance = "1"
  }
}

resource "nsxt_policy_static_route" "static_route_VPN_2" {
  description  = "Route provisioned with Terraform"
  display_name = "${var.customer}-peer-ip-static-route"
  gateway_path = data.nsxt_policy_tier0_gateway.tier0_router.path
  network      = "45.119.101.240/32"

  next_hop {
    ip_address     = "168.1.103.193"
    admin_distance = "1"
  }
}
