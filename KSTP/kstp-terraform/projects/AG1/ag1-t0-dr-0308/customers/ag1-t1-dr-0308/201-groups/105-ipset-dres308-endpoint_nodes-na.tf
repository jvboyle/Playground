
resource "nsxt_policy_group" "grp_750" {
   display_name = "TF-AG1-IPSET-Endpoint_Nodes-Canada"
   nsx_id = "TF-AG1-IPSET-Endpoint_Nodes-Canada"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "10.21.198.139",
                        "10.21.38.53",
                        "10.23.140.88",
                        "10.23.95.13",
                        "10.23.95.231",
                        "10.28.170.139",
                        "10.28.170.140",
                        "10.29.188.229",
                        "129.39.193.192/26",
                        "129.39.196.128/28",
                        "129.39.196.160/28",
                        "129.39.198.0/24",
                        "129.39.204.0/26",
                        "129.39.205.128/25",
                        "129.39.207.224/27",
                        "129.39.208.0/24",
                        "129.39.210.0/24",
                        "129.39.214.128/25",
                        "129.39.215.0/24",
                        "129.39.248.0/24",
                        "167.210.52.0/25",
                        "167.210.53.128/28",
                        "167.210.8.0/25",
                        "167.210.9.128/28",
                        "192.91.193.0/27",
                        "192.91.193.240/28",
                        "206.75.100.0/24",
                        "206.75.101.64/28",
                        "206.75.96.0/24",
                        "206.75.97.240/28"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_751" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-NA"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      path_expression {
         member_paths = [
                        "/infra/domains/default/groups/TF-AG1-IPSET-Endpoint_Nodes-Canada"
                        ]
      }
   }
}

