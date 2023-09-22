resource "nsxt_policy_security_policy" "policies_TF-NSX-V2T-IAM_PHASE3" {
   display_name    = "TF-NSX-V2T"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-NSX-V2T"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-3832-CISO-AWS-to-KSTP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CISO-TOOLS-AWS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-RMQ-PROD-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpiamciprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-RMQ-PROD-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpiamciprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-CISO-TOOLS-AWS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
}