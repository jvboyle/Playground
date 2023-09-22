data "nsxt_policy_tier1_gateway" "tier1_router" {
  display_name = var.customer
}

data "nsxt_policy_tier0_gateway" "tier0_router" {
  display_name = var.project
}

data "nsxt_policy_gateway_locale_service" "select" {
  gateway_path = data.nsxt_policy_tier1_gateway.tier1_router.path
}

resource "nsxt_policy_ipsec_vpn_service" "vpn_329" {
  display_name        = "${var.customer}-vpn1"
  description         = "${var.customer} dres329 service"
  locale_service_path = data.nsxt_policy_gateway_locale_service.select.path # /infra/tier-1s/ag1-t1-dr-001-0329
  enabled             = true
  ha_sync             = true
  ike_log_level       = "INFO"
}

resource "nsxt_policy_ipsec_vpn_local_endpoint" "local_ep" {
  display_name  = "${var.customer}-local_ep"
  service_path  = nsxt_policy_ipsec_vpn_service.vpn_329.path
  description   = "${var.customer} dres329 vpn1"
  local_address = "150.239.66.217"
}

resource "nsxt_policy_ipsec_vpn_session" "session1" {
  display_name               = "${var.customer}-session1"
  description                = "Terraform-provisioned IPsec Policy-Based VPN"
  ike_profile_path           = "/infra/ipsec-vpn-ike-profiles/TF-ikev2_aes256_sha2256_14_28800"
  tunnel_profile_path        = "/infra/ipsec-vpn-tunnel-profiles/TF-ipsec_aes256_sha2256_14_28800"
  local_endpoint_path        = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  dpd_profile_path           = "/infra/ipsec-vpn-dpd-profiles/TF-ON_DEMAND_DPI-10-RC-8-dpd"
  enabled                    = true
  service_path               = nsxt_policy_ipsec_vpn_service.vpn_329.path
  vpn_type                   = "PolicyBased"
  authentication_mode        = "PSK"
  compliance_suite           = "NONE"
  peer_address               = "208.199.104.84"
  peer_id                    = "208.199.104.84"
  psk                        = "cPold6POacg$FjpsogLzoQCL#"
  connection_initiation_mode = "INITIATOR"
  rule {
    sources      = ["158.87.104.0/24"]
    destinations = ["10.25.50.0/27"]
    action       = "PROTECT"
  }
}

resource "nsxt_policy_static_route" "static_route" {
  description  = "Route provisioned with Terraform"
  display_name = "${var.customer}-peer-ip-static-route"
  gateway_path = data.nsxt_policy_tier0_gateway.tier0_router.path
  network      = "208.199.104.84/32"

  next_hop {
    ip_address     = "150.239.66.1"
    admin_distance = "1"
  }
}
