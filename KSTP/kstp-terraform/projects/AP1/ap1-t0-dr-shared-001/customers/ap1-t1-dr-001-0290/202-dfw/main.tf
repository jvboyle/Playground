data "nsxt_policy_service" "services" {
  for_each     = toset(var.map_services["SERVICES"])
  display_name = each.key
}

data "nsxt_policy_group" "groups" {
  for_each     = toset(var.map_groups["GROUPS"])
  display_name = each.key
}

data "nsxt_policy_tier0_gateway" "T0_0" {
  display_name = "ap1-t0-dr-shared-001"
}

data "nsxt_policy_tier1_gateway" "T1_0" {
  display_name = "ap1-t1-dr-001-0290"
}

module "nsxt-tf-cm-dfw" {
  source              = "../../../../../../modules/nsxt/dfw-map-pol"
  map_policies        = var.map_policies
  nsxt_policy_svc_svc = data.nsxt_policy_service.services
  nsxt_policy_grp_grp = data.nsxt_policy_group.groups
  project             = var.project
  environment         = var.environment
  customer            = var.customer
}

# T1-gateway policy * mirror of dfw but only applied to t1 scope
module "t1-gw-map-fw-pol" {
  source              = "../../../../../../modules/nsxt/t1-gw-map-fw-pol"
  map_policies        = var.map_policies
  nsxt_policy_svc_svc = data.nsxt_policy_service.services
  nsxt_policy_grp_grp = data.nsxt_policy_group.groups
  project             = var.project
  environment         = var.environment
  customer            = var.customer
  scope               = [data.nsxt_policy_tier1_gateway.T1_0.path]
}

