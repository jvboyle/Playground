
locals {
  change   = "RITM0145085/CHGEU0200098"
  dres     = "327"
  dc1_vm   = "ag1d${local.dres}wpafidc1"
  dc2_vm   = "ag1d${local.dres}wpafidc2"
  arx_vm   = "ag1dr${local.dres}lpafiarx"
  stw_vm   = "ag1d${local.dres}wpafistw"
  stl_vm   = "ag1dr${local.dres}lpafistl"
  fm_vm    = "ag1dr${local.dres}lpafifm"
  skl_vm   = "ag1dr${local.dres}lpafiskl"
  ocum_vm  = "ag1dr${local.dres}lpafiocum"
  VM_list  = ["${local.dc1_vm}", 
              "${local.dc2_vm}",
              "${local.arx_vm}",
              "${local.stw_vm}",
              "${local.stl_vm}",
              "${local.fm_vm}",
              "${local.skl_vm}",
              "${local.ocum_vm}",]
           
}

#VMs
resource "nsxt_policy_group" "grp_1" {
  for_each = toset(local.VM_list)
  display_name = "TF-AG1-VM-${each.value}"
  nsx_id       = "TF-AG1-VM-${each.value}"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = each.value
    }
  }
}

#AD Group 
resource "nsxt_policy_group" "grp_2" {
  display_name = "TF-AG1-SG-${local.dres}-GSTaaS-AD-DNS"
  nsx_id       = "TF-AG1-SG-${local.dres}-GSTaaS-AD-DNS"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-AG1-VM-${local.dc1_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.dc2_vm}"
      ]
    }
  }
  depends_on = [nsxt_policy_group.grp_1]
}

#AD-Clients
resource "nsxt_policy_group" "grp_3" {
  display_name = "TF-AG1-SG-${local.dres}-GSTaaS-AD-Clients"
  nsx_id       = "TF-AG1-SG-${local.dres}-GSTaaS-AD-Clients"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-AG1-VM-${local.arx_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.stw_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.stl_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.fm_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.skl_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.ocum_vm}"
      ]
    }
  }
  depends_on = [nsxt_policy_group.grp_1]
}

#Mail-Clients
resource "nsxt_policy_group" "grp_4" {
  display_name = "TF-AG1-SG-${local.dres}-GSTaaS-Mail-Clients"
  nsx_id       = "TF-AG1-SG-${local.dres}-GSTaaS-Mail-Clients"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    path_expression {
      member_paths = [
        "/infra/domains/default/groups/TF-AG1-VM-${local.arx_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.stw_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.fm_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.skl_vm}",
        "/infra/domains/default/groups/TF-AG1-VM-${local.ocum_vm}"
      ]
    }
  }
  depends_on = [nsxt_policy_group.grp_1]
}
