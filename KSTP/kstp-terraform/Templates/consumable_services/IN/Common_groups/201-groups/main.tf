
# only create once per Geo
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-IN1-VM-$bds_server"
  nsx_id       = "TF-IN1-VM-$bds_server"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "$bds_server"
    }
  }
}


resource "nsxt_policy_group" "grp_2" {
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
