data "nsxt_policy_edge_cluster" "ec" {
  display_name = "ag1-tactical-etn-cluster-01" #Edge Cluster Name from SS
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
  transit_subnets      = ["100.64.48.24/30"] #T0-T1 Transit Subnet
  edge_cluster_path    = data.nsxt_policy_edge_cluster.ec.path

  bgp_config {
    local_as_num    = "65001" #Local AS
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
  segment_path   = "/infra/segments/ag1-public-t0-uplinks-vlan786" # get segement path from GUI 
  subnets        = ["150.239.66.125/24"]                           #T0 Public Interface1 IP
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
  segment_path   = "/infra/segments/ag1-public-t0-uplinks-vlan786" # get segement path from GUI 
  subnets        = ["150.239.66.126/24"]                           #T0 Public Interface2 IP
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
  segment_path   = "/infra/segments/ag1-provider-transit-1" # get segement path from GUI 
  subnets        = ["100.64.65.13/24"]                      #T0 Transit Downlink Interface1 IP
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
  segment_path   = "/infra/segments/ag1-provider-transit-1" # get segement path from GUI 
  subnets        = ["100.64.65.14/24"]                      #T0 Transit Downlink Interface2 IP
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