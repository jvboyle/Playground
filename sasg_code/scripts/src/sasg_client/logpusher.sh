#!/usr/bin/bash
shortname=`hostname -s`
echo $shortname
MRTGKEY="/sasg/mrtg/ssh/id_rsa"

#BPM IP with 2. address from sasg
#BPM_IP=2.120.134.40
BPM_IP=2ADDRESS

cd /sasg/mrtg/htdocs/*;tar -cf $shortname.tar *.rrd;tar -uf $shortname.tar *.png;gzip -f $shortname.tar
scp -vvv -B -p -q -r -P 2222 -i $MRTGKEY /sasg/mrtg/htdocs/$shortname/$shortname.tar.gz mrtg@$BPM_IP:SasgMrtg
scp -vvv -B -p -q -r -P 2222 -i $MRTGKEY /sasg/mrtg/conf/$shortname.cfg mrtg@$BPM_IP:SasgMrtg
scp -vvv -B -p -q -r -P 2222 -i $MRTGKEY /sasg/logs/keepalived/keepalived_status.log mrtg@$BPM_IP:SasgMrtg
scp -vvv -B -p -q -r -P 2222 -i $MRTGKEY /sasg/logs/keepalived/status/trigger mrtg@$BPM_IP:SasgMrtg

