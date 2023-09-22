#!/bin/bash

echo "hello world" > /tmp/gz
sudo apt-get update
sudo apt-get install nfs-kernel-server
sudo mkdir /var/nfs/general -p
sudo mkdir -p /data/test
echo '/data *(rw,sync,no_root_squash,no_subtree_check)' | sudo tee -a /etc/exports
sudo mount -a
sudo systemctl enable nfs-server
sudo systemctl start nfs-server
sudo exportfs -av
sudo chown nobody:nogroup /var/nfs/general
sudo /etc/init.d/nfs-kernel-server restart
