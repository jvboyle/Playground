#Loading groups module
module "nsxt-tf-cm-grp" {
   source = "../../../../../modules/nsxt/grp-map-group"
   map_grp = var.map_grp
   project = var.project
   environment = var.environment
   customer = var.customer
}
