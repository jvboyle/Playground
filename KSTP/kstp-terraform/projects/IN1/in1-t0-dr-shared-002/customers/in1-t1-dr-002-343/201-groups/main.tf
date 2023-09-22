
#ipsets
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-IN1-Client-DRES343-CACF-Proxy-VIP"
  nsx_id       = "TF-IN1-Client-DRES343-CACF-Proxy-VIP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "100.126.177.50"
      ]
    }
  }
}


resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-IN1-Client-premise-DRES343-JH"
  nsx_id       = "TF-IN1-Client-premise-DRES343-JH"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = [
        "172.22.1.21",
        "172.22.1.22"
      ]
    }
  }
}

resource "nsxt_policy_group" "grp_3" {
  display_name = "TF-IN1-VM-in1d343lpcacprx1"
  nsx_id       = "TF-IN1-VM-in1d343lpcacprx1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "in1d343lpcacprx1"
    }
  }
}

resource "nsxt_policy_group" "grp_4" {
  display_name = "TF-IN1-VM-in1d343lpcacprx2"
  nsx_id       = "TF-IN1-VM-in1d343lpcacprx2"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "in1d343lpcacprx2"
    }
  }
}


#groups 
resource "nsxt_policy_group" "grp_5" {
  display_name = "TF-IN1-SG-DRES343-CACF-Proxy"
  nsx_id       = "TF-IN1-SG-DRES343-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-IN1-VM-in1d343lpcacprx1",
        "/infra/domains/default/groups/TF-IN1-VM-in1d343lpcacprx2"
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
