#####################################
# SGEM GROUPS
#
# Migration date: 08/09/2023 15:24
# Geography.....: EU1 
# Wave..........: eu_sres_wave5
#####################################
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm30"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm30"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam03"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam03"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam03"
]
      }
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam62"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam62"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam62"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam62"
]
      }
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam20"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam20"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam20"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm60"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm60"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam70"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam70"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam70"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam96"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam96"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam96"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam96"
]
      }
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam97"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam97"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam97"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam97"
]
      }
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam31"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam31"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam31"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam31"
]
      }
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam41"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam41"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam41"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam41"
]
      }
   }
}
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai90"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai90"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai90"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai90"
]
      }
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam50"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam50"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam50"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm70"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm70"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm70"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm70"
]
      }
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam95"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam95"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam95"
]
      }
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm40"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm40"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm40"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-EU1-SG-DR280-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-DR280-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR280-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR280-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR280-ESG-vNic_2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srwnisiwin01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srwnisiwin01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srwnisiwin01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srwnisiwin01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildap"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildap"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildap"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildap"
]
      }
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai03"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai03"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai03"
]
      }
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm95"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm95"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm95"
]
      }
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildi01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildi01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildi01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildi01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm95"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm95"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm95"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm95"
]
      }
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam52"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam52"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam52"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam52"
]
      }
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam42"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam42"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam42"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam42"
]
      }
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiasodb"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiasodb"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiasodb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiasodb"
]
      }
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbi01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbi01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbi01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbi01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam82"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam82"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam82"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam82"
]
      }
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam40"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam40"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam40"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam33"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam33"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam33"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam33"
]
      }
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm30"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm30"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai04"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai04"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai04"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai04"
]
      }
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam22"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam22"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam22"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam22"
]
      }
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam83"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam83"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam83"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam83"
]
      }
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam63"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam63"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam63"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam63"
]
      }
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam21"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam21"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam21"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam21"
]
      }
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlnisildap1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlnisildap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlnisildap1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlnisildap1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildap1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildap1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildap1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai93"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai93"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai93"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai93"
]
      }
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam60"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam60"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlnisiwas01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlnisiwas01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlnisiwas01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlnisiwas01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm80"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm80"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm80"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm80"
]
      }
   }
}
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm60"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm60"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm60"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm60"
]
      }
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisimail02"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisimail02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisimail02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisimail02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai92"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai92"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai92"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai92"
]
      }
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-EU1-SG-DR62-SDDC-RP"
   nsx_id = "TF-EU1-SG-DR62-SDDC-RP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkrp4",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkrp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam81"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam81"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam81"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam81"
]
      }
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbi90"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbi90"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbi90"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbi90"
]
      }
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam61"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam61"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam61"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam61"
]
      }
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm50"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm50"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm50"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidwhi"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidwhi"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidwhi"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidwhi"
]
      }
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam72"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam72"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam72"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam72"
]
      }
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam98"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam98"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam98"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam98"
]
      }
   }
}
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwas01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwas01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwas01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwas01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai02"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm80"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm80"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm80"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm80"
]
      }
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam02"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam02"
]
      }
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam04"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam04"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam04"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam04"
]
      }
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam43"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam43"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam43"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam43"
]
      }
   }
}
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam51"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam51"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam51"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam51"
]
      }
   }
}
resource "nsxt_policy_group" "grp_184" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildi90"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildi90"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildi90"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildi90"
]
      }
   }
}
resource "nsxt_policy_group" "grp_185" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam23"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam23"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam23"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam23"
]
      }
   }
}
resource "nsxt_policy_group" "grp_186" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam71"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam71"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam71"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam71"
]
      }
   }
}
resource "nsxt_policy_group" "grp_187" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_188" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam73"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam73"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam73"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam73"
]
      }
   }
}
resource "nsxt_policy_group" "grp_189" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisimail01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisimail01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisimail01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisimail01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_190" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm50"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm50"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm50"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm50"
]
      }
   }
}
resource "nsxt_policy_group" "grp_191" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam32"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam32"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam32"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam32"
]
      }
   }
}
resource "nsxt_policy_group" "grp_192" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam30"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam30"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam30"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam30"
]
      }
   }
}
resource "nsxt_policy_group" "grp_193" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm40"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm40"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm40"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm40"
]
      }
   }
}
resource "nsxt_policy_group" "grp_194" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai91"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwai91"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwai91"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwai91"
]
      }
   }
}
resource "nsxt_policy_group" "grp_195" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisildm20"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisildm20"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisildm20"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisildm20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_196" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm20"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisidbm20"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisidbm20"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisidbm20"
]
      }
   }
}
resource "nsxt_policy_group" "grp_197" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam53"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam53"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam53"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam53"
]
      }
   }
}
resource "nsxt_policy_group" "grp_198" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam80"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpisiwam80"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpisiwam80"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpisiwam80"
]
      }
   }
}
