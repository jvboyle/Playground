#####################################
# EMPTY GROUPS
#
# Migration date: 05/12/2023 12:24
# Geography.....: AP1 
# Wave..........: DRES101
#####################################
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-AP1-SG-IRES-WIN-VMware-vLI"
   nsx_id = "TF-AP1-SG-IRES-WIN-VMware-vLI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-AP1-SG-IRES-LIN-MSS-Qradar-EC"
   nsx_id = "TF-AP1-SG-IRES-LIN-MSS-Qradar-EC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-AP1-SG-SRES-WIN-SEPM"
   nsx_id = "TF-AP1-SG-SRES-WIN-SEPM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-AP1-SG-SRES-Sciencelogic-DB-servers"
   nsx_id = "TF-AP1-SG-SRES-Sciencelogic-DB-servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-AP1-SG-SRES-RHEL-Licensing"
   nsx_id = "TF-AP1-SG-SRES-RHEL-Licensing"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-AP1-SG-IRES-WIN-VMware-vROPS"
   nsx_id = "TF-AP1-SG-IRES-WIN-VMware-vROPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
