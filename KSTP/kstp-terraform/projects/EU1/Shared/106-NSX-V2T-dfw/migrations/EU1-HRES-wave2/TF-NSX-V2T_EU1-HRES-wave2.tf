resource "nsxt_policy_security_policy" "policies_TF-NSX-V2T-EU1-HRES-wave2" {
   display_name    = "TF-NSX-V2T"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-NSX-V2T"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-8944-Ansible-to-BDS-child"
         notes        = "RITM0137971 RITM0140044"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
}