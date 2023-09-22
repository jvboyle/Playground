resource "nsxt_policy_security_policy" "policies_TF-EDR-CARBONBLACK_tf" {
  display_name    = "TF-EDR-CARBONBLACK"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-EDR-CARBONBLACK"
  comments        = ""
  sequence_number = 0
# rules
######################################################
# migration: IAM_PHASE5
######################################################
   rule {
         display_name = "TF-1120-Systems-to-CarbonBlack-Cloud"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-EDR-CarbonBlack"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EDR-CarbonBlack"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-EDR-CarbonBlack",
               "/infra/domains/default/groups/TF-AG1-IPSET-EDR-CarbonBlack"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-EDR-CarbonBlack-AG1"
            }
      }
}