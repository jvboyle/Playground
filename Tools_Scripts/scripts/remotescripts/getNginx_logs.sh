THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/'|head -1)
SHNAME=`hostname -s`
RELEASE=$(sudo ls -la  /var/log/nginx)
#LEASE=$(sudo ls -la /etc/redhat-release | awk '{print $6, $7, $8}'|cut -f1 -d'/'|head -1)
if [ "$?" -ne 0 ];then
echo -e "\nERROR,$SHNAME,$THIS,failed ls of logse" 
else
echo -e "\nSUCCESS,$SHNAME,$THIS,$RELEASE"
fi
