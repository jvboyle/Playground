/*
resource "nsxt_policy_service" "svc" {
   for_each = var.map_svc
   #key = service name
   display_name = each.key
   nsx_id = each.key
   tag {
       tag = "TF"
   }
   dynamic "l4_port_set_entry" {
      #each.value = map of TCP,UDP or IP list where l4_port_set_entry.key will be TCP or UDP
      #the for_each contain a for loop with filter to create the l4_port_set_entry only if there is a list with TCP or UDP as name
      for_each = { for key,val in each.value : key => val if key == "TCP" || key == "UDP" }
	  content {
	     display_name = "${l4_port_set_entry.key}_${each.key}"
	     protocol = l4_port_set_entry.key
	     destination_ports = l4_port_set_entry.value
      }
   }
*/

/*
resource "nsxt_policy_service" "port_2222" {
    display_name = "1_test_2222"
   
l4_port_set_entry {
    display_name      = "1_test_2222"
    protocol          = "TCP"
    destination_ports = ["2222"]
  }
l4_port_set_entry {
    display_name      = "1_test_2223"
    protocol          = "TCP"
    destination_ports = ["2223"]
 }
*/

resource "nsxt_policy_service" "svc" {
   for_each = var.map_svc
   #key = service name
   display_name = each.key
   nsx_id = each.key
   tag {
       tag = "TF"
   }

   dynamic "l4_port_set_entry" {
      #each.value = map of TCP,UDP or IP list where l4_port_set_entry.key will be TCP or UDP
      #the for_each contain a for loop with filter to create the l4_port_set_entry only if there is a list with TCP or UDP as name
      for_each = { for key,val in each.value : key => val if key == "TCP" || key == "UDP" }
	  content {
	     display_name = "${l4_port_set_entry.key}_${each.key}"
	     protocol = l4_port_set_entry.key
	     destination_ports = l4_port_set_entry.value
      }
   }
}