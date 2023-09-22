#####################################
# IPSETs GROUPS
#
# Migration date: 05/05/2023 13:17
# Geography.....: EU1 
# Wave..........: DRES_335
#####################################
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-EU1-HOST-DRES335-CACF-Proxy-VIP"
  nsx_id       = "TF-EU1-HOST-DRES335-CACF-Proxy-VIP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "100.73.242.50"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-EU1-SG-DRES335-CPREM-JH"
  nsx_id       = "TF-EU1-SG-DRES335-CPREM-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "172.31.105.37","172.31.105.38"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_6" {
  display_name = "TF-EU1-SG-DRES335-CPREM-JH_2"
  nsx_id       = "TF-EU1-SG-DRES335-CPREM-JH_2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "172.31.140.136","172.31.140.137"
      ]
    }
  }
}
resource "nsxt_policy_group" "grp_9" {
  display_name = "TF-EU1-SG-DRES335-CPREM-HOST-SL1"
  nsx_id       = "TF-EU1-SG-DRES335-CPREM-HOST-SL1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "172.31.105.31","172.31.105.32","172.31.105.33","172.31.105.34"
      ]
    }
  }
}
resource "nsxt_policy_group" "grp_10" {
  display_name = "TF-EU1-SG-DRES335-CPREM-HOST-SL1_2"
  nsx_id       = "TF-EU1-SG-DRES335-CPREM-HOST-SL1_2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "172.22.118.91","172.22.118.92"
      ]
    }
  }
}
resource "nsxt_policy_group" "grp_11" {
  display_name = "TF-EU1-SG-DRES335-CPREM-HOST-Netcool"
  nsx_id       = "TF-EU1-SG-DRES335-CPREM-HOST-Netcool"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "172.31.140.134","172.31.140.135"
      ]
    }
  }
}
resource "nsxt_policy_group" "grp_12" {
  display_name = "TF-EU1-SG-DRES335-CPREM-HOST-SL1_3"
  nsx_id       = "TF-EU1-SG-DRES335-CPREM-HOST-SL1_3"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "172.31.140.130","172.31.140.131","172.31.140.132","172.31.140.133","172.22.118.91","172.22.118.92"
      ]
    }
  }
}