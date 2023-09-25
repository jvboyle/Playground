# -*- coding: utf-8 -*-
"""
SASGaaS library to store shared functions
"""

import datetime
import inspect
import json
import os
import os.path
import shutil
#import ssh
import service.src.lib.ssh
import subprocess
import sys
import tarfile
import service.src.lib.sasglog

from service import application

class DockerImage:
    IMAGES_DIR = '/sasg_data/images'
    def __init__(self, image_type, filename, tag):
        self.image_type = image_type
        self.filename = filename
        self.tag = tag
        self.uploaded = False
        path_to_file = ('%s/%s' % (self.IMAGES_DIR, self.filename))
        if os.path.isfile(path_to_file):
            self.uploaded = True
            self.label = self._get_image_label('%s/%s' % (self.IMAGES_DIR, self.filename))

    def _get_image_label(self, image_path):
        docker_manifest = 'manifest.json'
        tarfile.open(image_path).extract(docker_manifest)
        with open(docker_manifest) as f:
            tags = json.load(f)[0]['RepoTags']
        
        for tag in tags:
            label = tag.split(':')[1]
            if label == 'latest':
                continue

            os.remove(docker_manifest)
            return label
        
        os.remove(docker_manifest)
        return None


class Customer:
    CUSTOMERS_DIR = '/sasg_data/userdata/customers'
    UPDATE_PACKAGE = 'update_package.tgz'
    DEPLOYMENT_PACKAGE = 'sasg_install.tgz'

    def __init__(self, user_name, bg, customer_name):
        self.name = customer_name
        self.dir = ('%s/%s' % (self.CUSTOMERS_DIR, self.name))
        self.exists = False
        self.allowed = False

        self.load_info(user_name, bg)

    def load_info(self, user_name, bg):
        customer_info_file = ('%s/customer_info.json' % self.dir)
        bg_metadata_file = ('/sasg_data/userdata/%s/metadata_info.json' % bg)

        if not os.path.isfile(customer_info_file):
            print('Customer info for "%s" does not exist' % self.name)
            return None

        self.exists = True

        if not os.path.isfile(bg_metadata_file):
            print('Metadata for "%s" does not exist' % bg)
            return None

        with open(bg_metadata_file, 'r') as f:
            if not self.name in json.load(f)['customers']:
                print('Customer "%s" is not allowed for "%s"' % (self.name, bg))
                return None
        
        self.allowed = True

        user_data = json.load(open(customer_info_file, 'r'))

        self.tools_user = user_data['vyos_auto_username']
        self.tools_key = '%s/%s/%s/%s' % ('/sasg_data/userdata',
                                       bg,
                                       'keys',
                                       user_data['vyos_auto_passkey'])
        print('Key: %s (%s)' % (self.tools_key, os.path.isfile(self.tools_key)))
        self.sasfw_ip = user_data['vars']['PRIVATE_VYOS_IP']
    
    def get_deployment_image(self):
        deployment_package = '%s/%s' % (self.dir, self.DEPLOYMENT_PACKAGE)
        if not os.path.isfile(deployment_package):
            return None
        
        return deployment_package

_UPDATE_PACKAGE = 'update_sasg.tgz'
_DOCKER_IMAGES_DIR = '/sasg_data/images'
_UPDATE_TRIGGER_FILE = 'do-upgrade'

DOCKER_IMAGES = {
    'sasgc': DockerImage('sasgc', 
                         'docker-container.sasgc.tgz',
                         'gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg_build'),
    'checker': DockerImage('checker', 
                           'docker-container.checker.tgz',
                           'gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg-sidecar-checker')
}

def _debug_message(message):
    if os.environ['ENABLE_DEBUG'] == '1':
        print('DEBUG MESSAGE: %s' % message)

def debug_init(customer_info):
    if (not ('debug' in customer_info)) or (customer_info['debug']['status'] == 'disabled'):
        return
    customer_info['debug']['debug_log'] = '/userdata/customers/%s/debug_log.log' % customer_info['customername']
    debug_file = '/sasg_data%s' % customer_info['debug']['debug_log']

    with open(debug_file, 'w') as df:
        df.write('%s: --- DEBUG LOG START ---\n' % datetime.datetime.now().strftime('%Y-%m-%d %H:%M'))

def debug_message(customer_info, message):
    print('debug')
    print(customer_info)
    if (not ('debug' in customer_info)) or (customer_info['debug']['status'] == 'disabled'):
        return    
    debug_file = '/sasg_data%s' % customer_info['debug']['debug_log']

    with open(debug_file, 'a') as df:
        df.write('%s: %s\n' % (datetime.datetime.now().strftime('%Y-%m-%d %H:%M'), message))

