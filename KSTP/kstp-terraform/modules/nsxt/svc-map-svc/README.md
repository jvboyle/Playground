#Loading services module
module "svc" {
   source = "../../../../../Tools/terraform/modules/svc-map-svc"
   map_svc = var.map_svc
   project = var.project
   environment = var.environment
}
