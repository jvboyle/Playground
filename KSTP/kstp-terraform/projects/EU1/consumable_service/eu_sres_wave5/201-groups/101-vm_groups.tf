#####################################
# VM GROUPS
#
# Migration date: 08/09/2023 15:24
# Geography.....: EU1 
# Wave..........: eu_sres_wave5
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-EU1-HOST-eu1d62apprkrp3"
   nsx_id = "TF-EU1-HOST-eu1d62apprkrp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62apprkrp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.26"]
      }
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-EU1-HOST-eu1d92lpfnatnp2"
   nsx_id = "TF-EU1-HOST-eu1d92lpfnatnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d92lpfnatnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.208.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-EU1-HOST-vCLS-ef551546-a6e7-47c2-b327-9198daa18445"
   nsx_id = "TF-EU1-HOST-vCLS-ef551546-a6e7-47c2-b327-9198daa18445"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "vCLS-ef551546-a6e7-47c2-b327-9198daa18445"
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
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-EU1-HOST-NLS01GNABPPBB12"
   nsx_id = "TF-EU1-HOST-NLS01GNABPPBB12"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "NLS01GNABPPBB12"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.79.248.68"]
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-EU1-HOST-eu1d35lpthwtnp1"
   nsx_id = "TF-EU1-HOST-eu1d35lpthwtnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d35lpthwtnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.120.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-EU1-HOST-eu1d92lpfnatnp1"
   nsx_id = "TF-EU1-HOST-eu1d92lpfnatnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d92lpfnatnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.208.32"]
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-EU1-HOST-eu1d35lpthwtnp2"
   nsx_id = "TF-EU1-HOST-eu1d35lpthwtnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d35lpthwtnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.120.33"]
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-EU1-HOST-eu1d62apprkrp4"
   nsx_id = "TF-EU1-HOST-eu1d62apprkrp4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1d62apprkrp4"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      ipaddress_expression {
         ip_addresses = ["100.72.162.27"]
      }
   }
}
