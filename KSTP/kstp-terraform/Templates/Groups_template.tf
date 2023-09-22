# https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_group
# THis is not a full example but one we use for migration, see link for Full resource block usage

resource "nsxt_policy_group" "grp_1" {
  display_name = "GIVE_NAME"
  nsx_id       = "GIVE_NAME" #match display_name
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  # criteria based on the VM Name 
  criteria {
    condition {
      key         = "Name"           # ComputerName, OSName or Name
      member_type = "VirtualMachine" # VirtualMachine, VirtualNetworkInterface, CloudNativeServiceInstance, or PhysicalServer. Defaults to VirtualMachine.
      operator    = "EQUALS"         # CONTAINS, ENDSWITH, EQUALS, NOTEQUALS or STARTSWITH
      value       = "vm_name "
    }
  }
  # this adds an OR to the policy , match VM name OR the IP 
  conjunction {
    operator = "OR"
  }
  # ip of a vm , can be a single ip or cidr or list of strings 
  criteria {
    ipaddress_expression {
      ip_addresses = ["9.9.9.9"]
    }
  }
}


