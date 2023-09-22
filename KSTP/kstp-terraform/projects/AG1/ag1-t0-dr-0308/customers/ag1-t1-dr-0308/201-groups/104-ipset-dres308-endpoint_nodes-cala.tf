
resource "nsxt_policy_group" "grp_725" {
   display_name = "TF-AG1-IPSET-Endpoint_Nodes-Argentina"
   nsx_id = "TF-AG1-IPSET-Endpoint_Nodes-Argentina"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "129.39.165.0/24",
                        "129.39.166.0/24",
                        "129.39.167.0/24",
                        "129.39.177.0/24",
                        "129.39.80.0/24",
                        "129.39.81.0/24",
                        "149.131.148.0/24",
                        "149.131.149.0/24",
                        "149.131.150.0/24",
                        "149.131.151.0/24",
                        "149.131.156.0/23",
                        "167.210.80.0/24",
                        "167.210.81.0/24"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_726" {
   display_name = "TF-AG1-IPSET-Endpoint_Nodes-Chile"
   nsx_id = "TF-AG1-IPSET-Endpoint_Nodes-Chile"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "129.39.174.0/24",
                        "129.39.176.0/24",
                        "129.39.83.0/24",
                        "129.39.87.0/24",
                        "129.39.86.0/24",
                        "129.39.180.0/24",
                        "129.39.181.0/24"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_727" {
   display_name = "TF-AG1-IPSET-Endpoint_Nodes-Colombia"
   nsx_id = "TF-AG1-IPSET-Endpoint_Nodes-Colombia"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "129.39.55.0/24",
                        "129.39.82.0/24",
                        "129.39.164.0/24",
                        "129.39.170.0/23",
                        "129.39.172.0/24",
                        "129.39.175.32/29",
                        "129.39.175.200/31",
                        "129.39.183.0/24"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_728" {
   display_name = "TF-AG1-IPSET-Endpoint_Nodes-Ecuador"
   nsx_id = "TF-AG1-IPSET-Endpoint_Nodes-Ecuador"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "129.39.73.0/24",
                        "158.98.4.0/24",
                        "158.98.5.0/24"
]
      }
   }
}

resource "nsxt_policy_group" "grp_729" {
   display_name = "TF-AG1-IPSET-Endpoint_Nodes-Mexico"
   nsx_id = "TF-AG1-IPSET-Endpoint_Nodes-Mexico"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "158.98.48.0/24",
                        "158.98.50.0/24",
                        "158.98.51.0/24",
                        "158.98.52.0/24",
                        "158.98.53.0/24",
                        "158.98.54.0/24",
                        "158.98.55.0/24",
                        "158.98.56.0/24",
                        "158.98.57.0/24",
                        "158.98.58.0/24",
                        "158.98.59.0/24",
                        "158.98.60.0/24",
                        "158.98.7.0/24",
                        "192.168.254.249",
                        "192.168.254.252"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_730" {
   display_name = "TF-AG1-IPSET-Endpoint_Nodes-Uruguay"
   nsx_id = "TF-AG1-IPSET-Endpoint_Nodes-Uruguay"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "10.223.4.3",
                        "158.98.14.0/24",
                        "158.98.15.0/24"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_731" {
   display_name = "TF-AG1-IPSET-Endpoint_Nodes-Venezuela"
   nsx_id = "TF-AG1-IPSET-Endpoint_Nodes-Venezuela"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "129.39.168.0/24",
                        "129.39.175.0/24"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_732" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-CALA"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-CALA"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      path_expression {
         member_paths = [
                        "/infra/domains/default/groups/TF-AG1-IPSET-Endpoint_Nodes-Argentina",
                        "/infra/domains/default/groups/TF-AG1-IPSET-Endpoint_Nodes-Chile",
                        "/infra/domains/default/groups/TF-AG1-IPSET-Endpoint_Nodes-Colombia",
                        "/infra/domains/default/groups/TF-AG1-IPSET-Endpoint_Nodes-Ecuador",
                        "/infra/domains/default/groups/TF-AG1-IPSET-Endpoint_Nodes-Mexico",
                        "/infra/domains/default/groups/TF-AG1-IPSET-Endpoint_Nodes-Uruguay",
                        "/infra/domains/default/groups/TF-AG1-IPSET-Endpoint_Nodes-Venezuela"
                        ]
      }
   }
}

