
locals {
  name = "vpn_name_jvb"
}

# T0 or T1 lookup , if vpn is running on T0 , only T0 lookup is needed if vpn is on T1 , need both , Routes are added to T0 
data "nsxt_policy_tier0_gateway" "select" {
  display_name = var.project
}

#data "nsxt_policy_tier1_gateway" "select" {
#  display_name = var.customer
#}

#
data "nsxt_policy_gateway_locale_service" "select" {
  gateway_path = data.nsxt_policy_tier0_gateway.select.path # Gateway you put the service 
}

resource "nsxt_policy_ipsec_vpn_service" "vpn" {
  display_name        = "TF-${var.customer}-vpn-service"
  description         = "TF-${var.customer}-vpn-service"
  locale_service_path = data.nsxt_policy_gateway_locale_service.select.path # should not need changing 
  enabled             = false
  ha_sync             = true
  ike_log_level       = "INFO"
}

resource "nsxt_policy_ipsec_vpn_local_endpoint" "local_ep" {
  display_name  = "TF-${var.customer}-ep"
  description   = "TF-${var.customer}-ep"
  service_path  = nsxt_policy_ipsec_vpn_service.vpn.path #should not need changing
  local_address = "169.51.163.5"                         # update with Endpoint ip,
}

module "vpn" {
  source                      = "../../../../modules/nsxt/vpn"
  project                     = var.project
  environment                 = var.environment
  customer                    = var.customer
  name                        = "GSNI_TWINS"
  static_gateway_path         = data.nsxt_policy_tier0_gateway.select.path # T0 Path to add Routes 
  endpoint_local_address      = "169.51.163.5"
  local_endpoint_path         = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path # should not have to change 
  ike_encryption_algorithms   = "AES_256"                                          # AES_256 AES_GCM_192 AES_GCM_256 AES_GCM_128 AES_128 NO_ENCRYPTION_AUTH_AES_GMAC_128
  ike_digest_algorithms       = "SHA2_256"                                         # SHA2_256 SHA2_512 SHA2_384 SHA1
  ike_dh_groups               = "GROUP14"                                          # GROUP2 GROUP5 GROUP20 GROUP16 GROUP15 GROUP14 GROUP21 GROUP19
  ike_version                 = "IKE_V1"                                           # IKE_V1 IKE_V2
  ike_sa_life_time            = "86400"
  ipsec_encryption_algorithms = "AES_256"  #AES_256 AES_GCM_192 AES_GCM_256 AES_GCM_128 AES_128 NO_ENCRYPTION_AUTH_AES_GMAC_128
  ipsec_digest_algorithms     = "SHA2_256" # SHA2_256 SHA2_512 SHA2_384 SHA1
  ipsec_dh_groups             = "GROUP14"  # GROUP2 GROUP5 GROUP20 GROUP16 GROUP15 GROUP14 GROUP21 GROUP19
  ipsec_sa_life_time          = "3600"
  vpn_service_path            = nsxt_policy_ipsec_vpn_service.vpn.path
  peer_address                = "129.35.26.78" # Remote peer ip 
  next_hop                    = "169.51.163.1" # Fortigate ip 

  bypass_rule_config = {
    sources      = ["158.87.57.0/24"]
    destinations = ["62.185.95.96/27", "100.98.244.0/25", "129.39.46.0/24", "100.98.242.0/24", "195.118.243.144/28"]
  }
}

module "vpn-2" {
  source                      = "../../../../modules/nsxt/vpn"
  project                     = var.project
  environment                 = var.environment
  customer                    = var.customer
  name                        = "GSNI_Israel"
  static_gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  endpoint_local_address      = "169.51.163.5"
  local_endpoint_path         = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  ike_encryption_algorithms   = "AES_256"
  ike_digest_algorithms       = "SHA2_256" # SHA2_256 SHA2_512 SHA2_384 SHA1
  ike_dh_groups               = "GROUP14"
  ike_version                 = "IKE_V2"
  ike_sa_life_time            = "86400"
  ipsec_encryption_algorithms = "AES_256"
  ipsec_digest_algorithms     = "SHA2_256" # SHA2_256 SHA2_512 SHA2_384 SHA1
  ipsec_dh_groups             = "GROUP14"
  ipsec_sa_life_time          = "3600"
  vpn_service_path            = nsxt_policy_ipsec_vpn_service.vpn.path
  peer_address                = "80.178.106.13"
  next_hop                    = "169.51.163.1"

  bypass_rule_config = {
    sources      = ["158.87.57.0/24"]
    destinations = ["158.98.132.80/28"]
  }
}
