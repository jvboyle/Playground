#####################################
# EMPTY GROUPS
#
# Migration date: 04/20/2023 08:46
# Geography.....: AG1 
# Wave..........: IAM_PHASE1
#####################################
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-AG1-SG-AG1SR1CP2P0"
   nsx_id = "TF-AG1-SG-AG1SR1CP2P0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxDR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-AG1-SG-SRES-WIN-DA"
   nsx_id = "TF-AG1-SG-SRES-WIN-DA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-All"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-AG1-SG-DRES40-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES40-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-AG1-SG-SRES-TKG-Base-Server"
   nsx_id = "TF-AG1-SG-SRES-TKG-Base-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-AG1-SG-SRES-DVAA-Dev-Servers"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Dev-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-Front"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-Front"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-AG1-SG-Ansible-SSH-Hosts"
   nsx_id = "TF-AG1-SG-Ansible-SSH-Hosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-AG1-SG-SRES-agnsrlnicp1p-vip"
   nsx_id = "TF-AG1-SG-SRES-agnsrlnicp1p-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SDI-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SDI-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-AG1-SG-SRES-AGNSRLNICP1-ICP"
   nsx_id = "TF-AG1-SG-SRES-AGNSRLNICP1-ICP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-AG1-SG-DRES96-CRO-All-Servers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-All-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DE-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DE-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SECRET-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SECRET-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-AG1-SG-BigFix-Relay"
   nsx_id = "TF-AG1-SG-BigFix-Relay"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-AG1-SG-DR52-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR52-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersWinDr"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersWinDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-AG1-SG-DR52-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR52-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-AG1-SG-DR40-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DR40-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-AG1-SG-DRES98-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES98-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersWinDr"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersWinDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-AG1-SG-DR40-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DR40-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-AG1-SG-ISIM-WDC-SRES-Standalone"
   nsx_id = "TF-AG1-SG-ISIM-WDC-SRES-Standalone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-AG1-SG-OCP-Cluster6-wrkrnodes"
   nsx_id = "TF-AG1-SG-OCP-Cluster6-wrkrnodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-AG1-SG-DR71-STaaS-Arxview"
   nsx_id = "TF-AG1-SG-DR71-STaaS-Arxview"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-AG1-SG-DR71-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR71-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_184" {
   display_name = "TF-AG1-SG-SRES-OCP-Cluster2-Control_Node"
   nsx_id = "TF-AG1-SG-SRES-OCP-Cluster2-Control_Node"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_185" {
   display_name = "TF-AG1-SG-SRES-DVAA-Prod-Servers-Front"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Prod-Servers-Front"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_186" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_187" {
   display_name = "TF-AG1-SG-DR40-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DR40-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_188" {
   display_name = "TF-AG1-SG-SRES-CACM-Test-Servers"
   nsx_id = "TF-AG1-SG-SRES-CACM-Test-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_189" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_190" {
   display_name = "TF-AG1-SG-DR71-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR71-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_191" {
   display_name = "TF-AG1-SG-GRES01-CogSol-Logicnets"
   nsx_id = "TF-AG1-SG-GRES01-CogSol-Logicnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_192" {
   display_name = "TF-AG1-SG-DRES74-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES74-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_193" {
   display_name = "TF-AG1-SG-DRES96-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_194" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-Back"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-Back"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_195" {
   display_name = "TF-AG1-SG-DR71-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR71-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_196" {
   display_name = "TF-AG1-SG-ISIM-WDC-GRES-Standalone"
   nsx_id = "TF-AG1-SG-ISIM-WDC-GRES-Standalone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_197" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_198" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-RMQ-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-RMQ-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_199" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_200" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_201" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_202" {
   display_name = "TF-AG1-SG-OCP-Cluster6-cntrlnodes"
   nsx_id = "TF-AG1-SG-OCP-Cluster6-cntrlnodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_203" {
   display_name = "TF-AG1-SG-DRES99-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES99-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_204" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_205" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_206" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_207" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersWinDR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersWinDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_208" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