def _test_ssh_port(ip):
    ssh_port = 0
    for port in [ 2222, 22 ]:
        cmd = ('timeout 3 bash -c "cat < /dev/null > /dev/tcp/%s/%s" && echo OPEN || echo CLOSED' 
               % (ip, port))
        ps = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        output = ps.stdout.read()

        ps.stdout.close()
        ps.wait()

        if ps.returncode == 0 and 'OPEN' in output:
            ssh_port = port
            break

    if ssh_port == 0:
        print('Could not connect to %s' % ip)
        print('Error output (%s): %s' % (inspect.stack()[0][3], output))
        raise Exception('Error', str(output))
    
    return ssh_port

def get_image_label(image_path):
    docker_manifest = 'manifest.json'
    tarfile.open(image_path).extract(docker_manifest)
    with open(docker_manifest) as f:
        tags = json.load(f)[0]['RepoTags']
    
    for tag in tags:
        label = tag.split(':')[1]
        if label == 'latest':
            continue

        os.remove(docker_manifest)
        return label
    
    os.remove(docker_manifest)
    return None

def extract_image(path_to_archive, image_type, extract_path):
    try:
        with tarfile.open(path_to_archive, 'r:gz') as depl_package:
            depl_package.extract(DOCKER_IMAGES[image_type].filename, extract_path)
    except Exception as e:
        print('Error message (%s->%s): %s' % (inspect.stack()[1][3],
                                              inspect.stack()[0][3],
                                              str(e)))
        raise

def copy_image(image, target_dir):
    image_file = '%s/%s' % (_DOCKER_IMAGES_DIR, DOCKER_IMAGES[image].filename)
    target_file = '%s/%s' % (target_dir, DOCKER_IMAGES[image].filename)
    try:
        shutil.copyfile(image_file, target_file)
    except Exception as e:
        print('Error message (%s->%s): %s' % (inspect.stack()[1][3],
                                              inspect.stack()[0][3],
                                              str(e)))
        raise

def create_update_package(work_dir):
    update_package = '%s/%s' % (work_dir, _UPDATE_PACKAGE)
    if os.path.isfile(update_package):
        os.remove(update_package)
    
    GCM_POLICY_FILES = [
        'policy_OS.xml',
        'policy_docker.xml'
    ]

    try:
        with tarfile.open(update_package, 'w:gz') as update_package:
            for image in DOCKER_IMAGES:
                label_file_name = '%s.label' % DOCKER_IMAGES[image].filename
                label_file_path = os.path.join(work_dir, label_file_name)
                with open(label_file_path, 'w') as label_file:
                    label_file.write(get_image_label(os.path.join(work_dir, DOCKER_IMAGES[image].filename)))
                update_package.add('%s/%s' % (work_dir, DOCKER_IMAGES[image].filename),
                                DOCKER_IMAGES[image].filename)
                update_package.add(label_file_path, label_file_name)
            for gcm_policy_file in GCM_POLICY_FILES:
                update_package.add('%s/%s' % (application.config['GCM_POLICY_DIR'], gcm_policy_file),
                                gcm_policy_file)
                
    except Exception as e:
        fname = os.path.split(sys.exc_info()[2].tb_frame.f_code.co_filename)[1]
        print('Error message (%s->%s): %s (%s:%s)' % (inspect.stack()[1][3],
                                              inspect.stack()[0][3],
                                              str(e), fname, sys.exc_info()[2].tb_lineno))
        raise

def upload_update_package(work_dir, customer):

    try:
        update_image = '%s/%s' % (work_dir, _UPDATE_PACKAGE)
        remote_image = '/tmp/%s' % (_UPDATE_PACKAGE)

        ssh_conn = ssh.SSH()

        ssh_port = _test_ssh_port(customer.sasfw_ip)

        _debug_message('Using %s:%s for SSH connection' % (customer.sasfw_ip, ssh_port))

        rc, output = ssh_conn.copy_local_to_remote(customer.tools_user,
                                                customer.tools_key,
                                                customer.sasfw_ip,
                                                update_image,
                                                remote_dir="/tmp",
                                                port=ssh_port)
        _debug_message('copy_local_to_remote results:')
        _debug_message('  * Output:  %s' % output)
        _debug_message('  * RC:  %s' % rc)
        if rc != 0:
            print(str(output))
            raise Exception('Remote copy error',
                            'Could not copy %s to %s' % (update_image, customer.sasfw_ip))

    except Exception as e:
        fname = os.path.split(sys.exc_info()[2].tb_frame.f_code.co_filename)[1]
        print('Error message (%s->%s): %s (%s:%s)' % (inspect.stack()[1][3],
                                              inspect.stack()[0][3],
                                              str(e), fname, sys.exc_info()[2].tb_lineno))
        raise

    remote_folder = '/sasg/listener/uploads/autoupdate'
    try:
        for command in [
            (
                'sudo mkdir -p %s' % remote_folder +
                ' || { echo "Could not create folder for autoupdate package"; exit 1; }'
            ),
            (
                'sudo tar xzf %s -C %s' % (remote_image, remote_folder) +
                ' || { echo "Could not extract images on target machine"; exit 1; }'
            ),
            (
                'sudo rm -f %s' % remote_image +
                '|| { echo "Could not delete remote update package %s"; exit 1; }' % remote_image
            ),
            'echo "$(date "+%Y%m%d-%H%M")" > /tmp/sas-images-upload-ts'
        ]:

            rc, output = ssh_conn.run_remote_cmd(customer.tools_user,
                                                customer.tools_key,
                                                customer.sasfw_ip,
                                                command,
                                                port=ssh_port)

            _debug_message(' Running command:')
            _debug_message('  * Command: %s' % command)
            _debug_message('  * Output:  %s' % output)
            _debug_message('  * RC:  %s' % rc)

            if rc != 0:
                print('Error output (%s): %s' % (inspect.stack()[0][3], output))
                raise Exception('Error', str(output))
        
    except Exception as e:
        print('run_remote_cmd failed: ' + str(e))
        raise

