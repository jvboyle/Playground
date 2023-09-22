#!/bin/bash
nc -w1 -vz 158.87.50.67 443 &>/dev/null
status=$( echo $? )
echo $status
if [[ $status == 1 ]] ; then
    echo "NSXT AP production is down - failed on Date `date "+%d%h%y-%H:%M"` " >> /tmp/blue-logs.txt
    echo "FAILED 158.87.50.67" | mail --subject="Failed - nc -vz158.87.50.67 443 site -AP-NSXT-TEST" 0b781c31.kyndryl.com@amer.teams.ms
else
    echo "NSXT AP production is Available on Date `date "+%d%h%y-%H:%M"` "
    echo "158.87.50.67 is live" | mail -r "monitor@kyndryl.com" -subject="Success - nc -vz 158.87.50.67 443 site -AP-NSXT-TEST" 0b781c31.kyndryl.com@amer.teams.ms
fi