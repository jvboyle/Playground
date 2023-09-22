
data "nsxt_policy_tier1_gateway" "tier1_router" {
  display_name = var.customer
}

data "nsxt_policy_tier0_gateway" "tier0_router" {
  display_name = "eu1-t0-dr-shared-001"
}

data "nsxt_policy_gateway_locale_service" "select" {
  gateway_path = data.nsxt_policy_tier1_gateway.tier1_router.path
}

resource "nsxt_policy_ipsec_vpn_service" "vpn_342" {
  display_name        = "${var.customer}-vpn1"
  description         = "${var.customer} dres342 service"
  locale_service_path = data.nsxt_policy_gateway_locale_service.select.path # /infra/tier-1s/eu1-t1-dr-001-342
  enabled             = true
  ha_sync             = true
  ike_log_level       = "INFO"
}

resource "nsxt_policy_ipsec_vpn_local_endpoint" "local_ep" {
  display_name  = "${var.customer}-local_ep"
  service_path  = nsxt_policy_ipsec_vpn_service.vpn_342.path
  description   = "${var.customer} dres342 vpn1"
  local_address = "169.51.163.21"
}

resource "nsxt_policy_ipsec_vpn_session" "ZUMTOBEL" {
  display_name               = "${var.customer}-ZUMTOBEL"
  description                = "RITM0152810"
  ike_profile_path           = "/infra/ipsec-vpn-ike-profiles/eu1-t1-dres-01-ikev2-aes256-sha256-dh16"
  tunnel_profile_path        = "/infra/ipsec-vpn-tunnel-profiles/eu1-t1-dres-01-aes256-sha256-pfs16"
  local_endpoint_path        = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  dpd_profile_path           = "/infra/ipsec-vpn-dpd-profiles/nsx-default-l3vpn-dpd-profile"
  enabled                    = true
  service_path               = nsxt_policy_ipsec_vpn_service.vpn_342.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = "193.108.101.15"
  peer_id                    = "193.108.101.15"
  psk                        = "CHANGE_ME"
  connection_initiation_mode = "INITIATOR"
  rule {
    sources      = ["158.87.104.0/24"]
    destinations = ["172.28.27.144/28"]
    action       = "PROTECT"
  }
}

resource "nsxt_policy_static_route" "static_route" {
  description  = "Route provisioned with Terraform"
  display_name = "${var.customer}-peer-ip-static-route"
  gateway_path = data.nsxt_policy_tier0_gateway.tier0_router.path
  network      = "193.108.101.15/32"

  next_hop {
    ip_address     = "169.51.163.1"
    admin_distance = "1"
  }
}