# https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_service
# THis is not a full example but one we use for migration, see link for Full resource block usage

resource "nsxt_policy_service" "service_l4port" {
  description  = "L4 ports service provisioned by Terraform"
  display_name = "Service_Name"
  nsx_id       = "Service_Name" # match display_name

  l4_port_set_entry {
    display_name      = "TCP80"
    description       = "TCP port 80 entry"
    protocol          = "TCP"
    destination_ports = ["80"]
  }

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
