resource "nsxt_policy_security_policy" "policies_TF-VDR2" {
  display_name    = "TF-VDR2"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-VDR2"
  comments        = ""
  sequence_number = 0
# rules
######################################################
# migration: eu_sres_wave3
######################################################
   rule {
         display_name = "TF-9190-DRES-ESG-to-SRES"
         notes        = "CHGEU0202753"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-VDR2-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MnEaaS-PRTG-SHR"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-VDR2-ESG-LB-Source",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MnEaaS-PRTG-SHR"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VDR2-EU1"
            }
      }
}