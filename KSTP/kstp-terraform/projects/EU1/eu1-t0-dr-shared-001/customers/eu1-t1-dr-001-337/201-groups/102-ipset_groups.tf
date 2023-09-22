#####################################
# IPSETs GROUPS
#
# Migration date: 17/07/2023
# Geography.....: EU1 
# Wave..........: DRES_337
#####################################
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-EU1-Client-DRES337-CACF-Proxy-VIP"
  nsx_id       = "TF-EU1-Client-DRES337-CACF-Proxy-VIP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "100.73.246.50"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-EU1-Client-premise-DRES337-JH"
  nsx_id       = "TF-EU1-Client-premise-DRES337-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "151.171.86.64","151.171.86.71"
      ]
    }
  }
}