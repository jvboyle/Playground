#####################################
# EMPTY GROUPS
#
# Migration date: 05/08/2023 13:39
# Geography.....: AP1 
# Wave..........: DRES_256
#####################################
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-AP1-SG-IRES-LIN-MSS-Qradar-EC"
   nsx_id = "TF-AP1-SG-IRES-LIN-MSS-Qradar-EC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-AP1-SG-SRES-RHEL-Licensing"
   nsx_id = "TF-AP1-SG-SRES-RHEL-Licensing"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-AP1-SG-IRES-WIN-VMware-vROPS"
   nsx_id = "TF-AP1-SG-IRES-WIN-VMware-vROPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-AP1-SG-IRES-WIN-VMware-vLI"
   nsx_id = "TF-AP1-SG-IRES-WIN-VMware-vLI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-AP1-SG-SRES-WIN-SEPM"
   nsx_id = "TF-AP1-SG-SRES-WIN-SEPM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-AP1-SG-SRES-Sciencelogic-DB-servers"
   nsx_id = "TF-AP1-SG-SRES-Sciencelogic-DB-servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
