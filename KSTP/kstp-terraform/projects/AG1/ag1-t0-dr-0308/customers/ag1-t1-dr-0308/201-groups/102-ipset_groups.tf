#IP Sets
resource "nsxt_policy_group" "grp_200" {
   display_name = "TF-AG1-IPSET-DRES308-NMSAMS-EU-Servers"
   nsx_id = "TF-AG1-IPSET-DRES308-NMSAMS-EU-Servers"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                         "100.72.162.30",
                         "100.72.162.31",
                         "100.72.162.130",
                         "100.72.162.131"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_201" {
   display_name = "TF-AG1-IPSET-EU-RestorePoint"
   nsx_id = "TF-AG1-IPSET-EU-RestorePoint"
   description  = local.change
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "100.72.162.32",
                        "100.72.162.33"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_202" {
   display_name = "TF-AG1-IPSET-DRES308-RP-MASTER"
   nsx_id = "TF-AG1-IPSET-DRES308-RP-MASTER"
   description  = "RITM0152392"
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "3.74.207.137",
                        "18.198.165.9"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_203" {
   display_name = "TF-AG1-IPSET-DRES308-CIO-DNS"
   nsx_id = "TF-AG1-IPSET-DRES308-CIO-DNS"
   description  = "RITM0154468"
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "130.103.1.30",
                        "130.103.1.31",
                        "142.88.131.104",
                        "142.88.131.106",
                        "142.88.129.104",
                        "142.88.129.106",
                        "142.88.132.104",
                        "142.88.132.106",
                        "142.88.128.104",
                        "142.88.128.106",
                        "142.88.130.104",
                        "142.88.130.106",
                        "142.88.133.104",
                        "142.88.133.106",
                        "142.88.134.104",
                        "142.88.134.106",
                        "142.88.135.104",
                        "142.88.135.106"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_204" {
   display_name = "TF-AG1-IPSET-DRES308-l4a-ibv-amcomd01-kyn"
   nsx_id = "TF-AG1-IPSET-DRES308-l4a-ibv-amcomd01-kyn"
   description  = "RITM0154468"
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "142.88.147.204"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_205" {
   display_name = "TF-AG1-IPSET-DRES308-l3n-ibv-amcomd01-kyn"
   nsx_id = "TF-AG1-IPSET-DRES308-l3n-ibv-amcomd01-kyn"
   description  = "RITM0154468"
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "142.88.146.204"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_206" {
   display_name = "TF-AG1-IPSET-DRES308-ie3-ibv-amcomd01-kyn"
   nsx_id = "TF-AG1-IPSET-DRES308-ie3-ibv-amcomd01-kyn"
   description  = "RITM0154468"
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "142.88.144.204"
                        ]
      }
   }
}

resource "nsxt_policy_group" "grp_207" {
   display_name = "TF-AG1-IPSET-DRES308-k5q-ibv-amcomd01-kyn"
   nsx_id = "TF-AG1-IPSET-DRES308-k5q-ibv-amcomd01-kyn"
   description  = "RITM0154468"
   tag {
      tag = "TF-${var.environment}-${var.project}"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = [
                        "142.88.145.204"
                        ]
      }
   }
}

