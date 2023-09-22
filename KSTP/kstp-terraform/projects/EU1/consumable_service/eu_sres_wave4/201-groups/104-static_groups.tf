#####################################
# SGEM GROUPS
#
# Migration date: 07/18/2023 14:12
# Geography.....: EU1 
# Wave..........: eu_sres_wave4
#####################################
resource "nsxt_policy_group" "grp_258" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascni000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascni000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascni000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascni000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_262" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpno"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1easpno"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1easpno"
]
      }
   }
}
resource "nsxt_policy_group" "grp_263" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epwg3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epwg3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epwg3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epwg3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_264" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpdb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1easpdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1easpdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_266" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecnp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_267" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecwg3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecwg3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_268" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecwg2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecwg2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_269" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlphstp1ncl"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlphstp1ncl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlphstp1ncl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlphstp1ncl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_270" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcni"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejcni"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejcni"
]
      }
   }
}
resource "nsxt_policy_group" "grp_271" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpni"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejpni"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejpni"
]
      }
   }
}
resource "nsxt_policy_group" "grp_272" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esldc1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esldc1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esldc1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esldc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_273" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcwg"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcwg"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejcwg"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejcwg"
]
      }
   }
}
resource "nsxt_policy_group" "grp_274" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epni2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epni2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epni2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epni2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_275" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejtnp1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejtnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejtnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejtnp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_277" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecni2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecni2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecni2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecni2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_280" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspnw000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspnw000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspnw000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspnw000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_281" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecno2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecno2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecno2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecno2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_282" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epno3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epno3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epno3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epno3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_283" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascdb000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascdb000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascdb000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascdb000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_284" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpni"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1easpni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1easpni"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1easpni"
]
      }
   }
}
resource "nsxt_policy_group" "grp_289" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecno3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecno3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecno3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecno3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_290" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srltm1esdc"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srltm1esdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srltm1esdc"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srltm1esdc"
]
      }
   }
}
resource "nsxt_policy_group" "grp_291" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascno"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1eascno"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1eascno"
]
      }
   }
}
resource "nsxt_policy_group" "grp_292" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecdb2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecdb2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecdb2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_294" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecwg1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecwg1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecwg1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_295" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecni3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecni3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecni3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecni3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_296" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1etnp2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1etnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1etnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1etnp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_297" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspni000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspni000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspni000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspni000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_298" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascdb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1eascdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1eascdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_299" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspnp000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspnp000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspnp000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspnp000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_307" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspno000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspno000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspno000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspno000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_308" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlphsts1ncl"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlphsts1ncl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlphsts1ncl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlphsts1ncl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_309" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecdb3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecdb3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecdb3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecdb3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_312" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epdb2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epdb2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epdb2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_315" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk8"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esbk8"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esbk8"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esbk8"
]
      }
   }
}
resource "nsxt_policy_group" "grp_318" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascni000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascni000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascni000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascni000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_321" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epnp2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_323" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascdb000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascdb000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascdb000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascdb000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_324" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejtnp2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejtnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejtnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejtnp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_325" {
   display_name = "TF-EU1-SG-IRES-SPLUNK-HF"
   nsx_id = "TF-EU1-SG-IRES-SPLUNK-HF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-IRES-eu1irsplnkhf01-NAT",
                         "/infra/domains/default/groups/TF-EU1-IPSET-IRES-eu1irsplnkhf02-NAT",
                         "/infra/domains/default/groups/TF-EU1-IPSET-IRES-SPLUNK-HF-VIP-NAT",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1irsplnkhf01",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1irsplnkhf02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_329" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspnp000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspnp000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspnp000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspnp000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_330" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srltm1eslc"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srltm1eslc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srltm1eslc"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srltm1eslc"
]
      }
   }
}
resource "nsxt_policy_group" "grp_331" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epnp3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epnp3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epnp3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_332" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspni000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspni000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspni000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspni000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_333" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1easweb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1easweb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1easweb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1easweb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_334" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1esc2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1esc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1esc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_335" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspno000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspno000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspno000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspno000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_338" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcno"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejcno"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejcno"
]
      }
   }
}
resource "nsxt_policy_group" "grp_340" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspnw000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspnw000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspnw000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspnw000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_341" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecnp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_343" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epni3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epni3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epni3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epni3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_345" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srltm1esdp"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srltm1esdp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srltm1esdp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srltm1esdp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_346" {
   display_name = "TF-EU1-SG-DR240-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-DR240-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR240-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR240-ESG-vNic_2",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR240-ESG-vNic_1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_349" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epno2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epno2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epno2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epno2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_352" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epdb3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epdb3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epdb3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epdb3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_354" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ecnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_355" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpwg"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpwg"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejpwg"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejpwg"
]
      }
   }
}
resource "nsxt_policy_group" "grp_356" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpdb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejpdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejpdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_357" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1easbcp"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1easbcp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1easbcp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1easbcp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_358" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascni"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1eascni"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1eascni"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1eascni"
]
      }
   }
}
resource "nsxt_policy_group" "grp_359" {
   display_name = "TF-EU1-SG-SRES-HOST-nlaspdb000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlaspdb000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlaspdb000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlaspdb000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_360" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascno000m1ermp"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascno000m1ermp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascno000m1ermp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascno000m1ermp"
]
      }
   }
}
resource "nsxt_policy_group" "grp_361" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpno"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejpno"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejpno"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejpno"
]
      }
   }
}
resource "nsxt_policy_group" "grp_362" {
   display_name = "TF-EU1-SG-SRES-HOST-nlascno000m1erms"
   nsx_id = "TF-EU1-SG-SRES-HOST-nlascno000m1erms"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "nlascno000m1erms"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlascno000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_363" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcdb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1ejcdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1ejcdb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ejcdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_364" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srltm1eslc2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srltm1eslc2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srltm1eslc2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srltm1eslc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_365" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1etnp1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1etnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1etnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1etnp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_367" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpm1epwg2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpm1epwg2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpm1epwg2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epwg2"
]
      }
   }
}