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
# 321
module "vpn-1" {
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
  peer_address                = "80.178.106.139"
  next_hop                    = "169.51.163.1"

  bypass_rule_config = {
    sources      = ["158.87.57.0/24"]
    destinations = ["158.98.132.80/28"]
  }
}

module "vpn-3" {
  source                      = "../../../../modules/nsxt/vpn"
  project                     = var.project
  environment                 = var.environment
  customer                    = var.customer
  name                        = "GSNI_IST"
  static_gateway_path         = data.nsxt_policy_tier0_gateway.select.path # T0 Path to add Routes 
  endpoint_local_address      = "169.51.163.5"
  local_endpoint_path         = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path # should not have to change 
  ike_encryption_algorithms   = "AES_256"                                          # AES_256 AES_GCM_192 AES_GCM_256 AES_GCM_128 AES_128 NO_ENCRYPTION_AUTH_AES_GMAC_128
  ike_digest_algorithms       = "SHA1"                                             # SHA2_256 SHA2_512 SHA2_384 SHA1
  ike_dh_groups               = "GROUP5"                                           # GROUP2 GROUP5 GROUP20 GROUP16 GROUP15 GROUP14 GROUP21 GROUP19
  ike_version                 = "IKE_V1"                                           # IKE_V1 IKE_V2
  ike_sa_life_time            = "86400"
  ipsec_encryption_algorithms = "AES_256" #AES_256 AES_GCM_192 AES_GCM_256 AES_GCM_128 AES_128 NO_ENCRYPTION_AUTH_AES_GMAC_128
  ipsec_digest_algorithms     = "SHA1"    # SHA2_256 SHA2_512 SHA2_384 SHA1
  ipsec_dh_groups             = "GROUP5"  # GROUP2 GROUP5 GROUP20 GROUP16 GROUP15 GROUP14 GROUP21 GROUP19
  ipsec_sa_life_time          = "3600"
  vpn_service_path            = nsxt_policy_ipsec_vpn_service.vpn.path
  peer_address                = "31.145.56.96" # Remote peer ip 
  next_hop                    = "169.51.163.1" # Fortigate ip 

  bypass_rule_config = {
    sources      = ["158.87.57.0/24"]
    destinations = ["158.98.136.0/24"]
  }
}

module "vpn-4" {
  source                      = "../../../../modules/nsxt/vpn"
  project                     = var.project
  environment                 = var.environment
  customer                    = var.customer
  name                        = "DA_JP_IPSec_VPN"
  static_gateway_path         = data.nsxt_policy_tier0_gateway.select.path
  endpoint_local_address      = "169.51.163.5"
  local_endpoint_path         = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path
  ike_encryption_algorithms   = "AES_256"
  ike_digest_algorithms       = "SHA2_256" # SHA2_256 SHA2_512 SHA2_384 SHA1
  ike_dh_groups               = "GROUP14"
  ike_version                 = "IKE_V1"
  ike_sa_life_time            = "86400"
  ipsec_encryption_algorithms = "AES_256"
  ipsec_digest_algorithms     = "SHA2_256" # SHA2_256 SHA2_512 SHA2_384 SHA1
  ipsec_dh_groups             = "GROUP14"
  ipsec_sa_life_time          = "3600"
  vpn_service_path            = nsxt_policy_ipsec_vpn_service.vpn.path
  peer_address                = "169.55.62.172"
  next_hop                    = "169.51.163.1"

  bypass_rule_config = {
    sources      = ["158.87.57.0/24"]
    destinations = ["158.98.25.0/24", "158.98.100.0/24", "100.87.0.0/16", "158.98.22.0/24", "158.98.104.0/24", "158.98.99.0/24", "158.87.222.0/24", "130.103.180.0/24", "129.39.125.0/24", "158.98.20.0/24", "130.103.183.0/24", "129.39.115.0/24", "158.98.23.0/24", "158.98.98.0/24", "158.98.101.0/24", "158.98.248.0/24", "158.98.24.0/24", "158.98.251.0/24", "158.98.21.0/24"]
  }
}

module "vpn-5" {
  source                      = "../../../../modules/nsxt/vpn"
  project                     = var.project
  environment                 = var.environment
  customer                    = var.customer
  name                        = "DA_EU_IPSec_VPN"
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
  peer_address                = "169.55.61.130" # Remote peer ip 
  next_hop                    = "169.51.163.1"  # Fortigate ip 

