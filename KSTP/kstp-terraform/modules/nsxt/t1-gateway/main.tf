terraform {
  required_providers {
    nsxt = {
      source  = "vmware/nsxt"
      version = ">= 3.0"
    }
  }
}

resource "nsxt_policy_tier1_gateway" "T1" {
  description               = "Tier-1 provisioned by Terraform"
  display_name              = var.display_name # "ag1-t1-dr-001-0003"
  nsx_id                    = var.nsx_id
  edge_cluster_path         = var.edge_cluster_path #data.nsxt_policy_edge_cluster.EC_01.path
  failover_mode             = "NON_PREEMPTIVE"
  default_rule_logging      = "false"
  enable_firewall           = "true"
  enable_standby_relocation = "false"
  tier0_path                = var.tier0_path # data.nsxt_policy_tier0_gateway.T0_0.path
  route_advertisement_types = ["TIER1_CONNECTED", "TIER1_IPSEC_LOCAL_ENDPOINT"]
  pool_allocation           = "ROUTING"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
