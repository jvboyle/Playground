resource "nsxt_policy_security_policy" "policies_TF-IAM_PHASE2-IAM_PHASE2" {
  display_name    = "GIVE NAME" # Section 
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "GIVE NAME" # Match Display_name
  comments        = ""
  sequence_number = 0
  rule {
    display_name          = "RUle_Name"
    notes                 = "ADD NOTE" # Ticket number
    source_groups         = []         #"/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"                                         
    destination_groups    = []         #"/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
    action                = "ALLOW"
    services              = [] #"/infra/services/TCP-20000-20008",
    scope                 = [] #"/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2"
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-${var.project}-${var.customer}"
    }
  }
}

# add additional Rules section under the rules block 
