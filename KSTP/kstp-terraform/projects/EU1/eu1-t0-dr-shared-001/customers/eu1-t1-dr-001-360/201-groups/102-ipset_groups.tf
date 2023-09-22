#####################################
# IPSETs GROUPS
#
# Migration date: 01/08/2023
# Geography.....: EU1 
# Wave..........: DRES_360
#####################################
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-EU1-Client-DRES360-CACF-Proxy-VIP"
  nsx_id       = "TF-EU1-Client-DRES360-CACF-Proxy-VIP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "100.74.2.50"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-EU1-Client-premise-DRES360-JH"
  nsx_id       = "TF-EU1-Client-premise-DRES360-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "172.28.26.4","172.28.26.5"
      ]
    }
  }
}