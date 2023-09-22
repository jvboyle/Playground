data "nsxt_policy_edge_cluster" "ec" {
  display_name = "eu1-dres-etn-cluster-0341"
}

data "nsxt_policy_edge_node" "node0" {
  edge_cluster_path = data.nsxt_policy_edge_cluster.ec.path
  member_index      = 0
}

data "nsxt_policy_edge_node" "node1" {
  edge_cluster_path = data.nsxt_policy_edge_cluster.ec.path
  member_index      = 1
}

resource "nsxt_policy_tier0_gateway" "tier0_gw" {
  description          = "Tier-0 provisioned by Terraform"
  display_name         = var.project # value from Project DIR 
  failover_mode        = "NON_PREEMPTIVE"
  default_rule_logging = false
  enable_firewall      = true
  ha_mode              = "ACTIVE_STANDBY"
  transit_subnets      = ["100.72.48.96/30"]
  edge_cluster_path    = data.nsxt_policy_edge_cluster.ec.path

  bgp_config {
    local_as_num    = "65002"
    multipath_relax = true
    ecmp            = false
  }

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#### Public Interfaces 
resource "nsxt_policy_tier0_gateway_interface" "if1" {
  display_name   = "${var.project}-private-uplink-01" # eu1-t0-dr-0341-private-uplink-01
  type           = "EXTERNAL"
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = "/infra/segments/eu1-private-t0-uplinks-vlan1408"
  subnets        = ["10.214.32.10/24"] #
  edge_node_path = data.nsxt_policy_edge_node.node0.path
}

resource "nsxt_policy_tier0_gateway_interface" "if2" {
  display_name   = "${var.project}-private-uplink-02" #
  type           = "EXTERNAL"
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = "/infra/segments/eu1-private-t0-uplinks-vlan1408"
  subnets        = ["10.214.32.11/24"] #
  edge_node_path = data.nsxt_policy_edge_node.node1.path
}

#Private Interfaces 
resource "nsxt_policy_tier0_gateway_interface" "if3" {
  display_name   = "${var.project}-transit-downlink-01" #
  type           = "EXTERNAL"
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = "/infra/segments/eu1-provider-transit-01"
  subnets        = ["100.72.66.23/23"] #
  edge_node_path = data.nsxt_policy_edge_node.node0.path
}

resource "nsxt_policy_tier0_gateway_interface" "if4" {
  display_name   = "${var.project}-transit-downlink-02" #
  type           = "EXTERNAL"
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = "/infra/segments/eu1-provider-transit-01"
  subnets        = ["100.72.66.24/23"] #
  edge_node_path = data.nsxt_policy_edge_node.node1.path
}


resource "nsxt_policy_gateway_redistribution_config" "t0_route" {
  gateway_path = nsxt_policy_tier0_gateway.tier0_gw.path
  bgp_enabled  = true
}

resource "nsxt_policy_gateway_redistribution_config" "test" {
  gateway_path = nsxt_policy_tier0_gateway.tier0_gw.path
  bgp_enabled  = true
  ospf_enabled = true

  rule {
    name  = "redistribute-bgp"
    types = ["TIER1_SEGMENT"]
  }
}

#open 
# https://10.175.10.136/nsx/#/app/security/edge/module/allRules
# GW firewall , select t0 , set policy default tp drop