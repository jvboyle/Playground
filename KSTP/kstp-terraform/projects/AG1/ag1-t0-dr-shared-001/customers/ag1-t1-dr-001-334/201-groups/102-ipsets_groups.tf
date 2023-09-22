
#IP Sets
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-${var.environment}-IPSET-DR${local.dres}-${local.consumable_service}-Proxy-Vip"
   nsx_id = "TF-${var.environment}-IPSET-DR${local.dres}-${local.consumable_service}-Proxy-Vip"
   description  = local.change
   tag {
      tag = "TF-${var.customer}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.216.50"
                        ]
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-${var.environment}-IPSET-DR${local.dres}-${local.consumable_service}-CPREM-JHOSTS"
   nsx_id = "TF-${var.environment}-IPSET-DR${local.dres}-${local.consumable_service}-CPREM-JHOSTS"
   description  = local.change
   tag {
      tag = "TF-${var.customer}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "216.96.68.178",
                         "216.96.68.179"
                        ]
      }
   }
}