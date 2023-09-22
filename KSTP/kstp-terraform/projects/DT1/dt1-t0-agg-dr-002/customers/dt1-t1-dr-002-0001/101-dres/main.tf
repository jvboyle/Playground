# Current Default for T0 Levels 
data "nsxt_policy_tier0_gateway" "T0_0" {
  display_name = "dt1-t0-agg-dr-002"
}

data "nsxt_policy_transport_zone" "vm_overlay_01" {
  display_name = "dt1-nsxt-tz-vm-overlay"
}

data "nsxt_policy_edge_cluster" "EC_01" {
  display_name = "agg-dr002-etn-cluster"
}

module "dres3" {
  source   = "../../../../../../modules/nsxt/dres-basic"
  project = var.project
  environment = var.environment
  display_name = var.customer # T1 Name
  nsx_id   = var.customer  
  segment_name = "${var.customer}-internal-01"   # "dt1-dr-002-0001-internal-01" - dt1-t1-dr-002-0001-internal-01
  subnet_cidr = "100.120.7.1/25"
  edge_cluster_path = data.nsxt_policy_edge_cluster.EC_01.path
  tier0_path = data.nsxt_policy_tier0_gateway.T0_0.path
  transport_zone_path = data.nsxt_policy_transport_zone.vm_overlay_01.path
}

resource "nsxt_policy_segment" "pol_seg_01" {
  display_name        = "${var.customer}-internal-01"
  description         = "Terraform provisioned Segment"
  connectivity_path   = module.dres3.t1_path
  transport_zone_path = data.nsxt_policy_transport_zone.vm_overlay_01.path  #data.nsxt_policy_transport_zone.vm_overlay_01.path
  
  subnet {
    cidr        = "100.120.7.1/25"
  }
  
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}