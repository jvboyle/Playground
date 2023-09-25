#!/bin/bash
###########################################################################
# Description: Generate SASG Generation Package 
# Author: Jinho Hwang
# Date: 2016.08.21
# History:
#    2016.08.21 - Original script.
# Notes:
#    Make sure 'vars' exists in build
###########################################################################

SCRIPTS_DIR=./
APP_NAME=sasg_gen.sh

#if [ -z $1 ]; then echo "Usage: $0 <target folder with vars>"; exit -1; fi

${SCRIPTS_DIR}/bin/makeself.sh "$SCRIPTS_DIR" "$APP_NAME" "SASG Generation Package" ./make.sh

echo "SUCCESS: $APP_NAME is generated"
