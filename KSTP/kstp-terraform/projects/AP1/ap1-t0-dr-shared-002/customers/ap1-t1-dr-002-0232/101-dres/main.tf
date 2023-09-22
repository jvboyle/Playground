# Current Default for T0 Levels 
data "nsxt_policy_tier0_gateway" "T0_0" {
  display_name = "ap1-t0-dr-shared-002"
}

data "nsxt_policy_transport_zone" "vm_overlay_01" {
  display_name = "ap1-nsxt-tz-vm-overlay"
}

data "nsxt_policy_edge_cluster" "EC_01" {
  display_name = "ap1-dres-etn-cluster-002"
}

locals {
  segment_cidr = "100.80.112.1/24"
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
  display_name = "${var.customer}-internal-01"
  description  = "Terraform provisioned Segment"
  # connectivity_path   = module.dres.t1_path
  transport_zone_path = data.nsxt_policy_transport_zone.vm_overlay_01.path

  # this is the Gateway IP , 1st oct of the cidr 
  subnet {
    cidr = local.segment_cidr
  }

  # this section is pulled when attaching the seg/t1 , added based on PLAN output, tobe removed after vmotion is complete 
  #bridge_config {
  #  profile_path        = "/infra/sites/default/enforcement-points/default/edge-bridge-profiles/l2bridge-profile04"
  #  transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/99c6a37c-e728-42a4-bca7-b9ddedc3cbf9"
  #  vlan_ids            = ["0"]
  #}

  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
}
