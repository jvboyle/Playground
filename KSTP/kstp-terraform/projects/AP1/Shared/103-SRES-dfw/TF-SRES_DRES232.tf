resource "nsxt_policy_security_policy" "policies_TF-SRES" {
  display_name    = "TF-SRES"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-SRES"
  comments        = ""
  sequence_number = 0
     rule {
         display_name = "TF-1583-OCP-to-CACF-Proxy-VIP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d232lpwnzpr1-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AP1-HOST-ap1d232lpwnzpr1",
               "/infra/domains/default/groups/TF-AP1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AP1-IPSET-ap1d232lpwnzpr1-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AP1"
            }
      }

}