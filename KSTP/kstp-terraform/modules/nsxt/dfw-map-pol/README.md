How to use 
```

data "nsxt_policy_service" "services" {
   for_each = toset(var.map_services["SERVICES"])
   display_name = each.key
}

data "nsxt_policy_group" "groups" {
   for_each = toset(var.map_groups["GROUPS"])
   display_name = each.key
}

module "dfw" {
   source = "../../../../../Tools/terraform/modules/dfw-map-pol"
   map_policies = var.map_policies
   nsxt_policy_svc_svc = data.nsxt_policy_service.services
   nsxt_policy_grp_grp = data.nsxt_policy_group.groups
   project = var.project
   environment = var.environment
}
```