terraform {
  required_providers {
    nsxt = {
      source  = "vmware/nsxt"
      version = ">= 3.1.1"
    }
  }
}

resource "nsxt_policy_group" "grp" {
  for_each     = var.map_grp
  display_name = each.key
  nsx_id       = each.key
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  dynamic "criteria" {
    #The for_each contain a for loop with filter to create the criteriia only if there is a list with the name NAME
    for_each = { for key, val in each.value : key => val if key == "VM" }
    content {

      dynamic "condition" {
        #looping over the set to create every tags
        for_each = criteria.value

        content {
          key         = "Name"
          member_type = "VirtualMachine"
          #operator = condition.value["oper"]
          operator = "EQUALS" #starts_with
          #value = condition.value["vm"]
          value = condition.value
        }
      }
    }
  }

  dynamic "criteria" {
    #The for_each contain a for loop with filter to create the criteriia only if there is a list with the name IP
    for_each = { for key, val in each.value : key => val if key == "IP" }
    content {
      ipaddress_expression {
        ip_addresses = criteria.value
      }
    }
  }
}
