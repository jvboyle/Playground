terraform {
   required_providers {
      nsxt = {
         source = "vmware/nsxt"
         version = ">= 3.1.1"
      }
   }
}

#Nested for_each loop to loop over the policies then all the rules
resource "nsxt_policy_security_policy" "policies" {
   for_each = var.map_policies
       display_name = each.key
       category = each.value["category"]
       locked          = try(each.value["locked"],false)
	    tcp_strict      = try(each.value["tcp_strict"],true)
	    stateful        = try(each.value["stateful"],true)
       nsx_id          = try(each.value["nsx_id"],replace(each.key," ","_"))
       comments        = try(each.value["comments"],"")
       sequence_number = try(each.value["sequence_number"],0)
       dynamic "rule" {
          for_each = each.value["rules"]

              content {
                  tag {
                     tag = "TF-${var.project}-${var.environment}"
                  }
                  display_name = rule.value["display_name"]
		            source_groups = concat([for x in try(rule.value["source_groups"],[]) : var.nsxt_policy_grp_grp[x].path],
                                          try(rule.value["source_ips"],[]),
                                          try(rule.value["source_gr_paths"],[])
                                        )
		            destination_groups = concat([for x in try(rule.value["destination_groups"],[]) : var.nsxt_policy_grp_grp[x].path],
                                               try(rule.value["destination_ips"],[]),
                                               try(rule.value["destination_gr_paths"],[])
                                             )
		            action = rule.value["action"]
		            services = concat([for x in try(rule.value["services"],[]) : var.nsxt_policy_svc_svc[x].path],
                                    try(rule.value["service_paths"],[])
                                   )  
		            scope = concat([for x in try(rule.value["scope"],[]) : try(var.nsxt_policy_grp_grp[x].path)],
                                 try(rule.value["scope_paths"],[])
                                )
		            disabled = try(rule.value["disabled"],false)
                  direction             = try(rule.value["direction"],"IN_OUT")
		            ip_version            = try(rule.value["ip_version"],"IPV4_IPV6")
		            logged                = try(rule.value["logged"],false)
		            sources_excluded      = try(rule.value["sources_excluded"],false)
                  destinations_excluded = try(rule.value["destinations_excluded"],false)
                  #nsx_id                = try(rule.value["nsx_id"],replace(rule.value["display_name"]," ","_")) 
                  #sequence_number = try(rule.value["sequence_number"],0)
              }  
       }
}