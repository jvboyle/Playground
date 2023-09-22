locals {
  bgb_neighbor = [
    "100.120.66.1", #dt1-t0-agg-private-01
    "100.120.66.2", #dt1-t0-agg-private-01
    "100.120.66.3", #dt1-t0-sres-01
    "100.120.66.4", #dt1-t0-sres-01
    "100.120.66.5", #dt1-t0-agg-public-01
    "100.120.66.6", #dt1-t0-agg-public-01
    "100.120.66.7", #dt1-t0-pdr-01
    "100.120.66.8", #dt1-t0-pdr-01
    #"100.120.66.11", #dt1-t0-agg-dr-001
    #"100.120.66.12", #dt1-t0-agg-dr-001
    #"100.120.66.13", #dt1-t0-agg-dr-002
    #"100.120.66.14"  #dt1-t0-agg-dr-002
    ]
}

data "nsxt_policy_tier0_gateway" "select" {
  display_name = var.project
}

data "nsxt_policy_gateway_locale_service" "select" {
  gateway_path = data.nsxt_policy_tier0_gateway.select.path
}

resource "nsxt_policy_bgp_neighbor" "bpg_neighbor" {
  for_each   = toset(local.bgb_neighbor)
  display_name          = each.key
  description           = "Terraform provisioned BgpNeighborConfig"
  bgp_path              = data.nsxt_policy_gateway_locale_service.select.bgp_path
  #allow_as_in           = true
  graceful_restart_mode = "HELPER_ONLY"
  hold_down_time        = 180
  keep_alive_time       = 60
  neighbor_address      = each.key
  #password              = "passw0rd"
  remote_as_num         = "65000"
  #source_addresses      = [data.nsxt_policy_edge_node.node0.id]
  source_addresses = ["100.120.66.11","100.120.66.12"]

  bfd_config {
    enabled  = true
    interval = 500
    multiple = 3
  } 
}