resource "nsxt_policy_security_policy" "policies_TF-EDR-CARBONBLACK_tf" {
  display_name    = "TF-EDR-CARBONBLACK"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-EDR-CARBONBLACK"
  comments        = ""
  sequence_number = 0
# rules
}