
#ipsets
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-IN1-Client-DRES311-CACF-Proxy-VIP"
  nsx_id       = "TF-IN1-Client-DRES311-CACF-Proxy-VIP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "100.126.161.50"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-IN1-Client-premise-DRES311-JH"
  nsx_id       = "TF-IN1-Client-premise-DRES311-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "172.27.0.64",
        "172.27.0.65"
      ]
    }
  }
}

resource "nsxt_policy_group" "grp_3" {
  display_name = "TF-IN1-VM-in1d311lpcacprx1"
  nsx_id       = "TF-IN1-VM-in1d311lpcacprx1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "in1d311lpcacprx1"
    }
  }
}

resource "nsxt_policy_group" "grp_4" {
  display_name = "TF-IN1-VM-in1d311lpcacprx2"
  nsx_id       = "TF-IN1-VM-in1d311lpcacprx2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "in1d311lpcacprx2"
    }
  }
}


#groups 
resource "nsxt_policy_group" "grp_5" {
  display_name = "TF-IN1-SG-DRES311-CACF-Proxy"
  nsx_id       = "TF-IN1-SG-DRES311-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-IN1-VM-in1d311lpcacprx1",
        "/infra/domains/default/groups/TF-IN1-VM-in1d311lpcacprx2"
      ]
    }
  }
}

resource "nsxt_policy_group" "grp_6" {
  display_name = "TF-IN1-VM-in1sr1lpcacfbds"
  nsx_id       = "TF-IN1-VM-in1sr1lpcacfbds"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "in1sr1lpcacfbds"
    }
  }
}

resource "nsxt_policy_group" "grp_7" {
  display_name = "TF-IN1-NET-CPREM-GSNI-NAT-Range"
  nsx_id       = "TF-IN1-NET-CPREM-GSNI-NAT-Range"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "158.87.104.0/24"
      ]
    }
  }
}
