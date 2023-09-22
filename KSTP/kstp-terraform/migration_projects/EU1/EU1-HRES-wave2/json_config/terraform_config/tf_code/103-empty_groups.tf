#####################################
# EMPTY GROUPS
#
# Migration date: 04/17/2023 19:16
# Geography.....: EU1 
# Wave..........: EU1-HRES-wave2
#####################################
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-EU1-SG-SRES-Netcool-Next-CACF"
   nsx_id = "TF-EU1-SG-SRES-Netcool-Next-CACF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-EU1-SG-SRES-AA-Controlroom"
   nsx_id = "TF-EU1-SG-SRES-AA-Controlroom"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-BPE-AppDevSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-BPE-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-EU1-SG-SRES01-ICp-Cluster02-Worker-Nodes"
   nsx_id = "TF-EU1-SG-SRES01-ICp-Cluster02-Worker-Nodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcProdSrv"
   nsx_id = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR60-RPA-BP-GNF-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcUatSrv"
   nsx_id = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR60-RPA-BP-GNF-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-EU1-SG-DRES86-MNEAAS-H3G-NCPP"
   nsx_id = "TF-EU1-SG-DRES86-MNEAAS-H3G-NCPP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR37-RPA-BP-ICF-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcServers"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-EU1-SG-DR35-STaaS-Mail-Clients"
   nsx_id = "TF-EU1-SG-DR35-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR46-RPA-BP-IBE-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-EU1-SG-SRES-RPA-JHS-Jump-Servers"
   nsx_id = "TF-EU1-SG-SRES-RPA-JHS-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppDevSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR39-RPA-BP-ECI-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR39-RPA-BP-ECI-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-Jump-Servers"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR37-RPA-BP-ICF-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-EU1-SG-DR48-STaaS-Mail-Clients"
   nsx_id = "TF-EU1-SG-DR48-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-EU1-SG-SRES-GTS-Analytics"
   nsx_id = "TF-EU1-SG-SRES-GTS-Analytics"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR60-RPA-BP-GNF-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR46-RPA-BP-IBE-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-OrcProdSrv"
   nsx_id = "TF-EU1-SG-DR31-RPA-UP-POC-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcDevSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-Jump-Servers"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-EU1-SG-eu1d72lpsphprx-Proxy-VIP"
   nsx_id = "TF-EU1-SG-eu1d72lpsphprx-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-EU1-SG-SRES-RPA-GBS-AA-UAT-ControlRoom"
   nsx_id = "TF-EU1-SG-SRES-RPA-GBS-AA-UAT-ControlRoom"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-EU1-SG-SRES-IAM-NODB-PROD"
   nsx_id = "TF-EU1-SG-SRES-IAM-NODB-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-EU1-SG-DRDDC-CSSR-All"
   nsx_id = "TF-EU1-SG-DRDDC-CSSR-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR39-RPA-BP-ECI-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-EU1-SG-Empty"
   nsx_id = "TF-EU1-SG-Empty"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR37-RPA-BP-ICF-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR51-RPA-BP-CTT-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR51-RPA-BP-CTT-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-OrcUatSrv"
   nsx_id = "TF-EU1-SG-DR31-RPA-UP-POC-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-AppServers"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-AppServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-BPE-AppUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-BPE-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-EU1-SG-SRES-IAM-WINDOWS-PROD"
   nsx_id = "TF-EU1-SG-SRES-IAM-WINDOWS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GBS-AppProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-GBS-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GBS-AppUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-GBS-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-EU1-SG-DR18-AA-Jump-Servers"
   nsx_id = "TF-EU1-SG-DR18-AA-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcDevSrv"
   nsx_id = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR46-RPA-BP-IBE-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-EU1-SG-SRES-RPA-GBS-BP-AppServers"
   nsx_id = "TF-EU1-SG-SRES-RPA-GBS-BP-AppServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-EU1-SG-SRES-WIN-DA"
   nsx_id = "TF-EU1-SG-SRES-WIN-DA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR51-RPA-BP-CTT-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-POC-PostgresSQL"
   nsx_id = "TF-EU1-SG-SRES-RPA-AA-POC-PostgresSQL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-EU1-SG-ISIM-EUISPW-DRES-Members"
   nsx_id = "TF-EU1-SG-ISIM-EUISPW-DRES-Members"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-EU1-SG-SRES-IAM-LINUX-PROD"
   nsx_id = "TF-EU1-SG-SRES-IAM-LINUX-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
