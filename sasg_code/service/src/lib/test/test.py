import os, sys, json
import subprocess
import random
import socket

from time import gmtime, strftime
from datetime import date,datetime

import traceback, logging

import paramiko
from paramiko.py3compat import input

def check_ping(hostname):
    response = os.system("ping -c 1 " + hostname)
    # and then check the response...
    if response == 0:
        pingstatus = "Network Active"
    else:
        pingstatus = "Network Error"

    return pingstatus

def copy_local_to_remote(username, pass_key, ip, local_objs, remote_dir=None):
    rc = 0
    output = ''

    #if not remote_dir: remote_dir = self.temp_dir

    if not hasattr(local_objs, '__iter__'):
        local_objs = [local_objs]

    hostname = ip
    try:
        t = paramiko.Transport((hostname, 22))

        #t.connect(hostkey, username, password, gss_host=socket.getfqdn(hostname),
        #        gss_auth=self.UseGSSAPI, gss_kex=self.DoGSSAPIKeyExchange)

        # TODO: add the private key
        #k = paramiko.RSAKey.from_private_key_file("/Users/whatever/Downloads/mykey.pem")
        #c = paramiko.SSHClient()
        #c.set_missing_host_key_policy(paramiko.AutoAddPolicy()) # this adds the host to known_hosts
        #c.connect( hostname = "www.acme.com", username = "ubuntu", pkey = k )

        if not os.path.isfile(pass_key):
            # NOTE: this works fine, but need more testing.
            t.connect(username=username, password=pass_key)
        else:
            pkey = paramiko.RSAKey.from_private_key_file(pass_key)
            t.connect(username=username, pkey=pkey)
            
        sftp = paramiko.SFTPClient.from_transport(t)

        # dirlist on remote host
        #dirlist = sftp.listdir(remote_dir)

        try:
            stat = sftp.stat(remote_dir)
            #print(stat)
        except:
            sftp.mkdir(remote_dir)

        for local_obj in local_objs:
            remote_file = '/'.join([remote_dir, os.path.basename(local_obj)])

            #with sftp.open(remote_file, 'w') as f:
            #    f.write('This was created by jinho.\n')

            '''
            with open(local_obj, 'r') as f:
                data = f.read()
            sftp.open(remote_file, 'w').write(data)
            sftp.chmod(remote_file, 0o755)
            '''

            if os.path.isfile(local_obj):
                sftp.put(local_obj, remote_file)
                sftp.chmod(remote_file, 0o755)

            #print('created file on the server')

            ''' TO BE USED
            # copy the README back here
            with sftp.open('demo_sftp_folder/README', 'r') as f:
                data = f.read()
            with open('README_demo_sftp', 'w') as f:
                f.write(data)
            print('copied README back here')
            
            # BETTER: use the get() and put() methods
            sftp.put('demo_sftp.py', 'demo_sftp_folder/demo_sftp.py')
            sftp.get('demo_sftp_folder/README', 'README_demo_sftp')
            '''

        t.close()

    except Exception as e:
        rc = 1
        output = '*** Caught exception: %s: %s' % (e.__class__, e)

        print('*** Caught exception: %s: %s' % (e.__class__, e))
        traceback.print_exc()
        try:
            t.close()
        except:
            pass

    return rc, output


#print(check_ping('8.8.8.9'))

#copy_local_to_remote('jinho', '/home/vagrant/sasg/service/userdata/jinho@us.ibm.com/keys/jinho', '174.36.252.183', '/home/vagrant/sasg/service/userdata/jinho@us.ibm.com/key_test/sasg_vyos_configure.sh', '/tmp')
