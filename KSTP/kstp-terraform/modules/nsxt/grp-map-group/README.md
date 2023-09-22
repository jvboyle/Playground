#Loading groups module
module "grp" {
   source = "../../../../../Tools/terraform/modules/grp-map-group"
   map_grp = var.map_grp
   project = var.project
   environment = var.environment
}