def init_update(customer):
    
    ssh_conn = ssh.SSH()

    ssh_port = _test_ssh_port(customer.sasfw_ip)

    try:
        for command in [
            (
                'sudo touch /sasg/listener/uploads/autoupdate/do-upgrade' +
                ' || { echo "Could not create upgrade file"; exit 1; }'
            )
        ]:
            rc, output = ssh_conn.run_remote_cmd(customer.tools_user,
                                                customer.tools_key,
                                                customer.sasfw_ip,
                                                command,
                                                port=ssh_port)

            _debug_message(' Running command:')
            _debug_message('  * Command: %s' % command)
            _debug_message('  * Output:  %s' % output)
            _debug_message('  * RC:  %s' % rc)

            if rc != 0:
                print('Error output (%s): %s' % (inspect.stack()[0][3], output))
                raise Exception('Error', str(output))
        
    except Exception as e:
        print('run_remote_cmd failed: ' + str(e))
        raise

def stop_update(customer):
    
    ssh_conn = ssh.SSH()

    ssh_port = _test_ssh_port(customer.sasfw_ip)

    try:
        for command in [
            (
                'sudo rm -f /sasg/listener/uploads/autoupdate/do-upgrade' +
                ' || { echo "Could not remove upgrade file"; exit 1; }'
            )
        ]:
            rc, output = ssh_conn.run_remote_cmd(customer.tools_user,
                                                customer.tools_key,
                                                customer.sasfw_ip,
                                                command,
                                                port=ssh_port)

            _debug_message(' Running command:')
            _debug_message('  * Command: %s' % command)
            _debug_message('  * Output:  %s' % output)
            _debug_message('  * RC:  %s' % rc)

            if rc != 0:
                print('Error output (%s): %s' % (inspect.stack()[0][3], output))
                raise Exception('Error', str(output))
        
    except Exception as e:
        print('run_remote_cmd failed: ' + str(e))
        raise

def log_user_action(user, message):
    with open(application.config['USER_LOG'], 'wa') as log_file:
        dt = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())
        log_line = '[ SASGAAS ] [ %s ] %s: %s\n' % (dt, user, message)
        log_file.writelines(log_line)

def remove_redundant_references(customer, vars_json, default_tools_servers):
    _debug_message('Entering "remove_redundant_references"')
    customer_dir = os.path.join('/sasg_data/userdata/customers', customer)
    customer_files = os.listdir(customer_dir)
    tools_present = False
    for tool in default_tools_servers:
        _debug_message('Processing tool: %s' % tool)
        if tool in vars_json:
            _debug_message('Found tool: %s' % tool)
            tools_present = True
            continue

        for customer_file in customer_files:
            _debug_message('Processing file: %s' % customer_file)
            if not customer_file.endswith('%s.log' % tool):
                _debug_message('%s is not log, omitting' % customer_file)
                continue
            # Make sure we're not mixing RCP_BPM_IP log w/ BPM_IP - the former 
            # will give bigger length if split by '_' symbol
            if not (len(customer_file.split('_')) - 1  == len(tool.split('_'))):
                _debug_message('Should not mismatch %s for %s file' % (customer_file, tool))
                continue
            _debug_message('Removing %s...' % customer_file)
            os.remove(os.path.join(customer_dir, customer_file))
            _debug_message('%s is present: %s' % (customer_file, os.path.isfile(os.path.join(customer_dir, customer_file))))
        
    if not tools_present:
        _debug_message('Removing sasg_tools_configure.sh...')
        os.remove(os.path.join(customer_dir, 'sasg_tools_configure.sh'))
        _debug_message('sasg_tools_configure.sh is present: %s' % os.path.isfile(os.path.join(customer_dir, 'sasg_tools_configure.sh')))

def is_not_empty_var(var):
    if type(var) in (str, int):
        return bool(var)
    elif type(var) is list:
        var_has_value = 0
        for list_value in var:
            var_has_value += int(bool(list_value))
        return bool(var_has_value)
