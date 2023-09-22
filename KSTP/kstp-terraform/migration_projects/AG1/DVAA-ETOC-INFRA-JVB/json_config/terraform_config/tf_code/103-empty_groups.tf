#####################################
# EMPTY GROUPS
#
# Migration date: 04/06/2023 10:25
# Geography.....: AG1 
# Wave..........: DVAA-ETOC-INFRA-JVB
#####################################
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-AG1-SG-DR52-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR52-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-AG1-SG-DR71-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR71-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-All"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-AG1-SG-DRES40-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES40-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-AG1-SG-DR71-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR71-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-RMQ-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-RMQ-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-AG1-SG-OCP-Cluster6-cntrlnodes"
   nsx_id = "TF-AG1-SG-OCP-Cluster6-cntrlnodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-AG1-SG-DRES96-CRO-All-Servers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-All-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-AG1-SG-AG1SR1CP2P0"
   nsx_id = "TF-AG1-SG-AG1SR1CP2P0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-AG1-SG-ISIM-WDC-GRES-Standalone"
   nsx_id = "TF-AG1-SG-ISIM-WDC-GRES-Standalone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-AG1-SG-DR40-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DR40-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-AG1-SG-SRES-OCP-Cluster2-Control_Node"
   nsx_id = "TF-AG1-SG-SRES-OCP-Cluster2-Control_Node"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersWinDr"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersWinDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-AG1-SG-DRES74-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES74-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-AG1-SG-DR40-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DR40-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-AG1-SG-Ansible-SSH-Hosts"
   nsx_id = "TF-AG1-SG-Ansible-SSH-Hosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-AG1-SG-DR52-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR52-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-AG1-SG-SRES-CACM-Test-Servers"
   nsx_id = "TF-AG1-SG-SRES-CACM-Test-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-Back"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-Back"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-AG1-SG-DR71-STaaS-Arxview"
   nsx_id = "TF-AG1-SG-DR71-STaaS-Arxview"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-AG1-SG-SRES-AGNSRLNICP1-ICP"
   nsx_id = "TF-AG1-SG-SRES-AGNSRLNICP1-ICP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-AG1-SG-SRES-agnsrlnicp1p-vip"
   nsx_id = "TF-AG1-SG-SRES-agnsrlnicp1p-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-AG1-SG-SRES-TKG-Base-Server"
   nsx_id = "TF-AG1-SG-SRES-TKG-Base-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-AG1-SG-BigFix-Relay"
   nsx_id = "TF-AG1-SG-BigFix-Relay"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-AG1-SG-GRES01-CogSol-Logicnets"
   nsx_id = "TF-AG1-SG-GRES01-CogSol-Logicnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersWinDR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersWinDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-AG1-SG-ISIM-WDC-SRES-Standalone"
   nsx_id = "TF-AG1-SG-ISIM-WDC-SRES-Standalone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersWinDr"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersWinDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DE-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DE-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-AG1-SG-SRES-DVAA-Dev-Servers"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Dev-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-Front"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-Front"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-AG1-SG-DRES99-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES99-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-AG1-SG-SRES-DVAA-Prod-Servers-Front"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Prod-Servers-Front"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-AG1-SG-DRES96-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxDR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-AG1-SG-DR40-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DR40-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-AG1-SG-OCP-Cluster6-wrkrnodes"
   nsx_id = "TF-AG1-SG-OCP-Cluster6-wrkrnodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-AG1-SG-DR71-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR71-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-AG1-SG-DRES98-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES98-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SECRET-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SECRET-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SDI-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SDI-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
