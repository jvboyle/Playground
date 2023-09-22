resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-EU1-SG-DRES336-CPREM-JH"
  nsx_id       = "TF-EU1-SG-DRES336-CPREM-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "195.118.230.53/32"
      ]
    }
  }
}