#!/bin/bash
#########################################################################
# auther Stan Braun 
# use to regenerate the bluegroup Matadata when customers dir does not match the Dashboard
#########################################################################

CUSTDIR="/var/lib/docker/data/sasg_data/userdata/customers"
NEWMD="/tmp/new_metadata"

UD="/var/lib/docker/data/sasg_data/userdata"

ALL=""
cd $CUSTDIR
for i in `ls -d *`
do
  ALL="$ALL\"$i\", "
done

ALLACCTS="{\"customers\": [$(echo "$ALL"|sed "s/, $//g")],"
DATE=$(date +"%F")

cd $UD
ls -d sasgaas* |while read BGNAME
do

  sudo cp -p "$BGNAME"/metadata_info.json "$BGNAME"/metadata_info.json.${DATE}

  BG="\"keys\": {\"sasauto\": {\"created\": \"2018-09-20 00:02:34\", \"path\": \"/sasg_data/userdata/"$BGNAME"/keys/sasauto\", \"url\": \"/userdata/"$BGNAME"/keys/sasauto\"}}}"

  echo "$ALLACCTS  $BG" >$NEWMD."$BGNAME"
  sudo cp $NEWMD."$BGNAME" "$UD/$BGNAME/metadata_info.json"
  echo "Created new metadata file: $UD/"$BGNAME"/metadata_info.json"
  ls -l $UD/"$BGNAME"/metadata_info.json*

done
