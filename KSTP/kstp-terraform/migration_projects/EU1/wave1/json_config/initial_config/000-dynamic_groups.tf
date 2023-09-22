#####################################
# VM GROUPS
#
# Migration date: 03/27/2023 17:16
# Geography.....: EU1 
# Wave..........: wave1
#####################################
#####################################
# IPSETs GROUPS
#
# Migration date: 03/27/2023 17:16
# Geography.....: EU1 
# Wave..........: wave1
#####################################
#####################################
# EMPTY GROUPS
#
# Migration date: 03/27/2023 17:16
# Geography.....: EU1 
# Wave..........: wave1
#####################################
resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR60-RPA-BP-GNF-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-EU1-SG-SRES-Netcool-Next-CACF"
   nsx_id = "TF-EU1-SG-SRES-Netcool-Next-CACF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-EU1-SG-eu1d72lpsphprx-Proxy-VIP"
   nsx_id = "TF-EU1-SG-eu1d72lpsphprx-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR46-RPA-BP-IBE-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcProdSrv"
   nsx_id = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-BPE-AppDevSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-BPE-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-EU1-SG-Empty"
   nsx_id = "TF-EU1-SG-Empty"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-EU1-SG-DRES86-MNEAAS-H3G-NCPP"
   nsx_id = "TF-EU1-SG-DRES86-MNEAAS-H3G-NCPP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-EU1-SG-SRES-AA-Controlroom"
   nsx_id = "TF-EU1-SG-SRES-AA-Controlroom"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR51-RPA-BP-CTT-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-EU1-SG-SRES-RPA-JHS-Jump-Servers"
   nsx_id = "TF-EU1-SG-SRES-RPA-JHS-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR39-RPA-BP-ECI-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-EU1-SG-DR18-AA-Jump-Servers"
   nsx_id = "TF-EU1-SG-DR18-AA-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR37-RPA-BP-ICF-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-EU1-SG-DR48-STaaS-Mail-Clients"
   nsx_id = "TF-EU1-SG-DR48-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppDevSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-EU1-SG-ISIM-EUISPW-DRES-Members"
   nsx_id = "TF-EU1-SG-ISIM-EUISPW-DRES-Members"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-AppServers"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-AppServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-BPE-AppUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-BPE-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-EU1-SG-SRES01-ICp-Cluster02-Worker-Nodes"
   nsx_id = "TF-EU1-SG-SRES01-ICp-Cluster02-Worker-Nodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-OrcProdSrv"
   nsx_id = "TF-EU1-SG-DR31-RPA-UP-POC-OrcProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcServers"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR46-RPA-BP-IBE-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR37-RPA-BP-ICF-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR46-RPA-BP-IBE-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-EU1-SG-SRES-GTS-Analytics"
   nsx_id = "TF-EU1-SG-SRES-GTS-Analytics"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-OrcUatSrv"
   nsx_id = "TF-EU1-SG-DR31-RPA-UP-POC-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-EU1-SG-SRES-IAM-LINUX-PROD"
   nsx_id = "TF-EU1-SG-SRES-IAM-LINUX-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-EU1-SG-DR35-STaaS-Mail-Clients"
   nsx_id = "TF-EU1-SG-DR35-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GBS-AppProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-GBS-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR37-RPA-BP-ICF-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-EU1-SG-SRES-RPA-GBS-BP-AppServers"
   nsx_id = "TF-EU1-SG-SRES-RPA-GBS-BP-AppServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR39-RPA-BP-ECI-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR60-RPA-BP-GNF-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-Jump-Servers"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-WIE-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR51-RPA-BP-CTT-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-EU1-SG-SRES-IAM-NODB-PROD"
   nsx_id = "TF-EU1-SG-SRES-IAM-NODB-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-Jump-Servers"
   nsx_id = "TF-EU1-SG-DR17-RPA-BP-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GBS-AppUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-BP-GBS-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-EU1-SG-SRES-WIN-DA"
   nsx_id = "TF-EU1-SG-SRES-WIN-DA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-AppUatSrv"
   nsx_id = "TF-EU1-SG-DR51-RPA-BP-CTT-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcDevSrv"
   nsx_id = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-EU1-SG-SRES-IAM-WINDOWS-PROD"
   nsx_id = "TF-EU1-SG-SRES-IAM-WINDOWS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-EU1-SG-SRES-RPA-GBS-AA-UAT-ControlRoom"
   nsx_id = "TF-EU1-SG-SRES-RPA-GBS-AA-UAT-ControlRoom"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppProdSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-BP-PHA-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcUatSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-EU1-SG-DRDDC-CSSR-All"
   nsx_id = "TF-EU1-SG-DRDDC-CSSR-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcDevSrv"
   nsx_id = "TF-EU1-SG-SRES-RPA-SRV-UP-GTS-OrcDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-POC-PostgresSQL"
   nsx_id = "TF-EU1-SG-SRES-RPA-AA-POC-PostgresSQL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-AppDevSrv"
   nsx_id = "TF-EU1-SG-DR60-RPA-BP-GNF-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcUatSrv"
   nsx_id = "TF-EU1-SG-DR117-RPA-UP-RPA-OrcUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-AppProdSrv"
   nsx_id = "TF-EU1-SG-DR39-RPA-BP-ECI-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
#####################################
# SGEM GROUPS
#
# Migration date: 03/27/2023 17:16
# Geography.....: EU1 
# Wave..........: wave1
#####################################
#####################################
# DYNAMIC GROUPS
#
# Migration date: 03/27/2023 17:16
# Geography.....: EU1 
# Wave..........: wave1
#####################################
