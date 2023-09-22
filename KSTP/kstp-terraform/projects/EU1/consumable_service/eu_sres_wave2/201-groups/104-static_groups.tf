#####################################
# SGEM GROUPS
#
# Migration date: 05/16/2023 13:49
# Geography.....: EU1 
# Wave..........: eu_sres_wave2
#####################################
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpta3ssh1"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpta3ssh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpta3ssh1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta3ssh1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpgsntnp2"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpgsntnp2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpgsntnp2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpgsntnp2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-EU1-SG-DR238-CPREM-iAIOPs"
   nsx_id = "TF-EU1-SG-DR238-CPREM-iAIOPs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-10-20-42-0-24",
                         "/infra/domains/default/groups/TF-EU1-IPSET-10-148-42-0-24",
                         "/infra/domains/default/groups/TF-EU1-IPSET-10-20-43-0-24"
]
      }
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpta1hap2"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpta1hap2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpta1hap2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta1hap2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpta2hap1"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpta2hap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpta2hap1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2hap1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-EU1-SG-SRES-SL1-SMTP-Reporting"
   nsx_id = "TF-EU1-SG-SRES-SL1-SMTP-Reporting"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpdb",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1ermp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1hr1lpcacfbds"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1hr1lpcacfbds"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1hr1lpcacfbds"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1hr1lpcacfbds"
]
      }
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-EU1-SG-DR309-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-DR309-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR309-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR309-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR309-ESG-vNic_2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-EU1-SG-DR310-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-DR310-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR310-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR310-ESG-vNic_2",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR310-ESG-vNic_1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-EU1-SG-SRES-SL1-eu1srlpm1esd7-vip"
   nsx_id = "TF-EU1-SG-SRES-SL1-eu1srlpm1esd7-vip"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-eu1srlpm1esd7-vip",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp7",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc7"
]
      }
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpta1ssh2"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpta1ssh2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpta1ssh2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta1ssh2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpta1hap1"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpta1hap1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpta1hap1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta1hap1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1hr1lpcacfovpn"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1hr1lpcacfovpn"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1hr1lpcacfovpn"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1hr1lpcacfovpn"
]
      }
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-EU1-SG-SRES-IAMaaS-RITM0140502"
   nsx_id = "TF-EU1-SG-SRES-IAMaaS-RITM0140502"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam83",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam41",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam71",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam04",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam23",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam73",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai91",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam32",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai92",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam43",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam62",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam31",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam53",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam33",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai93",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam21",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam81",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam63",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam98",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam52",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam02",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam72",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam96",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam51",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam22",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam97",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam82",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam42",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam61",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam03"
]
      }
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-EU1-SG-MnEaaS-Event-Bisync-RITM0138533"
   nsx_id = "TF-EU1-SG-MnEaaS-Event-Bisync-RITM0138533"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-MnEaaS-Event-Bisync-VIP-RITM0138533",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc3",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srltm1esdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1esldbp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lplegsldb2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdc",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d48lpmicsdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlcsdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlcsdc",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1esldbs",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esldbc1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp5",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lperisdc",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc4",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdc",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d139lpcd8sdc",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc6",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lperisdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdc",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d48lpmicsdc",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d139lpcd8sdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc5",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcpksldb2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp8",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp4",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpdv1sldbp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc2",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbc1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lplegsldb1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpdv1sldbc1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdp",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp6",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc7",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srltm1esdc",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc8",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcpksldb1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp7",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esldbp1",
                         "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp3"
]
      }
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpta3ssh2"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpta3ssh2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpta3ssh2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta3ssh2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpta2ssh1"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpta2ssh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpta2ssh1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2ssh1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-EU1-SG-DR34-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-DR34-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR34-ESG-vNic_2",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR34-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR34-ESG-vNic_0"
]
      }
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpta1ssh1"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpta1ssh1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpta1ssh1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta1ssh1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpta2hap2"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpta2hap2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpta2hap2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2hap2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpta2ssh2"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpta2ssh2"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpta2ssh2"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2ssh2"
]
      }
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-EU1-SG-HRES-HOST-eu1h1lpgsntnp1"
   nsx_id = "TF-EU1-SG-HRES-HOST-eu1h1lpgsntnp1"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
         key         = "Name" 
         member_type = "VirtualMachine"
         operator    = "EQUALS"
         value       = "eu1h1lpgsntnp1"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpgsntnp1"
]
      }
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-EU1-SG-DR306-ESG-LB-Source"
   nsx_id = "TF-EU1-SG-DR306-ESG-LB-Source"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      path_expression {
         member_paths = [
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR306-ESG-vNic_1",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR306-ESG-vNic_0",
                         "/infra/domains/default/groups/TF-EU1-IPSET-DR306-ESG-vNic_2"
]
      }
   }
}
