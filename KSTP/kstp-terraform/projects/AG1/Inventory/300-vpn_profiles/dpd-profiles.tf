
resource "nsxt_policy_ipsec_vpn_dpd_profile" "dpd" {
  display_name       = "TF-ON_DEMAND_DPI-10-RC-8-dpd"
  nsx_id             = "TF-ON_DEMAND_DPI-10-RC-8-dpd"
  description        = "Terraform provisioned IPSec VPN DPD Profile"
  dpd_probe_mode     = "ON_DEMAND"
  dpd_probe_interval = 10
  enabled            = true
  retry_count        = 8
}
