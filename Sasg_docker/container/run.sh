#!/bin/bash

export SASG_RUNNING_PLATFORM=CONTAINER
rm -f /sasg/configs/sasgc.info
cd /opt/sasg/sasg_install
./sasg_main.sh

echo "
KERNEL_VERSION=\"$(uname -r)\"
OPENVPN_VERSION=\"$(openvpn --version | head -1 | awk '{print $1" "$2" "$3}')\"
NGINX_VERSION=\"$(nginx -v 2>&1)\"
IPTABLES_VERSION=\"$(iptables --version)\"
IPSET_VERSION=\"$(ipset --version)\"
ALPINE_VERSION=\"$(grep VERSION_ID /etc/os-release | cut -f2 -d"=")\"
" | tee /sasg/configs/sasgc.info

while true; do
    # Put 'tail -f' to log message in docker logs
    echo "SASG running..."
    sleep 60
done
