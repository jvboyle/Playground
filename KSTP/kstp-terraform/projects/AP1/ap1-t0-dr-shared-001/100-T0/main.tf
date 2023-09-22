data "nsxt_policy_edge_cluster" "ec" {
  display_name = "ap1-dres-etn-cluster-000"
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
  display_name         = var.project
  failover_mode        = "NON_PREEMPTIVE"
  default_rule_logging = false
  enable_firewall      = true
  ha_mode              = "ACTIVE_STANDBY"
  transit_subnets      = ["100.80.48.32/27"]
  edge_cluster_path    = data.nsxt_policy_edge_cluster.ec.path

  bgp_config {
    local_as_num    = "65003"
    multipath_relax = true
    ecmp            = false
  }

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}

#### Public Interfaces 
resource "nsxt_policy_tier0_gateway_interface" "if1" {
  display_name   = "${var.project}-public-uplink-01"
  type           = "EXTERNAL"
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = "/infra/segments/ap1-public-t0-uplinks-vlan1113"
  subnets        = ["168.1.103.253/26"]
  edge_node_path = data.nsxt_policy_edge_node.node0.path

  lifecycle {
    ignore_changes = [
      gateway_path
    ]
  }
}

resource "nsxt_policy_tier0_gateway_interface" "if2" {
  display_name   = "${var.project}-public-uplink-02"
  type           = "EXTERNAL"
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = "/infra/segments/ap1-public-t0-uplinks-vlan1113"
  subnets        = ["168.1.103.254/26"]
  edge_node_path = data.nsxt_policy_edge_node.node1.path

  lifecycle {
    ignore_changes = [
      gateway_path
    ]
  }
}

#Private Interfaces 
resource "nsxt_policy_tier0_gateway_interface" "if3" {
  display_name   = "${var.project}-transit-downlink-01"
  type           = "EXTERNAL"
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = "/infra/segments/ap1-provider-transit-01"
  subnets        = ["100.80.66.149/23"]
  edge_node_path = data.nsxt_policy_edge_node.node0.path

  lifecycle {
    ignore_changes = [
      gateway_path
    ]
  }
}

resource "nsxt_policy_tier0_gateway_interface" "if4" {
  display_name   = "${var.project}-transit-downlink-02"
  type           = "EXTERNAL"
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = "/infra/segments/ap1-provider-transit-01"
  subnets        = ["100.80.66.150/23"]
  edge_node_path = data.nsxt_policy_edge_node.node1.path

  lifecycle {
    ignore_changes = [
      gateway_path
    ]
  }
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
    types = ["TIER1_SEGMENT", "TIER1_IPSEC_LOCAL_ENDPOINT"]
  }
}



#open 
# https://10.63.70.200/nsx/#/app/security/edge/module/allRules
# GW firewall , select t0 , set policy default tp drop 
