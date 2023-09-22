data "nsxt_policy_service" "services" {
   for_each = toset(var.map_services["SERVICES"])
   display_name = each.key
}

data "nsxt_policy_group" "groups" {
   for_each = toset(var.map_groups["GROUPS"])
   display_name = each.key
}

module "nsxt-tf-cm-dfw" {
   
   source = "../../../../../kstp-terraform/Tools/terraform/modules/nsxt-tf-cm-dfw"
   map_policies = var.map_policies
   nsxt_policy_svc_svc = data.nsxt_policy_service.services
   nsxt_policy_grp_grp = data.nsxt_policy_group.groups
}
  
#resource "nsxt_policy_security_policy" "DRES114"{
#   display_name = "DRES114"
#} 



