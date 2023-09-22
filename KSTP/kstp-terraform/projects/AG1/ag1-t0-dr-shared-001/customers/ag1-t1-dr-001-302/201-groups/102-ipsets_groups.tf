
#IP Sets
resource "nsxt_policy_group" "grp_300" {
   display_name = "TF-${var.environment}-IPSET-DR${local.dres}-${local.consumable_service}-Proxy-Vip"
   nsx_id = "TF-${var.environment}-IPSET-DR${local.dres}-${local.consumable_service}-Proxy-Vip"
   description  = local.change
   tag {
      tag = "TF-${var.customer}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.64.210.50"
                        ]
      }
   }
}
resource "nsxt_policy_group" "grp_301" {
   display_name = "TF-${var.environment}-IPSET-DR${local.dres}-${local.consumable_service}-CPREM-SFS-RELAY-SCOPE"
   nsx_id = "TF-${var.environment}-IPSET-DR${local.dres}-${local.consumable_service}-CPREM-SFS-RELAY-SCOPE"
   description  = local.change
   tag {
      tag = "TF-${var.customer}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "135.31.158.28",
                         "135.41.104.224",
                         "135.41.8.55",
                         "135.31.158.45",
                         "135.31.158.28",
                         "132.201.80.73",
                         "155.241.248.113",
                         "155.241.249.113",
                         "155.241.249.61",
                         "135.153.226.225",
                         "32.77.77.31"
                        ]
      }
   }
}

