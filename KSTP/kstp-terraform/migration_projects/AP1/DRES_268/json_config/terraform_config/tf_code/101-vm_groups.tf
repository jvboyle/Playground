#####################################
# VM GROUPS
#
# Migration date: 05/03/2023 11:44
# Geography.....: AP1 
# Wave..........: DRES_268
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AP1-HOST-ap1d114lpcacpr1_RestoreTest24032023"
   nsx_id = "TF-AP1-HOST-ap1d114lpcacpr1_RestoreTest24032023"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "ap1d114lpcacpr1_RestoreTest24032023"
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