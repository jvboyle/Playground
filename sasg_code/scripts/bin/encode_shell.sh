#!/bin/bash
###########################################################################
# Description: Generate keepalived.conf for Sasg
# Author: Joe Boyle
# Date: 2016.07.29
SCRIPT_INFO="keepalived_setup.sh v1.0"
# Config: vars file 
# Main: ./Sasg_build.sh
# Standalone Usage: ./keepalived_setup.sh
# History:
#    2016.07.29 - Original script.
# Notes:
#    Make sure "var file" is completed before running.
###########################################################################

usage() {
    echo "usage: $0 source build"
    exit -1
}

[ -z $1 ] && usage
[ -z $2 ] && usage

SOURCE_DIR=$1
BUILD_DIR=$2

if [ ! -d "$BUILD_DIR" ]; then
    mkdir $BUILD_DIR
fi

for f in `ls $SOURCE_DIR`; do
    echo $f
    if [ "${f##*.}" == "sh" ]; then
        ./bin/shc -v -r -T -f $SOURCE_DIR/$f
        mv $SOURCE_DIR/$f.x $BUILD_DIR
        rm -rf $SOURCE_DIR/$f.x.c
    else
        cp -a $SOURCE_DIR/$f $BUILD_DIR
    fi
done

for f in `ls $BUILD_DIR`; do
    if [ "${f#*.}" == "sh.x" ]; then
        mv $BUILD_DIR/$f $BUILD_DIR/${f%%.*}.sh
    fi
done
