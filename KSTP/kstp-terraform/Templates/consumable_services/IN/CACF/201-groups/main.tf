
#ipsets
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-IN1-Client-DRESXXX-CACF-Proxy-VIP"
  nsx_id       = "TF-IN1-Client-DRESXXX-CACF-Proxy-VIP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "100.126.xxx.50"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-IN1-Client-premise-DRESxxx-JH"
  nsx_id       = "TF-IN1-Client-premise-DRESxxx-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "xxx.xxx.xxx.xxx",
        "xxx.xxx.xxx.xxx"
      ]
    }
  }
}

resource "nsxt_policy_group" "grp_3" {
  display_name = "TF-IN1-VM-$PROXY_NAME_1"
  nsx_id       = "TF-IN1-VM-$PROXY_NAME_1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "$PROXY_NAME_1"
    }
  }
}

resource "nsxt_policy_group" "grp_4" {
  display_name = "TF-IN1-VM-$PROXY_NAME_2"
  nsx_id       = "TF-IN1-VM-$PROXY_NAME_2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "$PROXY_NAME_2"
    }
  }
}


#groups 
resource "nsxt_policy_group" "grp_5" {
  display_name = "TF-IN1-SG-DRESxxx-CACF-Proxy"
  nsx_id       = "TF-IN1-SG-DRESxxx-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-IN1-VM-$PROXY_NAME_1",
        "/infra/domains/default/groups/TF-IN1-VM-$PROXY_NAME_2"
      ]
    }
  }
}
