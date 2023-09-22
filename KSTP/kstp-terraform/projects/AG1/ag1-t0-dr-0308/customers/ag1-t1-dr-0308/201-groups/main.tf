
locals {
  change   = "RITM0145040/CHGEU0199596"
  dres     = "308"
  apprkise1_vm   = "ag1d${local.dres}apprkise1"
  apprkise2_vm   = "ag1d${local.dres}apprkise2"
  wpprkorp1_vm   = "ag1d${local.dres}wprkorp1"
  wpprkorp2_vm   = "ag1d${local.dres}wprkorp2"
  apprkrp1_vm    = "ag1d${local.dres}apprkrp1"
  apprkrp2_vm    = "ag1d${local.dres}apprkrp2"
  lpprkjmp1_vm   = "ag1d${local.dres}lpprkjmp1"
  lpprkjmp2_vm   = "ag1d${local.dres}lpprkjmp2"
  lpecnsdc1_vm   = "ag1d${local.dres}lpecnsdc1"
  lpecnsdc2_vm   = "ag1d${local.dres}lpecnsdc2"
  lpecnsdc3_vm   = "ag1d${local.dres}lpecnsdc3"
  lpecnsmc1_vm   = "ag1d${local.dres}lpecnsmc1"
  apprkbds1_vm   = "ag1d${local.dres}apprkbds1"
  apprkbds2_vm   = "ag1d${local.dres}apprkbds2"
  VM_list  = ["${local.apprkise1_vm}",
              "${local.apprkise2_vm}",
              "${local.wpprkorp1_vm}",
              "${local.wpprkorp2_vm}",
              "${local.apprkrp1_vm}",
              "${local.apprkrp2_vm}",
              "${local.lpprkjmp1_vm}",
              "${local.lpprkjmp2_vm}",
              "${local.lpecnsdc1_vm}",
              "${local.lpecnsdc2_vm}",
              "${local.lpecnsdc3_vm}",
              "${local.lpecnsmc1_vm}",
              "${local.apprkbds1_vm}",
              "${local.apprkbds2_vm}"
              ]
}
