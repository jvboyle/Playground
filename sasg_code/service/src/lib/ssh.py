# -*- coding: utf-8 -*-
#
# IBM Research
# Wrapper for accessing Machines using 'ssh'
# Jinho Hwang
# 

import os, sys, json, time, re
import subprocess
import random
import socket

from time import gmtime, strftime
from datetime import date,datetime

import traceback, logging

import threading, paramiko
from paramiko.py3compat import input
from service.src.lib.sasglib2 import debug_init
from service.src.lib.sasglib2 import debug_message

class SSH:
    """SSH driver to access servers with ssh server"""

    temp_dir = '/tmp'

    # for session.
    shell = None
    client = None
    transport = None

    def __init__(self):
        pass

    def from_private_key_file(self, key_path):
        ''' Find details in http://docs.paramiko.org/en/2.4/api/keys.html '''
        key_blob = None
        for key_type in ['RSAKey', 'Ed25519Key', 'ECDSAKey','DSSKey']: 
            func = getattr(paramiko, key_type)
            try:
                key_blob = func.from_private_key_file(key_path)
            except: # just continue if fails.
                continue
            break
        return key_blob

    def session_open(self, address, username, pass_key, port=22):
        ''' This session returns the ssh session that can run multiple commands by holding the session '''
        try:
            #print("Connecting to server on ip", str(address) + ".")
            self.client = paramiko.client.SSHClient()
            self.client.set_missing_host_key_policy(paramiko.client.AutoAddPolicy())

            if not os.path.isfile(pass_key):
                self.client.connect(address, username=username, password=pass_key, look_for_keys=False)
                self.transport = paramiko.Transport((address, port))
                self.transport.connect(username=username, password=pass_key)
            else:
                private_key = self.from_private_key_file(pass_key)
                self.client.connect(address, username=username, pkey=private_key, look_for_keys=False)
                self.transport = paramiko.Transport((address, port))
                self.transport.connect(username=username, pkey=private_key)

            # Open Shell.
            self.shell = self.client.invoke_shell(height=65535, width=65535) # max height, width
        except Exception as e:
            return -1, 'Failed to open a ssh session: %s' % str(e)
 
        # shell interactive mode (process function below).
        #thread = threading.Thread(target=self.interactive)
        #thread.daemon = True
        #thread.start()

        return 0, 'SSH session opened'
 
    def session_close(self):
        try:
            self.client.close()
            self.transport.close()
        except Exception as e:
            logging.info('Failed to close client and transport, but just pass')

    def escape_ansi(self, ansi_str):
        ansi_re = re.compile(r'(\x9B|\x1B\[)[0-?]*[ -\/]*[@-~]|\x1b=\r')
        return ansi_re.sub('', ansi_str)
 
    def session_send(self, command):
        if(self.shell):
            self.shell.send(command + "\n")
        else:
            logging.error('Shell is not opened')

        time.sleep(1) # let command execute

        alldata = ''
        cnt = 0
        escape = 0
        MAX_SPACE_WAIT = 60
        while True:
            if escape >= MAX_SPACE_WAIT: # 1 minutes: error.
                break # if this fails, the subsequent will not work.

            cnt += 1
            if cnt > 65535*100: # NOTE: this may generate a couple of more prompts, but ok.
                self.shell.send(' \n') # space to get moving.
                time.sleep(1)
                cnt = 0
                escape += 1

            if self.shell != None and self.shell.recv_ready():
                alldata += self.shell.recv(1024)
                while self.shell.recv_ready():
                    alldata += self.shell.recv(1024)
                #strdata = str(alldata, "utf8")
                strdata = str(alldata)
                #strdata.replace('\r', '')
                if(strdata.endswith("$ ") or strdata.endswith("# ")):
                    alldata = strdata
                    break

        alldata = self.escape_ansi(alldata) # remove color codes.
        if escape == MAX_SPACE_WAIT:
            return -1, alldata

        return 0, alldata
 
    def interactive(self):
        #global connection
        while True:
            # Output data when available
            if self.shell != None and self.shell.recv_ready():
                alldata = self.shell.recv(1024)
                while self.shell.recv_ready():
                    alldata += self.shell.recv(1024)
                #strdata = str(alldata, "utf8")
                strdata = str(alldata)
                strdata.replace('\r', '')
                print(strdata,)
                if(strdata.endswith("$ ")):
                    print("\n$ ",)
                    #print("\n$ ", end="")

    def run_remote_cmd(self, username, pass_key, ip, cmd, customer_info, port=22):
        output = ''
        exit_code = 0

        debug_message(customer_info, 'INFO: running remote command "%s" on %s:%s' % (cmd, ip, port))

        try:
            ssh = paramiko.SSHClient()
            #ssh.set_missing_host_key_policy(paramiko.WarningPolicy())
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

            if not os.path.isfile(pass_key):
                ssh.connect(ip, username=username, password=pass_key, port=port)
            else:
                pkey = self.from_private_key_file(pass_key)
                ssh.connect(ip, username=username, pkey=pkey, port=port)

            # NOTE for get_pty=True: By default, SUDO is configured to require a TTY. That is, SUDO is expected to be run from a login shell. You can defeat this requirement by adding the -t switch to your SSH invocation:
            ssh_stdin, ssh_stdout, ssh_stderr = ssh.exec_command(cmd, get_pty=True)

            output = ssh_stdout.read()
            output += ssh_stdout.read()

            #print(username, pass_key, ip)
            #print('run_remote_cmd:', cmd, output)

            exit_code = ssh_stdout.channel.recv_exit_status()

            # TODO: SSH close needs to be done here?
        except Exception as e:
            debug_message(customer_info, 'ERROR: SSH failed with %s / %s' % (str('/'.join([username, '*****', ip, cmd])), str(e)))
            print('SSH failed with %s / %s' % (str('/'.join([username, '*****', ip, cmd])), str(e)))
            output = 'SSH failed with %s / %s' % (str('/'.join([username, '*****', ip, cmd])), str(e))

        # Preventing error for json.loads()
        if output == None or output == "":
            output = 'NO_OUTPUT'

        #print(exit_code, output)

        return exit_code, output

    # Run local commands in this box
    def run_local_cmd(self, cmd, sudo=False):
        if sudo and 'sudo' not in cmd:
            cmd = 'sudo ' + cmd
        ps = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        output = ps.stdout.read()

        ps.stdout.close()
        ps.wait()

        # returncode: 0 => SUCCESS, N => ERROR
        #print('return code: ' + str(ps.returncode))
        #print('run_remote_cmd output: ' + str(output))

        return ps.returncode, output

    def ssh_copy_id(self, username, password, ip, args):
        """The requirement is sshpass installation"""

        cmd = ""

        if 'ip' in args:
            cmd += "sed '/" + args['ip'] + "/d' /root/.ssh/known_hosts; " 

        if 'password' in args:
            cmd += "sshpass -p " + args['password'] + " " 
        else:
            return "STATUS_ERROR", "password is mandatory when ostype = linux"

        if 'username' in args:
            cmd += "ssh-copy-id -i /root/.ssh/id_rsa.pub " + args['username'] + "@" + args['ip']
        else: # default = root
            cmd += "ssh-copy-id -i /root/.ssh/id_rsa.pub " + "root@" + args['ip']

        #print(cmd)

        exit_code, output = self.run_remote_cmd(username, password, ip, cmd)

        return exit_code, output

    def hostname(self, username, pass_key, ip):
        return self.run_remote_cmd(username, pass_key, ip, 'hostname')

    # reference command.
    #ssh-keyscan -t rsa cmo.paasibm.com > /tmp/key; ssh-keygen -lf /tmp/key
    ## cmo.paasibm.com SSH-2.0-OpenSSH_5.9p1 Debian-5ubuntu1.4
    #2048 65:24:cd:f4:a7:93:81:9d:62:81:8b:db:14:81:73:67 cmo.paasibm.com (RSA)
    def get_thumbprint(self, ip):
        cmd = 'ssh-keyscan -t rsa ' + ip + ' > /tmp/' + ip
        cmd += '; ssh-keygen -lf /tmp/' + ip

        ps = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        output = ps.stdout.read()

        ps.stdout.close()
        ps.wait()

        #print(ps.returncode, output, output.split(' ')[3])

        if ps.returncode == 0:
            return output.split(' ')[3]

        return None

    def install_wget(self, username, pass_key, ip, arch=None):

        # TODO: Find the arch if None and copy wget to the target
        
        # /usr/bin/wget
        # NOTE: failed to run wget
        #
        # root@cmoportal-dev:/var/www/cmoportal/cmoportal_lib# ldd /usr/bin/wget
        # linux-vdso.so.1 =>  (0x00007fffc6341000)
        # libssl.so.1.0.0 => /lib/x86_64-linux-gnu/libssl.so.1.0.0 (0x00007f56aafe1000)
        # libcrypto.so.1.0.0 => /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 (0x00007f56aac06000)
        # libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f56aa9ec000)
        # libidn.so.11 => /usr/lib/x86_64-linux-gnu/libidn.so.11 (0x00007f56aa7b9000)
        # libuuid.so.1 => /lib/x86_64-linux-gnu/libuuid.so.1 (0x00007f56aa5b4000)
        # libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f56aa1ee000)
        # libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f56a9fea000)
        # /lib64/ld-linux-x86-64.so.2 (0x00007f56ab248000)

        #wget_x64 = '/var/www/cmoportal/bin/linux/x64/wget'
        #rc, output = self.copy_local_to_remote(username, pass_key, ip, wget_x64, '/usr/bin')
        #if rc:
        #    print('ERROR: install_wget (%s), %s' % (str(rc), str(output)))

        # TODO: Find Distribution (One of these...)
        rc, output = self.run_remote_cmd(username, pass_key, ip, 'apt-get install -y wget')
        if rc:
            print('ERROR: install_wget (%s), %s' % (str(rc), str(output)))
            logging.error('ERROR: install_wget (%s), %s' % (str(rc), str(output)))

        rc, output = self.run_remote_cmd(username, pass_key, ip, 'yum install -y wget')
        if rc:
            print('ERROR: install_wget (%s), %s' % (str(rc), str(output)))
            logging.error('ERROR: install_wget (%s), %s' % (str(rc), str(output)))

        return rc, output

    UseGSSAPI = True             # enable GSS-API / SSPI authentication
    DoGSSAPIKeyExchange = True
    Port = 22

    def copy_local_to_remote(self, username, pass_key, ip, local_objs, customer_info, remote_dir=None, port=22):
        rc = 0
        output = ''

        if not remote_dir: remote_dir = self.temp_dir
        working_dir = os.getcwd()
        debug_message(customer_info, 'INFO: working dir: %s' % working_dir)
        debug_message(customer_info, 'INFO: username: %s' % username)
        debug_message(customer_info, 'INFO: pass_key: %s' % pass_key)
        debug_message(customer_info, 'INFO: Remote dir: %s' % remote_dir)

        #if not hasattr(local_objs, '__iter__'):
        if isinstance(local_objs, str):
            local_objs = [local_objs]

        debug_message(customer_info, 'INFO: files to copy %s' % ','.join(local_objs))
        
        hostname = ip
        try:
            t = paramiko.Transport((hostname, port))

            if not os.path.isfile(pass_key):
                # NOTE: this works fine, but need more testing.
                debug_message(customer_info, 'INFO: Using password to connect to %s' % hostname)
                t.connect(username=username, password=pass_key)
                
            else:
                pkey = self.from_private_key_file(pass_key)
                debug_message(customer_info, 'INFO: Using key to connect to %s' % hostname)
                t.connect(username=username, pkey=pkey)

            sftp = paramiko.SFTPClient.from_transport(t)

            try:
                stat = sftp.stat(remote_dir)
                #print(stat)
            except:
                sftp.mkdir(remote_dir)
            for local_obj in local_objs:
                remote_file = '/'.join([remote_dir, os.path.basename(local_obj)])

                if os.path.isfile(local_obj):
                    print('Copying local object %s to the remote directory %s' % (local_obj,remote_dir))
                    debug_message(customer_info, 'INFO: copying local object %s to the remote directory %s' % (local_obj,remote_dir))
                    sftp.put(local_obj, remote_file)

                    sftp.chmod(remote_file, 0o755)
                else: # accumulate err messages.
                    rc = 1
                    output += ('File %s does not exist; ' % local_obj)
                    debug_message(customer_info, 'File %s does not exist; ' % local_obj)

            t.close()

        except Exception as e:
            rc = 1
            output = '*** Caught exception: %s: %s' % (e.__class__, e)
            debug_message(customer_info, 'ERROR: caught exception: %s: %s' % (e.__class__, e))

            print('*** Caught exception: %s: %s' % (e.__class__, e))
            traceback.print_exc()
            try:
                t.close()
            except:
                pass

        return rc, output

    # only file-level copy.
    def copy_remote_to_local(self, username, pass_key, ip, remote_objs, local_dir, customer_info, port=22):
        rc = 0
        output = ''

        debug_message(customer_info, 'INFO: local dir: %s' % local_dir)

        #if not hasattr(remote_objs, '__iter__'):
        if isinstance(remote_objs, str):
            remote_objs = [remote_objs]
        
        debug_message(customer_info, 'INFO: Objects to copy: %s' % ','.join(remote_objs))

        hostname = ip

        try:
            t = paramiko.Transport((hostname, port))

            #t.connect(hostkey, username, pass_key, gss_host=socket.getfqdn(hostname),
            #        gss_auth=self.UseGSSAPI, gss_kex=self.DoGSSAPIKeyExchange)

            if not os.path.isfile(pass_key):
                # NOTE: this works fine, but need more testing.
                t.connect(username=username, password=pass_key)
            else:
                pkey = self.from_private_key_file(pass_key)
                t.connect(username=username, pkey=pkey)

            sftp = paramiko.SFTPClient.from_transport(t)

            if not os.path.isdir(local_dir):
                os.makedirs(local_dir)

            for remote_obj in remote_objs:
                local_file = '/'.join([local_dir, os.path.basename(remote_obj)])

                print('Copying remotel object %s to the local %s' % (remote_obj, local_file))
                debug_message(customer_info, 'INFO: copying remotel object %s to the local %s from %s' % (remote_obj, local_file, hostname))
                sftp.get(remote_obj, local_file)
                os.chmod(local_file, 0o755)

            t.close()

        except Exception as e:
            rc = 1
            output = '*** Caught exception: %s: %s' % (e.__class__, e)
            print('*** Caught exception: %s: %s' % (e.__class__, e))
            debug_message(customer_info, 'ERROR: caught exception: %s: %s' % (e.__class__, e))
            traceback.print_exc()
            try:
                t.close()
            except:
                pass

        return rc, output

    # TODO: need testing....
    def copy_source_to_target(self, source_username, source_password, source_ip, target_username, target_password, target_ip, source_dirs_files, target_folder):
        rc = 0
        output = ''
        print('copy_source_to_target')
        tmp_folder = tempfile.NamedTemporaryFile().name

        print(tmp_folder)
        print(source_username, source_password, source_ip, source_dirs_files, tmp_folder)

        rc, output = self.copy_remote_to_local(source_username, source_password, source_ip, source_dirs_files, tmp_folder)
        if rc: 
            print('ERROR (%s): %s' % (str(rc), str(output)))
            return rc, output

        interim_files = []
        for ifile in os.listdir(tmp_folder):
            interim_files.append(tmp_folder + '/' + ifile)

        print(interim_files)
        rc, output = self.copy_local_to_remote(target_username, target_password, target_ip, interim_files, target_folder)
        if rc: 
            print('ERROR (%s): %s' % (str(rc), str(output)))
            return rc, output

        return rc, output

    def run_scripts(self, user, pass_key, ip, local_script_paths, params=''):
        rc = 0
        outputs = []

        if not hasattr(local_script_paths, '__iter__'):
            local_script_paths = [local_script_paths]

        directory = self.temp_dir

        # Send Files
        for local_script_path in local_script_paths:
            each_output = {'script': os.path.basename(local_script_path), 'start_time': strftime("%Y-%m-%d %H:%M:%S", gmtime())}

            rc, output = self.copy_local_to_remote(user, pass_key, ip, local_script_path, directory)
            if rc: # error.
                print('ERROR in run_scripts: ' + str(output))
                each_output.update({'returncode': rc, 'output': str(output), 'end_time': strftime("%Y-%m-%d %H:%M:%S", gmtime())})

                outputs.append(each_output)
                continue

            cmd = '%s/%s %s' % (directory, os.path.basename(local_script_path), params)
            rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)

            each_output.update({'returncode': rc, 'output': str(output), 'end_time': strftime("%Y-%m-%d %H:%M:%S", gmtime())})

            outputs.append(each_output)

        return rc, outputs

    def check_wget_install(self, user, pass_key, ip):
        rc, output = self.run_remote_cmd(user, pass_key, ip, 'if [ -f "/usr/bin/wget" ]; then echo "installed"; else echo "uninstalled"; fi')

        #print('check_wget_install:', output)

        if 'uninstalled' in output:
            # install new one
            rc, output = self.install_wget(user, pass_key, ip)
            if rc:
                return False

        return True

    def run_urls(self, user, pass_key, ip, urls, params=''):
        rc = 0
        outputs = []

        if not hasattr(urls, '__iter__'):
            urls = [urls]

        if not check_wget_install(user, pass_key, ip):
            print('ERROR: Failed to install wget')
            return 1, ['ERROR: Failed to install wget']

        # Run Scripts from Temp
        for url in urls:
            each_output = {'script': url, 'start_time': strftime("%Y-%m-%d %H:%M:%S", gmtime())}

            # remove if exists wget makes *.1, *.2...
            cmd = 'rm -rf %s/%s' % (self.temp_dir, os.path.basename(url))
            rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)

            cmd = 'wget -q -T 5 -t 3 --no-check-certificate -P %s %s' % (self.temp_dir, url)
            rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)
            if rc:
                print('ERROR: run_urls %s, %s' % (str(rc), str(output)))
                each_output.update({'returncode': rc, 'output': str(output), 'end_time': strftime("%Y-%m-%d %H:%M:%S", gmtime())})
                continue

            # Mode Executable Change
            cmd = 'chmod 755 %s/%s' % (self.temp_dir, os.path.basename(url))
            rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)

            cmd = '%s/%s %s' % (self.temp_dir, os.path.basename(url), params)
            rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)
            each_output.update({'returncode': rc, 'output': str(output), 'end_time': strftime("%Y-%m-%d %H:%M:%S", gmtime())})

            outputs.append(each_output)

        return rc, outputs

    # When I need the string replacement.
    def send_str(self, username, pass_key, ip, script_str, filename, directory=None, port=22):
        rc = 0
        output = ''

        if not directory:
            remote_dir = self.temp_dir
        else:
            remote_dir = directory

        remote_file = '/'.join([remote_dir, filename])

        # pre-processing
        #script_str = script_str.replace('"', '\\"')
        #script_str = script_str.replace("'", "\\'")

        hostname = ip
        try:
            t = paramiko.Transport((hostname, port))

            #t.connect(hostkey, username, pass_key, gss_host=socket.getfqdn(hostname),
            #        gss_auth=self.UseGSSAPI, gss_kex=self.DoGSSAPIKeyExchange)

            if not os.path.isfile(pass_key):
                # NOTE: this works fine, but need more testing.
                t.connect(username=username, password=pass_key)
            else:
                pkey = self.from_private_key_file(pass_key)
                t.connect(username=username, pkey=pkey)

            sftp = paramiko.SFTPClient.from_transport(t)
            # dirlist on remote host
            #dirlist = sftp.listdir(remote_dir)

            try:
                stat = sftp.stat(remote_dir)
            except:
                sftp.mkdir(remote_dir)

            try:
                sftp.remove(remote_file)
            except:
                pass

            for line in script_str.split('\n'):
                cmd = "echo '" + line + "' >> " + remote_file
                rc, output = self.run_remote_cmd(username, pass_key, ip, cmd)

                #print(rc, output)

            sftp.chmod(remote_file, 0o755)

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

    def send_str_and_run(self, user, pass_key, ip, script_str, filename=None, directory=None, params=''):
        rc = 0

        if not directory:
            directory = self.temp_dir

        if not filename:
            filename = 'linux_script_%s.vbs' % str(('%06x' % random.randrange(16**6)))

        remote_dir = '/'.join([directory, filename])

        cmd = 'rm -rf %s' % remote_dir
        rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)

        json_output = {'script': filename, 'start_time': strftime("%Y-%m-%d %H:%M:%S", gmtime())}

        rc, output = send_str(user, pass_key, ip, script_str, filename, directory)
        if rc:
            print('ERROR in run_scripts: ' + str(output))
            json_output.update({'returncode': rc, 'output': str(output)})

            return rc, json_output

        cmd = '%s/%s %s' % (directory, filename, params)
        rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)

        json_output.update({'returncode': rc, 'output': str(output), 'end_time': strftime("%Y-%m-%d %H:%M:%S", gmtime())})

        return rc, json_output

    def mount_samba(self, user, pass_key, ip, sambaaddress, sharename, sambauser, sambapass):
        cmd = 'mkdir /tmp/windowsshare'
        rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)
        if rc != 0 and output != "NO_OUTPUT":
            return rc, output

        cmd = 'mount -t cifs //%s/%s /tmp/windowsshare -o username=%s,password="%s",noexec' % (sambaaddress, sharename, sambauser, sambapass)
        rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)

        return rc, output

    def umount_samba(self, user, pass_key, ip):
        cmd = 'umount /tmp/windowsshare'
        rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)

        return rc, output

    def check_readiness(self, user, pass_key, ip):
        if not user or not pass_key or not ip:
            return False

        cmd = 'echo ready'
        rc, output = self.run_remote_cmd(user, pass_key, ip, cmd)
        print('result: ', rc, output)
        if rc == 0 and output.strip() == 'ready':
            return True
        return False

