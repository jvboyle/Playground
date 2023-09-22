
locals {
  change = "CHGEU0212520/CTASKEU0413064"
  dres = "302"
  consumable_service = "AIOPS"
  lpcacpr1_vm   = "ag1d${local.dres}lpcacpr1"
  lpcacpr2_vm   = "ag1d${local.dres}lpcacpr2"
  VM_list  = ["${local.lpcacpr1_vm}", 
              "${local.lpcacpr2_vm}"
              ]
}

