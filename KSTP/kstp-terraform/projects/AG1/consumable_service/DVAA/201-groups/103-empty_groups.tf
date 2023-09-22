#####################################
# EMPTY GROUPS
#
# Migration date: 03/22/2023 16:07
# Geography.....: AG1 
# Wave..........: DVAA
#####################################
resource "nsxt_policy_group" "grp_1654" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1655" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1656" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1657" {
   display_name = "TF-AG1-SG-DR52-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR52-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1658" {
   display_name = "TF-AG1-SG-DR52-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR52-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1659" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersWinDr"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersWinDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1660" {
   display_name = "TF-AG1-SG-DR71-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR71-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1661" {
   display_name = "TF-AG1-SG-SRES-agnsrlnicp1p-vip"
   nsx_id = "TF-AG1-SG-SRES-agnsrlnicp1p-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1662" {
   display_name = "TF-AG1-SG-GRES01-CogSol-Logicnets"
   nsx_id = "TF-AG1-SG-GRES01-CogSol-Logicnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1663" {
   display_name = "TF-AG1-SG-SRES-DVAA-Prod-Servers-Front"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Prod-Servers-Front"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1664" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1665" {
   display_name = "TF-AG1-SG-DRES74-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES74-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1666" {
   display_name = "TF-AG1-SG-Ansible-SSH-Hosts"
   nsx_id = "TF-AG1-SG-Ansible-SSH-Hosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1667" {
   display_name = "TF-AG1-SG-SRES-AGNSRLNICP1-ICP"
   nsx_id = "TF-AG1-SG-SRES-AGNSRLNICP1-ICP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1668" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-Front"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-Front"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1669" {
   display_name = "TF-AG1-SG-DRES98-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES98-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1670" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1671" {
   display_name = "TF-AG1-SG-ISIM-WDC-GRES-Standalone"
   nsx_id = "TF-AG1-SG-ISIM-WDC-GRES-Standalone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1672" {
   display_name = "TF-AG1-SG-DRES96-CRO-All-Servers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-All-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1673" {
   display_name = "TF-AG1-SG-DR71-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR71-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1674" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1675" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SDI-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SDI-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1676" {
   display_name = "TF-AG1-SG-DR40-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DR40-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1677" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1678" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxDR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1679" {
   display_name = "TF-AG1-SG-DR40-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DR40-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1680" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-RMQ-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-RMQ-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1681" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1682" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1683" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1684" {
   display_name = "TF-AG1-SG-DR71-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR71-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1685" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1686" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1687" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1688" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1689" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersWinDr"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersWinDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1690" {
   display_name = "TF-AG1-SG-DR40-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DR40-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1691" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1692" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxDr"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllersLinuxDr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1693" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersWinPR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersWinPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1694" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DE-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DE-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1695" {
   display_name = "TF-AG1-SG-DRES99-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES99-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1696" {
   display_name = "TF-AG1-SG-DR71-STaaS-Arxview"
   nsx_id = "TF-AG1-SG-DR71-STaaS-Arxview"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1697" {
   display_name = "TF-AG1-SG-DRES74-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES74-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1698" {
   display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersWinDR"
   nsx_id = "TF-AG1-SG-DRES40-CRO-SiteControllersWinDR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1699" {
   display_name = "TF-AG1-SG-OCP-Cluster6-wrkrnodes"
   nsx_id = "TF-AG1-SG-OCP-Cluster6-wrkrnodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1700" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1701" {
   display_name = "TF-AG1-SG-DRES96-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES96-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1702" {
   display_name = "TF-AG1-SG-DRES99-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES99-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1703" {
   display_name = "TF-AG1-SG-AG1SR1CP2P0"
   nsx_id = "TF-AG1-SG-AG1SR1CP2P0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1704" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SECRET-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SECRET-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1705" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllersW"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllersW"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1706" {
   display_name = "TF-AG1-SG-DRES40-CRO-DRM-Servers"
   nsx_id = "TF-AG1-SG-DRES40-CRO-DRM-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1707" {
   display_name = "TF-AG1-SG-SRES-TKG-Base-Server"
   nsx_id = "TF-AG1-SG-SRES-TKG-Base-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1708" {
   display_name = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxPR"
   nsx_id = "TF-AG1-SG-DRES96-CRO-SiteControllersLinuxPR"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1709" {
   display_name = "TF-AG1-SG-OCP-Cluster6-cntrlnodes"
   nsx_id = "TF-AG1-SG-OCP-Cluster6-cntrlnodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1710" {
   display_name = "TF-AG1-SG-SRES-OCP-Cluster2-Control_Node"
   nsx_id = "TF-AG1-SG-SRES-OCP-Cluster2-Control_Node"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1711" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1712" {
   display_name = "TF-AG1-SG-DRES98-CRO-SiteControllers"
   nsx_id = "TF-AG1-SG-DRES98-CRO-SiteControllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
