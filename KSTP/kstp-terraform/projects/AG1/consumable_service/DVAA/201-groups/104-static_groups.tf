#####################################
# SGEM GROUPS
#
# Migration date: 03/22/2023 16:07
# Geography.....: AG1 
# Wave..........: DVAA
#####################################
resource "nsxt_policy_group" "grp_1713" {
   display_name = "TF-AG1-SG-DR162-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR162-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR162-ESG-vpn-vNic_1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR162-ESG-dlr-vNic_2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR162-ESG-agg-vNic_0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1714" {
   display_name = "TF-AG1-SG-CIO-WIN-LIN-Servers"
   nsx_id = "TF-AG1-SG-CIO-WIN-LIN-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcifs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1715" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-Back"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-Back"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwndvaapp02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1716" {
   display_name = "TF-AG1-SG-agnsrlnicp1p-vip"
   nsx_id = "TF-AG1-SG-agnsrlnicp1p-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1717" {
   display_name = "TF-AG1-SG-DR59-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR59-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1718" {
   display_name = "TF-AG1-SG-TS-Session-Hosts"
   nsx_id = "TF-AG1-SG-TS-Session-Hosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1719" {
   display_name = "TF-AG1-SG-DR212-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-SG-DR212-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR212-CACF-Proxy-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d212lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d212lpcacpr2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1720" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DE-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DE-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1721" {
   display_name = "TF-AG1-SG-DR227-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR227-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR227-ESG-dlr-vNic_2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR227-ESG-vpn-vNic_1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR227-ESG-agg-vNic_0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1722" {
   display_name = "TF-AG1-SG-DR198-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR198-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198stw"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1723" {
   display_name = "TF-AG1-SG-STaas-DRES-Ansible-port-5985"
   nsx_id = "TF-AG1-SG-STaas-DRES-Ansible-port-5985"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d112dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d112fm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d100dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d112dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGADCD2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19sklm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d100dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGADCD1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197dc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1724" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DE-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DE-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1725" {
   display_name = "TF-AG1-SG-SRES-IAM-WINDOWS-POC"
   nsx_id = "TF-AG1-SG-SRES-IAM-WINDOWS-POC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-MSSQL-POC-VIP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1726" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1727" {
   display_name = "TF-AG1-SG-DRES47-ICp-Cluster01"
   nsx_id = "TF-AG1-SG-DRES47-ICp-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1dr47icp1"
      }
   }
}
resource "nsxt_policy_group" "grp_1728" {
   display_name = "TF-AG1-SG-DR237-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR237-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1729" {
   display_name = "TF-AG1-SG-SRES-HWSW-SERVERS"
   nsx_id = "TF-AG1-SG-SRES-HWSW-SERVERS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1730" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-SVG-PEN"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1731" {
   display_name = "TF-AG1-SG-DR19-STaaS-AD"
   nsx_id = "TF-AG1-SG-DR19-STaaS-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1732" {
   display_name = "TF-AG1-SG-SRES-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-SRES-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1733" {
   display_name = "TF-AG1-SG-SRES-IAMAAS-THY-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAMAAS-THY-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuaq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuar2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuar1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuaq2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1734" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptprx2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1735" {
   display_name = "TF-AG1-SG-DR74-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR74-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74fm"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1736" {
   display_name = "TF-AG1-SG-SRES-WIN-WSUS"
   nsx_id = "TF-AG1-SG-SRES-WIN-WSUS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wsus01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1737" {
   display_name = "TF-AG1-SG-DR197-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR197-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1738" {
   display_name = "TF-AG1-SG-DR203-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-SG-DR203-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR203-CACF-Proxy-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d203lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d203lpcacpr2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1739" {
   display_name = "TF-AG1-SG-PDR-Internet-Proxy-Server"
   nsx_id = "TF-AG1-SG-PDR-Internet-Proxy-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1prx02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1prx01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1740" {
   display_name = "TF-AG1-SG-SRES-IAM-NODB-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-NODB-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprsdi1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre4",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprsdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprsdi2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1741" {
   display_name = "TF-AG1-SG-DR197-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR197-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lpskl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1742" {
   display_name = "TF-AG1-SG-SRES-IAM-LINUX-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-LINUX-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-SVG-PEN",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptsdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptsdi",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptsdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptd2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptd1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1743" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-SVG-SIDT",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamtssvg1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1744" {
   display_name = "TF-AG1-SG-GRES01-ICp-Cluster03"
   nsx_id = "TF-AG1-SG-GRES01-ICp-Cluster03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1gr1icp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-Pod-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ICp-VRRP-IP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1745" {
   display_name = "TF-AG1-SG-DR11-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR11-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11dc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1746" {
   display_name = "TF-AG1-SG-DR65-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR65-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65skl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1747" {
   display_name = "TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1748" {
   display_name = "TF-AG1-SG-ag1d95lpjllprx-Proxy-VIP"
   nsx_id = "TF-AG1-SG-ag1d95lpjllprx-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR95-SSH-Proxy-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d95lpjllprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d95lpjllprx2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1749" {
   display_name = "TF-AG1-SG-DR12-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR12-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12dc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1750" {
   display_name = "TF-AG1-SG-DR234-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR234-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lparx",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lpfm"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1751" {
   display_name = "TF-AG1-SG-DR237-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR237-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237lpstl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237stw"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1752" {
   display_name = "TF-AG1-SG-EDR-CarbonBlack"
   nsx_id = "TF-AG1-SG-EDR-CarbonBlack"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1753" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuaprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuaprx2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1754" {
   display_name = "TF-AG1-SG-SRES01-OCP-Cluster05"
   nsx_id = "TF-AG1-SG-SRES01-OCP-Cluster05"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "agnsr1lnta5"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster5-VIP-1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1755" {
   display_name = "TF-AG1-SG-SRES-DVAA-Test-Servers-All"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Test-Servers-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwndvaapp02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1756" {
   display_name = "TF-AG1-SG-IRES-K8"
   nsx_id = "TF-AG1-SG-IRES-K8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-Host-IBM-K8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1757" {
   display_name = "TF-AG1-SG-DR162-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR162-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162stw"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1758" {
   display_name = "TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
   nsx_id = "TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1759" {
   display_name = "TF-AG1-SG-DR144-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR144-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpOrch",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpstl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpipq2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpipq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpskl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1760" {
   display_name = "TF-AG1-SG-DRES01-ICp-Cluster01"
   nsx_id = "TF-AG1-SG-DRES01-ICp-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-Pod-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ICp-VRRP-IP",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-CPREM-GSNI-NAT-Range"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1761" {
   display_name = "TF-AG1-SG-DR147-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR147-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1762" {
   display_name = "TF-AG1-HWSW-DB-VM"
   nsx_id = "TF-AG1-HWSW-DB-VM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1763" {
   display_name = "TF-AG1-SG-DR75-HWSW-Win-Servers"
   nsx_id = "TF-AG1-SG-DR75-HWSW-Win-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d75wphwcetl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d75wphwcdb",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d75wphwcweb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1764" {
   display_name = "TF-AG1-SG-SRES-STaaS-AD"
   nsx_id = "TF-AG1-SG-SRES-STaaS-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1765" {
   display_name = "TF-AG1-SG-DR112-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR112-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d112fm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stw"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1766" {
   display_name = "TF-AG1-SG-DR151-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR151-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151dc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1767" {
   display_name = "TF-AG1-SG-SRES-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-SRES-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1768" {
   display_name = "TF-AG1-SG-DR147-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR147-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpocum"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1769" {
   display_name = "TF-AG1-SG-DR77-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR77-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77fm"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1770" {
   display_name = "TF-AG1-SG-Thycotic-UAT-LA"
   nsx_id = "TF-AG1-SG-Thycotic-UAT-LA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprsdi1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptsdi",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1771" {
   display_name = "TF-AG1-SG-SL-IRES-Internet-Proxy-Clients"
   nsx_id = "TF-AG1-SG-SL-IRES-Internet-Proxy-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-MEaaS-Netcool-Probe",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sftp01n",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1prx01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sftp01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1prx01n",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1jump02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1772" {
   display_name = "TF-AG1-SG-HRES-HAProxy-IN"
   nsx_id = "TF-AG1-SG-HRES-HAProxy-IN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta1hap1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta1hap2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1773" {
   display_name = "TF-AG1-SG-SRES-IAM-CIO-BLKLD-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-CIO-BLKLD-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamcibkl1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1774" {
   display_name = "TF-AG1-SG-DR12-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR12-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12sfm"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1775" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1776" {
   display_name = "TF-AG1-SG-DR224-CACF-Proxy"
   nsx_id = "TF-AG1-SG-DR224-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d224lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d224lpcacpr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1777" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptsdi"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1778" {
   display_name = "TF-AG1-SG-SRES-IAM-LINUX-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-LINUX-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuaprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuaprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1779" {
   display_name = "TF-AG1-SG_IAMAAS_Thycotic_Windows_EP"
   nsx_id = "TF-AG1-SG_IAMAAS_Thycotic_Windows_EP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1780" {
   display_name = "TF-AG1-SG-DR112-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR112-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d112dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d112dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1781" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-EPW1-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-EPW1-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1782" {
   display_name = "TF-AG1-SG-SRES-DVAA-Prod-Servers-All"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Prod-Servers-All"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpdvaapp02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1783" {
   display_name = "TF-AG1-SG-SRES-WIN-SQL"
   nsx_id = "TF-AG1-SG-SRES-WIN-SQL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1sql01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1784" {
   display_name = "TF-AG1-SG-ag1h1lpta1hapProxy"
   nsx_id = "TF-AG1-SG-ag1h1lpta1hapProxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1h1lpta1hap",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta1hap1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta1hap2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1785" {
   display_name = "TF-AG1-SG-STaas-DRES-Ansible-port-22"
   nsx_id = "TF-AG1-SG-STaas-DRES-Ansible-port-22"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpOrch",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpstl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpstl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpocum",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lpstl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1786" {
   display_name = "TF-AG1-SG-SRES-WIN-DNS-NTP"
   nsx_id = "TF-AG1-SG-SRES-WIN-DNS-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1787" {
   display_name = "TF-AG1-SG-DR285-CACF-Proxy"
   nsx_id = "TF-AG1-SG-DR285-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR285-CACF-Proxy-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d285lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d285lpcacpr2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1788" {
   display_name = "TF-AG1-SG-SRES-IAM-LINUX-POC"
   nsx_id = "TF-AG1-SG-SRES-IAM-LINUX-POC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-POC-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamdb02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamdb01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1789" {
   display_name = "TF-AG1-SG-ISIM-WDCSTaaS-SRES-Members"
   nsx_id = "TF-AG1-SG-ISIM-WDCSTaaS-SRES-Members"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1790" {
   display_name = "TF-AG1-SG-DR162-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR162-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpstl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162lpocum",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162stw"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1791" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1792" {
   display_name = "TF-AG1-SG-DR151-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR151-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpstl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1793" {
   display_name = "TF-AG1-SG-DR147-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR147-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpstl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr147lpocum"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1794" {
   display_name = "TF-AG1-SG-ISIM-WDCISPW-SRES-Members"
   nsx_id = "TF-AG1-SG-ISIM-WDCISPW-SRES-Members"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wsus01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1sql01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1daipwin01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1daipwin02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1sepm1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1795" {
   display_name = "TF-AG1-SG-SRES-IAM-CIO-LINUX-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-CIO-LINUX-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamcibkl1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1796" {
   display_name = "TF-AG1-SG-IRES-SL1-Collectors"
   nsx_id = "TF-AG1-SG-IRES-SL1-Collectors"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-uswhpsl1dcr3-NAT",
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-uswhpsl1dcr1-NAT",
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-uswhpsl1dcr2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-uswhpsl1dcr3",
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-uswhpsl1dcr1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-uswhpsl1dcr4-NAT",
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-uswhpsl1dcr2-NAT",
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-uswhpsl1dcr4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1797" {
   display_name = "TF-AG1-SG-DR19-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR19-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19sklm"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1798" {
   display_name = "TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1799" {
   display_name = "TF-AG1-SG-DR112-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR112-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d112fm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d112stw"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1800" {
   display_name = "TF-AG1-SG-HOST-UAT-Shared"
   nsx_id = "TF-AG1-SG-HOST-UAT-Shared"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-UAT-Shared",
                         "/infra/domains/default/groups/TF-AG1-IPSET-UAT-Integration"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1801" {
   display_name = "TF-AG1-SG-IRES-Qradar"
   nsx_id = "TF-AG1-SG-IRES-Qradar"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-QRADAR-NAT-IP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1lsplunkfwd01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1802" {
   display_name = "TF-AG1-SG-DR192-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR192-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR192-ESG-vNic_2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR192-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR192-ESG-vNic_0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1803" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-EPW2-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-EPW2-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1804" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprsdi1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1805" {
   display_name = "TF-AG1-SG-DR100-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR100-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d100dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d100dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1806" {
   display_name = "TF-AG1-SG-DRES16-ICp-Cluster01"
   nsx_id = "TF-AG1-SG-DRES16-ICp-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1dr16icp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-Pod-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ICp-VRRP-IP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1807" {
   display_name = "TF-AG1-SG-ISIM-WDCSTaaS-DRES-Members"
   nsx_id = "TF-AG1-SG-ISIM-WDCSTaaS-DRES-Members"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59fm",
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGASFM1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65skl",
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGASTW1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGATPC1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77fm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12sfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74fm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11sat",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19sklm"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1808" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprprx1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1809" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SVG-POC"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SVG-POC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-THY-IGI-VIP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1810" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuafs"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1811" {
   display_name = "TF-AG1-SG-DR162-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-SG-DR162-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR162-CACF-Proxy-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d162lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d162lpcacpr2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1812" {
   display_name = "TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-RMQ-PROD-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1813" {
   display_name = "TF-AG1-SG-DR11-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR11-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11sat"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1814" {
   display_name = "TF-AG1-SG-SRES-IAM-LINUX-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-LINUX-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PROD",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprsdi1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprprx1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1815" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-RMQ-PROD-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1816" {
   display_name = "TF-AG1-SG-PDR01-ICp-Cluster01"
   nsx_id = "TF-AG1-SG-PDR01-ICp-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1pdr1icp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-Pod-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ICp-VRRP-IP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1817" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-SVG-UAT"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1818" {
   display_name = "TF-AG1-SG-DR187-CACF-Proxy"
   nsx_id = "TF-AG1-SG-DR187-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d187lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d187lpcacpr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1819" {
   display_name = "TF-AG1-SG-DR53-PSIS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR53-PSIS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGADCD2",
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGADCD1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1820" {
   display_name = "TF-AG1-SG-DR180-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR180-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR180-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR180-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR180-ESG-vNic_2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1821" {
   display_name = "TF-AG1-SG-SL-IRES-Internet-Proxy-Server"
   nsx_id = "TF-AG1-SG-SL-IRES-Internet-Proxy-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1prx01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1prx01n"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1822" {
   display_name = "TF-AG1-SG-DR156-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR156-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156dc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1823" {
   display_name = "TF-AG1-SG-SRES-Linux-Jump-Servers"
   nsx_id = "TF-AG1-SG-SRES-Linux-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01n",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1824" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-MSSQL-PEN-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptfs"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1825" {
   display_name = "TF-AG1-SG-DR59-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR59-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR59-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR59-ESG-vNic_2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR59-ESG-vNic_0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1826" {
   display_name = "TF-AG1-SG-SMTP-Clients"
   nsx_id = "TF-AG1-SG-SMTP-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprsdi1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamtssvg1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuaprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtsprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuaprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpta1str1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptsdi",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuafs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptprx2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1827" {
   display_name = "TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuafs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuar2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuar1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuaq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuaq2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1828" {
   display_name = "TF-AG1-SG-SRES-IAM-LINUX-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-LINUX-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-DevOps",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-DevOps",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamdb02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamdb01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1829" {
   display_name = "TF-AG1-SG-SRES-WIN-SEPM"
   nsx_id = "TF-AG1-SG-SRES-WIN-SEPM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1sepm1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1830" {
   display_name = "TF-AG1-SG-DR227-CACF-Proxy"
   nsx_id = "TF-AG1-SG-DR227-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d227lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d227lpcacpr2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1831" {
   display_name = "TF-AG1-SG-DR156-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR156-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lparx"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1832" {
   display_name = "TF-AG1-SG-DR53-PSIS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR53-PSIS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGASFM1",
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGASTW1",
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGASTL1",
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53WPIGATPC1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1833" {
   display_name = "TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
   nsx_id = "TF-AG1-SG-SRES-CACM-Netcool-Test-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmimpt",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmomni"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1834" {
   display_name = "TF-AG1-SG-DR53-PSIS-SKLM"
   nsx_id = "TF-AG1-SG-DR53-PSIS-SKLM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGAKLM2",
                         "/infra/domains/default/groups/TF-AG1-HOST-AG1D53LPIGAKLM1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1835" {
   display_name = "TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre4",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprra",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprq2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprfs"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1836" {
   display_name = "TF-AG1-SG-IRES-Network-Automation-Server-Group"
   nsx_id = "TF-AG1-SG-IRES-Network-Automation-Server-Group"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-ag1irlptfa01",
                         "/infra/domains/default/groups/TF-AG1-IPSET-IRES-ag1irlpipam01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1837" {
   display_name = "TF-AG1-SG-DRES-PEN-IAM-THY-JPF"
   nsx_id = "TF-AG1-SG-DRES-PEN-IAM-THY-JPF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dit3lniamjpf"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1838" {
   display_name = "TF-AG1-SG-DR223-CACF-Proxy"
   nsx_id = "TF-AG1-SG-DR223-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d223lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d223lpcacpr2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1839" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1840" {
   display_name = "TF-AG1-SG-SRES-IAMAAS-THY-PT-Test-Dev"
   nsx_id = "TF-AG1-SG-SRES-IAMAAS-THY-PT-Test-Dev"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1841" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1842" {
   display_name = "TF-AG1-SG-DR197-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR197-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lpstl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr197lpocum"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1843" {
   display_name = "TF-AG1-SG-ISIM-WDCISPW-IRES-Members"
   nsx_id = "TF-AG1-SG-ISIM-WDCISPW-IRES-Members"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1jump02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1844" {
   display_name = "TF-AG1-SG-DR65-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR65-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1845" {
   display_name = "TF-AG1-SG-PDR-SMTP-Server"
   nsx_id = "TF-AG1-SG-PDR-SMTP-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-ag1pdr1smtp01-IRES-NAT",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1846" {
   display_name = "TF-AG1-SG-SRES-IAM-CIO-WINDOWS-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-CIO-WINDOWS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcifs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1847" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtsprx1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1848" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1849" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1850" {
   display_name = "TF-AG1-SG-dr65-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-dr65-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65stl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr65skl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1851" {
   display_name = "TF-AG1-SG-SRES-IAM-WINDOWS-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-WINDOWS-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-DevOps",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-DevOps",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-DevOps"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1852" {
   display_name = "TF-AG1-SG-SRES01-OCP-Cluster02"
   nsx_id = "TF-AG1-SG-SRES01-OCP-Cluster02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "agnsr1lnta2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP",
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES01-OCP-Cluster02_46_TEMP",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP04-Subnet",
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1853" {
   display_name = "TF-AG1-SG-SRES01-ICp-Cluster02"
   nsx_id = "TF-AG1-SG-SRES01-ICp-Cluster02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-Pod-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ICp-VRRP-IP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1nfs01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1nfs02n",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1nfs02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1nfs01n"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1854" {
   display_name = "TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-MSSQL-PROD-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1855" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-SVG-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1856" {
   display_name = "TF-AG1-SG-GRES-CogSolVM-prod"
   nsx_id = "TF-AG1-SG-GRES-CogSolVM-prod"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1857" {
   display_name = "TF-AG1-SG-DR162-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR162-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr162dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1858" {
   display_name = "TF-AG1-SG-DR100-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR100-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d100fm"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1859" {
   display_name = "TF-AG1-SG-DR158-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR158-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR158-ESG-vpn-vNic_1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR158-ESG-dlr-vNic_2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR158-ESG-agg-vNic_0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1860" {
   display_name = "TF-AG1-SG-DR77-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR77-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1861" {
   display_name = "TF-AG1-SG-DR278-CACF-Proxy"
   nsx_id = "TF-AG1-SG-DR278-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d278lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d278lpcacpr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1862" {
   display_name = "TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1863" {
   display_name = "TF-AG1-SG-SRES-IAM-NODB-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-NODB-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-DevOps",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-DevOps",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-DevOps",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-DevOps"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1864" {
   display_name = "TF-AG1-SG-BigFix-Relay"
   nsx_id = "TF-AG1-SG-BigFix-Relay"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1bfrelay1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1bfrelay2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1865" {
   display_name = "TF-AG1-SG-SRES-IAM-NODB-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-NODB-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1866" {
   display_name = "TF-AG1-SG-DR198-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR198-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198lpstl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198stw"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1867" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-MSSQL-PROD-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprq2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1868" {
   display_name = "TF-AG1-SG-DR201-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-SG-DR201-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR201-CACF-Proxy-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d201lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d201lpcacpr2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1869" {
   display_name = "TF-AG1-SG-SRES-DVAA-Prod-Servers-Back"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Prod-Servers-Back"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpdvaapp02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1870" {
   display_name = "TF-AG1-SG-SRES-IAM-SANDBOX-LINUX"
   nsx_id = "TF-AG1-SG-SRES-IAM-SANDBOX-LINUX"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1871" {
   display_name = "TF-AG1-SG-SL-IRES-WIN-Jump-Servers"
   nsx_id = "TF-AG1-SG-SL-IRES-WIN-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1jump02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1872" {
   display_name = "TF-AG1-SG-SRES-IAM-NODB-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-NODB-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptsdi"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1873" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DE-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DE-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre4",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1874" {
   display_name = "TF-AG1-SG-SRES-IAMAAS-THYCOTIC-VMS"
   nsx_id = "TF-AG1-SG-SRES-IAMAAS-THYCOTIC-VMS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1aniamigi",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1aniamigi2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1875" {
   display_name = "TF-AG1-SG-GRES-CogSolVM-test"
   nsx_id = "TF-AG1-SG-GRES-CogSolVM-test"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
}
resource "nsxt_policy_group" "grp_1876" {
   display_name = "TF-AG1-SG-ISIM-WDC-SRES-Standalone"
   nsx_id = "TF-AG1-SG-ISIM-WDC-SRES-Standalone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwnccmwsus",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwnccmwin16"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1877" {
   display_name = "TF-AG1-SG-SRES-IAM-SANDBOX-WINDOWS"
   nsx_id = "TF-AG1-SG-SRES-IAM-SANDBOX-WINDOWS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1878" {
   display_name = "TF-AG1-SG-DR100-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR100-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d100stl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d100fm"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1879" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1880" {
   display_name = "TF-AG1-SG-DR77-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR77-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77fm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr77stl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1881" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprra"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1882" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-MSSQL-UAT-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuaq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuafs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuaq2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1883" {
   display_name = "TF-AG1-SG-SRES-CACM-Test-Servers"
   nsx_id = "TF-AG1-SG-SRES-CACM-Test-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnccmlxjmp",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwnccmwin16",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnccmrhrepo",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwnccmwsus",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnccmrhel7",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnccmtower"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1884" {
   display_name = "TF-AG1-SG-SRES-WIN-Jump-Servers"
   nsx_id = "TF-AG1-SG-SRES-WIN-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1885" {
   display_name = "TF-AG1-SG-SRES01-ICp-Cluster01"
   nsx_id = "TF-AG1-SG-SRES01-ICp-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-WDC-SRES-GSNI-subnets",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre3",
                         "/infra/domains/default/groups/TF-AG1-HOST-rhel-hc",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1daipwin02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ubuntu1604_vm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuar2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptd1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwnccmwsus",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdefmstr",
                         "/infra/domains/default/groups/TF-AG1-HOST-etn-v2t-01b",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprra",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
                         "/infra/domains/default/groups/TF-AG1-HOST-vm0120-pt",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpchatixf1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1bfrelay1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas4",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadeva1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamigi",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocddb",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1sepm1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuaq2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpdvaapp02",
                         "/infra/domains/default/groups/TF-AG1-HOST-WIN2016stdLatest",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srapjfwkali1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocdb1011",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptsdi",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1apiamprsvg1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1apiamprsvg2",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnrckvm1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlptena1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamcibkl1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srapjfwkalif2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlncacfxfr",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1nfs01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptsdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnccmrhel7",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptd2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lcacfjump01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphcs0001",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmimpt",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadevdb",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1",
                         "/infra/domains/default/groups/TF-AG1-HOST-rhel-template1-sr1-sp-ibm-local",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpsecgw1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamuasvg2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1win19test",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnccmrhrepo",
                         "/infra/domains/default/groups/TF-AG1-HOST-photon-custom-lsilogic-hw11-2-0-304b817",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmomni",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt3",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaweb01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocwas1021",
                         "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmjmp6",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnccmtower",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmjmp4",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds",
                         "/infra/domains/default/groups/TF-AG1-HOST-rhel-template2-sr1-sp-ibm-local",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnmnepen1_old",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr40crotedrmm_test",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaweb01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpocnnfs02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtsprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpta1str1",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnmnepen1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnicp1nfs02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1daipwin01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuad1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamptsvg1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
                         "/infra/domains/default/groups/TF-AG1-HOST-rhel7_testvm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprsdi1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamptsvg2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir3",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmjmp3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1w19lic01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamtssvg1",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnicp1nfs01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvadb01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1cntrl1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprsdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnccmlxjmp",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamdb02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuar1",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmjmp5",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuaq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1dajh01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwndvadeva2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcifs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1nfs02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamigi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprsdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwnccmwin16",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcarwas1000",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi1",
                         "/infra/domains/default/groups/TF-AG1-HOST-etn-v2t-01a",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1nfs02n",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptsdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1nfs01n",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprq2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpocpnfs01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprt2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01n",
                         "/infra/domains/default/groups/TF-AG1-HOST-rhel8_test1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtsd1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1sltestvm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpdvaapp01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpSATZcld_old",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1sql01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1dajh02",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlnetocdwas",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamptprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnaiodev1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprd2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre4",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit2",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmjmp2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1bfrelay2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuaprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds-clone",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlnetocdb1021",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamdb01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpansb",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwndvaapp02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuad2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamuasvg1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wsus01",
                         "/infra/domains/default/groups/TF-AG1-HOST-rhel8_test2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1rhel82022",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lnocpnfs02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcardb1000",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1qualy1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir1",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvadb01",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrlndvaapp01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpSATZcld_rhel7",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsr1lnccmjmp1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamprd1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuaprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1rhellic01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuafs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpetocwas1011",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1886" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SVG-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SVG-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1aniamigi-VIP",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1aniamigi2-VIP",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1aniamigi",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1aniamigi2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1887" {
   display_name = "TF-AG1-SG-SRES-IAM-CIO-All-VMs"
   nsx_id = "TF-AG1-SG-SRES-IAM-CIO-All-VMs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcifs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamcibkl1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1888" {
   display_name = "TF-AG1-SG-SRES01-OCP-Cluster03"
   nsx_id = "TF-AG1-SG-SRES01-OCP-Cluster03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "agnsr1lnta3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster03-VIP",
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP04-Subnet",
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1889" {
   display_name = "TF-AG1-SG-DR144-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR144-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpipq2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpipq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144lpskl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1890" {
   display_name = "TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1891" {
   display_name = "TF-AG1-SG-DR74-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR74-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74stl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74fm"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1892" {
   display_name = "TF-AG1-SG-SRES-HWSW-OPENSSH-SERVERS"
   nsx_id = "TF-AG1-SG-SRES-HWSW-OPENSSH-SERVERS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1893" {
   display_name = "TF-AG1-SG-DR112-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR112-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-dr112-LB-VIP1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-dr112-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-AG1-IPSET-dr112-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-AG1-IPSET-dr112-ESG-vNic_2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1894" {
   display_name = "TF-AG1-SG-IRES-TS-License-Server"
   nsx_id = "TF-AG1-SG-IRES-TS-License-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1895" {
   display_name = "TF-AG1-DRES-IPS"
   nsx_id = "TF-AG1-DRES-IPS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d227lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d233lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d111lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d223lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d201lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d111lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d144lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d203lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d203lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d187lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d233lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d188lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d188lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d217lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d223lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d227lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d182lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d144lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d192lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d224lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d251lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d201lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta2hap2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d116lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d217lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta2hap1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d187lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d116lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d95lpjllprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d182lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d224lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d192lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d212lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d212lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d95lpjllprx2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d251lpcacpr2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1896" {
   display_name = "TF-AG1-SG-DR211-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-SG-DR211-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR211-CACF-Proxy-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d211lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d211lpcacpr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1897" {
   display_name = "TF-AG1-SG-ISIM-WDC-DRES-Standalone"
   nsx_id = "TF-AG1-SG-ISIM-WDC-DRES-Standalone"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d75wphwcetl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d75wphwcdb",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d75wphwcweb",
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwndvaapp02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1898" {
   display_name = "TF-AG1-SG-DR198-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR198-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr198dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1899" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-EPL1-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-EPL1-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1900" {
   display_name = "TF-AG1-SG-AG1SRWPHWC"
   nsx_id = "TF-AG1-SG-AG1SRWPHWC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1901" {
   display_name = "TF-AG1-SG-SRES-IAM-LINUX-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-LINUX-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtssdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamtsprx1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1902" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-DB2-DevOps"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-DB2-DevOps"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamdb02",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamdb01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1903" {
   display_name = "TF-AG1-SG-DR151-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR151-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr151stw"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1904" {
   display_name = "TF-AG1-SG-GRES01-ICp-Cluster01"
   nsx_id = "TF-AG1-SG-GRES01-ICp-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-Pod-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ICp-VRRP-IP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1905" {
   display_name = "TF-AG1-SG-SRES-LINUX-Jump-Server-CACF"
   nsx_id = "TF-AG1-SG-SRES-LINUX-Jump-Server-CACF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lcacfjump01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1906" {
   display_name = "TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
   nsx_id = "TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1907" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-RMQ-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-RMQ-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-RMQ-PEN-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1908" {
   display_name = "TF-AG1-SG-SRES-EntAuto-VMs-POK"
   nsx_id = "TF-AG1-SG-SRES-EntAuto-VMs-POK"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1909" {
   display_name = "TF-AG1-SG-DR196-ESG-LB-Source"
   nsx_id = "TF-AG1-SG-DR196-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR196-ESG-dlr-vNic_2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR196-ESG-agg-vNic_0",
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR196-ESG-vpn-vNic_1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1910" {
   display_name = "TF-AG1-SG-SRES-IAM-NODB-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-NODB-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
                         "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamuasvg2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuafs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuad1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuar2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuar1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi3",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuad2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuat1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamuasvg1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1911" {
   display_name = "TF-AG1-SG-GRES01-ICp-Cluster02"
   nsx_id = "TF-AG1-SG-GRES01-ICp-Cluster02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ag1gr1icp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-Pod-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ICp-VRRP-IP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1912" {
   display_name = "TF-AG1-SG-DR234-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR234-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234dc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1913" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptfs"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1914" {
   display_name = "TF-AG1-SG-DR59-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR59-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59fm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59stl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1915" {
   display_name = "TF-AG1-SG-DR192-CACF-Proxy-VIP"
   nsx_id = "TF-AG1-SG-DR192-CACF-Proxy-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-DR192-CACF-Proxy-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d192lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d192lpcacpr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1916" {
   display_name = "TF-AG1-SG-DR234-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR234-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lparx",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr234lpstl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1917" {
   display_name = "TF-AG1-SG-DR144-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR144-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144dc1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr144dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1918" {
   display_name = "TF-AG1-SG-PDR-UCDRelay"
   nsx_id = "TF-AG1-SG-PDR-UCDRelay"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1ucdrly01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1919" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-EPL2-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-EPL2-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1920" {
   display_name = "TF-AG1-SG-DR217-CACF-Proxy"
   nsx_id = "TF-AG1-SG-DR217-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d217lpcacpr2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d217lpcacpr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1921" {
   display_name = "TF-AG1-SG-ag1h1lpta2hapProxy"
   nsx_id = "TF-AG1-SG-ag1h1lpta2hapProxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-ag1h1lpta2hap-vip",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta2hap1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta2hap2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1922" {
   display_name = "TF-AG1-SG-DR251-CACF-Proxy"
   nsx_id = "TF-AG1-SG-DR251-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d251lpcacpr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1d251lpcacpr2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1923" {
   display_name = "TF-AG1-SG-HRES-TALOS-SSHProxy-SharedProd"
   nsx_id = "TF-AG1-SG-HRES-TALOS-SSHProxy-SharedProd"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta1ssh2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta1ssh1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1924" {
   display_name = "TF-AG1-SG-SRES-Automation-Control-Node"
   nsx_id = "TF-AG1-SG-SRES-Automation-Control-Node"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1cntrl1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1925" {
   display_name = "TF-AG1-SG-OCP-Cluster6-VIP"
   nsx_id = "TF-AG1-SG-OCP-Cluster6-VIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster2-VIP",
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1926" {
   display_name = "TF-AG1-SG-DR237-STaaS-Mail-Clients"
   nsx_id = "TF-AG1-SG-DR237-STaaS-Mail-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237lpfm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr237stw"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1927" {
   display_name = "TF-AG1-SG-DR74-STaaS-AD-DNS"
   nsx_id = "TF-AG1-SG-DR74-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74dc2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr74dc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1928" {
   display_name = "TF-AG1-SG-SRES-WIN-DA"
   nsx_id = "TF-AG1-SG-SRES-WIN-DA"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1daipwin01",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1daipwin02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1929" {
   display_name = "TF-AG1-SG-PDR01-ICp-agnplicp1"
   nsx_id = "TF-AG1-SG-PDR01-ICp-agnplicp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "agnplnicp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-ClusterIP-Service-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-ICp-Pod-Network",
                         "/infra/domains/default/groups/TF-AG1-IPSET-ICp-VRRP-IP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1930" {
   display_name = "TF-AG1-SG-DR11-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR11-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11fm",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11slog",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr11sat"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1931" {
   display_name = "TF-AG1-SG-HRES-HAProxy-OUT"
   nsx_id = "TF-AG1-SG-HRES-HAProxy-OUT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta2hap1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1h1lpta2hap2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1932" {
   display_name = "TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
   nsx_id = "TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-RMQ-UAT-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuar2",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuar1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1933" {
   display_name = "TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
   nsx_id = "TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-PROXY-PROD-VIP",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1934" {
   display_name = "TF-AG1-SG-EU-SRES-RPA-Subnets"
   nsx_id = "TF-AG1-SG-EU-SRES-RPA-Subnets"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-EU-SRES-RPA-2",
                         "/infra/domains/default/groups/TF-AG1-IPSET-NET-EU-SRES-RPA-1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1935" {
   display_name = "TF-AG1-SG-SRES-DVAA-Dev-Servers"
   nsx_id = "TF-AG1-SG-SRES-DVAA-Dev-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-agnsrwndvadeva2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1936" {
   display_name = "TF-AG1-SG-SRES-IAM-SANDBOX-NODB"
   nsx_id = "TF-AG1-SG-SRES-IAM-SANDBOX-NODB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1937" {
   display_name = "TF-AG1-SG-Ansible-Tower"
   nsx_id = "TF-AG1-SG-Ansible-Tower"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpta1str1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1938" {
   display_name = "TF-AG1-SG-SRES-IAM-SANDBOX-All-VMs"
   nsx_id = "TF-AG1-SG-SRES-IAM-SANDBOX-All-VMs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_1939" {
   display_name = "TF-AG1-SG-DR156-STaaS-AD-Clients"
   nsx_id = "TF-AG1-SG-DR156-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lpskl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156stw",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lpstl",
                         "/infra/domains/default/groups/TF-AG1-HOST-ag1dr156lpfm"
]
      }
   }
}
