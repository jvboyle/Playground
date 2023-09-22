locals {
  bgb_neighbor = [
    "100.64.65.1", #ag1-t0-agg-private-01
    "100.64.65.2", #ag1-t0-agg-private-01
    "100.64.65.3", #ag1-t0-sres-01
    "100.64.65.4", #ag1-t0-sres-01
    "100.64.65.5", #ag1-t0-agg-public-01
    "100.64.65.6", #ag1-t0-agg-public-01
    "100.64.65.7", #ag1-t0-pdr-01
    "100.64.65.8", #ag1-t0-pdr-01
    # "100.64.65.13" # ag1-t0-tactical-01
    # "100.64.65.14" # ag1-t0-tactical-01
    "100.64.65.220", #ag1-t0-v2t-01
    "100.64.65.221"  #ag1-t0-v2t-01
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
  remote_as_num = "65001"
  #source_addresses      = [data.nsxt_policy_edge_node.node0.id]
  source_addresses = ["100.64.65.13", "100.64.65.14"]

  bfd_config {
    enabled  = true
    interval = 500
    multiple = 3
  }
}
