#####################################
# VM GROUPS
#
# Migration date: 05/09/2023 09:30
# Geography.....: AG1 
# Wave..........: IAM_PHASE2
#####################################
resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-AG1-HOST-ag1srlncacfxfr_old"
  nsx_id       = "TF-AG1-HOST-ag1srlncacfxfr_old"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "ag1srlncacfxfr_old"
    }
  }
  conjunction {
    operator = "OR"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = ["9.9.9.9"]
    }
  }
}


resource "nsxt_policy_group" "grp_1" {
  display_name = "TF-AG1-HOST-jvb"
  nsx_id       = "TF-AG1-HOST-jvb"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "EQUALS"
      value       = "jvb"
    }
  }
  conjunction {
    operator = "OR"
  }
  criteria {
    ipaddress_expression {
      ip_addresses = ["9.9.9.9"]
    }
  }
}

resource "nsxt_policy_security_policy" "policies_TF-IAM_PHASE2-IAM_PHASE2" {
  display_name    = "TF-IAM_PHASE2"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-IAM_PHASE2"
  comments        = ""
  sequence_number = 0
  rule {
    display_name = "TF-2005-Distributed-Engine-to-DRES-JH"
    notes = ["/infra/domains/default/groups/TF-AG1-HOST-jvb"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-1024-1027",
      "/infra/services/TCP-20000-20008"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-IAM_PHASE2-AG1"
    }
  }
}


