#!/bin/bash

function usage() {
    echo "usage: $0 <IP or Hostname>:Port <IP or Hostname> ..."
    echo "for example, $0 google.com:80 google.com:8000 google.com"
    exit -1
}

[ -z $1 ] && usage

# NAME:IP or HOSTNAME:PORT
SERVER_ARRAY="$@"

for sa in $SERVER_ARRAY; 
do 
    echo -n "$sa="

    sa_arr=(${sa//:/ })

    SERVER=${sa_arr[0]}
    PORT=${sa_arr[1]}

    if [ ${#sa_arr[@]} -eq 1 ]; then
        ping -q -w 1 -c 1 $SERVER &> /dev/null && echo OPEN || echo CLOSED
    elif [ ${#sa_arr[@]} -eq 2 ]; then
        timeout 3 bash -c "cat < /dev/null > /dev/tcp/$SERVER/$PORT" &> /dev/null && echo OPEN || echo CLOSED
    else
        echo 'INVALID'
    fi
done

# misc....
#echo -n "$SERVER:$PORT="
#timeout 1 bash -c "cat < /dev/null > /dev/tcp/$SERVER/$PORT" && echo OPEN || echo CLOSED

# not all systems have nc installed
#if nc -zw1 google.com 8000; then
#  echo "we have connectivity"
#else
#  echo "we have NO connectivity"
#fi

# in a newer enough bash install.. this works. 
#timeout 1 bash -c 'cat < /dev/null > /dev/tcp/google.com/80'
#echo $?

#SERVER=174.36.252.183
#PORT=7
#timeout 1 bash -c "cat < /dev/null > /dev/tcp/$SERVER/$PORT" && echo $SERVER:$PORT open || echo $SERVER:$PORT closed

#echo -n "$SERVER:$PORT="
#timeout 1 bash -c "cat < /dev/null > /dev/tcp/$SERVER/$PORT" && echo OPEN || echo CLOSED

#timeout 1 bash -c "cat < /dev/null > /dev/tcp/$SERVER/$PORT" 2> /dev/null
#if [ "$?" -ne 0 ]; then 
#    echo $SERVER:$PORT closed
#else
#    echo $SERVER:$PORT open
#fi

#ping -q -w 1 -c 1 google.com > /dev/null && echo "Testing connection success" || echo "Testing connection fail"

#</dev/tcp/google.com/80 && echo Port open. || echo Port closed.

# this takes too long without timeout
#</dev/tcp/google.com/8000 && echo Port open. || echo Port closed.
