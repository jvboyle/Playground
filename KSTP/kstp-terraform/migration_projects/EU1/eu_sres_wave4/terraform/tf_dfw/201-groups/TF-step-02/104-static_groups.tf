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
resource "nsxt_policy_group" "grp_259" {
   display_name = "TF-EU1-SG-SRES-HOST-lmt-wizard"
   nsx_id = "TF-EU1-SG-SRES-HOST-lmt-wizard"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "lmt-wizard"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-lmt-wizard"
]
      }
   }
}
resource "nsxt_policy_group" "grp_260" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_261" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt2"
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
resource "nsxt_policy_group" "grp_265" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt0"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt0"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt0"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt0"
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
resource "nsxt_policy_group" "grp_276" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlPdshbrd"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlPdshbrd"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlPdshbrd"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlPdshbrd"
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
resource "nsxt_policy_group" "grp_278" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1staas15"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1staas15"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1staas15"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1staas15"
]
      }
   }
}
resource "nsxt_policy_group" "grp_279" {
   display_name = "TF-EU1-SG-DR62-lpecnsdc"
   nsx_id = "TF-EU1-SG-DR62-lpecnsdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc4",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc1"
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
resource "nsxt_policy_group" "grp_285" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdhapxy2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdhapxy2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdhapxy2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdhapxy2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_286" {
   display_name = "TF-EU1-SG-SRES-MnEaaS-PRTG-SHR"
   nsx_id = "TF-EU1-SG-SRES-MnEaaS-PRTG-SHR"
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
                         "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpm1epnp2",
                         "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp2",
                         "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpm1ecnp3",
                         "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpm1epnp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_287" {
   display_name = "TF-EU1-SG-DR62-JumpHost-NTP"
   nsx_id = "TF-EU1-SG-DR62-JumpHost-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpprkjmp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpprkjmp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_288" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpabcmstr"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpabcmstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpabcmstr"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpabcmstr"
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
resource "nsxt_policy_group" "grp_293" {
   display_name = "TF-EU1-SG-VDR2-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-VDR2-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-VDR2-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-EU1-IPSET-VDR2-ESG-vNic_2"
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
resource "nsxt_policy_group" "grp_300" {
   display_name = "TF-EU1-SG-DR328-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-DR328-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR328-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR328-ESG-vNic_2",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR328-ESG-vNic_0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_301" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdansdb2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdansdb2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdansdb2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdansdb2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_302" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdanstw2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdanstw2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_303" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpdefmstr"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpdefmstr"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1lpdefmstr"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpdefmstr"
]
      }
   }
}
resource "nsxt_policy_group" "grp_304" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlPtmmch"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlPtmmch"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlPtmmch"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlPtmmch"
]
      }
   }
}
resource "nsxt_policy_group" "grp_305" {
   display_name = "TF-EU1-SG-DR62-WindowsClients"
   nsx_id = "TF-EU1-SG-DR62-WindowsClients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62wpprkorp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62wpprkorp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_306" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdanstw1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdanstw1"
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
resource "nsxt_policy_group" "grp_310" {
   display_name = "TF-EU1-SG-HOST-SRES-eu1srlngacdwdb"
   nsx_id = "TF-EU1-SG-HOST-SRES-eu1srlngacdwdb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlngacdwdb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_311" {
   display_name = "TF-EU1-SDE_APIC_Controllers"
   nsx_id = "TF-EU1-SDE_APIC_Controllers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SDE_Grabels_APICs",
                         "/infra/domains/default/groups/TF-EU1-IPSET-SDE_Milano_APICs",
                         "/infra/domains/default/groups/TF-EU1-IPSET-SDE_Montpellier_APICs"
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
resource "nsxt_policy_group" "grp_313" {
   display_name = "TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc"
   nsx_id = "TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc4",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_314" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdhapxy1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdhapxy1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdhapxy1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdhapxy1"
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
resource "nsxt_policy_group" "grp_316" {
   display_name = "TF-EU1-SG-HOST-SRES-eu1srlptena1"
   nsx_id = "TF-EU1-SG-HOST-SRES-eu1srlptena1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlptena1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_317" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdexec"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdexec"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdexec"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdexec"
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
resource "nsxt_policy_group" "grp_319" {
   display_name = "TF-EU1-SG-DR62-eu1d62lpecnsmc"
   nsx_id = "TF-EU1-SG-DR62-eu1d62lpecnsmc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsmc2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsmc1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_320" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1staas17"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1staas17"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1staas17"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1staas17"
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
resource "nsxt_policy_group" "grp_322" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt3"
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
resource "nsxt_policy_group" "grp_326" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdnexus"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdnexus"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdnexus"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdnexus"
]
      }
   }
}
resource "nsxt_policy_group" "grp_327" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw3"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdanstw3"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdanstw3"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdanstw3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_328" {
   display_name = "TF-EU1-SG-SRES-CISO-Splunk-HF"
   nsx_id = "TF-EU1-SG-SRES-CISO-Splunk-HF"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpcishfds1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpcishfds2"
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
resource "nsxt_policy_group" "grp_336" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt4"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt4"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt4"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt4"
]
      }
   }
}
resource "nsxt_policy_group" "grp_337" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1staas16"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1staas16"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1staas16"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1staas16"
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
resource "nsxt_policy_group" "grp_339" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpans01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpans01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpans01"
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
resource "nsxt_policy_group" "grp_342" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1staas14"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1staas14"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1staas14"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1staas14"
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
resource "nsxt_policy_group" "grp_344" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpcacfbds1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpcacfbds1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpcacfbds1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpcacfbds1"
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
resource "nsxt_policy_group" "grp_347" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlplmt5"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlplmt5"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlplmt5"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlplmt5"
]
      }
   }
}
resource "nsxt_policy_group" "grp_348" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdjump"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdjump"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdjump"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdjump"
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
resource "nsxt_policy_group" "grp_350" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcmssysl"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcmssysl"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcmssysl"
]
      }
   }
}
resource "nsxt_policy_group" "grp_351" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdjenkns"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdjenkns"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdjenkns"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdjenkns"
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
resource "nsxt_policy_group" "grp_353" {
   display_name = "TF-EU1-SG-DR62-PSN-ISE"
   nsx_id = "TF-EU1-SG-DR62-PSN-ISE"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkise1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkise2"
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
resource "nsxt_policy_group" "grp_366" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmcdansdb1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmcdansdb1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmcdansdb1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmcdansdb1"
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
resource "nsxt_policy_group" "grp_368" {
   display_name = "TF-EU1-SG-DR62-RestorePoint"
   nsx_id = "TF-EU1-SG-DR62-RestorePoint"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkrp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkrp2"
]
      }
   }
}
