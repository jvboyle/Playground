THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/'|head -1)
SHNAME=`hostname -s`
RELEASE=$(sudo cat /etc/redhat-release)
KEY='from="10.149.99.229/32,10.149.99.236/32,10.149.99.238/32,10.149.99.199/32" ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEiSnkDFNPSYSTheYAPfjKC7yXYR5rTgMU3DVl6gboVW !!US/F/*SLASAS/IBM/SLA SAS Cloud automation 112020 !!'
LEASE=$(mv .ssh/authorized_keys .ssh/authorized_keys_backup && echo $KEY >> .ssh/authorized_keys )
if [ "$?" -ne 0 ];then
echo -e "\nERROR,$SHNAME,$THIS,failed cat of redhat-release" 
else
echo -e "\nSUCCESS,$SHNAME,$THIS,$RELEASE,$LEASE"
fi
