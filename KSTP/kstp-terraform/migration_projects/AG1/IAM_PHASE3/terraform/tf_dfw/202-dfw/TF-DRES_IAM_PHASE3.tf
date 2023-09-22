resource "nsxt_policy_security_policy" "policies_TF-IAM_PHASE3-IAM_PHASE3" {
   display_name    = "TF-IAM_PHASE3"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-IAM_PHASE3"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-2982-JPF-to-EPL2"
         notes        = "SR51198745"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPL2-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPL2-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE3-AG1"
            }
      }
   rule {
         display_name = "TF-2985-EPL2-to-JPF"
         notes        = "SR51198745"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPL2-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPL2-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE3-AG1"
            }
      }
   rule {
         display_name = "TF-2978-JPF-to-EPL1-UAT"
         notes        = "SR51198745"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPL1-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPL1-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE3-AG1"
            }
      }
   rule {
         display_name = "TF-2980-EPL1-UAT-to-jpf"
         notes        = "SR51198745"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPL1-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPL1-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE3-AG1"
            }
      }
}