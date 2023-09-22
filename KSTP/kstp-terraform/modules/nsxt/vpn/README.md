


Link - 
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_ipsec_vpn_tunnel_profile
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_ipsec_vpn_dpd_profile
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_ipsec_vpn_ike_profile



Example Usage 

# the nsxt_policy_ipsec_vpn_service Resource is created once per T1 service so goes inside dres index 
```
resource "nsxt_policy_ipsec_vpn_service" "vpn" {
  display_name        = "TF-${var.customer}-${local.name}-vpn"
  description         = "${var.customer}-${local.name}-vpn"
  locale_service_path = module.vpn.local_service_path
  enabled             = false
  ha_sync             = true
  ike_log_level       = "INFO"
}
```
# Module can be reused as many times as needed , Change the Module "Name"(vpn) to be unique 
# The 1st module created is used as a reference for the locale_service_path , do not change the 1st module name being deployed 

```
module "vpn" {
  source                 = "../../../../../../modules/nsxt/vpn"
  project                = var.project
  environment            = var.environment
  customer               = var.customer
  name                   = local.name
  endpoint_local_address = "192.168.1.100"
  ike_encryption_algorithms   = "AES_128"
  ike_digest_algorithms       = "SHA2_256"
  ike_dh_groups               = "GROUP14"
  ike_version                 = "IKE_V2"
  ike_sa_life_time            = "86400"
  ipsec_encryption_algorithms = "AES_128"
  ipsec_digest_algorithms     = "SHA2_256"
  ipsec_dh_groups             = "GROUP14"
  ipsec_sa_life_time          = "3600"
  service_path                = nsxt_policy_ipsec_vpn_service.vpn.path
  peer_address                = "172.172.1.10"
  next_hop                    = "192.1.168.1"

  bypass_rule_config = {
    sources      = ["11.0.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
    destinations = ["12.0.0.0/24"]
  }
}
```