#####################################
# SGEM GROUPS
#
# Migration date: 04/17/2023 19:16
# Geography.....: EU1 
# Wave..........: EU1-HRES-wave2
#####################################
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpcardb1000"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpcardb1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpcardb1000"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpcardb1000"
]
      }
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-EU1-SG-SRES-TSB-M-EaaS-SL1-Powerflow"
   nsx_id = "TF-EU1-SG-SRES-TSB-M-EaaS-SL1-Powerflow"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlnm1eslpf01",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eslpf01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-EU1-SG-DR209-M-EaaS-lphlcs"
   nsx_id = "TF-EU1-SG-DR209-M-EaaS-lphlcs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR209-eu1d209lphlcsdp-vip",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlcsdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlcsdc"
]
      }
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-EU1-SG-MnEaaS-Dynatrace-Monitoring"
   nsx_id = "TF-EU1-SG-MnEaaS-Dynatrace-Monitoring"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlascni000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-SL-IRES-MnEaaS-Dynatrace-Monitoring",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlaspnp000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlaspni000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlascnp000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlascdb000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlascno000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlaspdb000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlaspno000iswrm",
                         "/infra/domains/default/groups/TF-EU1-IPSET-nlaspnw000iswrm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcni",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejtnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg2",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpwg",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpno",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcwg",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascno000dc1rm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcno",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000dc1rm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcno",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000dc1rm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpno",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejtnp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcfrtnp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcfrtnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpni",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpni",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000dc1rm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcni",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascni000dc1rm",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpni",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascni",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easweb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp3",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1erms",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1erms"
]
      }
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-EU1-HOST-HRES-CACF-BDS-Child"
   nsx_id = "TF-EU1-HOST-HRES-CACF-BDS-Child"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds"
]
      }
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-EU1-SG-SRES-MNE-AMS3-Shared"
   nsx_id = "TF-EU1-SG-SRES-MNE-AMS3-Shared"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-EU1-EU-SG-SRES-eu1srlpm1esd3-vip"
   nsx_id = "TF-EU1-EU-SG-SRES-eu1srlpm1esd3-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpmsatcld1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpmsatcld1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpgsenb01"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpgsenb01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpgsenb01"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpgsenb01"
]
      }
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlphcs0001"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlphcs0001"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlphcs0001"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlphcs0001"
]
      }
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-EU1-SG-SRES-TSB-M-EaaS-SL1-DB"
   nsx_id = "TF-EU1-SG-SRES-TSB-M-EaaS-SL1-DB"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpgse1000"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpgse1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpgse1000"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpgse1000"
]
      }
   }
}
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpgsenexgen"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpgsenexgen"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpgsenexgen"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpgsenexgen"
]
      }
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-EU1-SG-DR88-M-EaaS-SL1"
   nsx_id = "TF-EU1-SG-DR88-M-EaaS-SL1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d88lpciftnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d88lpciftnp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-EU1-SG-DR209-M-EaaS-lphlctnp"
   nsx_id = "TF-EU1-SG-DR209-M-EaaS-lphlctnp"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlctnp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlctnp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1srlpcarwas1000"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1srlpcarwas1000"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1srlpcarwas1000"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpcarwas1000"
]
      }
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpbzprod2"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpbzprod2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1lpbzprod2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpbzprod2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1lpbzzprod"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1lpbzzprod"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1lpbzzprod"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpbzzprod"
]
      }
   }
}
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-EU1-SG-SRES-HOST-eu1sr1dxdev02"
   nsx_id = "TF-EU1-SG-SRES-HOST-eu1sr1dxdev02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1sr1dxdev02"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1dxdev02"
]
      }
   }
}
