#####################################
# SGEM GROUPS
#
# Migration date: 07/14/2023 08:59
# Geography.....: AP1 
# Wave..........: DRES114
#####################################
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-AP1-SG-PDR-OKTA-ASA-GW"
   nsx_id = "TF-AP1-SG-PDR-OKTA-ASA-GW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1pdr1lpasagw1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1pdr1lpasagw2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-AP1-SG-CISO-Tools-KSTP"
   nsx_id = "TF-AP1-SG-CISO-Tools-KSTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "splnkfwd"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "splunkfwd"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IRES-QRADAR-NAT-IP"
]
      }
   }
}
