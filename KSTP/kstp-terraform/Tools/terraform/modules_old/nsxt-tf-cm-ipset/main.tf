terraform {
   required_providers {
      nsxt = {
         source = "vmware/nsxt"
         version = ">= 3.1.1"
      }
   }
}

resource "nsxt_ip_set" "ipset" {

   for_each = var.map_ipset
       display_name = each.key
       ip_addresses = each.value
       
}
