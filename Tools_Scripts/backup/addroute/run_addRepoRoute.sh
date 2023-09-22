#!/bin/bash

# copy add_RepoRoute.sh script to each server in CDS_IP_LIST, run the script via ssh, capture all log output in local output file & then grep the file for just error & success msgs
if [[ -z $1 ]];then
  THISSCRIPT=`basename $0`
  echo -e "\nUSAGE:\n\t$THISSCRIPT <devices.csv or file with IPs>"
  echo -e "\n\t**Note - expects std devices.csv export format from SoftLayer interface:"
  echo -e "\t  \"Device Name\",\"Device Type\",Location,\"Public IP\",\"Private IP\",\"Start Date\",Username,Password,Notes,\"Active Transaction\""
  echo -e "\n\t**Note 2 - If it doesn't see this first line then assume it's just a file\n\t  with a list of IP's one IP per line, lines starting with # & blank lines ignored.\n"

  exit 1
fi 

CDS_IP_LIST="$1"
SCRIPT2RUN="add_RepoRoute.sh"
LOG="./RepoRoute_${1}_log.txt"
RESULTS="./RepoRoute_${1}_summary.txt"

if [[ -f $LOG ]];then
  echo "copying $LOG to $LOG.prev"
  mv $LOG $LOG.prev
fi

if [[ -f $RESULTS ]];then
  echo "copying $RESULTS to $RESULTS.prev"
  mv $RESULTS $RESULTS.prev
fi

main(){

# loop thru each line in ip file ignoring blank lines & comments
#for IP in `cat $CDS_IP_LIST | egrep -v "^$|^#"`
grep -q "\"Device Name\",\"Device Type\",Location,\"Public IP\",\"Private IP\"" $CDS_IP_LIST
if [[ $? -ne 0 ]];then
  # assume we just have a list of IP's, one IP per line.
  cat $CDS_IP_LIST|egrep -v "^$|#" >${CDS_IP_LIST}.temp
else
  # assume we just have a devices.csv from Softlayer with the right format & private ip in 5th column
  cat $CDS_IP_LIST|egrep -v "^$|#|Device Name" | awk -F',' '{print $5}' >${CDS_IP_LIST}.temp
fi

for IP in `cat ${CDS_IP_LIST}.temp`
do
  
  USEPORT=2222  # set default port to try each time to 2222

  echo -e "\n---------------------------------------- $IP ----------------------------------------------------------\n"
  sftp -oStrictHostKeyChecking=no -P $USEPORT automate@$IP << EOF
put $SCRIPT2RUN /tmp/$SCRIPT2RUN
EOF
  if [[ $? -ne 0 ]];then
    # try sftp again but with port 22
    echo -e "\nsftp error to $IP on $USEPORT\n"
#    echo -e "\nsftp error to $IP on $USEPORT, trying port 22 ...\n"
#      sftp -oStrictHostKeyChecking=no -P 22 automate@$IP << EOF
#put $SCRIPT2RUN /tmp/$SCRIPT2RUN
#EOF
#    if [[ $? -eq 255 ]];then
#      echo -e "\nERROR - error sftp'ing $SCRIPT2RUN script to $IP on $USEPORT or port 22 ...moving on...\n"
#      USEPORT=0
#    else
#      USEPORT=22
#    fi
  else
    echo -e "\nsftp'd $SCRIPT2RUN script to $IP...now executing script & capturing results.\n"
  fi

  if [[ $USEPORT != 0 ]];then
    # successfully sftp'd via either port 2222 or 22 - now ssh & try to run the script
    ssh -t -oStrictHostKeyChecking=no automate@$IP -p $USEPORT "bash /tmp/$SCRIPT2RUN;rm -f /tmp/$SCRIPT2RUN /tmp/$SCRIPT2RUN.log /tmp/yum.out"
    if [[ $? -ne 0 ]];then
      echo -e "\nERROR - error executing $SCRIPT2RUN script on $IP !! manual intervention required."
    else
      echo -e "\nsuccessfully executed $SCRIPT2RUN script on $IP !"
    fi
  fi

  echo -e "\n-------------------------------------------------------------------------------------------------------\n"

done

} #main()

main 2>&1 | tee $LOG


# for some reason when we run the script remotely we're getting carriage returns at the end of every output line - no issue - just remove them from the log
#cat $LOG|sed "s///g" >log.clean
#cp log.clean $LOG
sed -i .bak -e's///g' $LOG

rm -f ${CDS_IP_LIST}.temp

# since all lines in log are in order for each ip we ran against, can just look for changes in ip addrs in each output line
# and add a newline whenever there's a change in address - makes for easier reading in the summary report.

egrep "^ERROR|SUCCESS" $LOG |while read LINE
do
 IP=`echo $LINE|grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}"`
 if [[ $IP == $PREVIP ]];then
   # same ip as previous line - just echo the line to the output file
   echo -e "$LINE" |tee -a $RESULTS
 else
   # different ip than previous line - echo the line to the output file then echo the line we just read in
   PREVIP="$IP"
   echo -e "\n$LINE" | tee -a $RESULTS
 fi
done

echo -e "\nDone..view:\n\t $LOG - all output\n\t $RESULTS - just errors & success messages.\n"
