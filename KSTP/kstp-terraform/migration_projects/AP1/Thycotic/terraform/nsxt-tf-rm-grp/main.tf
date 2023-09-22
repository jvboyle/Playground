#Loading groups module
module "nsxt-tf-cm-grp" {
   source = "../../../../Tools/terraform/modules/nsxt-tf-cm-grp"
   map_grp = var.map_grp
}
