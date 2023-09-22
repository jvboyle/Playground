# modules/nsxt/dres

<!-- TOC -->

- Use in project 
<!-- /TOC -->


### Use in project 
```
module "dres5" {
  source   = "../../../modules/nsxt/dres"
  nsx_id   = "dres5"  
  segment_name = "dres5"
  subnet_cidr = "100.65.5.1/24"
  display_name = "ag1-t1-dr-001-0003"
  edge_cluster_path = data.nsxt_policy_edge_cluster.EC_01.path
  tier0_path = data.nsxt_policy_tier0_gateway.T0_0.path
  transport_zone_path = data.nsxt_policy_transport_zone.vm_overlay_01.path
}
```
### Second run disable default policy

```
data "nsxt_policy_gateway_policy" "default" {
  category = "Default"
  display_name = "Policy_Default_Infra-tier1-${var.customer}"
}

resource "nsxt_policy_predefined_gateway_policy" "test" {
  path = data.nsxt_policy_gateway_policy.default.path

  default_rule {
    scope     = nsxt_policy_tier1_gateway.T1.path
    logged    = true
    action    = "DROP"
  }
}
```