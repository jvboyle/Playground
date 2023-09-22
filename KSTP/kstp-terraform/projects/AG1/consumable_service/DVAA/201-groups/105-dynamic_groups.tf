#####################################
# DYNAMIC GROUPS
#
# Migration date: 03/22/2023 16:07
# Geography.....: AG1 
# Wave..........: DVAA
#####################################
resource "nsxt_policy_group" "grp_1940" {
  display_name = "TF-AG1-SG-All-Windows-Hosts"
  nsx_id       = "TF-AG1-SG-All-Windows-Hosts"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "OSName"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "Windows"
    }
  }
}
resource "nsxt_policy_group" "grp_1941" {
  display_name = "TF-AG1-SG-IRES-vROps-Nodes"
  nsx_id       = "TF-AG1-SG-IRES-vROps-Nodes"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1vrops0"
    }
  }
}
resource "nsxt_policy_group" "grp_1942" {
  display_name = "TF-AG1-SG-DR12-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR12-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d12lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1943" {
  display_name = "TF-AG1-SG-DR74-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR74-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d74lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1944" {
  display_name = "TF-AG1-SG-DR11-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR11-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d11lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1945" {
  display_name = "TF-AG1-SG-DR197-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR197-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d197lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1946" {
  display_name = "TF-AG1-SG-DR237-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR237-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d237lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1947" {
  display_name = "TF-AG1-SG-DR77-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR77-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d77lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1948" {
  display_name = "TF-AG1-SG-DR144-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR144-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d144lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1949" {
  display_name = "TF-AG1-SG-DR59-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR59-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d59lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1950" {
  display_name = "TF-AG1-SG-SRES01-CACF-LDAP"
  nsx_id       = "TF-AG1-SG-SRES01-CACF-LDAP"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "cacpr"
    }
  }
  conjunction {
    operator = "OR"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1d"
    }
  }
}
resource "nsxt_policy_group" "grp_1952" {
  display_name = "TF-AG1-SG-DRES259-CACF-Proxy"
  nsx_id       = "TF-AG1-SG-DRES259-CACF-Proxy"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1d259lpcacpr"
    }
  }
}
resource "nsxt_policy_group" "grp_1953" {
  display_name = "TF-AG1-SG-DR100-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR100-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d100lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1954" {
  display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersLinux"
  nsx_id       = "TF-AG1-SG-DRES40-CRO-SiteControllersLinux"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1dr40crotescl"
    }
  }
}
resource "nsxt_policy_group" "grp_1955" {
  display_name = "TF-AG1-SG-DRES98-CRO-All-Servers"
  nsx_id       = "TF-AG1-SG-DRES98-CRO-All-Servers"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1d98cromd"
    }
  }
}
resource "nsxt_policy_group" "grp_1956" {
  display_name = "TF-AG1-SG-DR112-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR112-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d112lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1957" {
  display_name = "TF-AG1-SG-DR53-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR53-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d53lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1958" {
  display_name = "TF-AG1-SG-DR147-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR147-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d147lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1959" {
  display_name = "TF-AG1-SG-SRES01-ICp-Cluster02-WorkerNodes"
  nsx_id       = "TF-AG1-SG-SRES01-ICp-Cluster02-WorkerNodes"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1sr1icp2e"
    }
  }
  conjunction {
    operator = "OR"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1sr1icp2n"
    }
  }
}
resource "nsxt_policy_group" "grp_1960" {
  display_name = "TF-AG1-SG-DR19-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR19-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d19lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1961" {
  display_name = "TF-AG1-SG-SRES-CACF-BDS"
  nsx_id       = "TF-AG1-SG-SRES-CACF-BDS"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1srlpcacfbds"
    }
  }
}
resource "nsxt_policy_group" "grp_1962" {
  display_name = "TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
  nsx_id       = "TF-AG1-SG-SRES-CACF-JumpHost-Test-Servers"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "agnsr1lnccmjmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1963" {
  display_name = "TF-AG1-SG-DRES40-CRO-SiteControllers"
  nsx_id       = "TF-AG1-SG-DRES40-CRO-SiteControllers"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1d40crotescw"
    }
  }
  conjunction {
    operator = "OR"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1d40crotecl"
    }
  }
}
resource "nsxt_policy_group" "grp_1964" {
  display_name = "TF-AG1-SG-SRES01-OCP-Cluster01"
  nsx_id       = "TF-AG1-SG-SRES01-OCP-Cluster01"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1sr1lpta1"
    }
  }
}
resource "nsxt_policy_group" "grp_1965" {
  display_name = "TF-AG1-SG-DR65-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR65-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d65lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1966" {
  display_name = "TF-AG1-SG-DRES74-CRO-All-Servers"
  nsx_id       = "TF-AG1-SG-DRES74-CRO-All-Servers"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1d74croca"
    }
  }
}
resource "nsxt_policy_group" "grp_1967" {
  display_name = "TF-AG1-SG-DR151-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR151-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d151lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1968" {
  display_name = "TF-AG1-SG-DR162-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR162-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = " ag1d162lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1969" {
  display_name = "TF-AG1-SG-LPW-TEST"
  nsx_id       = "TF-AG1-SG-LPW-TEST"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "prx"
    }
  }
}
resource "nsxt_policy_group" "grp_1970" {
  display_name = "TF-AG1-SG-DR156-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR156-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d156lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1971" {
  display_name = "TF-AG1-SG-DR198-STaaS-Arxview"
  nsx_id       = "TF-AG1-SG-DR198-STaaS-Arxview"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "CONTAINS"
      value       = "ag1d198lparxtmp"
    }
  }
}
resource "nsxt_policy_group" "grp_1972" {
  display_name = "TF-AG1-SG-DRES40-CRO-SiteControllersW"
  nsx_id       = "TF-AG1-SG-DRES40-CRO-SiteControllersW"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1d40crotescw"
    }
  }
}
resource "nsxt_policy_group" "grp_1973" {
  display_name = "TF-AG1-SG-DRES99-CRO-All-Servers"
  nsx_id       = "TF-AG1-SG-DRES99-CRO-All-Servers"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1d99crodh"
    }
  }
}
resource "nsxt_policy_group" "grp_1974" {
  display_name = "TF-AG1-SG-SRES01-ICp-agnsrlnicp1"
  nsx_id       = "TF-AG1-SG-SRES01-ICp-agnsrlnicp1"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "agnsrlnicp1"
    }
  }
}
resource "nsxt_policy_group" "grp_1975" {
  display_name = "TF-AG1-SG-SRES-IAM-THY-All-VMs"
  nsx_id       = "TF-AG1-SG-SRES-IAM-THY-All-VMs"
  tag {
    tag = "TF-${var.project}-${var.environment}"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1sr1lniams"
    }
  }
  conjunction {
    operator = "OR"
  }
  criteria {
    condition {
      key         = "Name"
      member_type = "VirtualMachine"
      operator    = "STARTSWITH"
      value       = "ag1sr1wniams"
    }
  }
}
