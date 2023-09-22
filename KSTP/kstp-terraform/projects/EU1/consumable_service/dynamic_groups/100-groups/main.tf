resource "nsxt_policy_group" "grp_1" {
   display_name = "TF-EU1-SG-CHGEU0134666-VM"
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
}
resource "nsxt_policy_group" "grp_2" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld117RPAupjmp"
      }
   }
}
resource "nsxt_policy_group" "grp_3" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-KIM-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl117KIMupdeb"
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
      value       = "nl117KIMupdsb"
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
      value       = "nl117KIMupdbb"
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
      value       = "nl117KIMupdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_4" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-KIM-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl117KIMuppgb"
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
      value       = "nl117KIMuppsb"
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
      value       = "nl117KIMuppbb"
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
      value       = "nl117KIMuppeb"
      }
   }
}
resource "nsxt_policy_group" "grp_5" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-KIM-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl117KIMupugb"
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
      value       = "nl117KIMupusb"
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
      value       = "nl117KIMupubb"
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
      value       = "nl117KIMupueb"
      }
   }
}
resource "nsxt_policy_group" "grp_6" {
   display_name = "TF-EU1-SG-DR117-RPA-UP-RPA-KIM-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl117KIMupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_7" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-ABC-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123ABCbpdsb"
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
      value       = "nl123ABCbpdbb"
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
      value       = "nl123ABCbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_8" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-ABC-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123ABCbppbb"
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
      value       = "nl123ABCbppsb"
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
      value       = "nl123ABCbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_9" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-ABC-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123ABCbpusb"
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
      value       = "nl123ABCbpugb"
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
      value       = "nl123ABCbpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_10" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-ABC-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123ABCbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_11" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-ICS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123ICSbpdsb"
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
      value       = "nl123ICSbpdgb"
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
      value       = "nl123ICSbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_12" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-ICS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123ICSbppgb"
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
      value       = "nl123ICSbppbb"
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
      value       = "nl123ICSbppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_13" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-ICS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123ICSbpugb"
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
      value       = "nl123ICSbpusb"
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
      value       = "nl123ICSbpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_14" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-ICS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123ICSbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_15" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld123ABCbpjmp"
      }
   }
}
resource "nsxt_policy_group" "grp_16" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-MWI-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123MWIbpdbb"
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
      value       = "nl123MWIbpdgb"
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
      value       = "nl123MWIbpdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_17" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-MWI-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123MWIbppbb"
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
      value       = "nl123MWIbppsb"
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
      value       = "nl123MWIbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_18" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-MWI-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123MWIbpubb"
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
      value       = "nl123MWIbpusb"
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
      value       = "nl123MWIbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_19" {
   display_name = "TF-EU1-SG-DR123-RPA-BP-ABC-MWI-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl123MWIbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_20" {
   display_name = "TF-EU1-SG-DR146-SDDC-eu1d146lnrpt1001"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1d146lnrpt"
      }
   }
}
resource "nsxt_policy_group" "grp_21" {
   display_name = "TF-EU1-SG-DR157-RPA-UP-RPA-DMP-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl157DMPupdgb"
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
      value       = "nl157DMPupdsb"
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
      value       = "nl157DMPupdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_22" {
   display_name = "TF-EU1-SG-DR157-RPA-UP-RPA-DMP-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl157DMPuppgb"
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
      value       = "nl157DMPuppbb"
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
      value       = "nl157DMPuppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_23" {
   display_name = "TF-EU1-SG-DR157-RPA-UP-RPA-DMP-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl157DMPupubb"
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
      value       = "nl157DMPupusb"
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
      value       = "nl157DMPupugb"
      }
   }
}
resource "nsxt_policy_group" "grp_24" {
   display_name = "TF-EU1-SG-DR157-RPA-UP-RPA-DMP-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl157DMPupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_25" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld17wiebpdsb"
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
      value       = "nld17wiebpdbb"
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
      value       = "nld17wiebpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_26" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld17wiebppgb"
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
      value       = "nld17wiebppbb"
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
      value       = "nld17wiebppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_27" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld17wiebpubb"
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
      value       = "nld17wiebpusb"
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
      value       = "nld17wiebpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_28" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld17wiebpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_29" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-WIE-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld17WIEbpdbb"
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
      value       = "nld17WIEbpdgb"
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
      value       = "nld17WIEbpdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_30" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-WIE-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld17WIEbppgb"
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
      value       = "nld17WIEbppsb"
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
      value       = "nld17WIEbppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_31" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-WIE-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld17WIEbpusb"
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
      value       = "nld17WIEbpubb"
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
      value       = "nld17WIEbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_32" {
   display_name = "TF-EU1-SG-DR17-RPA-BP-WIE-WIE-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld17WIEbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_33" {
   display_name = "TF-EU1-SG-DR175-RPA-UP-RPA-VOR-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl175VORupdsb"
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
      value       = "nl175VORupdgb"
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
      value       = "nl175VORupdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_34" {
   display_name = "TF-EU1-SG-DR175-RPA-UP-RPA-VOR-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl175VORuppbb"
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
      value       = "nl175VORuppgb"
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
      value       = "nl175VORuppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_35" {
   display_name = "TF-EU1-SG-DR175-RPA-UP-RPA-VOR-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl175VORupugb"
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
      value       = "nl175VORupusb"
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
      value       = "nl175VORupubb"
      }
   }
}
resource "nsxt_policy_group" "grp_36" {
   display_name = "TF-EU1-SG-DR175-RPA-UP-RPA-VOR-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl175VORupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_37" {
   display_name = "TF-EU1-SG-DR18-RPA-AA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld18boiaad"
      }
   }
}
resource "nsxt_policy_group" "grp_38" {
   display_name = "TF-EU1-SG-DR18-RPA-AA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld18boiaap"
      }
   }
}
resource "nsxt_policy_group" "grp_39" {
   display_name = "TF-EU1-SG-DR18-RPA-AA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld18boiaau"
      }
   }
}
resource "nsxt_policy_group" "grp_40" {
   display_name = "TF-EU1-SG-DR18-RPA-AA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld18boiaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_41" {
   display_name = "TF-EU1-SG-DR20-SSH-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1dr20dajh"
      }
   }
}
resource "nsxt_policy_group" "grp_42" {
   display_name = "TF-EU1-SG-DR215-RPA-UP-RPA-SDS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl215SDSupdgb"
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
      value       = "nl215SDSupdbb"
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
      value       = "nl215SDSupdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_43" {
   display_name = "TF-EU1-SG-DR215-RPA-UP-RPA-SDS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl215SDSuppgb"
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
      value       = "nl215SDSuppbb"
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
      value       = "nl215SDSuppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_44" {
   display_name = "TF-EU1-SG-DR215-RPA-UP-RPA-SDS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl215SDSupugb"
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
      value       = "nl215SDSupubb"
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
      value       = "nl215SDSupusb"
      }
   }
}
resource "nsxt_policy_group" "grp_45" {
   display_name = "TF-EU1-SG-DR215-RPA-UP-RPA-SDS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl215SDSupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_46" {
   display_name = "TF-EU1-SG-DR22-RPA-AA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld22dcgaadsb"
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
      value       = "nld22dcgaadbb"
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
      value       = "nld22dcgaadgb"
      }
   }
}
resource "nsxt_policy_group" "grp_47" {
   display_name = "TF-EU1-SG-DR22-RPA-AA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld22dcgaapsb"
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
      value       = "nld22dcgaapbb"
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
      value       = "nld22dcgaapgb"
      }
   }
}
resource "nsxt_policy_group" "grp_48" {
   display_name = "TF-EU1-SG-DR22-RPA-AA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld22dcgaausb"
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
      value       = "nld22dcgaaubb"
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
      value       = "nld22dcgaaugb"
      }
   }
}
resource "nsxt_policy_group" "grp_49" {
   display_name = "TF-EU1-SG-DR22-RPA-AA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld22dcgaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_50" {
   display_name = "TF-EU1-SG-DR24-RPA-AA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld24cambpdbb"
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
      value       = "nld24canbpdgb"
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
      value       = "nld24canbpdbb"
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
      value       = "nld24canbpdsb"
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
      value       = "nld24cambpdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_51" {
   display_name = "TF-EU1-SG-DR24-RPA-AA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld24cambppgb"
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
      value       = "nld24canbppgb"
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
      value       = "nld24canbppsb"
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
      value       = "nld24canbppbb"
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
      value       = "nld24cambppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_52" {
   display_name = "TF-EU1-SG-DR24-RPA-AA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld24cambpubb"
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
      value       = "nld24canbpugb"
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
      value       = "nld24canbpubb"
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
      value       = "nld24cambpusb"
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
      value       = "nld24canbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_53" {
   display_name = "TF-EU1-SG-DR24-RPA-AA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld24canbpgld"
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
      value       = "nld24cambpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_54" {
   display_name = "TF-EU1-SG-DR24-RPA-BP-CAN-CAN-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld24CANbpdbb"
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
      value       = "nld24CANbpdsb"
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
      value       = "nld24CANbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_55" {
   display_name = "TF-EU1-SG-DR24-RPA-BP-CAN-CAN-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld24CANbppsb"
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
      value       = "nld24CANbppbb"
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
      value       = "nld24CANbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_56" {
   display_name = "TF-EU1-SG-DR24-RPA-BP-CAN-CAN-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld24CANbpugb"
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
      value       = "nld24CANbpubb"
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
      value       = "nld24CANbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_57" {
   display_name = "TF-EU1-SG-DR24-RPA-BP-CAN-CAN-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld24CANbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_58" {
   display_name = "TF-EU1-SG-DR24-RPA-BP-CAN-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld24CANbpjmp"
      }
   }
}
resource "nsxt_policy_group" "grp_59" {
   display_name = "TF-EU1-SG-DR26-RPA-AppServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld26gtsbpdga"
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
      value       = "nld26gtsbpuga"
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
      value       = "nld26gtsbppga"
      }
   }
}
resource "nsxt_policy_group" "grp_60" {
   display_name = "TF-EU1-SG-DR26-RPA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld26gtsbpdsb"
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
      value       = "nld26gtsbpdgb"
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
      value       = "nld26gtsbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_61" {
   display_name = "TF-EU1-SG-DR26-RPA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld26gtsbppsb"
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
      value       = "nld26gtsbppgb"
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
      value       = "nld26gtsbppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_62" {
   display_name = "TF-EU1-SG-DR26-RPA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld26gtsbpugb"
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
      value       = "nld26gtsbpubb"
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
      value       = "nld26gtsbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_63" {
   display_name = "TF-EU1-SG-DR26-RPA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld26gtsbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_64" {
   display_name = "TF-EU1-SG-DR28-RPA-AA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld28ubmaadgb"
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
      value       = "nld28ubmaadsb"
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
      value       = "nld28ubmaadbb"
      }
   }
}
resource "nsxt_policy_group" "grp_65" {
   display_name = "TF-EU1-SG-DR28-RPA-AA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld28ubmaapbb"
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
      value       = "nld28ubmaapsb"
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
      value       = "nld28ubmaapgb"
      }
   }
}
resource "nsxt_policy_group" "grp_66" {
   display_name = "TF-EU1-SG-DR28-RPA-AA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld28ubmaaubb"
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
      value       = "nld28ubmaaugb"
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
      value       = "nld28ubmaausb"
      }
   }
}
resource "nsxt_policy_group" "grp_67" {
   display_name = "TF-EU1-SG-DR28-RPA-AA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld28ubmaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_68" {
   display_name = "TF-EU1-SG-DR28-RPA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nldr28ubmaad"
      }
   }
}
resource "nsxt_policy_group" "grp_69" {
   display_name = "TF-EU1-SG-DR28-RPA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nldr28ubmaap"
      }
   }
}
resource "nsxt_policy_group" "grp_70" {
   display_name = "TF-EU1-SG-DR28-RPA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nldr28ubmaau"
      }
   }
}
resource "nsxt_policy_group" "grp_71" {
   display_name = "TF-EU1-SG-DR28-RPA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld28UBMaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_72" {
   display_name = "TF-EU1-SG-DR29-RPA-AA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld29upnaadbb"
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
      value       = "nld29upnaadsb"
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
      value       = "nld29upnaadgb"
      }
   }
}
resource "nsxt_policy_group" "grp_73" {
   display_name = "TF-EU1-SG-DR29-RPA-AA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld29upnaapbb"
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
      value       = "nld29upnaapsb"
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
      value       = "nld29upnaapgb"
      }
   }
}
resource "nsxt_policy_group" "grp_74" {
   display_name = "TF-EU1-SG-DR29-RPA-AA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld29upnaaugb"
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
      value       = "nld29upnaaubb"
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
      value       = "nld29upnaausb"
      }
   }
}
resource "nsxt_policy_group" "grp_75" {
   display_name = "TF-EU1-SG-DR29-RPA-AA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld29upnaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_76" {
   display_name = "TF-EU1-SG-DR29-RPA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nldr29upnaad"
      }
   }
}
resource "nsxt_policy_group" "grp_77" {
   display_name = "TF-EU1-SG-DR29-RPA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nldr29upnaap"
      }
   }
}
resource "nsxt_policy_group" "grp_78" {
   display_name = "TF-EU1-SG-DR29-RPA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nldr29upnaau"
      }
   }
}
resource "nsxt_policy_group" "grp_79" {
   display_name = "TF-EU1-SG-DR29-RPA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld29UPNaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_80" {
   display_name = "TF-EU1-SG-DR31-RPA-AA-DWS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31DWSaadsb"
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
      value       = "nld31DWSaadbb"
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
      value       = "nld31DWSaadgb"
      }
   }
}
resource "nsxt_policy_group" "grp_81" {
   display_name = "TF-EU1-SG-DR31-RPA-AA-DWS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31DWSaapsb"
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
      value       = "nld31DWSaapgb"
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
      value       = "nld31DWSaapbb"
      }
   }
}
resource "nsxt_policy_group" "grp_82" {
   display_name = "TF-EU1-SG-DR31-RPA-AA-DWS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31DWSaaubb"
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
      value       = "nld31DWSaaugb"
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
      value       = "nld31DWSaausb"
      }
   }
}
resource "nsxt_policy_group" "grp_83" {
   display_name = "TF-EU1-SG-DR31-RPA-AA-DWS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31DWSaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_84" {
   display_name = "TF-EU1-SG-DR31-RPA-Capturing-VMs"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31rpacapvm"
      }
   }
}
resource "nsxt_policy_group" "grp_85" {
   display_name = "TF-EU1-SG-DR31-RPA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31tstbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_86" {
   display_name = "TF-EU1-SG-DR31-RPA-GoldenImage-Pool"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31tstbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_87" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31POCupjmp"
      }
   }
}
resource "nsxt_policy_group" "grp_88" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-POC-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31POCupdsb"
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
      value       = "nld31POCupdgb"
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
      value       = "nld31POCupdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_89" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-POC-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31POCuppgb"
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
      value       = "nld31POCuppbb"
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
      value       = "nld31POCuppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_90" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-POC-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31POCupusb"
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
      value       = "nld31POCupubb"
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
      value       = "nld31POCupugb"
      }
   }
}
resource "nsxt_policy_group" "grp_91" {
   display_name = "TF-EU1-SG-DR31-RPA-UP-POC-POC-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld31POCupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_92" {
   display_name = "TF-EU1-SG-DR31-RPA-UiPath-Pentest-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "NLD31RPAUPPEN"
      }
   }
}
resource "nsxt_policy_group" "grp_93" {
   display_name = "TF-EU1-SG-DR32-RPA-AA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld32abnaadsb"
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
      value       = "nld32abnaadbb"
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
      value       = "nld32abnaadgb"
      }
   }
}
resource "nsxt_policy_group" "grp_94" {
   display_name = "TF-EU1-SG-DR32-RPA-AA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld32abnaapgb"
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
      value       = "nld32abnaapbb"
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
      value       = "nld32abnaapsb"
      }
   }
}
resource "nsxt_policy_group" "grp_95" {
   display_name = "TF-EU1-SG-DR32-RPA-AA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld32abnaaubb"
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
      value       = "nld32abnaaugb"
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
      value       = "nld32abnaausb"
      }
   }
}
resource "nsxt_policy_group" "grp_96" {
   display_name = "TF-EU1-SG-DR32-RPA-AA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld32abnaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_97" {
   display_name = "TF-EU1-SG-DR32-RPA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nldr32abnaad"
      }
   }
}
resource "nsxt_policy_group" "grp_98" {
   display_name = "TF-EU1-SG-DR32-RPA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nldr32abnaap"
      }
   }
}
resource "nsxt_policy_group" "grp_99" {
   display_name = "TF-EU1-SG-DR32-RPA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nldr32abnaau"
      }
   }
}
resource "nsxt_policy_group" "grp_100" {
   display_name = "TF-EU1-SG-DR32-RPA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld32abnaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_101" {
   display_name = "TF-EU1-SG-DR33-RPA-AA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld33aslaadsb"
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
      value       = "nld33aslaadgb"
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
      value       = "nld33aslaadbb"
      }
   }
}
resource "nsxt_policy_group" "grp_102" {
   display_name = "TF-EU1-SG-DR33-RPA-AA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld33aslaapbb"
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
      value       = "nld33aslaapsb"
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
      value       = "nld33aslaapgb"
      }
   }
}
resource "nsxt_policy_group" "grp_103" {
   display_name = "TF-EU1-SG-DR33-RPA-AA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld33aslaaubb"
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
      value       = "nld33aslaausb"
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
      value       = "nld33aslaaugb"
      }
   }
}
resource "nsxt_policy_group" "grp_104" {
   display_name = "TF-EU1-SG-DR33-RPA-AA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld33aslaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_105" {
   display_name = "TF-EU1-SG-DR33-RPA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld33aslaadsb"
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
      value       = "nld33aslaadgb"
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
      value       = "nld33aslaadbb"
      }
   }
}
resource "nsxt_policy_group" "grp_106" {
   display_name = "TF-EU1-SG-DR33-RPA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld33aslaapbb"
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
      value       = "nld33aslaapsb"
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
      value       = "nld33aslaapgb"
      }
   }
}
resource "nsxt_policy_group" "grp_107" {
   display_name = "TF-EU1-SG-DR33-RPA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld33aslaaubb"
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
      value       = "nld33aslaausb"
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
      value       = "nld33aslaaugb"
      }
   }
}
resource "nsxt_policy_group" "grp_108" {
   display_name = "TF-EU1-SG-DR33-RPA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld33aslaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_109" {
   display_name = "TF-EU1-SG-DR37-RPA-AA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld37ICFaadgb"
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
      value       = "nld37ICFaadsb"
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
      value       = "nld37ICFaadbb"
      }
   }
}
resource "nsxt_policy_group" "grp_110" {
   display_name = "TF-EU1-SG-DR37-RPA-AA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld37ICFaapbb"
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
      value       = "nld37ICFaapsb"
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
      value       = "nld37ICFaapgb"
      }
   }
}
resource "nsxt_policy_group" "grp_111" {
   display_name = "TF-EU1-SG-DR37-RPA-AA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld37ICFaausb"
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
      value       = "nld37ICFaaugb"
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
      value       = "nld37ICFaaubb"
      }
   }
}
resource "nsxt_policy_group" "grp_112" {
   display_name = "TF-EU1-SG-DR37-RPA-AA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld37ICFaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_113" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-ICF-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld37ICFbpdgb"
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
      value       = "nld37ICFbpdbb"
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
      value       = "nld37ICFbpdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_114" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-ICF-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld37ICFbppbb"
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
      value       = "nld37ICFbppgb"
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
      value       = "nld37ICFbppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_115" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-ICF-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld37ICFbpugb"
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
      value       = "nld37ICFbpubb"
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
      value       = "nld37ICFbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_116" {
   display_name = "TF-EU1-SG-DR37-RPA-BP-ICF-ICF-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld37ICFbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_117" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-ECI-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld39ECIbpdbb"
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
      value       = "nld39ECIbpdgb"
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
      value       = "nld39ECIbpdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_118" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-ECI-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld39ECIbppgb"
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
      value       = "nld39ECIbppsb"
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
      value       = "nld39ECIbppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_119" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-ECI-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld39ECIbpugb"
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
      value       = "nld39ECIbpubb"
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
      value       = "nld39ECIbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_120" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-ECI-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld39ECIbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_121" {
   display_name = "TF-EU1-SG-DR39-RPA-BP-ECI-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld39ecibpjmp"
      }
   }
}
resource "nsxt_policy_group" "grp_122" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-IBE-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld46IBEbpdsb"
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
      value       = "nld46IBEbpdbb"
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
      value       = "nld46IBEbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_123" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-IBE-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld46IBEbppbb"
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
      value       = "nld46IBEbppgb"
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
      value       = "nld46IBEbppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_124" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-IBE-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld46IBEbpugb"
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
      value       = "nld46IBEbpubb"
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
      value       = "nld46IBEbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_125" {
   display_name = "TF-EU1-SG-DR46-RPA-BP-IBE-IBE-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld46IBEbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_126" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-CTT-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld51CTTbpdbb"
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
      value       = "nld51CTTbpdsb"
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
      value       = "nld51CTTbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_127" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-CTT-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld51CTTbppgb"
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
      value       = "nld51CTTbppsb"
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
      value       = "nld51CTTbppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_128" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-CTT-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld51CTTbpugb"
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
      value       = "nld51CTTbpusb"
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
      value       = "nld51CTTbpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_129" {
   display_name = "TF-EU1-SG-DR51-RPA-BP-CTT-CTT-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld51CTTbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_130" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-GNF-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld60GNFbpdgb"
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
      value       = "nld60GNFbpdsb"
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
      value       = "nld60GNFbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_131" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-GNF-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld60GNFbppgb"
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
      value       = "nld60GNFbppsb"
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
      value       = "nld60GNFbppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_132" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-GNF-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld60GNFbpubb"
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
      value       = "nld60GNFbpugb"
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
      value       = "nld60GNFbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_133" {
   display_name = "TF-EU1-SG-DR60-RPA-BP-GNF-GNF-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld60GNFbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_134" {
   display_name = "TF-EU1-SG-DR60-RPA-UP-RPA-GNF-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld60GNFupdsb"
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
      value       = "nld60GNFupdbb"
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
      value       = "nld60GNFupdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_135" {
   display_name = "TF-EU1-SG-DR60-RPA-UP-RPA-GNF-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld60GNFuppsb"
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
      value       = "nld60GNFuppbb"
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
      value       = "nld60GNFuppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_136" {
   display_name = "TF-EU1-SG-DR60-RPA-UP-RPA-GNF-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld60GNFupubb"
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
      value       = "nld60GNFupusb"
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
      value       = "nld60GNFupugb"
      }
   }
}
resource "nsxt_policy_group" "grp_137" {
   display_name = "TF-EU1-SG-DR60-RPA-UP-RPA-GNF-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld60GNFupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_138" {
   display_name = "TF-EU1-SG-DR63-SSH-Proxy"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "Eu1d63lpwgcssh"
      }
   }
}
resource "nsxt_policy_group" "grp_139" {
   display_name = "TF-EU1-SG-DR79-RPA-BP-GTS-MCM-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld79MCMbpdsb"
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
      value       = "nld79MCMbpdbb"
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
      value       = "nld79MCMbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_140" {
   display_name = "TF-EU1-SG-DR79-RPA-BP-GTS-MCM-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld79MCMbppbb"
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
      value       = "nld79MCMbppsb"
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
      value       = "nld79MCMbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_141" {
   display_name = "TF-EU1-SG-DR79-RPA-BP-GTS-MCM-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld79MCMbpubb"
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
      value       = "nld79MCMbpusb"
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
      value       = "nld79MCMbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_142" {
   display_name = "TF-EU1-SG-DR79-RPA-BP-GTS-MCM-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nld79MCMbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_143" {
   display_name = "TF-EU1-SG-DRES-MNEAAS-EU-NCI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1dr"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "lp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ni"
      }
   }
}
resource "nsxt_policy_group" "grp_144" {
   display_name = "TF-EU1-SG-DRES-MNEAAS-EU-NWG"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1dr"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "lp"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "wg"
      }
   }
}
resource "nsxt_policy_group" "grp_145" {
   display_name = "TF-EU1-SG-EU-IRES-SPLUNK"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1lsplunkfwd"
      }
   }
}
resource "nsxt_policy_group" "grp_146" {
   display_name = "TF-EU1-SG-IRES-vROps-Nodes"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1vrops"
      }
   }
}
resource "nsxt_policy_group" "grp_147" {
   display_name = "TF-EU1-SG-PDR-RPA-AA-EOH-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdreohaadgb"
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
      value       = "nlpdreohaadbb"
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
      value       = "nlpdreohaadsb"
      }
   }
}
resource "nsxt_policy_group" "grp_148" {
   display_name = "TF-EU1-SG-PDR-RPA-AA-EOH-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdreohaapbb"
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
      value       = "nlpdreohaapsb"
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
      value       = "nlpdreohaapgb"
      }
   }
}
resource "nsxt_policy_group" "grp_149" {
   display_name = "TF-EU1-SG-PDR-RPA-AA-EOH-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdreohaausb"
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
      value       = "nlpdreohaaubb"
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
      value       = "nlpdreohaaugb"
      }
   }
}
resource "nsxt_policy_group" "grp_150" {
   display_name = "TF-EU1-SG-PDR-RPA-AA-EOH-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdreohaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_151" {
   display_name = "TF-EU1-SG-PDR-RPA-AA-GBS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGBSaadsb"
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
      value       = "nlpdrGBSaadbb"
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
      value       = "nlpdrGBSaadgb"
      }
   }
}
resource "nsxt_policy_group" "grp_152" {
   display_name = "TF-EU1-SG-PDR-RPA-AA-GBS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGBSaapgb"
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
      value       = "nlpdrGBSaapsb"
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
      value       = "nlpdrGBSaapbb"
      }
   }
}
resource "nsxt_policy_group" "grp_153" {
   display_name = "TF-EU1-SG-PDR-RPA-AA-GBS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGBSaaugb"
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
      value       = "nlpdrGBSaausb"
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
      value       = "nlpdrGBSaaubb"
      }
   }
}
resource "nsxt_policy_group" "grp_154" {
   display_name = "TF-EU1-SG-PDR-RPA-AA-GBS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGBSaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_155" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-BPE-BPE-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrBPEbpdbb"
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
      value       = "nlpdrBPEbpdgb"
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
      value       = "nlpdrBPEbpdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_156" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-BPE-BPE-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrBPEbppgb"
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
      value       = "nlpdrBPEbppbb"
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
      value       = "nlpdrBPEbppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_157" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-BPE-BPE-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrBPEbpubb"
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
      value       = "nlpdrBPEbpugb"
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
      value       = "nlpdrBPEbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_158" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-BPE-BPE-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrBPEbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_159" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GBS-GBS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGBSbpdgb"
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
      value       = "nlpdrGBSbpdsb"
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
      value       = "nlpdrGBSbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_160" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GBS-GBS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGBSbppsb"
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
      value       = "nlpdrGBSbppgb"
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
      value       = "nlpdrGBSbppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_161" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GBS-GBS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGBSbpubb"
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
      value       = "nlpdrGBSbpusb"
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
      value       = "nlpdrGBSbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_162" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GBS-GBS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGBSbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_163" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GPS-GPS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGPSbpdsb"
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
      value       = "nlpdrGPSbpdbb"
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
      value       = "nlpdrGPSbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_164" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GPS-GPS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGPSbppsb"
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
      value       = "nlpdrGPSbppbb"
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
      value       = "nlpdrGPSbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_165" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GPS-GPS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGPSbpusb"
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
      value       = "nlpdrGPSbpubb"
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
      value       = "nlpdrGPSbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_166" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GPS-GPS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGPSbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_167" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GTS-EU-AppServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "NLPDRGTSBPUAP"
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
      value       = "NLPDRGTSBPDAP"
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
      value       = "NLPDRGTSBPPAP"
      }
   }
}
resource "nsxt_policy_group" "grp_168" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GTS-EU-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrgtsbpdsb"
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
      value       = "nlpdrgtsbpdgb"
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
      value       = "nlpdrgtsbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_169" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GTS-EU-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrgtsbppbb"
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
      value       = "nlpdrgtsbppgb"
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
      value       = "nlpdrgtsbppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_170" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GTS-EU-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrgtsbpubb"
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
      value       = "nlpdrgtsbpusb"
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
      value       = "nlpdrgtsbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_171" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GTS-EU-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrgtsbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_172" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GTS-GED-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGEDbpdbb"
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
      value       = "nlpdrGEDbpdgb"
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
      value       = "nlpdrGEDbpdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_173" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GTS-GED-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGEDbppgb"
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
      value       = "nlpdrGEDbppbb"
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
      value       = "nlpdrGEDbppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_174" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GTS-GED-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGEDbpugb"
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
      value       = "nlpdrGEDbpusb"
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
      value       = "nlpdrGEDbpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_175" {
   display_name = "TF-EU1-SG-PDR-RPA-BP-GTS-GED-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlpdrGEDbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_176" {
   display_name = "TF-EU1-SG-RPA-AA-ALL-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "aadgb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "aadsb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "aadbb"
      }
   }
}
resource "nsxt_policy_group" "grp_177" {
   display_name = "TF-EU1-SG-RPA-AA-ALL-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "aapsb"
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
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "aapgb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "aapbb"
      }
   }
}
resource "nsxt_policy_group" "grp_178" {
   display_name = "TF-EU1-SG-RPA-AA-ALL-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "aaugb"
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
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "aaubb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "aausb"
      }
   }
}
resource "nsxt_policy_group" "grp_179" {
   display_name = "TF-EU1-SG-RPA-AA-ALL-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "aagld"
      }
   }
}
resource "nsxt_policy_group" "grp_180" {
   display_name = "TF-EU1-SG-RPA-BP-ALL-AppServers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bpuap"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bppap"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bpdap"
      }
   }
}
resource "nsxt_policy_group" "grp_181" {
   display_name = "TF-EU1-SG-RPA-BP-ALL-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bpdgb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bpdbb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bpdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_182" {
   display_name = "TF-EU1-SG-RPA-BP-ALL-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bppgb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bppsb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_183" {
   display_name = "TF-EU1-SG-RPA-BP-ALL-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bpusb"
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
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bpugb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_184" {
   display_name = "TF-EU1-SG-RPA-BP-ALL-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "bpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_185" {
   display_name = "TF-EU1-SG-RPA-UP-ALL-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "updsb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "updgb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "updbb"
      }
   }
}
resource "nsxt_policy_group" "grp_186" {
   display_name = "TF-EU1-SG-RPA-UP-ALL-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "uppsb"
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
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "uppbb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "uppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_187" {
   display_name = "TF-EU1-SG-RPA-UP-ALL-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "upugb"
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
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "upubb"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "upusb"
      }
   }
}
resource "nsxt_policy_group" "grp_188" {
   display_name = "TF-EU1-SG-RPA-UP-ALL-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nl"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "upgld"
      }
   }
}
resource "nsxt_policy_group" "grp_189" {
   display_name = "TF-EU1-SG-SL-IRES-Internet-Proxy-Clients"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1vc1-"
      }
   }
}
resource "nsxt_policy_group" "grp_190" {
   display_name = "TF-EU1-SG-SL-IRES-PSC"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1psc"
      }
   }
}
resource "nsxt_policy_group" "grp_191" {
   display_name = "TF-EU1-SG-SL-IRES-vCenter"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1vc"
      }
   }
}
resource "nsxt_policy_group" "grp_192" {
   display_name = "TF-EU1-SG-SRES-Automation-Control-Node"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1sr1cntrl"
      }
   }
}
resource "nsxt_policy_group" "grp_193" {
   display_name = "TF-EU1-SG-SRES-EU-CACF-BDS"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1srlpcacfbds"
      }
   }
}
resource "nsxt_policy_group" "grp_194" {
   display_name = "TF-EU1-SG-SRES-GTSAnalytics-DevLinux"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1srlngal"
      }
   }
}
resource "nsxt_policy_group" "grp_195" {
   display_name = "TF-EU1-SG-SRES-MNEAAS-EU-NCI"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1srlpm1e"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ni"
      }
   }
}
resource "nsxt_policy_group" "grp_196" {
   display_name = "TF-EU1-SG-SRES-MNEAAS-EU-NWG"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1srlpm1e"
      }
   }
   conjunction {
      operator = "OR"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "wg"
      }
   }
}
resource "nsxt_policy_group" "grp_197" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-DWS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01DWSaadbb"
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
      value       = "nls01DWSaadsb"
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
      value       = "nls01DWSaadgb"
      }
   }
}
resource "nsxt_policy_group" "grp_198" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-DWS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01DWSaapbb"
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
      value       = "nls01DWSaapsb"
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
      value       = "nls01DWSaapgb"
      }
   }
}
resource "nsxt_policy_group" "grp_199" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-DWS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01DWSaaubb"
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
      value       = "nls01DWSaaugb"
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
      value       = "nls01DWSaausb"
      }
   }
}
resource "nsxt_policy_group" "grp_200" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-DWS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01DWSaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_201" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GBS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01gbsaadbb"
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
      value       = "nls01gbsaadgb"
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
      value       = "nls01gbsaadsb"
      }
   }
}
resource "nsxt_policy_group" "grp_202" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GBS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01gbsaapsb"
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
      value       = "nls01gbsaapgb"
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
      value       = "nls01gbsaapbb"
      }
   }
}
resource "nsxt_policy_group" "grp_203" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GBS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01gbsaaubb"
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
      value       = "nls01gbsaaugb"
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
      value       = "nls01gbsaausb"
      }
   }
}
resource "nsxt_policy_group" "grp_204" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GBS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01gbsaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_205" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GED-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GEDaadbb"
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
      value       = "nls01GEDaadsb"
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
      value       = "nls01GEDaadgb"
      }
   }
}
resource "nsxt_policy_group" "grp_206" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GED-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GEDaapgb"
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
      value       = "nls01GEDaapsb"
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
      value       = "nls01GEDaapbb"
      }
   }
}
resource "nsxt_policy_group" "grp_207" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GED-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GEDaaugb"
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
      value       = "nls01GEDaaubb"
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
      value       = "nls01GEDaausb"
      }
   }
}
resource "nsxt_policy_group" "grp_208" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GED-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GEDaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_209" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GJP-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GJPaadbb"
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
      value       = "nls01GJPaadsb"
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
      value       = "nls01GJPaadgb"
      }
   }
}
resource "nsxt_policy_group" "grp_210" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GJP-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GJPaapgb"
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
      value       = "nls01GJPaapsb"
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
      value       = "nls01GJPaapbb"
      }
   }
}
resource "nsxt_policy_group" "grp_211" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GJP-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GJPaaugb"
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
      value       = "nls01GJPaausb"
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
      value       = "nls01GJPaaubb"
      }
   }
}
resource "nsxt_policy_group" "grp_212" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GJP-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GJPaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_213" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GNA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GNAaadsb"
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
      value       = "nls01GNAaadgb"
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
      value       = "nls01GNAaadbb"
      }
   }
}
resource "nsxt_policy_group" "grp_214" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GNA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GNAaapsb"
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
      value       = "nls01GNAaapgb"
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
      value       = "nls01GNAaapbb"
      }
   }
}
resource "nsxt_policy_group" "grp_215" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GNA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GNAaausb"
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
      value       = "nls01GNAaaubb"
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
      value       = "nls01GNAaaugb"
      }
   }
}
resource "nsxt_policy_group" "grp_216" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GNA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GNAaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_217" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GTR-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GTRaadgb"
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
      value       = "nls01GTRaadbb"
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
      value       = "nls01GTRaadsb"
      }
   }
}
resource "nsxt_policy_group" "grp_218" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GTR-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GTRaapgb"
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
      value       = "nls01GTRaapbb"
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
      value       = "nls01GTRaapsb"
      }
   }
}
resource "nsxt_policy_group" "grp_219" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GTR-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GTRaaubb"
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
      value       = "nls01GTRaaugb"
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
      value       = "nls01GTRaausb"
      }
   }
}
resource "nsxt_policy_group" "grp_220" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-GTR-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GTRaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_221" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-HCS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01hcsaadsb"
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
      value       = "nls01hcsaadbb"
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
      value       = "nls01hcsaadgb"
      }
   }
}
resource "nsxt_policy_group" "grp_222" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-HCS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01hcsaapgb"
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
      value       = "nls01hcsaapbb"
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
      value       = "nls01hcsaapsb"
      }
   }
}
resource "nsxt_policy_group" "grp_223" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-HCS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01hcsaaubb"
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
      value       = "nls01hcsaaugb"
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
      value       = "nls01hcsaausb"
      }
   }
}
resource "nsxt_policy_group" "grp_224" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-HCS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01hcsaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_225" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-PH2-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PH2aadsb"
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
      value       = "nls01PH2aadgb"
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
      value       = "nls01PH2aadbb"
      }
   }
}
resource "nsxt_policy_group" "grp_226" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-PH2-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PH2aapbb"
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
      value       = "nls01PH2aapsb"
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
      value       = "nls01PH2aapgb"
      }
   }
}
resource "nsxt_policy_group" "grp_227" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-PH2-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PH2aausb"
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
      value       = "nls01PH2aaugb"
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
      value       = "nls01PH2aaubb"
      }
   }
}
resource "nsxt_policy_group" "grp_228" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-PH2-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PH2aagld"
      }
   }
}
resource "nsxt_policy_group" "grp_229" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-PHI-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHIaadsb"
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
      value       = "nls01PHIaadbb"
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
      value       = "nls01PHIaadgb"
      }
   }
}
resource "nsxt_policy_group" "grp_230" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-PHI-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHIaapbb"
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
      value       = "nls01PHIaapgb"
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
      value       = "nls01PHIaapsb"
      }
   }
}
resource "nsxt_policy_group" "grp_231" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-PHI-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHIaausb"
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
      value       = "nls01PHIaaubb"
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
      value       = "nls01PHIaaugb"
      }
   }
}
resource "nsxt_policy_group" "grp_232" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-PHI-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHIaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_233" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-POC-Controlroom"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "NLS01POCAATAP"
      }
   }
}
resource "nsxt_policy_group" "grp_234" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-POC-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCaadgb"
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
      value       = "nls01POCaadsb"
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
      value       = "nls01POCaadbb"
      }
   }
}
resource "nsxt_policy_group" "grp_235" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-POC-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCaapsb"
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
      value       = "nls01POCaapgb"
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
      value       = "nls01POCaapbb"
      }
   }
}
resource "nsxt_policy_group" "grp_236" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-POC-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCaaubb"
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
      value       = "nls01POCaaugb"
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
      value       = "nls01POCaausb"
      }
   }
}
resource "nsxt_policy_group" "grp_237" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-POC-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_238" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-SME-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01SMEaadsb"
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
      value       = "nls01SMEaadgb"
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
      value       = "nls01SMEaadbb"
      }
   }
}
resource "nsxt_policy_group" "grp_239" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-SME-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01SMEaapsb"
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
      value       = "nls01SMEaapbb"
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
      value       = "nls01SMEaapgb"
      }
   }
}
resource "nsxt_policy_group" "grp_240" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-SME-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01SMEaausb"
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
      value       = "nls01SMEaaubb"
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
      value       = "nls01SMEaaugb"
      }
   }
}
resource "nsxt_policy_group" "grp_241" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-SME-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01SMEaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_242" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-SPA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01SPAaadbb"
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
      value       = "nls01SPAaadgb"
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
      value       = "nls01SPAaadsb"
      }
   }
}
resource "nsxt_policy_group" "grp_243" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-SPA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01SPAaapgb"
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
      value       = "nls01SPAaapbb"
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
      value       = "nls01SPAaapsb"
      }
   }
}
resource "nsxt_policy_group" "grp_244" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-SPA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01SPAaausb"
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
      value       = "nls01SPAaaubb"
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
      value       = "nls01SPAaaugb"
      }
   }
}
resource "nsxt_policy_group" "grp_245" {
   display_name = "TF-EU1-SG-SRES-RPA-AA-SPA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01SPAaagld"
      }
   }
}
resource "nsxt_policy_group" "grp_246" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-BPE-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "NLS01BPEBPPAP"
      }
   }
}
resource "nsxt_policy_group" "grp_247" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GBS-GBS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GBSbpdbb"
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
      value       = "nls01GBSbpdgb"
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
      value       = "nls01GBSbpdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_248" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GBS-GBS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GBSbppsb"
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
      value       = "nls01GBSbppbb"
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
      value       = "nls01GBSbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_249" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GBS-GBS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GBSbpubb"
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
      value       = "nls01GBSbpugb"
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
      value       = "nls01GBSbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_250" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GBS-GBS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GBSbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_251" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GPS-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "NLS01GPSBPPAP"
      }
   }
}
resource "nsxt_policy_group" "grp_252" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GPS-GPS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPSbpdsb"
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
      value       = "nls01GPSbpdgb"
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
      value       = "nls01GPSbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_253" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GPS-GPS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPSbppsb"
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
      value       = "nls01GPSbppgb"
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
      value       = "nls01GPSbppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_254" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GPS-GPS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPSbpugb"
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
      value       = "nls01GPSbpusb"
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
      value       = "nls01GPSbpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_255" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GPS-GPS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPSbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_256" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-ANZ-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01ANZbpdsb"
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
      value       = "nls01ANZbpdgb"
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
      value       = "nls01ANZbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_257" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-ANZ-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01ANZbppbb"
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
      value       = "nls01ANZbppgb"
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
      value       = "nls01ANZbppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_258" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-ANZ-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01ANZbpusb"
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
      value       = "nls01ANZbpugb"
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
      value       = "nls01ANZbpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_259" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-ANZ-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01ANZbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_260" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-CDT-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01CDTbpdsb"
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
      value       = "nls01CDTbpdgb"
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
      value       = "nls01CDTbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_261" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-CDT-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01CDTbppbb"
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
      value       = "nls01CDTbppsb"
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
      value       = "nls01CDTbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_262" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-CDT-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01CDTbpusb"
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
      value       = "nls01CDTbpubb"
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
      value       = "nls01CDTbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_263" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-CDT-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01CDTbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_264" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-CIO-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01CIObpdgb"
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
      value       = "nls01CIObpdsb"
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
      value       = "nls01CIObpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_265" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-CIO-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01CIObppsb"
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
      value       = "nls01CIObppgb"
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
      value       = "nls01CIObppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_266" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-CIO-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01CIObpusb"
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
      value       = "nls01CIObpugb"
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
      value       = "nls01CIObpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_267" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-CIO-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01CIObpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_268" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GED-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GEDbpdsb"
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
      value       = "nls01GEDbpdbb"
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
      value       = "nls01GEDbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_269" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GED-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GEDbppsb"
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
      value       = "nls01GEDbppgb"
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
      value       = "nls01GEDbppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_270" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GED-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GEDbpubb"
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
      value       = "nls01GEDbpusb"
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
      value       = "nls01GEDbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_271" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GED-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GEDbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_272" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GJP-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GJPbpdbb"
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
      value       = "nls01GJPbpdsb"
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
      value       = "nls01GJPbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_273" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GJP-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GJPbppbb"
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
      value       = "nls01GJPbppsb"
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
      value       = "nls01GJPbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_274" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GJP-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GJPbpugb"
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
      value       = "nls01GJPbpubb"
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
      value       = "nls01GJPbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_275" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GJP-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GJPbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_276" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GNA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GNAbpdsb"
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
      value       = "nls01GNAbpdgb"
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
      value       = "nls01GNAbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_277" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GNA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GNAbppsb"
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
      value       = "nls01GNAbppbb"
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
      value       = "nls01GNAbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_278" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GNA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GNAbpugb"
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
      value       = "nls01GNAbpubb"
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
      value       = "nls01GNAbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_279" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GNA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GNAbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_280" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GPM-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPMbpdsb"
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
      value       = "nls01GPMbpdbb"
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
      value       = "nls01GPMbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_281" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GPM-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPMbppbb"
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
      value       = "nls01GPMbppgb"
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
      value       = "nls01GPMbppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_282" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GPM-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPMbpubb"
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
      value       = "nls01GPMbpugb"
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
      value       = "nls01GPMbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_283" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-GPM-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPMbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_284" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-IMI-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01IMIbpdbb"
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
      value       = "nls01IMIbpdsb"
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
      value       = "nls01IMIbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_285" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-IMI-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01IMIbppbb"
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
      value       = "nls01IMIbppsb"
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
      value       = "nls01IMIbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_286" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-IMI-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01IMIbpusb"
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
      value       = "nls01IMIbpugb"
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
      value       = "nls01IMIbpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_287" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-IMI-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01IMIbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_288" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GTSbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_289" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-SPA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01ECIbpdsb"
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
      value       = "nls01ECIbpdbb"
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
      value       = "nls01ECIbpdgb"
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
      value       = "nls01SPAbpdgb"
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
      value       = "nls01SPAbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_290" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-SPA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01ECIbppgb"
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
      value       = "nls01SPAbppbb"
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
      value       = "nls01ECIbppsb"
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
      value       = "nls01SPAbppsb"
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
      value       = "nls01ECIbppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_291" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-SPA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01SPAbpubb"
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
      value       = "nls01SPAbpusb"
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
      value       = "nls01SPAbpugb"
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
      value       = "nls01ECIbpusb"
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
      value       = "nls01ECIbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_292" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-SPA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01SPAbpgld"
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
      value       = "nls01ECIbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_293" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-VCI-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01VCIbpdbb"
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
      value       = "nls01VCIbpdsb"
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
      value       = "nls01VCIbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_294" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-VCI-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01VCIbppbb"
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
      value       = "nls01VCIbppsb"
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
      value       = "nls01VCIbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_295" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-VCI-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01VCIbpugb"
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
      value       = "nls01VCIbpusb"
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
      value       = "nls01VCIbpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_296" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-VCI-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01VCIbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_297" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01WLAbpdgb"
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
      value       = "nls01WLAbpdbb"
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
      value       = "nls01WLAbpdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_298" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01WLAbppgb"
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
      value       = "nls01WLAbppsb"
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
      value       = "nls01WLAbppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_299" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01WLAbpubb"
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
      value       = "nls01WLAbpugb"
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
      value       = "nls01WLAbpusb"
      }
   }
}
resource "nsxt_policy_group" "grp_300" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01WLAbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_301" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-HJP-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01hjpbpdap"
      }
   }
}
resource "nsxt_policy_group" "grp_302" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-HJP-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01hjpbppap"
      }
   }
}
resource "nsxt_policy_group" "grp_303" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-HJP-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01hjpbpuap"
      }
   }
}
resource "nsxt_policy_group" "grp_304" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-HJP-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01hjpbppic01"
      }
   }
}
resource "nsxt_policy_group" "grp_305" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-HSD-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01HSDbpdap"
      }
   }
}
resource "nsxt_policy_group" "grp_306" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-HSD-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01HSDbppap"
      }
   }
}
resource "nsxt_policy_group" "grp_307" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-HSD-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01HSDbpuap"
      }
   }
}
resource "nsxt_policy_group" "grp_308" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-HSD-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01HSDbppic01"
      }
   }
}
resource "nsxt_policy_group" "grp_309" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-PH2-PH2-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PH2bpdbb"
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
      value       = "nls01PH2bpdsb"
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
      value       = "nls01PH2bpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_310" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-PH2-PH2-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PH2bppbb"
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
      value       = "nls01PH2bppgb"
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
      value       = "nls01PH2bppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_311" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-PH2-PH2-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PH2bpusb"
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
      value       = "nls01PH2bpugb"
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
      value       = "nls01PH2bpubb"
      }
   }
}
resource "nsxt_policy_group" "grp_312" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-PH2-PH2-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PH2bpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_313" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-PHA-PHA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHAbpdsb"
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
      value       = "nls01PHAbpdbb"
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
      value       = "nls01PHAbpdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_314" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-PHA-PHA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHAbppbb"
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
      value       = "nls01PHAbppsb"
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
      value       = "nls01PHAbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_315" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-PHA-PHA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHAbpusb"
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
      value       = "nls01PHAbpubb"
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
      value       = "nls01PHAbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_316" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-PHA-PHA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHAbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_317" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-POC-POC-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCbpdsb"
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
      value       = "nls01POCbpdgb"
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
      value       = "nls01POCbpdbb"
      }
   }
}
resource "nsxt_policy_group" "grp_318" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-POC-POC-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCbppsb"
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
      value       = "nls01POCbppbb"
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
      value       = "nls01POCbppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_319" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-POC-POC-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCbpubb"
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
      value       = "nls01POCbpusb"
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
      value       = "nls01POCbpugb"
      }
   }
}
resource "nsxt_policy_group" "grp_320" {
   display_name = "TF-EU1-SG-SRES-RPA-BP-POC-POC-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCbpgld"
      }
   }
}
resource "nsxt_policy_group" "grp_321" {
   display_name = "TF-EU1-SG-SRES-RPA-GBS-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01gbsrpajmp"
      }
   }
}
resource "nsxt_policy_group" "grp_322" {
   display_name = "TF-EU1-SG-SRES-RPA-GTS-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01gtsrpajmp"
      }
   }
}
resource "nsxt_policy_group" "grp_323" {
   display_name = "TF-EU1-SG-SRES-RPA-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01rpards"
      }
   }
}
resource "nsxt_policy_group" "grp_324" {
   display_name = "TF-EU1-SG-SRES-RPA-POC-Capturing-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "NLS01POCCAPVM"
      }
   }
}
resource "nsxt_policy_group" "grp_325" {
   display_name = "TF-EU1-SG-SRES-RPA-POC-Test-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "NLS01POCTSTSR"
      }
   }
}
resource "nsxt_policy_group" "grp_326" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-POC-AppDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCbptap"
      }
   }
}
resource "nsxt_policy_group" "grp_327" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-POC-AppProdSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCbptap"
      }
   }
}
resource "nsxt_policy_group" "grp_328" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-BP-POC-AppUatSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCbptap"
      }
   }
}
resource "nsxt_policy_group" "grp_329" {
   display_name = "TF-EU1-SG-SRES-RPA-SRV-UP-POC-OrcDevSrv"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "NLS01POCUPDOR"
      }
   }
}
resource "nsxt_policy_group" "grp_330" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-POC-POC-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCupdbb"
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
      value       = "nls01POCupdsb"
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
      value       = "nls01POCupdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_331" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-POC-POC-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCuppbb"
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
      value       = "nls01POCuppsb"
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
      value       = "nls01POCuppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_332" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-POC-POC-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCupugb"
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
      value       = "nls01POCupusb"
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
      value       = "nls01POCupubb"
      }
   }
}
resource "nsxt_policy_group" "grp_333" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-POC-POC-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01POCupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_334" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GBS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GBSupdsb"
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
      value       = "nls01GBSupdbb"
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
      value       = "nls01GBSupdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_335" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GBS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GBSuppsb"
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
      value       = "nls01GBSuppbb"
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
      value       = "nls01GBSuppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_336" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GBS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GBSupusb"
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
      value       = "nls01GBSupubb"
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
      value       = "nls01GBSupugb"
      }
   }
}
resource "nsxt_policy_group" "grp_337" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GBS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GBSupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_338" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GPM-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPMupdbb"
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
      value       = "nls01GPMupdsb"
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
      value       = "nls01GPMupdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_339" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GPM-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPMuppgb"
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
      value       = "nls01GPMuppsb"
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
      value       = "nls01GPMuppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_340" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GPM-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPMupubb"
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
      value       = "nls01GPMupugb"
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
      value       = "nls01GPMupusb"
      }
   }
}
resource "nsxt_policy_group" "grp_341" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GPM-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPMupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_342" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GPS-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPSupdsb"
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
      value       = "nls01GPSupdbb"
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
      value       = "nls01GPSupdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_343" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GPS-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPSuppsb"
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
      value       = "nls01GPSuppbb"
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
      value       = "nls01GPSuppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_344" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GPS-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPSupusb"
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
      value       = "nls01GPSupugb"
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
      value       = "nls01GPSupubb"
      }
   }
}
resource "nsxt_policy_group" "grp_345" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-GPS-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01GPSupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_346" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-ORA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01ORAupdbb"
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
      value       = "nls01ORAupdgb"
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
      value       = "nls01ORAupdsb"
      }
   }
}
resource "nsxt_policy_group" "grp_347" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-ORA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01ORAuppsb"
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
      value       = "nls01ORAuppbb"
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
      value       = "nls01ORAuppgb"
      }
   }
}
resource "nsxt_policy_group" "grp_348" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-ORA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01ORAupugb"
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
      value       = "nls01ORAupusb"
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
      value       = "nls01ORAupubb"
      }
   }
}
resource "nsxt_policy_group" "grp_349" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-ORA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01ORAupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_350" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-PHI-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHIupdsb"
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
      value       = "nls01PHIupdbb"
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
      value       = "nls01PHIupdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_351" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-PHI-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHIuppsb"
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
      value       = "nls01PHIuppgb"
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
      value       = "nls01PHIuppbb"
      }
   }
}
resource "nsxt_policy_group" "grp_352" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-PHI-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHIupusb"
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
      value       = "nls01PHIupugb"
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
      value       = "nls01PHIupubb"
      }
   }
}
resource "nsxt_policy_group" "grp_353" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-PHI-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01PHIupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_354" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-RPA-Desktop-Pool_DEV"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01RPAupdsb"
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
      value       = "nls01RPAupdbb"
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
      value       = "nls01RPAupdgb"
      }
   }
}
resource "nsxt_policy_group" "grp_355" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-RPA-Desktop-Pool_PROD"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01RPAuppgb"
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
      value       = "nls01RPAuppbb"
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
      value       = "nls01RPAuppsb"
      }
   }
}
resource "nsxt_policy_group" "grp_356" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-RPA-Desktop-Pool_UAT"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01RPAupubb"
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
      value       = "nls01RPAupusb"
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
      value       = "nls01RPAupugb"
      }
   }
}
resource "nsxt_policy_group" "grp_357" {
   display_name = "TF-EU1-SG-SRES-RPA-UP-RPA-RPA-Pool-Images"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nls01RPAupgld"
      }
   }
}
resource "nsxt_policy_group" "grp_358" {
   display_name = "TF-EU1-SG-SRES-RPA-UiPath-Pentest-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1sr1pen"
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
      value       = "NLS01RPAUPPEN"
      }
   }
}
resource "nsxt_policy_group" "grp_359" {
   display_name = "TF-EU1-SG-SRES-RPA-WPAD-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1sr1rpakms"
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
      value       = "NLS01RPAWPAD"
      }
   }
}
resource "nsxt_policy_group" "grp_360" {
   display_name = "TF-EU1-SG-SRES01-ICP-restore"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "Reu1sr1icp2elk"
      }
   }
}
resource "nsxt_policy_group" "grp_361" {
   display_name = "TF-EU1-SG-SRES01-ICp-Cluster02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1sr1icp2"
      }
   }
}
resource "nsxt_policy_group" "grp_362" {
   display_name = "TF-EU1-SG-SRES01-OCP-Cluster01"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1sr1lpta1"
      }
   }
}
resource "nsxt_policy_group" "grp_363" {
   display_name = "TF-EU1-SG-SRES01-OCP-Cluster02"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1sr1lptaj"
      }
   }
}
resource "nsxt_policy_group" "grp_364" {
   display_name = "TF-EU1-SG-SRES01-OCP-Cluster03"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1sr1lpta3"
      }
   }
}
resource "nsxt_policy_group" "grp_365" {
   display_name = "TF-EU1-SG-SRES01-OCP-Cluster04"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "eu1sr1lpta4"
      }
   }
}
resource "nsxt_policy_group" "grp_366" {
   display_name = "TF-EU1-SG-VDR1-RPA-Jump-Servers"
   tag {
      tag = "TF-${var.project}-${var.environment}"
   }
   criteria {
      condition {
      key         = "Name" 
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "nlv01rpards"
      }
   }
}
