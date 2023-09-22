
#ipsets
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-IN1-Client-DRES314-CACF-Proxy-VIP"
  nsx_id       = "TF-IN1-Client-DRES314-CACF-Proxy-VIP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "100.126.164.50"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-IN1-Client-premise-DRES314-JH"
  nsx_id       = "TF-IN1-Client-premise-DRES314-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "10.162.35.133"
      ]
    }
  }
}

resource "nsxt_policy_group" "grp_3" {
  display_name = "TF-IN1-VM-in1d314lpcacprx1"
  nsx_id       = "TF-IN1-VM-in1d314lpcacprx1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "in1d314lpcacprx1"
    }
  }
}

resource "nsxt_policy_group" "grp_4" {
  display_name = "TF-IN1-VM-in1d314lpcacprx2"
  nsx_id       = "TF-IN1-VM-in1d314lpcacprx2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "in1d314lpcacprx2"
    }
  }
}


#groups 
resource "nsxt_policy_group" "grp_5" {
  display_name = "TF-IN1-SG-DRES314-CACF-Proxy"
  nsx_id       = "TF-IN1-SG-DRES314-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-IN1-VM-in1d314lpcacprx1",
        "/infra/domains/default/groups/TF-IN1-VM-in1d314lpcacprx2"
      ]
    }
  }
}
