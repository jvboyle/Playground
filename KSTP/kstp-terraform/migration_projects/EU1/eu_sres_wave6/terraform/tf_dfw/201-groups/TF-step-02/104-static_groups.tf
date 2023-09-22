#####################################
# SGEM GROUPS
#
# Migration date: 09/06/2023 13:49
# Geography.....: EU1 
# Wave..........: eu_sres_wave6
#####################################
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-EU1-EU-SG-DR62-Frontier-ALL"
   nsx_id = "TF-EU1-EU-SG-DR62-Frontier-ALL"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-EU-DR62-Frontier-EMEA-2",
                         "/infra/domains/default/groups/TF-EU1-IPSET-EU-DR62-Frontier-EMEA-1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-EU-DR62-Frontier-EMEA-SDDC",
                         "/infra/domains/default/groups/TF-EU1-IPSET-EU-DR62-Frontier-US-1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-EU-DR62-Frontier-CALA",
                         "/infra/domains/default/groups/TF-EU1-IPSET-EU-DR62-Frontier-ASPAC",
                         "/infra/domains/default/groups/TF-EU1-IPSET-EU-DR62-Frontier-US-2",
                         "/infra/domains/default/groups/TF-EU1-IPSET-EU-DR62-Frontier-NA"
]
      }
   }
}
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecdb4"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecdb4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecdb4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epwg4"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epwg4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epwg4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg4"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecwg4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk5"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esbk5"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esbk5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk6"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk6"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esbk6"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esbk6"
]
      }
   }
}
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlnsaspoc1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlnsaspoc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlnsaspoc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlnsaspoc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1wphwcdb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1wphwcdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1wphwcdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1wphwcdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srwdhwcgrfds"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srwdhwcgrfds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srwdhwcgrfds"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srwdhwcgrfds"
]
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1eslbak1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1eslbak1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1eslbak1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1eslbak1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-EU1-SG-DR62-eu1d62apprkise"
   nsx_id = "TF-EU1-SG-DR62-eu1d62apprkise"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkise2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkise1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srwphwcgrfds"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srwphwcgrfds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srwphwcgrfds"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srwphwcgrfds"
]
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspdb000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspdb000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspdb000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspdb000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1wphwcweb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1wphwcweb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1wphwcweb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1wphwcweb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-EU1-SG-SRES-HOST-nlasabuildm1e00p"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlasabuildm1e00p"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlasabuildm1e00p"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlasabuildm1e00p"
]
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1wphwccog"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1wphwccog"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1wphwccog"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1wphwccog"
]
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srwphwcgrfdb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srwphwcgrfdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srwphwcgrfdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srwphwcgrfdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-EU1-SG-DR62-eu1d62wprkeswo"
   nsx_id = "TF-EU1-SG-DR62-eu1d62wprkeswo"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62wprkeswo1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62wprkeswo2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-EU1-DR265-eu1d265lpcacprxVIP"
   nsx_id = "TF-EU1-DR265-eu1d265lpcacprxVIP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-Host-eu1d265lpcacprxVIP",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpcacprx2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpcacprx1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esap7"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esap7"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esap7"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esap7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1ljmp01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1ljmp01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1ljmp01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1ljmp01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esbk2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esbk2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srltm1esbk"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srltm1esbk"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srltm1esbk"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srltm1esbk"
]
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srwphwcdb2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srwphwcdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srwphwcdb2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srwphwcdb2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk7"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk7"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esbk7"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esbk7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-EU1-SG-DR296-WindowsClients"
   nsx_id = "TF-EU1-SG-DR296-WindowsClients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d296wpmcmjh2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d296wpmcmsus",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d296wpmcmjh1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-EU1-SG-DR296-WindowsJumpHosts"
   nsx_id = "TF-EU1-SG-DR296-WindowsJumpHosts"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d296wpmcmjh2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d296wpmcmjh1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpi2pprx2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpi2pprx2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1lpi2pprx2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpi2pprx2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-EU1-SG-DR296-WindowsWSUS"
   nsx_id = "TF-EU1-SG-DR296-WindowsWSUS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d296wpmcmsus"
]
      }
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1wphwcetl"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1wphwcetl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1wphwcetl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1wphwcetl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk4"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esbk4"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esbk4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epdb4"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epdb4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epdb4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpelk1001"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpelk1001"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpelk1001"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpelk1001"
]
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esbk3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esbk3"
]
      }
   }
}
