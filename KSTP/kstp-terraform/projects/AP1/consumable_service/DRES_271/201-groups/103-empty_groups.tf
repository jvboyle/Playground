#####################################
# EMPTY GROUPS
#
# Migration date: 03/21/2023 16:38
# Geography.....: AP1 
# Wave..........: DRES_271
#####################################
resource "nsxt_policy_group" "grp_647" {
   display_name = "TF-AP1-SG-SRES-WIN-SEPM"
   nsx_id = "TF-AP1-SG-SRES-WIN-SEPM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_648" {
   display_name = "TF-AP1-SG-IRES-LIN-MSS-Qradar-EC"
   nsx_id = "TF-AP1-SG-IRES-LIN-MSS-Qradar-EC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_649" {
   display_name = "TF-AP1-SG-SRES-Sciencelogic-DB-servers"
   nsx_id = "TF-AP1-SG-SRES-Sciencelogic-DB-servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_650" {
   display_name = "TF-AP1-SG-IRES-WIN-VMware-vLI"
   nsx_id = "TF-AP1-SG-IRES-WIN-VMware-vLI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_651" {
   display_name = "TF-AP1-SG-IRES-WIN-VMware-vROPS"
   nsx_id = "TF-AP1-SG-IRES-WIN-VMware-vROPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_652" {
   display_name = "TF-AP1-SG-SRES-RHEL-Licensing"
   nsx_id = "TF-AP1-SG-SRES-RHEL-Licensing"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
