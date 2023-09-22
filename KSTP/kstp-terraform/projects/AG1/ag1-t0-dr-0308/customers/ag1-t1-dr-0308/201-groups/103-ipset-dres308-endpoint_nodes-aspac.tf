
resource "nsxt_policy_group" "grp_700" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-Australia"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-Australia"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "10.190.34.139/32",
                        "100.80.8.134/32",
                        "129.39.103.0/24",
                        "129.39.104.0/24",
                        "129.39.109.0/24",
                        "129.39.110.0/25",
                        "129.39.111.0/25",
                        "129.39.112.0/24",
                        "129.39.118.0/27",
                        "129.39.120.0/26",
                        "146.89.241.0/24",
                        "167.210.56.0/24",
                        "202.81.17.129/32",
                        "202.81.23.146/32",
                        "202.81.24.112/32",
                        "9.190.232.22/32",
                        "9.190.232.34/32"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_701" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-China"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-China"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "100.84.129.16/29",
                        "100.84.137.16/29",
                        "100.84.145.16/29",
                        "100.84.153.16/29"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_702" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-Hong_Kong"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-Hong_Kong"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "10.197.113.119/32",
                        "100.90.41.16/29",
                        "129.39.100.0/25",
                        "129.39.122.64/27",
                        "129.39.126.152/29",
                        "129.39.126.192/27",
                        "129.39.127.0/24"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_703" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-India"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-India"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "158.98.122.0/24",
                        "158.99.123.0/24",
                        "158.99.124.0/24",
                        "158.99.40.115",
                        "9.182.116.205/32",
                        "9.182.116.206/32",
                        "9.182.116.207/32"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_704" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-Japan"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-Japan"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "129.39.115.0/24",
                        "129.39.117.0/24",
                        "129.39.124.0/24",
                        "129.39.125.0/24",
                        "129.42.147.0/24",
                        "129.42.151.0/24",
                        "130.103.180.0/24",
                        "130.103.181.0/25",
                        "130.103.183.0/24",
                        "158.98.18.0/24",
                        "158.98.19.0/24",
                        "158.98.20.0/24",
                        "158.98.21.0/24",
                        "158.98.22.0/24",
                        "158.98.23.0/24",
                        "158.98.24.0/24",
                        "158.98.25.0/24",
                        "158.98.97.0/24",
                        "158.98.98.0/24",
                        "158.98.99.0/24",
                        "158.98.100.0/24",
                        "158.98.101.0/24",
                        "158.98.102.0/24",
                        "158.98.103.0/24",
                        "158.98.104.0/24",
                        "158.98.112.0/24",
                        "158.98.119.0/24",
                        "158.98.229.0/24",
                        "158.98.230.0/24",
                        "158.98.248.0/24",
                        "158.98.249.0/24",
                        "158.98.250.0/24",
                        "158.98.251.0/24",
                        "158.98.252.0/24",
                        "100.87.98.16/29",
                        "100.87.130.16/29"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_705" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-New_Zealand"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-New_Zealand"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "130.103.160.61",
                        "130.103.160.62"
]
      }
   }
}

resource "nsxt_policy_group" "grp_706" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-Singapore"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-Singapore"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "10.0.148.12/32",
                        "158.98.106.0/24",
                        "158.98.113.237/32"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_707" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-Taiwan"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-Taiwan"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "10.191.48.151/32",
                        "158.98.226.0/24"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_708" {
   display_name = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
   nsx_id = "TF-AG1-IPSET-DRES308-Endpoint_Nodes-ASPAC"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      path_expression {
         member_paths = [
                        "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-Australia",
                        "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-China",
                        "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-Hong_Kong",
                        "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-India",
                        "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-Japan",
                        "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-New_Zealand",
                        "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-Singapore",
                        "/infra/domains/default/groups/TF-AG1-IPSET-DRES308-Endpoint_Nodes-Taiwan"
                        ]
      }
   }
}

