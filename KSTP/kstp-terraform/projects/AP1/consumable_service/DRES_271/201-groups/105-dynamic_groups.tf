#####################################
# DYNAMIC GROUPS
#
# Migration date: 03/21/2023 16:38
# Geography.....: AP1 
# Wave..........: DRES_271
#####################################
resource "nsxt_policy_group" "grp_717" {
   display_name = "TF-AP1-SG-DRES110-OCP-Cluster02"
   nsx_id = "TF-AP1-SG-DRES110-OCP-Cluster02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1dbpilp"
      }
   }
}
resource "nsxt_policy_group" "grp_718" {
   display_name = "TF-AP1-SG-ap1sr1wppd"
   nsx_id = "TF-AP1-SG-ap1sr1wppd"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1sr1"
      }
   }
}
resource "nsxt_policy_group" "grp_719" {
   display_name = "TF-AP1-DRES264-CACF-Proxy"
   nsx_id = "TF-AP1-DRES264-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1d264lpcacpr"
      }
   }
}
resource "nsxt_policy_group" "grp_720" {
   display_name = "TF-AP1-SG-IRES-SPPLUS"
   nsx_id = "TF-AP1-SG-IRES-SPPLUS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "spplus"
      }
   }
}
