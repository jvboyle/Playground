
resource "nsxt_policy_ipsec_vpn_tunnel_profile" "ipsec" {
  display_name = "TF-ipsec_aes256_sha2256_14_28800"
  nsx_id       = "TF-ipsec_aes256_sha2256_14_28800"
  description  = "Terraform provisioned IPSec VPN Profile"
  # df_policy             = "COPY"
  encryption_algorithms = ["AES_256"]   #["AES_256 AES_GCM_192 AES_GCM_256 AES_GCM_128 AES_128 NO_ENCRYPTION_AUTH_AES_GMAC_128"]
  digest_algorithms     = ["SHA2_256"]  #["SHA2_256 SHA2_512 SHA2_384 SHA1"]
  dh_groups             = ["GROUP14"]   #["GROUP2 GROUP5 GROUP20 GROUP16 GROUP15 GROUP14 GROUP21 GROUP19"]
  sa_life_time          = "3600"      # "3600"
}
