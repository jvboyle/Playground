locals {
  bgb_neighbor = [
    "100.80.66.1", #ap1-t0-agg-private-01
    "100.80.66.2", #ap1-t0-agg-private-01
    "100.80.66.3", #ap1-t0-sres-01
    "100.80.66.4", #ap1-t0-sres-01
    # "100.80.66.149", #ap1-t0-dr-0290
    # "100.80.66.150", #ap1-t0-dr-0290
    "100.80.66.220", #ap1-t0-v2t-01
    "100.80.66.221", #ap1-t0-v2t-01
    # "100.80.66.13" # ap1-t0-tactical-01
    # "100.80.66.14" # ap1-t0-tactical-01
    "100.80.66.152", #ap1-t0-dr-shared-002
    "100.80.66.153" #ap1-t0-dr-shared-002
  ]
}

data "nsxt_policy_tier0_gateway" "select" {
  display_name = var.project
}

data "nsxt_policy_gateway_locale_service" "select" {
  gateway_path = data.nsxt_policy_tier0_gateway.select.path
}

resource "nsxt_policy_bgp_neighbor" "bpg_neighbor" {
  for_each     = toset(local.bgb_neighbor)
  display_name = each.key
  description  = "Terraform provisioned BgpNeighborConfig"
  bgp_path     = data.nsxt_policy_gateway_locale_service.select.bgp_path
  #allow_as_in           = true
  graceful_restart_mode = "HELPER_ONLY"
  hold_down_time        = 180
  keep_alive_time       = 60
  neighbor_address      = each.key
  #password              = "passw0rd"
  remote_as_num = "65003"
  #source_addresses      = [data.nsxt_policy_edge_node.node0.id]
  source_addresses = ["100.80.66.13", "100.80.66.14"]

  bfd_config {
    enabled  = true
    interval = 500
    multiple = 3
  }
}
