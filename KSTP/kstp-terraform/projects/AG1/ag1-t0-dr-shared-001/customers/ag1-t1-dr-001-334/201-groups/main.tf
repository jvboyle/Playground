
locals {
  change = "RITM0151221"
  dres = "334"
  consumable_service = "CACF"
  lpcacpr1_vm   = "ag1d${local.dres}lpcacpr1"
  lpcacpr2_vm   = "ag1d${local.dres}lpcacpr2"
  VM_list  = ["${local.lpcacpr1_vm}", 
              "${local.lpcacpr2_vm}"
              ]
}

