#####################################
# IPSETs GROUPS
#
# Migration date: 05/05/2023 13:17
# Geography.....: AP1 
# Wave..........: DRES_261
#####################################
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-AP1-Client-DRES261-CACF-Proxy-VIP"
  nsx_id       = "TF-AP1-Client-DRES261-CACF-Proxy-VIP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "100.80.122.50"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-AP1-Client-premise-DRES261-JH"
  nsx_id       = "TF-AP1-Client-premise-DRES261-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "10.52.97.24","10.52.97.25"
      ]
    }
  }
}