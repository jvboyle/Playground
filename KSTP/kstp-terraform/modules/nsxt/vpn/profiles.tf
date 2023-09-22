
resource "nsxt_policy_ipsec_vpn_dpd_profile" "dpd" {
  display_name       = "TF-${var.name}-${var.peer_address}-dpd"
  description        = "Terraform provisioned IPSec VPN DPD Profile"
  dpd_probe_mode     = "ON_DEMAND"
  dpd_probe_interval = 10
  enabled            = true
  retry_count        = 8
}


resource "nsxt_policy_ipsec_vpn_ike_profile" "ike" {
  display_name          = "TF-${var.name}-${var.peer_address}-ike"
  description           = "Terraform provisioned IPSec VPN Ike Profile"
  encryption_algorithms = [var.ike_encryption_algorithms] # ["AES_128"]
  digest_algorithms     = [var.ike_digest_algorithms]     #["SHA2_256"]
  dh_groups             = [var.ike_dh_groups]             #["GROUP14"]
  ike_version           = var.ike_version                 #"IKE_V2"
  sa_life_time          = var.ike_sa_life_time            # "86600"
}


resource "nsxt_policy_ipsec_vpn_tunnel_profile" "ipsec" {
  display_name = "TF-${var.name}-${var.peer_address}-ipsec"
  description  = "Terraform provisioned IPSec VPN Profile"
  # df_policy             = "COPY"
  encryption_algorithms = [var.ipsec_encryption_algorithms] #["AES_128"]
  digest_algorithms     = [var.ipsec_digest_algorithms]     #["SHA2_256"]
  dh_groups             = [var.ipsec_dh_groups]             #["GROUP14"]
  sa_life_time          = var.ipsec_sa_life_time            # "3600"
}
