resource "nsxt_policy_group" "grp_4" {
  display_name = "TF-EU1-HOST-DRES340-CACF-Proxy-VIP"
  nsx_id       = "TF-EU1-HOST-DRES340-CACF-Proxy-VIP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "100.73.252.50"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_5" {
  display_name = "TF-EU1-SG-DRES340-CPREM-JH"
  nsx_id       = "TF-EU1-SG-DRES340-CPREM-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "10.15.151.14","10.15.151.12"
      ]
    }
  }
}