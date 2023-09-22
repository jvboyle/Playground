#####################################
# DYNAMIC GROUPS
#
# Migration date: 06/28/2023 14:37
# Geography.....: EU1 
# Wave..........: eu_sres_wave3
#####################################
resource "nsxt_policy_group" "grp_205" {
   display_name = "TF-EU1-SG-PDR-OKTA-ASA-GW"
   nsx_id = "TF-EU1-SG-PDR-OKTA-ASA-GW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "eu1pdr1lpasagw"
      }
   }
}
resource "nsxt_policy_group" "grp_206" {
   display_name = "TF-EU1-SG-SRES-MnEaaS-PRTG-SHR"
   nsx_id = "TF-EU1-SG-SRES-MnEaaS-PRTG-SHR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecnp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epnp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecnp2"
      }
   }
}
resource "nsxt_policy_group" "grp_207" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpmpcansb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpmpcansb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1lpmpcansb"
      }
   }
}
