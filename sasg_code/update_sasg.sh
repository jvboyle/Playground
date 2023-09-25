#!/bin/bash

set -e
set -v

SRC_DIR=./

function usage() {
    echo "usage: $0 <tag name or master>"
    exit -1
}

if [ -z $1 ]; then
    usage
fi

TAG=$1

cd "$SRC_DIR"

git fetch --all

git checkout $TAG -- scripts/src/VERSION

if [ "$TAG" == "master" ]; 
then
    git checkout $TAG
else
    ALL_TAG=`git branch`
    if [[ ! "$ALL_TAG" == *"tag_$TAG"* ]]
    then
        git checkout -b tag_$TAG $TAG
    fi

    CURRENT_TAG=`git branch | grep \* | cut -d ' ' -f2`
    if [ ! "$CURRENT_TAG" == "tag_$TAG" ];
    then
        git checkout tag_$TAG
    fi
fi

# Migration from sqlite to postgresql
if [ -d "/var/lib/docker/data/sasg_data/db" ];
then
    rm -rf /var/lib/docker/data/sasg_data/db
fi

git pull origin $TAG

set +e
sudo docker-compose kill
sudo docker-compose rm -f
#sudo docker rmi sla/sasg
set -e

# Add branch & commit as version for test sasgaas
if [[ -n "${TEST_SASGAAS}" ]]; then
    echo "${TAG}:$(git log --oneline -1)" > scripts/src/VERSION
fi

sudo docker-compose build
sudo docker-compose up -d
#sudo docker run -d -h sasg -v /var/lib/docker/data/sasg_data:/sasg_data -e SASG_ENV=production -p 443:443 --add-host bluepages.ibm.com:9.57.182.78 --name sasg sla/sasg
