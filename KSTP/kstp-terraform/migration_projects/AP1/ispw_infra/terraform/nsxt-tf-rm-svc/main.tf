#Loading services module
module "nsxt-tf-cm-svc" {
   source = "../../../../../kstp-terraform/Tools/terraform/modules/nsxt-tf-cm-svc"
   map_svc = var.map_svc
}
