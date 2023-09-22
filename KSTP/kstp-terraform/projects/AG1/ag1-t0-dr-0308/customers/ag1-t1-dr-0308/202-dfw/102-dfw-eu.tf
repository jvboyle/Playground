
resource "nsxt_policy_security_policy" "policies_TF-AG1-DRES308-EU" {
  display_name    = "TF-AG1--${local.dres}-EU"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-AG1-${local.dres}-EU"
  comments        = "RITM0152472"
  sequence_number = 0

}