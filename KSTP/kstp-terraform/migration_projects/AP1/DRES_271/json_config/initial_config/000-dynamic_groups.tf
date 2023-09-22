#####################################
# VM GROUPS
#
# Migration date: 03/24/2023 17:35
# Geography.....: AP1 
# Wave..........: DRES_271
#####################################
#####################################
# IPSETs GROUPS
#
# Migration date: 03/24/2023 17:35
# Geography.....: AP1 
# Wave..........: DRES_271
#####################################
#####################################
# EMPTY GROUPS
#
# Migration date: 03/24/2023 17:35
# Geography.....: AP1 
# Wave..........: DRES_271
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-AP1-SG-IRES-LIN-MSS-Qradar-EC"
   nsx_id = "TF-AP1-SG-IRES-LIN-MSS-Qradar-EC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-AP1-SG-SRES-RHEL-Licensing"
   nsx_id = "TF-AP1-SG-SRES-RHEL-Licensing"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-AP1-SG-IRES-WIN-VMware-vROPS"
   nsx_id = "TF-AP1-SG-IRES-WIN-VMware-vROPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-AP1-SG-SRES-WIN-SEPM"
   nsx_id = "TF-AP1-SG-SRES-WIN-SEPM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-AP1-SG-IRES-WIN-VMware-vLI"
   nsx_id = "TF-AP1-SG-IRES-WIN-VMware-vLI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-AP1-SG-SRES-Sciencelogic-DB-servers"
   nsx_id = "TF-AP1-SG-SRES-Sciencelogic-DB-servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
#####################################
# SGEM GROUPS
#
# Migration date: 03/24/2023 17:35
# Geography.....: AP1 
# Wave..........: DRES_271
#####################################
#####################################
# DYNAMIC GROUPS
#
# Migration date: 03/24/2023 17:35
# Geography.....: AP1 
# Wave..........: DRES_271
#####################################
