# -*- coding: utf-8 -*-
#
# IBM Research
# SASG Customer Dedicated Segment Configuration
# and generate SASG installation file
# Jinho Hwang
# 

import os, sys, json, re, time
import subprocess
import socket

from time import gmtime, strftime, sleep
from datetime import date,datetime

import traceback, logging

#from ssh import SSH
from service.src.lib.ssh import SSH
from service import application
from service.src.lib.sasglib2 import debug_init
from service.src.lib.sasglib2 import debug_message

import jnpr.junos
import lxml
import xmlplain
import yaml

class SASGLIB:
    ''' SASG Configuration Automation Library 
        - Create a installation package
        - VyOS Configuration through SSH (key or password)
        - Copy SASG installation package and provide URL to download
        - Out of scope: configure SASG (no connection to servers)
    '''

    def __init__(self, userdata_dir=None, scripts_dir=None, customers_dir=None):
        base_dir = os.path.dirname(os.path.realpath(__file__))
        self.scripts_dir = scripts_dir or application.config.get('SCRIPTS_DIR')
        self.userdata_dir = userdata_dir or application.config.get('USER_DATA_DIR')
        self.customers_dir = customers_dir or application.config.get('CUSTOMERS_DIR')

    def output_json(self, status, message, output={}):
        return { 'status': status, 'message': message, 'output': output }

    def port_check(self, customer_info, address, port_list=[22, 2222]):
        if len(port_list) == 0:
            debug_message(customer_info, 'port_check: no ports provided (%s)' % ','.join(port_list))
            return 0

        for port in port_list:
            debug_message(customer_info, 'port_check: checking port %s' % port)

            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            for i in range(10):
                try:
                    print('%s: trying port %s' % (i, port))
                    sock.connect((address, port))
                except ConnectionRefusedError:
                    debug_message(customer_info, 'port_check: connection refused for %s' % port)
                    break
                except ConnectionAbortedError:
                    debug_message(customer_info, 'port_check: attempt %s for %s - connection aborted' % (i, port))
                    continue
                except TimeoutError:
                    debug_message(customer_info, 'port_check: connection timeout for %s' % port)
                    break
                except Exception as e:
                    debug_message(customer_info, 'port_check: generic exception for %s: %s' % (port, e))
                    break

                debug_message(customer_info, 'port_check: found opened port %s' % port)
                return port

            #cmd = 'timeout 3 bash -c "cat < /dev/null > /dev/tcp/%s/%s" &> /dev/null && echo OPEN || echo CLOSED' % (address, port)
            # cmd = 'timeout 3 bash -c "cat < /dev/null > /dev/tcp/%s/%s" && echo OPEN || echo CLOSED' % (address, port)
            # debug_message(customer_info, 'port_check: using command >>%s<< to check port' % cmd)
            # ps = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            # output = ps.stdout.read()
            # debug_message(customer_info, 'port_check: output: %s' % output)
            # debug_message(customer_info, 'port_check: return code: %s' % ps.returncode)

            # ps.stdout.close()
            # ps.wait()

            # if ps.returncode == 0 and 'OPEN' in str(output):
            #     debug_message(customer_info, 'port_check: using port %s' % port)
            #     return port

        debug_message(customer_info, 'port_check: could not find proper port')
        return 0

    def pkey(self, dirloc, passkey):
        key_dir = '/'.join([self.userdata_dir, dirloc, 'keys'])
        if os.path.isfile('/'.join([key_dir, passkey])):
            return '/'.join([key_dir, passkey]) # key file
        return passkey # password

    def net_test(self, dirloc, target_servers, source_username, source_passkey, source_address, customer_info):
        ''' servers: [ "10.10.10.10:80", "20.20.20.20" ]
        '''

        # move net_test.sh scripts and add target_servers as parameters
        sdir = '/'.join([self.scripts_dir, 'src'])

        ssh = SSH()
        source_port = self.port_check(customer_info, source_address)
        if source_port == 0:
            return self.output_json('ERROR', 'ssh port is not open')

        # Find whether the private key exists
        source_passkey = self.pkey(dirloc, source_passkey)

        args = ' '.join(target_servers)

        # Move the configuration executable to the target machine
        try:
            rc, output = ssh.copy_local_to_remote(source_username, source_passkey, source_address, '/'.join([sdir, 'net_test.sh']), customer_info, remote_dir='/tmp', port=source_port)
            if rc != 0:
                logging.error('copy_local_to_remote failed: ' + str(output))
                return self.output_json('ERROR', str(output))
        except Exception as e:
            logging.error('copy_local_to_remote failed: ' + str(e))
            return self.output_json('ERROR', 'Internal error')

        try:
            rc, output = ssh.run_remote_cmd(source_username, source_passkey, source_address, '/tmp/net_test.sh ' + args, customer_info, port=source_port)

            if rc != 0:
                logging.error(str(output))
                return self.output_json('ERROR', str(output))
        except Exception as e:
            logging.error('run_remote_cmd failed: ' + str(e))
            return self.output_json('ERROR', 'Internal error')

        output_json = []
        for elem in output.split('\r\n'):
            elems = elem.split('=')
            if len(elems) == 0 or not elems[0]: continue
            if len(elems) == 2: # error.
                output_json.append({ 'source': source_address, 'destination': elems[0], 'status': elems[1] })
            else:
                output_json.append({ 'source': source_address, 'destination': elems[0], 'status': 'ERROR' })

        return self.output_json('OK', "Network connectivity test success", output=output_json)

    def vars_parsing(self, vars_json, cdir):
        ''' cdir = '/'.join([self.userdata_dir, dirloc, customername]) '''

        vars_output = '# Auto-generated configuration from SASGaaS API\n'

        for key in vars_json.keys():
            val = vars_json.get(key)
            if type(val) is list or type(val) is tuple:
                cnt = 0
                for elem in val:
                    vars_output += key + '[' + str(cnt) + ']' + '=' + elem + '\n'
                    cnt += 1
            elif type(val) is str or type(val) is unicode:
                vars_output += key + '=' + val + '\n'
            elif type(val) is dict:
                for elem in val.keys():
                    vars_output += key + '_' + elem + '=' + val[elem] + '\n'

        vars_output += '''
TIMESTAMP=$(date +"%Y-%m-%d:%H:%M:%S")
HOSTNAME="`hostname`"
VERSION="`cat ./VERSION`"

VTUN_CA_CERT_FILE=/config/auth/ca.crt
VTUN_CERT_FILE=/config/auth/"$HOSTNAME".crt
VTUN_DH_FILE=/config/auth/dh2048.pem
VTUN_KEY_FILE=/config/auth/$HOSTNAME.key

MRTG_USER=mrtg
MRTG_DIR=/home/mrtg

SASG_NWIF=eth0
SASG_VPNIF=vtun0
        '''

        # save directly to customer...
        try:
            open('/'.join([cdir, 'vars']), 'w+').write(vars_output)
        except Exception as e:
            logging.error(str(e))

        return vars_output

    def remote_conn_test(self, source_address, source_username, source_passkey, target_address, target_port=None):
        ''' Connection testing from a remote source machine (ssh) to the target machine '''
        pass

    # Since the automation engine in management segment, this may not be used.
    def local_conn_test(self, target_address, target_port=None):
        ''' Connection testing from local machine to the target machine '''

        # TODO: example code for telnet
        '''
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result = s.connect_ex((host, port)) # this is same as connect, but return value, not Exception
        s.close()
        if result:
            print("problem with socket!")
        else:
            print("everything it's ok!")

        # ping testing....
        response = os.system("ping -c 1 " + hostname)
        # and then check the response...
        if response == 0:
            pingstatus = "Network Active"
        else:
            pingstatus = "Network Error"

        return pingstatus
        '''

    def scripts_generate(self, customer_dir):
        ''' Create a configuration executable with 'vars' parameters '''

        cmd = 'cd ' + self.scripts_dir + '; ./make.sh ' + customer_dir
        ps = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        output = ps.stdout.read()

        ps.stdout.close()
        ps.wait()

        if ps.returncode != 0:
            logging.error(str(output))
            return self.output_json('ERROR', str(output))

        return self.output_json('OK', str(output))

    def tools_configure(self, dirloc, customername, tool_username, tool_passkey, tool_address, customer_info, tool_name='tool'):
        ''' Run tools configure script '''

        cdir = '/'.join([self.customers_dir, customername])

        # Find whether the private key exists
        tool_passkey = self.pkey(dirloc, tool_passkey)

        ssh = SSH()
        tool_port = self.port_check(customer_info, tool_address)
        if tool_port == 0:
            debug_message(customer_info, 'ERROR: Tool ssh port is not open')
            return self.output_json('ERROR', 'Tools server ssh port is not open')

        debug_message(customer_info, 'ERROR: Tool ssh port is open')
        # Move the configuration executable to the target machine
        try:
            rc, output = ssh.copy_local_to_remote(tool_username, tool_passkey, tool_address, '/'.join([cdir, 'sasg_tools_configure.sh']), customer_info, remote_dir='/tmp', port=tool_port)
            if rc != 0:
                logging.error('copy_local_to_remote failed: ' + str(output))
                return self.output_json('ERROR', str(output))
        except Exception as e:
            logging.error('copy_local_to_remote failed: ' + str(e))
            return self.output_json('ERROR', 'Internal error')
        
        debug_message(customer_info, 'INFO: config script copied to remote machine')

        tool_alias = '_'.join([tool_address, tool_name])
        debug_message(customer_info, 'INFO: running script on %s' % tool_alias)
        # Execute the configuration script
        try:
            rc, output = ssh.run_remote_cmd(tool_username, tool_passkey, tool_address, 'sudo /tmp/sasg_tools_configure.sh ' + tool_alias, customer_info, port=tool_port)

            # NOTE: after the configuration, ssh port is changed to 2222

            # Try to retrieve the log file regardless of success or fail
            nrc, noutput = ssh.copy_remote_to_local(tool_username, tool_passkey, tool_address, '/tmp/' + tool_alias + '.log', cdir, customer_info,  2222)
            if nrc != 0:
                logging.info('(%s) ssh.copy_remote_to_local failed with port 2222, and try again with 22' % str(noutput))
                nrc, noutput = ssh.copy_remote_to_local(tool_username, tool_passkey, tool_address, '/tmp/' + tool_alias + '.log', cdir, customer_info)
                logging.info('(%s) ssh.copy_remote_to_local tried with port 22' % str(noutput))
                # NOTE: ignore error.

            if rc != 0:
                logging.error(str(output))
                return self.output_json('ERROR', str(output))
        except Exception as e:
            logging.error('run_remote_cmd failed: ' + str(e))
            return self.output_json('ERROR', 'Internal error')

        # The GUI url should be updated
        return self.output_json('OK', "Executing sasg_tools_configure.sh succeeded")

    def vyos_save(self, vyos_username, vyos_passkey, vyos_address):
        ''' Run VyOS save command to permanently save the config '''
        pass

    def vyos_dump(self, vyos_username, vyos_passkey, vyos_address):
        ''' Dump VyOS configuration '''

        #show configuration commands
        pass

    def vyos_configure(self, dirloc, customername, vyos_username, vyos_passkey, vyos_address, customer_info, sasg_present=True):
        ''' vars file should be under customer's folder 
            vyos_passkey can be either password or ssh key path (ssh accepts key)
        '''
        cdir = '/'.join([self.customers_dir, customername])

        # Find whether the private key exists
        vyos_passkey = self.pkey(dirloc, vyos_passkey)
        ssh = SSH()

        debug_message(customer_info, 'INFO: checking VYOS %s for opened ports' % vyos_address)
        vyos_port = self.port_check(customer_info, vyos_address)
        if vyos_port == 0:
            debug_message(customer_info, 'ERROR: VyOS ssh port is not open')
            return self.output_json('ERROR', 'VyOS ssh port is not open')
        
        debug_message(customer_info, 'INFO: VyOS ssh port is open')

        # Create a vyos configuration file
        if not os.path.isfile('/'.join([cdir, 'sasg_vyos_configure.sh'])):
            debug_message(customer_info, 'ERROR: No sasg_vyos_configure.sh script found')
            output = self.scripts_generate(cdir)
            if output['status'] == 'ERROR':
                logging.error(str(output))
                return output

        # Move the configuration executable to the target machine
        try:
            rc, output = ssh.copy_local_to_remote(vyos_username, vyos_passkey, vyos_address, '/'.join([cdir, 'sasg_vyos_configure.sh']), customer_info, remote_dir='/tmp', port=vyos_port)
            if rc != 0:
                logging.error(str(output))
                return self.output_json('ERROR', str(output))
        except Exception as e:
            logging.error('copy_local_to_remote failed: ' + str(e))
            return self.output_json('ERROR', 'Internal error')
        
        debug_message(customer_info, 'INFO: config script copied to remote machine')

        # Execute the configuration script
        debug_message(customer_info, 'INFO: running config on remote machine...')
        try:
            rc, output = ssh.run_remote_cmd(vyos_username, vyos_passkey, vyos_address, '/tmp/sasg_vyos_configure.sh', customer_info, vyos_port)

            # NOTE: after the configuration, ssh port is changed to 2222

            # Try to retrieve the log file regardless of success or fail
            nrc, noutput = ssh.copy_remote_to_local(vyos_username, vyos_passkey, vyos_address, '/tmp/sasg_vyos_configure.log', cdir, customer_info, 2222)
            if nrc != 0: # try one more time with 22.
                logging.info('(%s) ssh.copy_remote_to_local failed with port 2222, and try again with 22' % str(noutput))
                nrc, noutput = ssh.copy_remote_to_local(vyos_username, vyos_passkey, vyos_address, '/tmp/sasg_vyos_configure.log', cdir, customer_info)
                logging.info('(%s) ssh.copy_remote_to_local tried with port 22' % str(noutput))
                # NOTE: ignore nrc error.

            if rc != 0:
                logging.error(str(output))
                return self.output_json('ERROR', str(output))
        except Exception as e:
            logging.error('run_remote_cmd failed: ' + str(e))
            return self.output_json('ERROR', 'Internal error')

        # wait until everything is reflected.
        time.sleep(10)

        # Move the file from remote to local, into cdir
        if sasg_present:
            logging.info('Sasg is present for "%s" hence getting sasg_install.sh script from SASFW' % customername)
            debug_message(customer_info, 'INFO: Sasg is present for "%s" hence getting sasg_install.sh script from SASFW' % customername)
            try:
                rc, output = ssh.copy_remote_to_local(vyos_username, vyos_passkey, vyos_address, '/tmp/sasg_install.sh', cdir, customer_info, 2222)
                if rc != 0:
                    logging.info('(%s) ssh.copy_remote_to_local failed with port 2222, and try again with 22' % str(output))

                    # Try once more with 22.
                    rc, output = ssh.copy_remote_to_local(vyos_username, vyos_passkey, vyos_address, '/tmp/sasg_install.sh', cdir, customer_info)
                    logging.info('(%s) ssh.copy_remote_to_local tried with port 22' % str(noutput))

                # error if still rc = error.
                if rc != 0:
                    logging.error(str(output))
                    return self.output_json('ERROR', str(output))
            except Exception as e:
                logging.error('copy_remote_to_local failed: ' + str(e))
                return self.output_json('ERROR', 'Internal error')
        else:
            logging.info('Sasg is not present for "%s" hence ending without sasg_install.sh' % customername)

        # The GUI url should be updated
        return self.output_json('OK', ("Find sasg_install.sh in %s" % cdir))

    def vyatta_set_nat(self, hostname, gsni_ip, sl_private_ip, protocol, interface):
        ''' Set a NAT rule into Vyatta 

            # destination: one each IP address
            set nat destination rule 10 description 'mgmt-crtlwrk01.ibm.com' -> hostname
            set nat destination rule 10 destination address '158.87.34.2' -> gsni_ip
            set nat destination rule 10 inbound-interface 'bond1' -> interface
            set nat destination rule 10 protocol 'ip' -> protocol
            set nat destination rule 10 translation address '10.148.11.169' -> sl_private_ip

            TBD: Joe should decide the logic behind this.
            # source: one for customer.. need to know the logic
            set nat source rule 26 description 'Hyundai-Green-Food-segment' -> customer
            set nat source rule 26 destination port '443,636' -> ports
            set nat source rule 26 outbound-interface 'bond1v1' -> interface
            set nat source rule 26 protocol 'tcp' -> protocol
            set nat source rule 26 source address '10.117.181.128/26' -> subnet
            set nat source rule 26 translation address '158.87.34.50' -> gsni_ip
        '''
        output = {}

        # TODO: get these info.
        vyatta_ip = ''
        vyatta_username = ''
        vyatta_pass_key = ''

        ssh = SSH() # open session to do everything.

        vyatta_port = self.port_check(customer_info, vyatta_ip)
        if vyatta_port == 0:
            return self.output_json('ERROR', 'Vyatta ssh port is not open')
 
        print('session_open')
        ssh.session_open(vyatta_ip, vyatta_username, vyatta_pass_key, vyatta_port)

        print('session_send')
        rc, data = ssh.session_send('show nat destination rules')

        print('find rule num')

        # TODO: range should be externalized.
        rule_start = 7
        rule_end = 8000
        rule_num = rule_start

        for line in data.split('\r\n'):
            sline = re.sub( '\s+', ' ', line).strip().split()
            if len(sline) == 6 and 'daddr' in sline:
                if rule_start <= int(sline[0]) <= rule_end:
                    if rule_num != int(sline[0]):
                        break
                    rule_num += 1

        output['vyatta_dest_rule_num'] = rule_num
        output['status'] = 'SUCCESS'

        commands = []
        commands.append("configure")
        commands.append("set nat destination rule %s description '%s'" % (rule_num, hostname))
        commands.append("set nat destination rule %s destination address '%s'" % (rule_num, gsni_ip))
        commands.append("set nat destination rule %s inbound-interface '%s'" % (rule_num, interface))
        commands.append("set nat destination rule %s protocol '%s'" % (rule_num, protocol))
        commands.append("set nat destination rule %s translation address '%s'" % (rule_num, sl_private_ip))

        for command in commands:
            rc, data = ssh.session_send(command)
            print(rc, data)

        rc, data = ssh.session_send('show nat destination rule 17')
        print(data)

        # ONLY TESTING...
        commands.append("exit discard")

        ssh.session_close()

        return self.output_json('OK', 'Nat rule is implemented.', output)

    def vyatta_delete_nat(self):
        ''' Delete a NAT rule from Vyatta '''
        status = 'SUCCESS'

        #status = 'FAILED'

        output = 'from vyatta'

        return status, output 

    def run_command(self, username, passkey, address, commands):
        ''' 
            This runs commands in the designated host.
        '''

        # where can I get vars info? 
        # replae commands... where the parameter is referred.. with $XXX

        port = self.port_check(customer_info, address)
        if port == 0:
            return self.output_json('ERROR', 'ssh port is not open')

        ssh = SSH() # open session to do everything.

        ssh.session_open(address, username, passkey, port)

        output = []
        for command in commands:
            rc, data = ssh.session_send(command)
            #print(rc, data, command)
            output.append(data)
            if rc != 0:
                return self.output_json('ERROR', command + ' FAILED: ' + data)
                
        ssh.session_close()

        return self.output_json('OK', 'Command run success', '; '.join(output))

    def run_juniper_config(self, juniper_info, juniper_keys_dir):
        
        key = os.path.join(juniper_keys_dir, str(juniper_info['key']))

        print('host:                    %s' % juniper_info['ip'])
        print('port:                    %s' % juniper_info['port'])
        print('user:                    %s' % juniper_info['junusername'])
        print('key:                     %s' % key)

        juniper_dev = jnpr.junos.Device(
            host=juniper_info['ip'],
            port=juniper_info['port'],
            user=juniper_info['junusername'],
            ssh_private_key_file=key)

        local_config = os.path.join('/sasg_data/userdata/juniper', juniper_info['client_id'], '%s_local.yml' % juniper_info['client_id'])
        xml_config = os.path.join('/sasg_data/userdata/juniper', juniper_info['client_id'], '%s_local.xml' % juniper_info['client_id'])

        if not os.path.isfile(local_config):
            print('Could not find config to apply: %s' % local_config)
            return self.output_json('ERROR', 'Could not find config to apply: %s' % local_config)
        
        with open(local_config) as f:
            config_obj = yaml.load(f, Loader=yaml.Loader)    
        
        with open(xml_config, 'w') as f:
            xmlplain.xml_from_obj(config_obj, f, pretty=True)
   
        try:
            juniper_dev.open()
        except jnpr.junos.exception.ConnectError as err:
            print('Cannot connect to device: {0}'.format(err))
            return self.output_json('ERROR', 'Cannot connect to device: {0}'.format(err))
        except Exception as err:
            print('Generic connection issue: {0}'.format(err))
            return self.output_json('ERROR', 'Generic connection issue: {0}'.format(err))
        
        try:
            juniper_config = jnpr.junos.utils.config.Config(juniper_dev)
            juniper_config.lock()
            juniper_config.load(path=xml_config, merge=True)
            config_diff = juniper_config.diff()
            print('Applying the following changes: %s' % config_diff)
            juniper_config.commit()
            juniper_config.unlock()

        except jnpr.junos.exception.LockError as err:
            print('Could not lock Juniper config: {0}'.format(err))
            return self.output_json('ERROR', 'Could not lock Juniper config: {0}'.format(err))
        except jnpr.junos.exception.ConfigLoadError as err:
            error_msg = 'Could not load Juniper config: %s' % (err)
            print(error_msg)
            juniper_config.unlock()
            return self.output_json('ERROR', error_msg)
        except jnpr.junos.exception.UnlockError as err:
            print('Could not unlock Juniper config: {0}'.format(err))
            return self.output_json('ERROR', 'Could not unlock Juniper config: {0}'.format(err))
        except jnpr.junos.exception.CommitError as err:
            print('Candidate configuration error: {0}'.format(err))
            juniper_config.unlock()
            return self.output_json('ERROR', 'Candidate configuration error: {0}'.format(err))
        except jnpr.junos.exception.RpcError as err:
            print('Error dry-running config commit: {0}'.format(err))
            juniper_config.unlock()
            return self.output_json('ERROR', 'Error dry-running config commit: {0}'.format(err))

        juniper_dev.close()

        return self.output_json('OK', 'Remote configuration was applied successfully: %s' % config_diff)

    def get_juniper_config(self, juniper_info, juniper_keys_dir):

        key = os.path.join(juniper_keys_dir, str(juniper_info['key']))

        print('host:                    %s' % juniper_info['ip'])
        print('port:                    %s' % juniper_info['port'])
        print('user:                    %s' % juniper_info['user'])
        print('key:                     %s' % key)

        juniper_dev = jnpr.junos.Device(
            host=juniper_info['ip'],
            port=juniper_info['port'],
            user=juniper_info['user'],
            ssh_private_key_file=key)
   
        try:
            juniper_dev.open()
        except jnpr.junos.exception.ConnectError as err:
            print('Cannot connect to device: {0}'.format(err))
            return self.output_json('ERROR', 'Cannot connect to device: {0}'.format(err))
        except Exception as err:
            print('Generic connection issue: {0}'.format(err))
            return self.output_json('ERROR', 'Generic connection issue: {0}'.format(err))
        
        try:
            juniper_config = jnpr.junos.utils.config.Config(juniper_dev)
            juniper_config.lock()
            # juniper_config.load(path=converter.outfile, update=True)
            juniper_config.unlock()

        except jnpr.junos.exception.LockError:
            return self.output_json('ERROR', 'Could not lock Juniper config')
        except jnpr.junos.exception.ConfigLoadError:
            juniper_config.unlock()
            return self.output_json('ERROR', 'Could not load Juniper config')
        except jnpr.junos.exception.UnlockError:
            return self.output_json('ERROR', 'Could not unlock Juniper config')

        juniper_dev.close()
        # converter.cleanup()

        return self.output_json('OK', 'Remote configuration was applied successfully')

    def get_remote_juniper_config(self, client_info, juniper_keys_dir):
        key = os.path.join(juniper_keys_dir, str(client_info['key']))

        print('Using key "%s" to get remote config with following properties:' % key)
        print('  * Client ID:       %s' % client_info['client_id'])
        print('  * IP:              %s' % client_info['ip'])
        print('  * User:            %s' % client_info['junusername'])
        print('  * Port:            %s' % client_info['port'])

        juniper_dev = jnpr.junos.Device(
            host=client_info['ip'],
            port=client_info['port'],
            user=client_info['junusername'],
            ssh_private_key_file=key)
        
        try:
            juniper_dev.open()
        except jnpr.junos.exception.ConnectError as err:
            print('Cannot connect to device: {0}'.format(err))
            return self.output_json('ERROR', 'Cannot connect to device: {0}'.format(err))
        except Exception as err:
            print('Generic connection issue: {0}'.format(err))
            return self.output_json('ERROR', 'Generic connection issue: {0}'.format(err))

        try:
            data = juniper_dev.rpc.get_config()
            xml_line = lxml.etree.tostring(data)
            config_obj = xmlplain.xml_to_obj(xml_line)
            header_obj = { 'configuration': [] }

            while True:
                no_header_items_found = True
                for i in range(len(config_obj['configuration'])):
                    # Objects are as follows: config_obj['configuration']['system': [...], 'security': ['...'], ...]
                    element_id = config_obj['configuration'][i].keys()[0]
                    if element_id == 'security':
                        header_security = []
                        security_element = config_obj['configuration'][i]['security']
                        while True:
                            no_extra_security_items_found = True
                            for j in range(len(security_element)):
                                security_element_id = security_element[j].keys()[0]
                                if not security_element_id in application.config['JUNIPER_CONFIG_ALLOWED_SECURITY_CATEGORIES']:
                                    header_security.append(security_element[j])
                                    del(security_element[j])
                                    no_header_items_found = False
                                    break
                            if no_extra_security_items_found:
                                break
                        header_obj['configuration'].append({'security': header_security})
                    if element_id in application.config['JUNIPER_HEADER_CONFIG_CATEGORIES']:
                        print('Found config item to be moved to header: %s' % element_id)
                        header_obj['configuration'].append(config_obj['configuration'][i])
                        del(config_obj['configuration'][i])
                        no_header_items_found = False
                        break
                if no_header_items_found:
                    break
            
            remote_config_file = os.path.join('userdata/juniper', client_info['client_id'], '%s_remote.yml' % client_info['client_id'])
            header_config_file = os.path.join('userdata/juniper', client_info['client_id'], '%s_header.yml' % client_info['client_id'])

            with open('/sasg_data/%s' % remote_config_file, 'w') as f:
                xmlplain.obj_to_yaml(config_obj, f)
            
            with open('/sasg_data/%s' % header_config_file, 'w') as f:
                xmlplain.obj_to_yaml(header_obj, f)

        except Exception as err:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            err_message = 'Error "%s" (%s) on %s:%s' % (exc_obj, exc_type, exc_tb.tb_lineno, fname)
            print('Could not get remote config: %s' % err_message)
            return self.output_json('ERROR', 'Could not get remote config: %s' % err_message)
        
        try:
            juniper_dev.close()
        except: 
            pass # connection should be closed at the end of the function anyway

        client_config_file = os.path.join('/sasg_data/userdata/juniper', client_info['client_id'], 'client.yml')
        remote_config_info = {}
        remote_config_info['config_url'] = remote_config_file
        remote_config_info['header_url'] = header_config_file
        remote_config_info['ts'] = datetime.now().strftime('%Y-%m-%d %H:%M')
        client_info['remote_config'] = remote_config_info

        with open(client_config_file, 'w') as f:
            yaml.dump(client_info, f)

        # try:
        #     result = self.get_config_diff(client)
        #     if result.get('status') != 'OK':
        #         return self.output_json('ERROR', 'Could not generate diff')
        # except:
        #     return self.output_json('ERROR', 'Could not generate diff')

        return self.output_json('OK', 'Remote config for "%s" was successfully fetched' % client_info['client_id'])

    def get_config_diff(self, client_info):

        diff_url = os.path.join('userdata/juniper', client_info['client_id'], '%s_config_diff.txt' % client_info['client_id'])
        diff_file = os.path.join('/sasg_data', diff_url)

        client_config_file = os.path.join('/sasg_data/userdata/juniper', client_info['client_id'], 'client.yml')

        if not 'remote_config' in client_info.keys() or not 'local_config' in client_info.keys():
            del client_info['diff_url']
        else:
            remote_config = os.path.join('/sasg_data', client_info['remote_config']['config_url'])
            local_config = os.path.join('/sasg_data', client_info['local_config']['config_url'])

            if not os.path.isfile(remote_config):
                return self.output_json('ERROR', 'Could not find remote config: %s' % remote_config)
            if not os.path.isfile(local_config):
                return self.output_json('ERROR', 'Could not find local config: %s' % local_config)
            
            cmd = 'diff "%s" "%s" > "%s"' % (local_config, remote_config, diff_file)
            print('Running command: %s' % cmd)
            subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            sleep(1)


            if os.path.getsize(diff_file) == 0:
                client_info['diff_url'] = 'Empty'
            else:
                client_info['diff_url'] = diff_url

        with open(client_config_file, 'w') as f:
            yaml.dump(client_info, f)

        return self.output_json('OK', 'Configs diff for "%s" was successfully created' % client_info['client_id'])
