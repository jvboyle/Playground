THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/'|head -1)
SHNAME=`hostname -s`
RELEASE=$(sudo cat /etc/redhat-release)
LEASE=$(sudo ls -la /etc/redhat-release | awk '{print $6, $7, $8}'|cut -f1 -d'/'|head -1)
if [ "$?" -ne 0 ];then
echo -e "\nERROR,$SHNAME,$THIS,failed cat of redhat-release" 
else
echo -e "\nSUCCESS,$SHNAME,$THIS,$RELEASE,$LEASE"
fi
