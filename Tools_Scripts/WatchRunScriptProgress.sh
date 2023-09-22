#!/bin/bash

while(true)
do
  ps -ef|grep -v grep|egrep -i "parallel|Tools/scripts" 
  if [ "$?" -ne 0 ];then
    echo -e "\nNo more Tools/scripts processes running."
    exit 0
  fi
  sleep 5
done
