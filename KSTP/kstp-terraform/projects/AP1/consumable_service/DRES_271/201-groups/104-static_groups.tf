#####################################
# SGEM GROUPS
#
# Migration date: 03/21/2023 16:38
# Geography.....: AP1 
# Wave..........: DRES_271
#####################################
resource "nsxt_policy_group" "grp_653" {
   display_name = "TF-AP1-SG-IRES-WIN-VMware-vRO"
   nsx_id = "TF-AP1-SG-IRES-WIN-VMware-vRO"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1vro01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_654" {
   display_name = "TF-AP1-SG-SL-IRES-NSX-Management"
   nsx_id = "TF-AP1-SG-SL-IRES-NSX-Management"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SL-IRES-NSXM"
]
      }
   }
}
resource "nsxt_policy_group" "grp_655" {
   display_name = "TF-AP1-SG-SRES-WIN-DNS-NTP"
   nsx_id = "TF-AP1-SG-SRES-WIN-DNS-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-WIN-DNS-NTP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_656" {
   display_name = "TF-AP1-SG-DR264-ESG-Interfaces"
   nsx_id = "TF-AP1-SG-DR264-ESG-Interfaces"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-DR264-ESG-vpn-vNic_1",
                         "/infra/domains/default/groups/TF-AP1-IPSET-DR264-ESG-agg-vNic_0",
                         "/infra/domains/default/groups/TF-AP1-IPSET-DR264-LB-vNIC_3",
                         "/infra/domains/default/groups/TF-AP1-IPSET-DR264-ESG-dlr-vNic_2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_657" {
   display_name = "TF-AP1-SG-SMTP-Clients"
   nsx_id = "TF-AP1-SG-SMTP-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-PROXY-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_658" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-PROXY-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-PROXY-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-PROXY-PROD",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_659" {
   display_name = "TF-AP1-SG-SRES01-OCP-Cluster03"
   nsx_id = "TF-AP1-SG-SRES01-OCP-Cluster03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1sr1lpta3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-LB-OCP-Cluster03-VIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-LB-OCP-Cluster03-VIP1",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES1-LB1-PrimaryIP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_660" {
   display_name = "TF-AP1-SG-SRES01-OCP-Cluster01"
   nsx_id = "TF-AP1-SG-SRES01-OCP-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1sr1lpta1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES1-LB-OCP-Cluster1-VIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-OCP-Cluster04-SNAT",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES1-LB-VIP-OCP1",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES01-ICP-Cluster01",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES1-LB1-PrimaryIP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_661" {
   display_name = "TF-AP1-SG-DRES-Proxy-Servers"
   nsx_id = "TF-AP1-SG-DRES-Proxy-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d103lpcacprx1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d128lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d130lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d141lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_662" {
   display_name = "TF-AP1-SG-PDR-Internet-Proxy-Server"
   nsx_id = "TF-AP1-SG-PDR-Internet-Proxy-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-PDR-Proxy-VIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-dnat-to-PDR-Proxy-from-IRES",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1pdr1prx01",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1pdr1prx02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_663" {
   display_name = "TF-AP1-SG-SL-IRES-VMWARE-Management"
   nsx_id = "TF-AP1-SG-SL-IRES-VMWARE-Management"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SL-IRES-vCenter"
]
      }
   }
}
resource "nsxt_policy_group" "grp_664" {
   display_name = "TF-AP1-HOST-SRES-HWSW-PROD"
   nsx_id = "TF-AP1-HOST-SRES-HWSW-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-HWSW-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_665" {
   display_name = "TF-AP1-SG-SRES01-OCP-Build"
   nsx_id = "TF-AP1-SG-SRES01-OCP-Build"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1sr1wdns01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_666" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-DE-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-DE-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-DE-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_667" {
   display_name = "TF-AP1-SG-HRES-HA-Proxy-OUT"
   nsx_id = "TF-AP1-SG-HRES-HA-Proxy-OUT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1h1lpta2hap2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1h1lpta2hap1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_668" {
   display_name = "TF-AP1-SG-SRES-WIN-SQL"
   nsx_id = "TF-AP1-SG-SRES-WIN-SQL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1sr1sql01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_669" {
   display_name = "TF-AP1-SG-SL-IRES-Internet-Proxy-Clients"
   nsx_id = "TF-AP1-SG-SL-IRES-Internet-Proxy-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-NET-SL-IRES-Portable"
]
      }
   }
}
resource "nsxt_policy_group" "grp_670" {
   display_name = "TF-AP1-SG-SRES-WIN-WSUS"
   nsx_id = "TF-AP1-SG-SRES-WIN-WSUS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1sr1wsus01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_671" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-RMQ-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-RMQ-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-RMQ-PROD",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-IAM-THY-RMQ-PROD-VIP"
]
      }
   }
}
resource "nsxt_policy_group" "grp_672" {
   display_name = "TF-AP1-TEST-SG-SRES01-Icp-Cluster01"
   nsx_id = "TF-AP1-TEST-SG-SRES01-Icp-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1cntrl1_old",
                         "/infra/domains/default/groups/TF-AP1-HOST-RHEltest",
                         "/infra/domains/default/groups/TF-AP1-HOST-etn-v2t-03a",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1lpcacprx1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1srlpcacfbds1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1lcacfjump01",
                         "/infra/domains/default/groups/TF-AP1-HOST-etn-v2t-03b",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1ptr1_test",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1lpcacprx2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1lcacfjump02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_673" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-SECRET-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-SECRET-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-SECRET-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_674" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-MSSQL-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-MSSQL-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-IAM-THY-MSSQL-PROD-VIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-MSSQL-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_675" {
   display_name = "TF-AP1-SG-SRES-STaaS-AD-Clients"
   nsx_id = "TF-AP1-SG-SRES-STaaS-AD-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-STaaS-AD-Clients"
]
      }
   }
}
resource "nsxt_policy_group" "grp_676" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-RDP-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-RDP-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "CONTAINS"
         value       = "piam"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1sr1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-IAM-THY-RMQ-PROD-VIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-IAM-THY-MSSQL-PROD-VIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-IAM-THY-SVG-PROD",
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-RDP-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_677" {
   display_name = "TF-AP1-SG-SRES-WIN-Jump-Servers"
   nsx_id = "TF-AP1-SG-SRES-WIN-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1sr1wjmp02",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-WIN-Jump-Servers-VIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1sr1wjmp01",
                         "/infra/domains/default/groups/TF-AP1-IPSET-dnat-to-ap1sr1wjmp00"
]
      }
   }
}
resource "nsxt_policy_group" "grp_678" {
   display_name = "TF-AP1-SG-BigFix-Relay"
   nsx_id = "TF-AP1-SG-BigFix-Relay"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1sr1bfrelay2",
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1sr1bfrelay1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_679" {
   display_name = "TF-AP1-SG-PDR-SMTP-Relay"
   nsx_id = "TF-AP1-SG-PDR-SMTP-Relay"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-ap1pdr1smtp01-IRES-NAT",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1pdr1smtp01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_680" {
   display_name = "TF-AP1-SG-SRES-Linux-Jump-Servers"
   nsx_id = "TF-AP1-SG-SRES-Linux-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-dnat-to-ap1sr1ljmp01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_681" {
   display_name = "TF-AP1-SG-SRES-STaaS-AD-DNS"
   nsx_id = "TF-AP1-SG-SRES-STaaS-AD-DNS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-STaaS-AD-DNS"
]
      }
   }
}
resource "nsxt_policy_group" "grp_682" {
   display_name = "TF-AP1-SG-SRES-Automation-Control-Node"
   nsx_id = "TF-AP1-SG-SRES-Automation-Control-Node"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1sr1cntrl1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1cntrl1_old"
]
      }
   }
}
resource "nsxt_policy_group" "grp_683" {
   display_name = "TF-AP1-SG-DRES110-OCP-Cluster01"
   nsx_id = "TF-AP1-SG-DRES110-OCP-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1d110lpbpi"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-DR110-LB1-PrimaryIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-DRES110-LB-OCP-Cluster1-VIP-1",
                         "/infra/domains/default/groups/TF-AP1-IPSET-DRES110-LB-OCP-Cluster1-VIP-2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_684" {
   display_name = "TF-AP1-SG-SRES-IAM-WINDOWS-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-WINDOWS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-MSSQL-PROD",
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-RAS-PROD",
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-DE-PROD",
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-SECRET-PROD",
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-RMQ-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_685" {
   display_name = "TF-AP1-SG-SRES-STaaS-AD"
   nsx_id = "TF-AP1-SG-SRES-STaaS-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-STaaS-AD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_686" {
   display_name = "TF-AP1-SG-HRES-TALOS-SSHProxy"
   nsx_id = "TF-AP1-SG-HRES-TALOS-SSHProxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SNAT-to-DA",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1h1lpta1ssh2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1h1lpta1ssh1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_687" {
   display_name = "TF-AP1-SG-IRES-WIN-VMware-Monitoring"
   nsx_id = "TF-AP1-SG-IRES-WIN-VMware-Monitoring"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-ap1vmon",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1vmon"
]
      }
   }
}
resource "nsxt_policy_group" "grp_688" {
   display_name = "TF-AP1-EU1-SRES-SEPM"
   nsx_id = "TF-AP1-EU1-SRES-SEPM"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-eu1sr1sepm1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_689" {
   display_name = "TF-AP1-SG-IRES-WIN-TS-Licensing"
   nsx_id = "TF-AP1-SG-IRES-WIN-TS-Licensing"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1wtslic01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_690" {
   display_name = "TF-AP1-SG-DRES-ALL-CACF-Proxy"
   nsx_id = "TF-AP1-SG-DRES-ALL-CACF-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d101lpcacprx1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1pdr1prx01",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d129lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1h1lpta1ssh2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d127lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1h1lpta1ssh1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1lpcacprx2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d130lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d107lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1pdr1prx02",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d141lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d114lpcacpr2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d128lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d103lpcacprx1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d114lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d108lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d105lpcacpr2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1sr1lpcacprx1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1d110lpcacpr1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_691" {
   display_name = "TF-AP1-SG-SMTP-sendgrid-net"
   nsx_id = "TF-AP1-SG-SMTP-sendgrid-net"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-smtp-sendgrid-net"
]
      }
   }
}
resource "nsxt_policy_group" "grp_692" {
   display_name = "TF-AP1-SG-SRES-Windows-Servers"
   nsx_id = "TF-AP1-SG-SRES-Windows-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-NET-SYD-SRES-GSNI-subnet"
]
      }
   }
}
resource "nsxt_policy_group" "grp_693" {
   display_name = "TF-AP1-SG-SL-IRES-WIN-AD-DNS-NTP"
   nsx_id = "TF-AP1-SG-SL-IRES-WIN-AD-DNS-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SL-IRES-WIN-AD-DNS-NTP",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1dc1",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1dc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_694" {
   display_name = "TF-AP1-SG-IRES-Network-Automation-Server-Group"
   nsx_id = "TF-AP1-SG-IRES-Network-Automation-Server-Group"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IRES-ap1irlptfa01",
                         "/infra/domains/default/groups/TF-AP1-IPSET-IRES-ap1irlpipam01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_695" {
   display_name = "TF-AP1-SG-DRES114-OCP-Cluster01"
   nsx_id = "TF-AP1-SG-DRES114-OCP-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1d114lpnab"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-DRES114-LB-OCP-Cluster1-VIP-2",
                         "/infra/domains/default/groups/TF-AP1-IPSET-DR114-LB1-PrimaryIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-DRES114-LB-OCP-Cluster1-VIP-1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_696" {
   display_name = "TF-AP1-SG-SRES-IAM-LINUX-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-LINUX-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-SDI-PROD",
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-SVG-PROD",
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-DB2-PROD",
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-PROXY-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_697" {
   display_name = "TF-AP1-SG-SRES01-OCP-Cluster02"
   nsx_id = "TF-AP1-SG-SRES01-OCP-Cluster02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1sr1lpta2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES1-LB-OCP-Cluster2-VIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES1-LB1-PrimaryIP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES1-LB-VIP-OCP2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_698" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-RAS-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-RAS-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-RAS-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_699" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-SDI-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-SDI-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-SDI-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_700" {
   display_name = "TF-AP1-EU1-SR1-Server"
   nsx_id = "TF-AP1-EU1-SR1-Server"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-eu1sr1lparmsisi"
]
      }
   }
}
resource "nsxt_policy_group" "grp_701" {
   display_name = "TF-AP1-SG-SRES-MNEAAS-AP-NWG"
   nsx_id = "TF-AP1-SG-SRES-MNEAAS-AP-NWG"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1srlpm1e*wg*"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1srlpm1epwg"
]
      }
   }
}
resource "nsxt_policy_group" "grp_702" {
   display_name = "TF-AP1-SG-IRES-LIN-SFTP-Backup"
   nsx_id = "TF-AP1-SG-IRES-LIN-SFTP-Backup"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-ap1sftp02-IRES-NAT"
]
      }
   }
}
resource "nsxt_policy_group" "grp_703" {
   display_name = "TF-AP1-SG-SRES01-Icp-Cluster01"
   nsx_id = "TF-AP1-SG-SRES01-Icp-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1sr1icp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-NET-ICp-Pod-Network",
                         "/infra/domains/default/groups/TF-AP1-IPSET-NET-ICp-ClusterIP-Service-Network",
                         "/infra/domains/default/groups/TF-AP1-IPSET-ICp-VRRP-IP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES01-ICP-Cluster01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_704" {
   display_name = "TF-AP1-SG-SRES-IAM-WINDOWS-PROD-AD"
   nsx_id = "TF-AP1-SG-SRES-IAM-WINDOWS-PROD-AD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-WINDOWS-PROD-AD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_705" {
   display_name = "TF-AP1-SG-AP-MSS-QRADAR-DC"
   nsx_id = "TF-AP1-SG-AP-MSS-QRADAR-DC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1lmssqr01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_706" {
   display_name = "TF-AP1-SG-SL-IRES-WIN-Jump-Servers"
   nsx_id = "TF-AP1-SG-SL-IRES-WIN-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1jump02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_707" {
   display_name = "TF-AP1-SG-SRES-NAB-RDP-PROD"
   nsx_id = "TF-AP1-SG-SRES-NAB-RDP-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-NAB-RDP-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_708" {
   display_name = "TF-AP1-SG-DRES164-OCP-Cluster01"
   nsx_id = "TF-AP1-SG-DRES164-OCP-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1d164lptest"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-DRES164-LB-OCP-Cluster1-VIP-1",
                         "/infra/domains/default/groups/TF-AP1-IPSET-DRES164-LB-OCP-Cluster1-VIP-2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_709" {
   display_name = "TF-AP1-SG-SRES-IAM-NODB-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-NODB-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-DE-PROD",
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-SECRET-PROD",
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-SDI-PROD",
                         "/infra/domains/default/groups/TF-AP1-SG-SRES-IAM-THY-RMQ-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_710" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-SVG-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-SVG-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-ap1sr1apiamprsvg1-secondary-IP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-SRES-IAM-THY-SVG-PROD",
                         "/infra/domains/default/groups/TF-AP1-IPSET-ap1sr1apiamprsvg2-secondary-IP",
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-SVG-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_711" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-DB2-PROD"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-DB2-PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-DB2-PROD"
]
      }
   }
}
resource "nsxt_policy_group" "grp_712" {
   display_name = "TF-AP1-SG-SRES-Sciencelogic-servers"
   nsx_id = "TF-AP1-SG-SRES-Sciencelogic-servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1srlpm1esc1",
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1srlpm1esbk1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_713" {
   display_name = "TF-AP1-SG-SRES-MNEAAS-AP-NCI"
   nsx_id = "TF-AP1-SG-SRES-MNEAAS-AP-NCI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1srlpm1e*ni*"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1srlpm1epni",
                         "/infra/domains/default/groups/TF-AP1-IPSET-Host-ap1srlpm1ecni"
]
      }
   }
}
resource "nsxt_policy_group" "grp_714" {
   display_name = "TF-AP1-SG-SL-VCS-WIN-AD-DNS-NTP"
   nsx_id = "TF-AP1-SG-SL-VCS-WIN-AD-DNS-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-SL-VCS-WIN-AD-DNS-NTP",
                         "/infra/domains/default/groups/TF-AP1-HOST-ADNSap12",
                         "/infra/domains/default/groups/TF-AP1-HOST-ADNSap11"
]
      }
   }
}
resource "nsxt_policy_group" "grp_715" {
   display_name = "TF-AP1-SG-SRES-IAM-THY-All-VMs"
   nsx_id = "TF-AP1-SG-SRES-IAM-THY-All-VMs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1sr1wpiam"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "STARTSWITH"
         value       = "ap1sr1lpiam"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-IPSET-IPSET-SRES-IAM-THY-All-VMs"
]
      }
   }
}
resource "nsxt_policy_group" "grp_716" {
   display_name = "TF-AP1-SG-HRES-HA-Proxy-IN"
   nsx_id = "TF-AP1-SG-HRES-HA-Proxy-IN"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1h1lpta1hap2",
                         "/infra/domains/default/groups/TF-AP1-HOST-ap1h1lpta1hap1"
]
      }
   }
}
