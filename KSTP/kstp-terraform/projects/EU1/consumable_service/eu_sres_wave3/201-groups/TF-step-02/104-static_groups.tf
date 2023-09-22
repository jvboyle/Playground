#####################################
# SGEM GROUPS
#
# Migration date: 06/28/2023 14:37
# Geography.....: EU1 
# Wave..........: eu_sres_wave3
#####################################
resource "nsxt_policy_group" "grp_163" {
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
resource "nsxt_policy_group" "grp_164" {
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
resource "nsxt_policy_group" "grp_165" {
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
resource "nsxt_policy_group" "grp_166" {
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
resource "nsxt_policy_group" "grp_167" {
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
resource "nsxt_policy_group" "grp_168" {
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
resource "nsxt_policy_group" "grp_169" {
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
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-EU1-SG-DR62-eu1d62lpecnsmc"
   nsx_id = "TF-EU1-SG-DR62-eu1d62lpecnsmc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsmc1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsmc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_171" {
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
resource "nsxt_policy_group" "grp_172" {
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
resource "nsxt_policy_group" "grp_173" {
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
resource "nsxt_policy_group" "grp_174" {
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
resource "nsxt_policy_group" "grp_175" {
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
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc"
   nsx_id = "TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc4",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_177" {
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
resource "nsxt_policy_group" "grp_178" {
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
resource "nsxt_policy_group" "grp_179" {
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
resource "nsxt_policy_group" "grp_180" {
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
resource "nsxt_policy_group" "grp_181" {
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
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-EU1-SG-DR62-PSN-ISE"
   nsx_id = "TF-EU1-SG-DR62-PSN-ISE"
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
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-EU1-SG-DR62-lpecnsdc"
   nsx_id = "TF-EU1-SG-DR62-lpecnsdc"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc4",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecnsdc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_184" {
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
resource "nsxt_policy_group" "grp_185" {
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
resource "nsxt_policy_group" "grp_186" {
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
resource "nsxt_policy_group" "grp_187" {
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
resource "nsxt_policy_group" "grp_188" {
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
resource "nsxt_policy_group" "grp_189" {
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
resource "nsxt_policy_group" "grp_190" {
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
resource "nsxt_policy_group" "grp_191" {
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
resource "nsxt_policy_group" "grp_192" {
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
resource "nsxt_policy_group" "grp_193" {
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
resource "nsxt_policy_group" "grp_194" {
   display_name = "TF-EU1-SG-DR62-JumpHost-NTP"
   nsx_id = "TF-EU1-SG-DR62-JumpHost-NTP"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpprkjmp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpprkjmp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_195" {
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
resource "nsxt_policy_group" "grp_196" {
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
resource "nsxt_policy_group" "grp_197" {
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
resource "nsxt_policy_group" "grp_198" {
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
resource "nsxt_policy_group" "grp_199" {
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
resource "nsxt_policy_group" "grp_200" {
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
resource "nsxt_policy_group" "grp_201" {
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
resource "nsxt_policy_group" "grp_202" {
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
resource "nsxt_policy_group" "grp_203" {
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
resource "nsxt_policy_group" "grp_204" {
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