  bypass_rule_config = {
    sources      = ["158.87.57.0/24"]
    destinations = ["100.105.20.0/24", "155.137.243.0/24", "213.153.119.0/24", "195.183.78.0/24", "194.194.203.0/24", "109.236.187.0/24", "158.105.1.0/24", "62.186.25.0/24", "129.39.157.0/24", "100.112.132.0/22", "158.98.182.0/24", "85.89.246.0/24", "100.107.21.64/26", "129.39.142.0/28", "100.107.10.0/24", "158.98.66.0/24", "158.98.85.0/24", "213.153.123.0/24", "62.186.24.0/24", "158.98.236.0/24", "32.34.115.0/24", "145.251.225.0/24", "172.16.4.0/24", "158.98.74.128/27", "129.39.143.0/26", "158.98.137.0/24", "149.83.0.0/16", "100.96.127.0/24", "100.112.9.0/25", "158.98.138.0/24", "151.171.86.0/24", "129.39.41.0/24", "129.39.159.0/24", "62.187.125.0/24", "158.98.41.0/24", "85.89.236.0/24", "149.131.103.0/24", "158.98.147.0/24", "194.29.123.0/24", "146.89.167.192/27", "100.100.0.0/24", "149.131.102.0/24", "129.42.145.0/24", "146.47.242.0/24", "146.89.188.0/24", "194.10.155.0/24", "62.187.63.0/24", "84.255.92.0/24", "212.93.55.0/24", "130.103.130.0/24", "172.16.16.0/24", "129.39.141.0/27", "194.69.35.0/24", "129.39.133.128/25", "158.98.144.0/25", "158.98.141.0/24", "100.66.55.0/24", "159.61.70.0/25", "62.186.26.0/24", "130.103.155.0/24", "212.63.226.224/27", "149.131.229.128/26", "100.107.17.0/24", "195.183.244.0/24", "141.171.252.0/24", "100.112.0.0/24", "129.39.135.48/28", "167.210.219.0/24", "152.90.89.0/24", "129.39.149.0/24", "62.187.58.0/24", "194.10.152.0/24", "195.200.201.0/24", "129.39.150.0/24", "195.193.124.0/24", "158.98.145.0/24", "100.107.4.0/24", "100.107.16.0/24", "194.194.213.0/24", "164.4.87.0/24", "129.39.233.0/24", "129.39.141.128/26", "129.39.33.0/24", "158.98.129.0/24", "158.98.42.0/24", "129.39.56.128/25", "172.31.186.0/24", "129.39.145.0/24", "158.98.224.0/24", "195.75.20.0/24", "62.186.37.0/24", "172.24.143.0/24", "84.255.94.0/24", "146.89.184.192/26", "85.89.228.0/24", "158.98.232.64/27", "150.251.116.0/24", "158.98.146.0/24", "158.98.77.0/24", "158.98.140.0/24", "146.192.227.0/24", "62.185.95.128/26", "146.89.151.0/24", "100.100.127.0/24", "195.118.243.64/27", "194.194.236.0/24", "139.120.114.0/24", "158.98.71.0/24", "100.66.50.0/24", "195.118.230.0/24", "129.39.143.160/27", "100.98.8.0/24", "100.112.8.0/24", "146.213.164.0/24", "158.98.139.0/24", "158.98.130.0/24", "139.114.152.0/24", "129.39.78.0/25", "129.42.146.0/24", "158.98.68.0/24", "100.96.128.0/18", "158.98.87.0/24"]
  }
}

module "vpn-6" {
  source                      = "../../../../modules/nsxt/vpn"
  project                     = var.project
  environment                 = var.environment
  customer                    = var.customer
  name                        = "GSNI_PL"
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
  peer_address                = "194.140.255.68" # Remote peer ip 
  next_hop                    = "169.51.163.1"   # Fortigate ip 

  bypass_rule_config = {
    sources      = ["158.87.57.0/24"]
    destinations = ["158.98.154.0/24"]
  }
}


module "vpn-7" {
  source                      = "../../../../modules/nsxt/vpn"
  project                     = var.project
  environment                 = var.environment
  customer                    = var.customer
  name                        = "CMOS_IBM_Cloud_Account_CAR"
  static_gateway_path         = data.nsxt_policy_tier0_gateway.select.path # T0 Path to add Routes 
  endpoint_local_address      = "169.51.163.5"
  local_endpoint_path         = nsxt_policy_ipsec_vpn_local_endpoint.local_ep.path # should not have to change 
  ike_encryption_algorithms   = "AES_256"                                          # AES_256 AES_GCM_192 AES_GCM_256 AES_GCM_128 AES_128 NO_ENCRYPTION_AUTH_AES_GMAC_128
  ike_digest_algorithms       = "SHA1"                                             # SHA2_256 SHA2_512 SHA2_384 SHA1
  ike_dh_groups               = "GROUP5"                                           # GROUP2 GROUP5 GROUP20 GROUP16 GROUP15 GROUP14 GROUP21 GROUP19
  ike_version                 = "IKE_V1"                                           # IKE_V1 IKE_V2
  ike_sa_life_time            = "86400"
  ipsec_encryption_algorithms = "AES_256" #AES_256 AES_GCM_192 AES_GCM_256 AES_GCM_128 AES_128 NO_ENCRYPTION_AUTH_AES_GMAC_128
  ipsec_digest_algorithms     = "SHA1"    # SHA2_256 SHA2_512 SHA2_384 SHA1
  ipsec_dh_groups             = "GROUP5"  # GROUP2 GROUP5 GROUP20 GROUP16 GROUP15 GROUP14 GROUP21 GROUP19
  ipsec_sa_life_time          = "3600"
  vpn_service_path            = nsxt_policy_ipsec_vpn_service.vpn.path
  peer_address                = "158.177.208.82" # Remote peer ip 
  next_hop                    = "169.51.163.1"   # Fortigate ip 

  bypass_rule_config = {
    sources      = ["158.87.57.0/24"]
    destinations = ["158.87.146.0/24"]
  }
}
