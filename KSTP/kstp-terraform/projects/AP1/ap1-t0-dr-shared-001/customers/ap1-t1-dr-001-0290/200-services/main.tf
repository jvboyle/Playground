#Loading services module
module "nsxt-tf-cm-svc" {
  source      = "../../../../../../modules/nsxt/svc-map-svc"
  map_svc     = var.map_svc
  project     = var.project
  environment = var.environment
  customer    = var.customer
}
