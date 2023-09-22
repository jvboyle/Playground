#####################################
# SGEM GROUPS
#
# Migration date: 05/12/2023 12:24
# Geography.....: AP1 
# Wave..........: DRES101
#####################################
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-AP1-SG-SRES-MNEAAS-AP-SHR1-NCO"
   nsx_id = "TF-AP1-SG-SRES-MNEAAS-AP-SHR1-NCO"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-SRES-MNEAAS-AP-SHR1-NCO"
]
      }
   }
}
resource "nsxt_policy_group" "grp_34" {
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
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-AP1-SG-SRES-ap1sr1lpcacprx"
   nsx_id = "TF-AP1-SG-SRES-ap1sr1lpcacprx"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-ap1sr1lpcacprx1-vip",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1lpcacprx1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1lpcacprx2"
]
      }
   }
}
