#!/bin/vbash
ip addr | grep eth0 | egrep inet
hostname
source /config/scripts/script-template
configure
set system login user sasauto authentication public-keys ssh_login_Key key 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDrtnqmQey1UE/vtjdGhot399IXpJLjJZp83OsVgIwMXs6aPx1F0tAzDUbZOH4EloBXBRhy3Dg5BgiPnULaLUkxID9SXerSlhZ7w2TpLKS/ZXY5GSOJBII5VoN+U0zk6nY/RNGf0OhusayvnLUqV4T/Pz/y4rko1/M4OEt2G9OR2sioWutG9X584V/6A+PnpL2NWGVQrBqLrC0223iCcM899VRn9IYAs/re+a0YRdWj3LDWDrb73JRDFNaFOslyMFoX08dqTiYODG1RyCCLvC8tIy7JteykpkFopRgHVByAxEcSCQofJaIbzqcbAt1KVgKS5ygloi7CCAUstBAWulx/'
set system login user sasauto authentication public-keys ssh_login_Key type 'ssh-rsa'
set system login user sasauto full-name '!!US/F/*SLASAS/IBM/SLA SAS Cloud automation!!'
set system login user sasauto level 'admin'
commit
save
