# Current Default for T0 Levels 
data "nsxt_policy_tier0_gateway" "T0_0" {
  display_name = var.project
}

data "nsxt_policy_transport_zone" "vm_overlay_01" {
  display_name = "in1-kstp-tz-vm-overlay"
}

data "nsxt_policy_edge_cluster" "EC_01" {
  display_name = "in1-dres-etn-cluster-001"
}

locals {
  segment_cidr = "100.126.169.1/24"
}

module "dres" {
  source              = "../../../../../../modules/nsxt/t1-gateway"
  project             = var.project
  environment         = var.environment
  display_name        = var.customer # T1 Name
  nsx_id              = var.customer
  segment_name        = "${var.customer}-internal-01"
  subnet_cidr         = local.segment_cidr
  edge_cluster_path   = data.nsxt_policy_edge_cluster.EC_01.path
  tier0_path          = data.nsxt_policy_tier0_gateway.T0_0.path
  transport_zone_path = data.nsxt_policy_transport_zone.vm_overlay_01.path
  customer            = var.customer
}

# running 1st pass to create but not attach to t0 
# init - build with no ip  
resource "nsxt_policy_segment" "pol_seg_01" {
  display_name        = "${var.customer}-internal-01"
  description         = "Terraform provisioned Segment"
  connectivity_path   = module.dres.t1_path
  transport_zone_path = data.nsxt_policy_transport_zone.vm_overlay_01.path

  # this is the Gateway IP , 1st oct of the cidr 
  subnet {
    cidr = local.segment_cidr
  }

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
