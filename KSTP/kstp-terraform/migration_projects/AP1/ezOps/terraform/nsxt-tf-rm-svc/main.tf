#Loading services module
module "nsxt-tf-cm-svc" {
   source = "../../../../Tools/terraform/modules/nsxt-tf-cm-svc"
   map_svc = var.map_svc
}
