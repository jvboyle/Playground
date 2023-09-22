THIS=$(/usr/sbin/ip r | grep default)
SHNAME=`hostname -s`
if [ "$?" -ne 0 ];then
echo -e "\nERROR,$SHNAME,$THIS,failed get default route" 
else
echo -e "\nSUCCESS,$SHNAME,$THIS"
fi
