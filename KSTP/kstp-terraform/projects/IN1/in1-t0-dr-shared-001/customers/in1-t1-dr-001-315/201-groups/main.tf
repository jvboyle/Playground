
#ipsets
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-IN1-Client-DRES315-CACF-Proxy-VIP"
  nsx_id       = "TF-IN1-Client-DRES315-CACF-Proxy-VIP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "100.126.165.50"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-IN1-Client-premise-DRES315-JH"
  nsx_id       = "TF-IN1-Client-premise-DRES315-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        " 10.0.1.91"
      ]
    }
  }
}

resource "nsxt_policy_group" "grp_3" {
  display_name = "TF-IN1-VM-in1d315lpcacprx1"
  nsx_id       = "TF-IN1-VM-in1d315lpcacprx1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "in1d315lpcacprx1"
    }
  }
}

resource "nsxt_policy_group" "grp_4" {
  display_name = "TF-IN1-VM-in1d315lpcacprx2"
  nsx_id       = "TF-IN1-VM-in1d315lpcacprx2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "in1d315lpcacprx2"
    }
  }
}


#groups 
resource "nsxt_policy_group" "grp_5" {
  display_name = "TF-IN1-SG-DRES315-CACF-Proxy"
  nsx_id       = "TF-IN1-SG-DRES315-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-IN1-VM-in1d315lpcacprx1",
        "/infra/domains/default/groups/TF-IN1-VM-in1d315lpcacprx2"
      ]
    }
  }
}
