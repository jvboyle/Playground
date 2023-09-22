locals {
  bgb_neighbor = [
    # "100.126.128.1", #in1-t0-agg-private-01 
    # "100.126.128.2", #in1-t0-agg-private-01 
    "100.126.128.3",  #in1-t0-sres-01
    "100.126.128.4",  #in1-t0-sres-01
    "100.126.128.5",  #in1-t0-agg-public-01
    "100.126.128.6",  #in1-t0-agg-public-01
    "100.126.128.7",  #in1-t0-pdr-01
    "100.126.128.8",  #in1-t0-pdr-01
    "100.126.128.9",  #in1-t0-kyndryl-01
    "100.126.128.10", #in1-t0-kyndryl-01
    "100.126.128.11", # in1-t0-dr-shared-001
    "100.126.128.12"  # in1-t0-dr-shared-001
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
  remote_as_num = "65000"
  #source_addresses      = [data.nsxt_policy_edge_node.node0.id]
  source_addresses = ["100.126.128.1", "100.126.128.2"]

  bfd_config {
    enabled  = false
    interval = 500
    multiple = 3
  }
}
