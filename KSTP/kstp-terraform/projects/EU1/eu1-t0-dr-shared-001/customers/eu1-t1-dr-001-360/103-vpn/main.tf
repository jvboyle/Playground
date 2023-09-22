
data "nsxt_policy_tier1_gateway" "tier1_router" {
  display_name = var.customer
}

data "nsxt_policy_tier0_gateway" "tier0_router" {
  display_name = "eu1-t0-dr-shared-001"
}

data "nsxt_policy_gateway_locale_service" "select" {
  gateway_path = data.nsxt_policy_tier1_gateway.tier1_router.path
}

resource "nsxt_policy_ipsec_vpn_service" "vpn_360" {
  display_name        = "${var.customer}-vpn1"
  description         = "${var.customer} dres360 service"
  locale_service_path = data.nsxt_policy_gateway_locale_service.select.path # /infra/tier-1s/eu1-t1-dr-001-360
  enabled             = true
  ha_sync             = true
  ike_log_level       = "INFO"
}

resource "nsxt_policy_ipsec_vpn_local_endpoint" "local_ep" {
  display_name  = "${var.customer}-local_ep"
  service_path  = nsxt_policy_ipsec_vpn_service.vpn_360.path
  description   = "${var.customer} dres360 vpn1"
  local_address = "169.51.163.115"
}

resource "nsxt_policy_ipsec_vpn_session" "SONY" {
  display_name               = "${var.customer}-SONY"
  description                = "RITM0152809"
  ike_profile_path           = "/infra/ipsec-vpn-ike-profiles/eu1-t1-dres-01-ikev2-aes256-sha256-dh16"
  tunnel_profile_path        = "/infra/ipsec-vpn-tunnel-profiles/eu1-t1-dres-01-aes256-sha256-pfs16"
  local_endpoint_path        = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  dpd_profile_path           = "/infra/ipsec-vpn-dpd-profiles/nsx-default-l3vpn-dpd-profile"
  enabled                    = true
  service_path               = nsxt_policy_ipsec_vpn_service.vpn_360.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = "193.108.101.15"
  peer_id                    = "193.108.101.15"
  psk                        = "CHANGE_ME"
  connection_initiation_mode = "INITIATOR"
  rule {
    sources      = ["158.87.104.0/24"]
    destinations = ["172.28.26.0/28"]
    action       = "PROTECT"
  }
}
