# -*- coding: utf-8 -*-
"""
    SASGaaS: Service Access Solution Gateway as a Service

    IBM T.J. Watson Research Center
    Jinho Hwang

    :copyright: (c) IBM 2016
"""

import ldap, os, base64, hashlib, shutil, logging, datetime, socket,struct, re, ipaddress, uuid, json, tarfile
from datetime import timedelta
from functools import wraps
from flask import request, render_template, flash, redirect, Blueprint, g, Response, json, jsonify, abort, url_for, send_file, session, escape
from flask_login import current_user, login_user, logout_user, login_required
from flask_session import Session
from flask_wtf.csrf import CSRFProtect, CSRFError
#from django.views.decorators.csrf import csrf_exempt

from Crypto.Cipher import AES

from service import login_manager, db, application
from service.src.models import User, Command
from service.src.lib.sasglog import log_action
import random
import sys
import yaml
#, Gsniip, Natip

from sqlalchemy import distinct

from service.src.lib.sasglib import SASGLIB
from service.src.lib.sasglib2 import Customer
from service.src.lib.sasglib2 import extract_image
from service.src.lib.sasglib2 import create_update_package
from service.src.lib.sasglib2 import upload_update_package
from service.src.lib.sasglib2 import init_update
from service.src.lib.sasglib2 import is_not_empty_var

import service.src.lib.sasglog
import service.src.lib.ansible as sasg_ansible

from service.src.lib.sasglib2 import debug_init
from service.src.lib.sasglib2 import debug_message

src = Blueprint('src', __name__)
static_dir = '/'.join([application.config.get('SERVICE_DIR'), 'static'])
userdata_dir = application.config.get('USER_DATA_DIR')
customers_dir = application.config.get('CUSTOMERS_DIR')
data_root_dir = application.config.get('DATA_ROOT_DIR')
version = application.config.get('VERSION', '0.0')
juniper_bluegroup = application.config.get('JUNIPER_BLUEGROUP')

csrf = CSRFProtect(application)
Session(application)

# TODO: this list should be externalized later for more services.
default_tools_servers = ["BPM_IP", "CHEF_IP", "EE_IP", "ASB_IP", "RCP_BPM_IP", "RCP_ROR_IP", "RCP_PROXY_IP", "RCP_IP", "CEBW_IP", "CSC_IP"]

#@application.after_request
#def add_cors(rv):
#    #rv.headers.add('Access-Control-Allow-Origin', 'http://localhost.localdomain:63342')
#    rv.headers.add('Access-Control-Allow-Headers', 'X-CSRFToken')
#    rv.headers.add('Access-Control-Allow-Credentials', 'true')
#    return rv

#@src.errorhandler(CSRFError)
#def handle_csrf_error(e):
#    print('csrf: ', e.description)
#    return 'ok'
#    #return render_template('csrf_error.html', reason=e.description), 400

#@src.before_request
#def check_csrf():
#    print('before_request: ', request)

################################################################################
# UTILITIES
################################################################################

@login_manager.user_loader
def load_user(id):
    return User.query.get(int(id))

@src.before_request
def make_session_permanent():
    session.modified = True
    session.permanent = True
    application.permanent_session_lifetime = timedelta(minutes=60)

@src.before_request
def get_current_user():
    g.user = current_user

def output_json(status, message):
    return json.dumps({ 'status': status, 'message': message })

def get_info(user, key, customer=''):
    dirloc = ''
    if key == 'user':
        dirloc = '/'.join([userdata_dir, user.username])
    elif key == 'metadata':
        dirloc = '/'.join([userdata_dir, get_val('bluegroup', user.desc)])
    else:
        dirloc = '/'.join([customers_dir, customer])

    try:
        info_file = '/'.join([dirloc, key+'_info.json'])
        return json.loads(open(info_file, 'r').read())
    except:
        return {}

def set_info(user, key, value, customer=''):
    dirloc = ''
    if key == 'user':
        dirloc = '/'.join([userdata_dir, user.username])
    elif key == 'metadata':
        dirloc = '/'.join([userdata_dir, get_val('bluegroup', user.desc)])
    else:
        dirloc = '/'.join([customers_dir, customer])

    info_file = '/'.join([dirloc, key+'_info.json'])
    info_file_bak = info_file + '.bak'

    try: # not existing for the first time
        os.rename(info_file, info_file_bak)
    except:
        pass

    try:
        open(info_file, 'w+').write(json.dumps(value or {}))
    except:
        pass

def vars_parsing(filepath):
    vars_str = ''
    with open(filepath, 'r') as f:
        for line in f:
            if len(line.strip()) == 0: continue
            if line.strip()[0] != '#':
                vars_str += line.strip() + '<br>'
    return vars_str

def vars_to_json(filepath):
    ''' Various forms:
        key=val -> { key: val }
        key[0]=val -> { key: [val, val] }
    '''
    out_json = {}
    with open(filepath, 'r') as f:
        for line in f:
            if len(line.strip()) == 0: continue
            if line.strip()[0] == '#': continue

            elems = line.split('=')
            if len(elems) != 2: continue

            key = elems[0].strip()
            val = elems[1].strip()
            idx = 0

            if '[' in key and ']' in key: # array
                idx = key[key.index('[')+1:key.index(']')] # may not be used
                key = key[:key.index('[')]

                if key not in out_json: out_json[key] = []
                out_json[key].append(val)
            else: # flat
                out_json[key] = val
    return out_json

def generate_hash_key():
    """ @return: A hashkey for use to authenticate agains the API. """
    return base64.b64encode(hashlib.sha256(str(random.getrandbits(256))).digest(),
                            random.choice(['rA', 'aZ', 'gQ', 'hH', 'hG', 'aR', 'DD'])).rstrip('==')

def is_valid_ipv4(ip):
    """Validates IPv4 addresses.
    """
    pattern = re.compile(r"""
        ^
        (?:
        # Dotted variants:
        (?:
            # Decimal 1-255 (no leading 0's)
            [3-9]\d?|2(?:5[0-5]|[0-4]?\d)?|1\d{0,2}
        |
            0x0*[0-9a-f]{1,2}  # Hexadecimal 0x0 - 0xFF (possible leading 0's)
        |
            0+[1-3]?[0-7]{0,2} # Octal 0 - 0377 (possible leading 0's)
        )
        (?:                  # Repeat 0-3 times, separated by a dot
            \.
            (?:
            [3-9]\d?|2(?:5[0-5]|[0-4]?\d)?|1\d{0,2}
            |
            0x0*[0-9a-f]{1,2}
            |
            0+[1-3]?[0-7]{0,2}
            )
        ){0,3}
        |
        0x0*[0-9a-f]{1,8}    # Hexadecimal notation, 0x0 - 0xffffffff
        |
        0+[0-3]?[0-7]{0,10}  # Octal notation, 0 - 037777777777
        |
        # Decimal notation, 1-4294967295:
        429496729[0-5]|42949672[0-8]\d|4294967[01]\d\d|429496[0-6]\d{3}|
        42949[0-5]\d{4}|4294[0-8]\d{5}|429[0-3]\d{6}|42[0-8]\d{7}|
        4[01]\d{8}|[1-3]\d{0,9}|[4-9]\d{0,8}
        )
        $
    """, re.VERBOSE | re.IGNORECASE)
    return pattern.match(ip) is not None

def is_valid_ipv6(ip):
    """Validates IPv6 addresses.
    """
    pattern = re.compile(r"""
        ^
        \s*                         # Leading whitespace
        (?!.*::.*::)                # Only a single whildcard allowed
        (?:(?!:)|:(?=:))            # Colon iff it would be part of a wildcard
        (?:                         # Repeat 6 times:
            [0-9a-f]{0,4}           #   A group of at most four hexadecimal digits
            (?:(?<=::)|(?<!::):)    #   Colon unless preceeded by wildcard
        ){6}                        #
        (?:                         # Either
            [0-9a-f]{0,4}           #   Another group
            (?:(?<=::)|(?<!::):)    #   Colon unless preceeded by wildcard
            [0-9a-f]{0,4}           #   Last group
            (?: (?<=::)             #   Colon iff preceeded by exacly one colon
            |  (?<!:)               #
            |  (?<=:) (?<!::) :     #
            )                       # OR
        |                           #   A v4 address with NO leading zeros
            (?:25[0-4]|2[0-4]\d|1\d\d|[1-9]?\d)
            (?: \.
                (?:25[0-4]|2[0-4]\d|1\d\d|[1-9]?\d)
            ){3}
        )
        \s*                         # Trailing whitespace
        $
    """, re.VERBOSE | re.IGNORECASE | re.DOTALL)
    return pattern.match(ip) is not None

def is_valid_ip(ip):
    """Validates IP addresses.
    """
    if not ip: return False
    return is_valid_ipv4(ip) or is_valid_ipv6(ip)

def is_ip_belong(ip, subnet): # 'x.x.x.x', 'x.x.x.x/x'
    ipaddr = struct.unpack('!L', socket.inet_aton(ip))[0]
    net, bits = subnet.split('/')
    netaddr = struct.unpack('!L', socket.inet_aton(net))[0]
    netmask = (0xFFFFFFFF >> int(bits)) ^ 0xFFFFFFFF
    return ipaddr & netmask == netaddr

def set_val(key, val, metadata=''):
    newitems = []
    exist = False
    if metadata: # none
        items = metadata.split(',')
        for item in items:
            if key+'=' in item: # exact key
                newitems.append(key + '=' + val)
                exist = True
            else:
                newitems.append(item)
    if exist == False:
        newitems.append(key + '=' + val)
    return ','.join(newitems)

def get_val(key, metadata=''):
    items = metadata.split(',')
    for item in items:
        if key+'=' in item: # exact key
            return item.split('=')[1]
    return None

def clean_user_input(userinput):
    return escape(userinput).replace(r'alert(', 'console.log(')

#@src.before_request
#def before_request(): # use if needed.
#    pass

################################################################################
# APIs (User+Key Authentication)
# GET, POST, HEAD, PUT, DELETE, OPTIONS, CONNECT
# Each API knows who is accessed and connected (current_user)
################################################################################
def require_api_auth(view_function):
    @wraps(view_function)
    # the new, post-decoration function. Note *args and **kwargs here.
    def decorated_function(*args, **kwargs):
        # Session
        if current_user and current_user.is_authenticated:
            return view_function(*args, **kwargs)

        # apikey
        if not request.headers.get('X-Api-Id'):
            return jsonify(status='ERROR', message='Unauthorized: provide correct apikey or password'), 401

        if not request.headers.get('X-Api-BG'):
            return jsonify(status='ERROR', message='Unauthorized: provide correct bluegroup name with X-Api-BG'), 401
        bluegroup = request.headers.get('X-Api-BG')

        #user_profile = get_info(request.headers.get('X-Api-Id'), 'user')
        user = User.query.filter_by(username=request.headers.get('X-Api-Id')).first()
        if not user:
            return jsonify(status='ERROR', message='Unauthorized: provide correct apikey'), 401

        user_groups = User.get_groups(user.username)
        if len(user_groups) == 0 or bluegroup not in user_groups:
            return jsonify(status='ERROR', message='Unauthorized: please ask admin to add to bluegroup.'), 401

        if user and request.headers.get('X-Api-Key') and request.headers.get('X-Api-Key') == user.apikey:

            all_groups = User.get_all_groups()
            user.desc = set_val('bluegroup', bluegroup, user.desc)
            user.desc = set_val('user_bluegroups', ';'.join(user_groups), user.desc)
            user.desc = set_val('all_bluegroups', ';'.join(all_groups), user.desc)

            # login to deliver who is connected to api
            login_user(user)

            return view_function(*args, **kwargs)
        else:
            return jsonify(status='ERROR', message='Unauthorized: provide correct apikey or password'), 401

    return decorated_function

@src.route('/api', methods=['GET'])
def api():
    return jsonify(name='SASGaaS', version='0.1', apidoc='/apidoc'), 200

@src.route('/apidoc', methods=['GET'])
def apidoc():
    swagger = open('/'.join([static_dir, 'api', 'swagger.json'])).read()
    swagger = swagger.replace('+HOSTURL+', request.host).replace('+VERSION+', version)
    return render_template('swagger.html', swagger=swagger)

@src.route('/bluegroups', methods=['PUT'])
def bluegroups():

    username = request.args.get('USERNAME','').strip()

    groups = User.get_groups(username)
    return jsonify(status='OK', message='Bluegroups', bluegroups=groups), 200

"""
@src.route('/service', methods=['GET', 'POST', 'DELETE'])
#@require_api_auth # no need for POST.
def service():
    ''' Service Registration: UCD, etc. to use this service. '''

    if request.method == 'POST': # NOTE: NOT PROTECTED
        req_json = request.get_json(silent=True) or request.form

        servicename = req_json.get('SERVICE_NAME').strip()
        password = req_json.get('PASSWORD').strip()
        desc = req_json.get('SERVICE_DESC', '')

        if not servicename or not password:
            return jsonify(status='ERROR', message='Provide mandatory fields'), 400

        password = base64.b64encode(password) # encode.
        desc = req_json.get('description')

        user = User.query.filter_by(username=servicename).first()
        desc = set_val('bluegroup', servicename, desc)
        if not user:
            user = User(servicename, generate_hash_key(), desc, password)
            db.session.add(user)
            db.session.commit()
        else:
            return jsonify(status='ERROR', message='Service already exists'), 400

        username = servicename
        customer_info = get_info(user, 'customer', username)
        user_info = get_info(user, 'user')
        meta_info = get_info(user, 'metadata')

        user_info['username'] = username
        meta_info['keys'] = {}
        meta_info['customers'] = []

        user_dir = '/'.join([userdata_dir, username]) # username = groupname
        if not os.path.isdir(user_dir): # first time user.
            os.makedirs(user_dir)
            set_info(user, 'customer', customer_info, username) # customer_info.json
            set_info(user, 'user', user_info) # user_info.json
            set_info(user, 'metadata', meta_info) # meta_info.json

        output = { 'servicename': user.username, 'apikey': user.apikey }
        return jsonify(status='OK', message='Account created. Keep apikey safely.', output=output), 200

    # NOTE: PROTECTED BELOW
    if not request.headers.get('X-Api-Id'):
        return jsonify(status='ERROR', message='Unauthorized: provide correct apikey or password'), 401

    service = User.query.filter_by(username=request.headers.get('X-Api-Id')).first()

    if not service:
        return jsonify(status='ERROR', message='Unauthorized: provide correct apikey or password'), 401

    if request.headers.get('X-Api-Password'):
        if request.headers.get('X-Api-Password') != base64.b64decode(service.password):
            return jsonify(status='ERROR', message='Unauthorized: provide correct apikey or password'), 401
    elif request.headers.get('X-Api-Key'):
        if request.headers.get('X-Api-Key') != service.apikey:
            return jsonify(status='ERROR', message='Unauthorized: provide correct apikey or password'), 401
    else:
        return jsonify(status='ERROR', message='Unauthorized: provide correct apikey or password'), 401

    if request.method == 'DELETE': # delete entire service footprints.
        db.session.delete(service)
        db.session.commit()

        sdir = '/'.join([userdata_dir, service.username])
        if os.path.isdir(sdir):
            shutil.rmtree(sdir, ignore_errors=True)

        return jsonify(status='OK', message='Service deleted'), 200

    # GET
    output = { 'servicename': service.username, 'apikey': service.apikey, 'description': service.desc }
    return jsonify(status='OK', message='Service exists', output=output), 200
"""

@src.route('/regenerate', methods=['POST'])
@require_api_auth
@csrf.exempt
def regenerate():
    if request.method == 'POST':
        req_json = request.get_json(silent=True) or request.form

        customername = req_json.get('CUSTOMER_NAME')

        meta_info = get_info(current_user, 'metadata')
        if customername not in meta_info.get('customers', []):
            return jsonify(status='ERROR', message='Customer name does not exist'), 400

        customer_info = get_info(current_user, 'customer', customername)
        if not customer_info:
            return jsonify(status='ERROR', message='Internal error: data structure for customer does not exist'), 400

        cdir = '/'.join([customers_dir, customername])
        if not os.path.isdir(cdir):
            return jsonify(status='ERROR', message='Internal error: directory for customer does not exist'), 400

        vars_path = '/'.join([cdir, "vars"])
        if not os.path.isfile(vars_path):
            return jsonify(status='ERROR', message='Internal error: vars file for customer does not exist'), 400

        # Run make.sh to generate sasg_vyos_configure.sh
        sasglib = SASGLIB()
        output = sasglib.scripts_generate(cdir)

        if output.get('status') == 'OK':
            # update version number.
            customer_info['script_version'] = version
            customer_info['script_gen_date'] = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())
            set_info(current_user, 'customer', customer_info, customername)
            return jsonify(status='OK', message='VyOS and Tools Script regeneration is done. Note that you need to run vyos script to regerate SASG script.'), 200
        else:
            return jsonify(status=output.get('status', 'ERROR'), message=output.get('message')), 400

    message = 'Only POST is supported'
    return jsonify(status='OK', message=message), 400

@src.route('/vyos', methods=['GET', 'POST'])
@require_api_auth
@csrf.exempt
def vyos():
    if request.method == 'POST': # configure
        req_json = request.get_json(silent=True) or request.form

        customername = req_json.get('CUSTOMER_NAME')
        action = req_json.get('ACTION') # configure, etc.

        meta_info = get_info(current_user, 'metadata')
        if customername not in meta_info.get('customers', []):
            return jsonify(status='ERROR', message='Customer name does not exist'), 400

        customer_info = get_info(current_user, 'customer', customername)

        vinfo = customer_info.get('vyos')

        if not vinfo:
            return jsonify(status='ERROR', message='Internal error: data structure for vyos does not exist'), 400

        debug_init(customer_info)
        debug_message(customer_info, 'Process: Configure VYOS')
        debug_message(customer_info, 'Remote user name: %s' % customer_info.get('vyos_auto_username'))
        debug_message(customer_info, 'Remote user key: %s' % customer_info.get('vyos_auto_passkey'))

        if action == 'configure':
            sasglib = SASGLIB()
            output = sasglib.vyos_configure(
                get_val('bluegroup', current_user.desc),
                customername,
                customer_info.get('vyos_auto_username'),
                customer_info.get('vyos_auto_passkey'),
                customer_info.get('vars',{}).get('PRIVATE_VYOS_IP'),
                customer_info,
                customer_info.get('vars',{}).get('SASG_VIP1')
                )

            if os.path.isfile('/'.join([data_root_dir, vinfo.get('log_file_url','')])):
                vinfo['log_uploaded'] = 1

            vinfo['executed'] = 1
            if output['status'] == "OK":
                vinfo['configured'] = 1
                vinfo['configured_timestamp'] = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())
                if customer_info.get('vars',{}).get('SASG_VIP1'):
                    vinfo['sasg_created'] = 1
            else:
                set_info(current_user, 'customer', customer_info, customername)
                log_action(current_user.username, customername, 'Configure SASFW', False)
                return jsonify(status=output.get('status','ERROR'), message=output.get('message', 'VyOS configuration failed. check the log.')), 400

            set_info(current_user, 'customer', customer_info, customername)

            log_action(current_user.username, customername, 'Configure SASFW')
            return jsonify(status=output.get('status','OK'), message=output.get('message', 'VyOS is configured.')), 200
        else:
            return jsonify(status='ERROR', message='Action is not supported'), 400

    # TODO: needs to be done.
    message = 'VyOS rules dump is not ready.'
    output = 'Retrieve VyOS rule information from device directly' # text formats (from sasglib)
    return jsonify(status='OK', message=message, output=output), 200

@src.route('/tools', methods=['GET', 'POST'])
@require_api_auth
@csrf.exempt
def tools():
    if request.method == 'POST': # configure
        req_json = request.get_json(silent=True) or request.form

        customername = req_json.get('CUSTOMER_NAME')
        action = req_json.get('ACTION') # configure, etc.

        meta_info = get_info(current_user, 'metadata')
        if customername not in meta_info.get('customers', []):
            return jsonify(status='ERROR', message='Customer name does not exist'), 400

        customer_info = get_info(current_user, 'customer', customername)
        if not customer_info:
            return jsonify(status='ERROR', message='Internal error: data structure for customer does not exist'), 400

        debug_init(customer_info)
        debug_message(customer_info, 'Process: Configure VYOS')
        debug_message(customer_info, 'Remote user name: %s' % customer_info.get('vyos_auto_username'))
        debug_message(customer_info, 'Remote user key: %s' % customer_info.get('vyos_auto_passkey'))

        if action == 'configure':
            sasglib = SASGLIB()

            # how to handle multiple tools servers 1) based on the IP; 2) just name; (I need to figure out tools servers when they are registered for the first time)
            # create tools references when accepting.. then could be referenced here.

            failed = []
            tools = customer_info.get('tools', {})
            debug_message(customer_info, 'List of tools: %s' % tools)

            for tool in tools:
                tinfo = tools.get(tool, {})
                debug_message(customer_info, 'Processing tool: %s' % tinfo)
                if not tools.get(tool, {}).get('tool_name'):
                   tools[tool]['tool_name'] = tool
                if not tools.get(tool, {}).get('tool_ip'):
                   tool_address = customer_info.get('vars',{}).get(tool)
                   tools[tool]['tool_ip'] = tool_address

                tool_name = tools.get(tool, {}).get('tool_name')
                tool_ip = tools.get(tool, {}).get('tool_ip')
                if tool_ip is None:
                   continue
                if not tool_ip in customer_info.get('vars',{}).get(tool_name):
                   continue

                print('## configuring tool: ', tool_name, tool_ip)
                output = sasglib.tools_configure(
                    get_val('bluegroup', current_user.desc),
                    customername,
                    customer_info.get('tools_auto_username'),
                    customer_info.get('tools_auto_passkey'),
                    tool_ip,
                    customer_info,
                    tool_name)

                print('Output: ', output)
                debug_message(customer_info, output)

                tool_log_name = '_'.join([tool_ip, tool_name]) + '.log'
                tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_log_name]).replace('//','/')

                tinfo['log_file_url'] = tool_log_file_url

                #tools = { 'BPM_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 }, 'CHEF_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 }, 'EE_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 }, 'ASB_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 } }

                #print('/'.join([data_root_dir, tinfo.get('log_file_url','')]), os.path.isfile('/'.join([data_root_dir, tinfo.get('log_file_url','')])))

                if os.path.isfile('/'.join([data_root_dir, tinfo.get('log_file_url','')])):
                    tinfo['log_uploaded'] = 1

                tinfo['executed'] = 1
                if output['status'] == "OK":
                    tinfo['configured'] = 1
                    tinfo['configured_timestamp'] = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())
                else:
                    try:
                        failed.append(tool_ip + ': ' + str(output.get('message'))) # fail late
                        #UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 1090: ordinal not in range(128)
                    except:
                        failed.append(tool_ip + ': scripts failed.. check the log file') # fail late

                    #set_info(current_user.username, 'customer', customer_info)
                    #return jsonify(status=output.get('status','ERROR'), message=output.get('message', 'Tools server (%s) configuration failed. check the log.')), 400

                set_info(current_user, 'customer', customer_info, customername)

            if bool(failed):
                log_action(current_user.username, customername, 'Configure tools', False)
                return jsonify(status=output.get('status','ERROR'), message=('%s tools servers (%s) configuration failed. check the log.' % (str(len(failed)), str(';'.join(failed)))) ), 400

            log_action(current_user.username, customername, 'Configure tools')
            return jsonify(status=output.get('status','OK'), message='Tools are configured.'), 200
        else:
            return jsonify(status='ERROR', message='Action is not supported'), 400

    # TODO: show something about tools servers.. maybe list
    message = 'Tools servers info dump is not ready.'
    output = 'Retrieve tools server information from vars'
    return jsonify(status='OK', message=message, output=output), 200

def get_all_customers(bluegroup):
    customers_info = {}
    meta_info = get_info(current_user, 'metadata')

    # lazy deletion when deleted from other group
    delete_list = []

    for customername in meta_info.get('customers', []):
        customer_info = get_info(current_user, 'customer', customername)
        if not customer_info:
            delete_list.append(customername)
            continue

        customers_info.update({ customername: customer_info })

    if len(delete_list) > 0:
        for customername in delete_list:
            meta_info['customers'].remove(customername)
        set_info(current_user, 'metadata', meta_info)

    return customers_info

@src.route('/customer', methods=['GET', 'POST', 'DELETE'])
@require_api_auth
@csrf.exempt
def customer():
    # Handle create/modify.
    if request.method == 'POST':
        req_json = request.get_json(silent=True) or request.form

        customername = req_json.get('CUSTOMER_NAME','').strip().replace(' ', '') # NOTE: used in html, thus remove space.
        customerid = req_json.get('CUSTOMER_ID','').strip()
        vyos_auto_username = req_json.get('VYOS_AUTO_USERNAME','').strip()
        vyos_auto_passkey = req_json.get('VYOS_AUTO_PASSKEY')
        tools_auto_username = req_json.get('TOOLS_AUTO_USERNAME','').strip()
        tools_auto_passkey = req_json.get('TOOLS_AUTO_PASSKEY')
        vars_json = req_json.get('VARS')
        bluegroups = req_json.get('BLUEGROUPS')

        if not customername or not vyos_auto_username or not vyos_auto_passkey \
                or not tools_auto_username or not tools_auto_passkey or not bluegroups:
            return jsonify(status='ERROR', message='All fields need to be sent.'), 400

        # Access Control to Group
        all_bluegroups = get_val('all_bluegroups', current_user.desc).split(';')
        for bg in all_bluegroups:
            temp_user = User(current_user.username, None, desc='bluegroup='+bg)

            # if directory not exist, create bluegroup directory.
            bluegroup_dir = '/'.join([userdata_dir, bg])
            if not os.path.isdir(bluegroup_dir): # first time user.
                os.makedirs(bluegroup_dir)
                meta_info = get_info(temp_user, 'metadata')
                meta_info['keys'] = {}
                meta_info['customers'] = []
                set_info(temp_user, 'metadata', meta_info)

            meta_info = get_info(temp_user, 'metadata')
            if not meta_info: # initialize {}
                meta_info['keys'] = {}
                meta_info['customers'] = []

            if not meta_info.get('keys'):
                meta_info['keys'] = {}

            if not meta_info.get('customers'):
                meta_info['customers'] = []

            if bg in bluegroups:
                if customername not in meta_info.get('customers',[]):
                    meta_info['customers'].append(customername)
            else:
                if customername in meta_info.get('customers',[]):
                    meta_info['customers'].remove(customername)
            set_info(temp_user, 'metadata', meta_info)


        # MODIFY EXISTING CUSTOMER-----------
        cdir = '/'.join([customers_dir, customername])
        if os.path.isdir(cdir): # if already exists, update basic info.
            cinfo = get_info(current_user, 'customer', customername)
            cinfo['vyos_auto_username'] = vyos_auto_username
            cinfo['vyos_auto_passkey'] = vyos_auto_passkey
            cinfo['tools_auto_username'] = tools_auto_username
            cinfo['tools_auto_passkey'] = tools_auto_passkey

            if not vars_json.get('PRIVATE_VYOS_IP'):
                log_action(current_user.username, customername, 'Modify', False)
                return jsonify(status='ERROR', message='VyOS IP address is not provided.'), 400

            sasglib = SASGLIB()
            sasglib.vars_parsing(vars_json, cdir) # also save vars file

            vars_path = '/'.join([cdir, "vars"])

            vars_json = vars_to_json(vars_path)
            org_vars_json = cinfo.get('vars',{})

            vars_file = '/'.join([customers_dir, customername, 'vars'])
            vars_str = vars_parsing(vars_file)
            cinfo['vars_str'] = vars_str
            cinfo['script_gen_date'] = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())

            # new tools
            tools = cinfo.get('tools',{})
            tools_exist = False
            for tool in default_tools_servers:
                if vars_json.get(tool):
                    tools_exist = True
                    if org_vars_json.get(tool):
                       if not vars_json.get(tool) == org_vars_json.get(tool):
                           print("##Changing info about ", tool)
                           if type(vars_json.get(tool)) is list:
                              if tool in tools: del tools[tool]
                              for tool_address in vars_json.get(tool):
                                  tool_alias = '_'.join([tool, str(vars_json.get(tool).index(tool_address))])
                                  if not tools.get(tool_alias, {}) or tools.get(tool_alias, {}).get('tool_ip') != tool_address:
                                      tool_alias_for_url = '_'.join([tool_address, tool])
                                      tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                                      tools[tool_alias] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address }
                           else:
                               tool_address = vars_json.get(tool)
                               tool_alias_for_url = '_'.join([tool_address, tool])
                               tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                               tools[tool] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address}
                    else:
                       print("##Adding info about ", tool)
                       if type(vars_json.get(tool)) is list:
                           for tool_address in vars_json.get(tool):
                               tool_alias = '_'.join([tool, str(vars_json.get(tool).index(address))])
                               tool_alias_for_url = '_'.join([tool_address, tool])
                               tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                               tools[tool_alias] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address }
                       else:
                           tool_address = vars_json.get(tool)
                           tool_alias_for_url = '_'.join([tool_address, tool])
                           tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                           tools[tool] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address}
                else:
                    if org_vars_json.get(tool):
                        print("Deleting info about ", tool)
                        if type(org_vars_json.get(tool)) is list:
                            for tool_address in org_vars_json.get(tool):
                                tool_alias = '_'.join([tool, str(org_vars_json.get(tool).index(tool_address))])
                                if tool_alias in tools: del tools[tool_alias]
                        else:
                            if tool in tools: del tools[tool]
            if not tools_exist:
                del cinfo['tools_configure_file_url']
            cinfo['vars'] = vars_json
            cinfo['tools'] = tools

            set_info(current_user, 'customer', cinfo, customername)

            sasg_ansible.create_ansible_inventory(cinfo['vars'], customername)

            log_action(current_user.username, customername, 'Modify')
            return jsonify(status='OK', message='Customer modified'), 200

        # CREATE NEW CUSTOMER-----------
        cdir = '/'.join([customers_dir, customername])
        if not os.path.isdir(cdir):
            os.makedirs(cdir)

        if not vars_json.get('PRIVATE_VYOS_IP'):
            return jsonify(status='ERROR', message='VyOS IP address is not provided.'), 400

        sasglib = SASGLIB()
        sasglib.vars_parsing(vars_json, cdir) # also save vars file

        # Run make.sh to generate sasg_vyos_configure.sh
        output = sasglib.scripts_generate(cdir)

        # only for display to user
        vars_file = '/'.join([customers_dir, customername, 'vars'])
        vars_str = vars_parsing(vars_file)

        vyos_configure_file_url = '/'.join(['/userdata/customers', customername, 'sasg_vyos_configure.sh']).replace('//','/')
        vyos_log_file_url = '/'.join(['/userdata/customers', customername, 'sasg_vyos_configure.log']).replace('//','/')
        tools_configure_file_url = '/'.join(['/userdata/customers', customername, 'sasg_tools_configure.sh']).replace('//','/')
        sasg_install_file_url = '/'.join(['/userdata/customers', customername, 'sasg_install.sh']).replace('//','/')
        deployment_package_file_url = '/'.join(['/userdata/customers', customername, application.config['DEPLOYMENT_PACKAGE_FILE']]).replace('//','/')

        vyos = { 'configure_file_url': vyos_configure_file_url, 'log_file_url': vyos_log_file_url, 'executed': 0, 'log_uploaded': 0, 'configured': 0, 'configured_timestamp': 0, 'sasg_created': 0, 'sasg_install_file_url': sasg_install_file_url }
        package = { 'deployment_package_file_url': deployment_package_file_url, 'generated': 0, 'generated_timestamp': 0, 'sasgc_version': 'None', 'main_image_tag': 'None', 'checker_version': 'None'}
        tools = {}
        for tool in default_tools_servers:
            if vars_json.get(tool):
                if type(vars_json.get(tool)) is list:
                   for tool_address in vars_json.get(tool):
                       tool_alias = '_'.join([tool, str(vars_json.get(tool).index(address))])
                       tool_alias_for_url = '_'.join([tool_address, tool])
                       tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                       tools[tool_alias] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address }
                else:
                       tool_address = vars_json.get(tool)
                       tool_alias_for_url = '_'.join([tool_address, tool])
                       tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                       tools[tool] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address}

            #tools = { 'BPM_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 }, 'CHEF_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 }, 'EE_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 }, 'ASB_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 } }

        customer_info = {
            'created': '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now()),
            'script_gen_date': '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now()),
            'script_version': version,
            'customername': customername,
            'customerid': customerid,
            'vyos_auto_username': vyos_auto_username,
            'vyos_auto_passkey': vyos_auto_passkey,
            'tools_auto_username': tools_auto_username,
            'tools_auto_passkey': tools_auto_passkey,
            'vars_str': vars_str,
            'vars': vars_json,
            'vyos': vyos,
            'package': package,
            'tools': tools,
            'tools_configure_file_url': tools_configure_file_url
        }

        set_info(current_user, 'customer', customer_info, customername)

        log_action(current_user.username, customername, 'Create')
        return jsonify(status='OK', message='VyOS install script is generated.'), 200

    elif request.method == 'DELETE':
        customername = request.args.get('CUSTOMER_NAME','').strip()
        print('## Deleting entry for the customer %s' % customername)
        meta_info = get_info(current_user, 'metadata')
        if customername in meta_info.get('customers'):
            meta_info['customers'].remove(customername)
            set_info(current_user, 'metadata', meta_info)

        customer_info = get_info(current_user, 'customer', customername)
        if customer_info:
            cdir = '/'.join([customers_dir, customername])
            if os.path.isdir(cdir):
                shutil.rmtree(cdir, ignore_errors=True)
        else:
            return jsonify(status='ERROR', message='Customer does not exist.'), 400

        log_action(current_user.username, customername, 'Delete')
        return jsonify(status='OK', message='Customer is deleted.'), 200

    # GET: customer's info (all or one)
    if request.args.get('customername'):
        meta_info = get_info(current_user, 'metadata')
        if request.args.get('customername') not in meta_info.get('customers', []):
            return jsonify(status='ERROR', message='Customer name does not exist'), 400
        customer_info = get_info(current_user, 'customer', request.args.get('customername'))
    else:
        customer_info = get_all_customers(get_val('bluegroup', current_user.desc))

    return jsonify(status='OK', message='Customer info.', output=customer_info), 200

@src.route('/user', methods=['GET', 'POST', 'DELETE'])
@require_api_auth
def user():
    if request.method == 'POST': # TODO: testing needed
        req_json = request.get_json(silent=True) or request.form
        ''' user json -> swagger
            {
                "KEY_NAME": "auto",
                "KEY_CONTENT": "key contents"
            }
        '''
        keyname = req_json.get('KEY_NAME','').strip()
        key_content = req_json.get('KEY_CONTENT','').strip()
        bluegroups = request.get('BLUEGROUPS',[])
        if not keyname or not key_content:
            return jsonify(status='ERROR', message='All fields need to be sent.'), 400

        for bg in bluegroups:
            temp_user = User(current_user.username, None, desc='bluegroup='+bg)

            meta_info = get_info(temp_user, 'metadata')
            if not meta_info.get('keys'):
                meta_info['keys'] = {}

            for key in meta_info.get('keys',{}).keys():
                if key == keyname:
                    return jsonify(status='ERROR', message='Key already exists'), 400

            kdir = '/'.join([userdata_dir, get_val('bluegroup', temp_user.desc), 'keys'])
            if not os.path.isdir(kdir):
                os.makedirs(kdir)

            keypath = '/'.join([kdir, keyname])
            keyurl = '/'.join(['/userdata', get_val('bluegroup', temp_user.desc), 'keys', keyname]).replace('//','/')
            try:
                open(keypath, 'w+').write(key_content)
                os.chmod(keypath, 0o400)
            except Exception as e:
                return jsonify(status='ERROR', message='Internal Error - Failed to save key file.'), 400

            meta_info['keys'][keyname] = { 'url': keyurl, 'path': keypath, 'created': '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now()) }

            set_info(temp_user, 'metadata', meta_info)

        return jsonify(status='OK', message='Key file is saved.'), 200
    elif request.method == 'DELETE':
        keyname = request.args.get('KEY_NAME','').strip()
        meta_info = get_info(current_user, 'metadata')
        if keyname in meta_info.get('keys',{}).keys():
            keypath = meta_info.get('keys',{}).get(keyname,{}).get('path')

            if os.path.isfile(keypath):
                os.remove(keypath)

            del meta_info['keys'][keyname]

            set_info(current_user, 'metadata', meta_info)
        else:
            return jsonify(status='ERROR', message='User does not exist.'), 400

        return jsonify(status='OK', message='User is deleted.'), 200

    # GET: user's info
    user_info = get_info(current_user, 'user')
    return jsonify(status='OK', message='user info.', output=user_info), 200

"""
@src.route('/gsniip', methods=['GET', 'PUT', 'POST', 'DELETE'])
@require_api_auth
def gsniip():
    ''' This manages the GSNI subnet and ip addresses '''
    if request.method == 'POST':
        req_json = request.get_json(silent=True) or request.form
        ''' gsniip json -> swagger
            {
                "subnet": "x.x.x.x/x"
            }
        '''
        subnet = req_json.get('SUBNET','').strip()

        if not subnet:
            return jsonify(status='ERROR', message='Provide a subnet info. x.x.x.x/x.'), 400

        net = ipaddress.ip_network(subnet) # unicode(subnet, 'utf-8')
        mgsnip = []
        for gip in net: # add each.
            used = (gip == net.network_address or gip == net.broadcast_address)
            desc = ''
            if gip == net.network_address: desc = 'network address'
            elif gip == net.broadcast_address: desc = 'broadcast address'

            mgsnip.append(Gsniip(str(net), str(gip), used, desc))

        try:
            db.session.add_all(mgsnip)
            db.session.commit()
        except Exception as e:
            return jsonify(status='ERROR', message='Failed to store subnet info: %s' % str(e)), 400

        return jsonify(status='OK', message='Subnet is updated.'), 200
    if request.method == 'PUT': # UPDATE.
        req_json = request.get_json(silent=True) or request.form
        ''' gsniip json -> swagger
            {
                "gsniip": "x.x.x.x",
                "used": false
            }
        '''
        gip = req_json.get('GSNIIP','').strip()
        used = req_json.get('USED') # true or false

        if not gip or used == None:
            return jsonify(status='ERROR', message='Provide correct info.'), 400

        gsni_obj = Gsniip.query.filter_by(gsni_ip=str(gip)).first()

        if not gsni_obj:
            return jsonify(status='ERROR', message='Failed to find the address'), 400

        gsni_obj.used = used

        try:
            db.session.commit()
        except Exception as e:
            return jsonify(status='ERROR', message='Failed to update info: %s' % str(e)), 400

        return jsonify(status='OK', message='IP is updated.'), 200
    if request.method == 'DELETE':
        subnet = request.args.get('SUBNET','').strip()

        if not subnet:
            return jsonify(status='ERROR', message='Provide a subnet info. x.x.x.x/x.'), 400

        gobjs = Gsniip.query.filter_by(subnet=str(subnet))
        sasglib = SASGLIB()
        for gobj in gobjs: # Best effort delete.
            if gobj.used:
                nobj = Natip.query.filter_by(gsni_ip=gobj.gsni_ip).first()
                if nobj:
                    status, output = sasglib.vyatta_delete_nat() # TODO: arguments
                    if status == "FAILED":
                        logging.error('Failed to delete the NAT IP from Device. *** Find the undeleted entires and delete them manually from DB *** ' + str(nobj.to_dict()))

                    try:
                        db.session.delete(nobj)
                    except Exception as e:
                        logging.error('Failed to delete the NAT IP. *** Find the undeleted entires and delete them manually from DB *** ' + str(nobj.to_dict()))

            try:
                db.session.delete(gobj)
            except Exception as e:
                logging.error('Failed to delete the GSNI IP. *** Find the undeleted entires and delete them manually from DB *** ' + str(gobj.to_dict()))

        try:
            db.session.commit()
        except Exception as e:
            return jsonify(status='ERROR', message='Failed to delete info: %s' % str(e)), 400

        return jsonify(status='OK', message='Addresses are deleted.'), 200

    # NOTE: LATER USE FOR SQL.
    # print(db.session.dirty)
    # filter_by(..).count()
    #session.query(User).filter(User.name.in_(['Edwardo', 'fakeuser'])).all()

    subnet = request.args.get('SUBNET','').strip()
    ip = request.args.get('IP','').strip()

    gobjs = []
    if subnet and ip:
        items = Gsniip.query.filter_by(subnet=str(subnet)).filter_by(gsni_ip=str(ip))
    elif subnet and not ip:
        items = Gsniip.query.filter_by(subnet=str(subnet))
    elif not subnet and ip:
        items = Gsniip.query.filter_by(gsni_ip=str(ip))
    else:
        items = Gsniip.query.all()

    output = []
    for item in items:
        output.append(item.to_dict())

    return jsonify(status='OK', message='gsniip info.', output=output), 200
"""

@src.route('/command', methods=['GET', 'POST', 'DELETE'])
@require_api_auth
def command():
    '''
        Collect commands that can be applied to any server
    '''
    if request.method == 'POST':
        req_json = request.get_json(silent=True) or request.form
        customer_name = req_json.get('CUSTOMER_NAME','').strip()
        device_type = req_json.get('DEVICE_TYPE','').strip()
        command_key = req_json.get('COMMAND_KEY','').strip()
        command_content = req_json.get('COMMAND_CONTENT','').strip()

        # TODO: remove <br>, replace parameter $KKK, run in the remote server(s).
        #print(customer_name, device_type, command_key, command_content)

        meta_info = get_info(current_user, 'metadata')
        if customer_name not in meta_info.get('customers', []):
            return jsonify(status='ERROR', message='Customer name does not exist'), 400

        customer_info = get_info(current_user, 'customer', customer_name)
        if not customer_info:
            return jsonify(status='ERROR', message='Internal error: data structure for customer does not exist'), 400

        cobj = Command.query.filter_by(key=command_key).first() # just to check.
        if not cobj:
            return jsonify(status='ERROR', message='Internal error: data structure for command does not exist'), 400

        vars_info = customer_info.get('vars',{})

        content = command_content.split('\n')
        commands = []
        for cmd in content: # TODO: more errors will possible be generated. watch out.
            command = []
            for word in cmd.split(' '):
                key = re.sub('[!@#%^&*()"\'<>?{}|\\;:.,+]', '', word) # only allow $, -, _
                if key.startswith('$'): # parameter
                    #print(word, key, vars_info.get(key[1:]))
                    if vars_info.get(key[1:]):
                        command.append(word.replace(key, vars_info.get(key[1:])))
                    else:
                        return jsonify(status='ERROR', message='Command parameter is wrong. Please check the spelling.'), 400
                else:
                    command.append(word)
            commands.append(' '.join(command))

        sasglib = SASGLIB()
        failed = []
        if device_type == 'vyos':
            output = sasglib.run_command(customer_info.get('vyos_auto_username'), customer_info.get('vyos_auto_passkey'), customer_info.get('vars',{}).get('PRIVATE_VYOS_IP'), commands)
        elif device_type == 'tools':
            failed = []
            tools = customer_info.get('tools', {})
            for tool in tools:
                tinfo = tools[tool]
                if not tinfo.get('configured'): continue

                tool_ip = customer_info.get('vars',{}).get(tool)
                output = sasglib.run_command(customer_info.get('tools_auto_username'), customer_info.get('tools_auto_passkey'), tool_ip, commands)
                if output.get('status') == 'ERROR':
                    try:
                        failed.append(tool_ip + ': ' + str(output.get('message'))) # fail late
                        #UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 1090: ordinal not in range(128)
                    except:
                        failed.append(tool_ip + ': command execution failed') # fail late

            if bool(failed):
                return jsonify(status=output.get('status','ERROR'), message=('%s tools servers (%s) execution failed.' % (str(len(failed)), str(';'.join(failed)))) ), 400

        return jsonify(status='OK', message='command ran successfully.', output=output), 200
    if request.method == 'DELETE':
        name = request.args.get('COMMAND_NAME','').strip()

        cobj = Command.query.filter_by(name=name).first()

        try:
            db.session.delete(cobj)
            db.session.commit()
        except Exception as e:
            return jsonify(status='ERROR', message='Failed to delete info: %s' % str(e)), 400

        return jsonify(status='OK', message='Command is deleted.'), 200

    output = Command.query.all()
    return jsonify(status='OK', message='command info.', output=output), 200


"""
@src.route('/natip', methods=['GET', 'POST', 'DELETE'])
@require_api_auth
def natip():
    '''
        The list has been managed manually.
        from https://w3-connections.ibm.com/activities/service/html/mainpage#activitypage,5232b6e8-6b6b-4c65-8e3a-d0ea17ee59d3
        Attributes: GSNI IP     SL Private IP   Hostname    SAS Environment     Customer Name   Service Request
    '''

    # be able to manage 158.x and 146.x IP addresses (GSNI IPs)
    if request.method == 'POST':
        req_json = request.get_json(silent=True) or request.form
        ''' This puts one NAT IP address each time.
            { 'sl_private_ip': '', 'hostname': '', 'sas_environment': '', 'customer_name': '', 'service_request': '' }
        '''

        sl_private_ip = req_json.get('SL_PRIVATE_IP','').strip()
        hostname = req_json.get('HOSTNAME','').strip()
        sas_environment = req_json.get('SAS_ENVIRONMENT','').strip()
        customer_name = req_json.get('CUSTOMER_NAME','').strip()
        service_request = req_json.get('SERVICE_REQUEST','').strip()
        actions = req_json.get('ACTIONS','').strip() # action,action

        if not actions:
            return jsonify(status='ERROR', message='Actions field is mandatory'), 400

        actions = actions.split(',')

        if 'reserve' in actions:
            if not sl_private_ip or not hostname or not sas_environment or not customer_name:
                return jsonify(status='ERROR', message='All fields need to be sent.'), 400

            gobj = Gsniip.query.filter_by(used=False).first() # get empty IP
            if not gobj:
                return jsonify(status='ERROR', message=('Fail to get a new GSNI IP. Check your GSNI IP list.')), 400

            nobj = Natip(gobj.subnet, gobj.gsni_ip, sl_private_ip, hostname, sas_environment, customer_name, service_request, 0, 'RESERVED')
            if not nobj:
                return jsonify(status='ERROR', message=('Fail to store natip.')), 400

            # this should not fail
            try:
                gobj.used = True
                gobj.desc = sl_private_ip

                db.session.add(nobj)
                db.session.commit()
            except Exception as e:
                return jsonify(status='ERROR', message='Failed to update info: %s' % str(e)), 400

        if 'configure' in actions: # should already have entry.

            if not sl_private_ip or not hostname:
                return jsonify(status='ERROR', message='All fields need to be sent.'), 400

            nobj = Natip.query.filter_by(hostname=hostname).filter_by(sl_private_ip=sl_private_ip).first()
            if not nobj:
                return jsonify(status='ERROR', message=('Fail to query natip.')), 400

            # TODO: testing is not done, and the parameters need to be checked as well.
            sasglib = SASGLIB()
            #out_json = sasglib.vyatta_set_nat(nobj.hostname, nobj.gsni_ip, nobj.sl_private_ip, 'ip', 'bond1')
            '''
            output = out_json['output']
            if out_json.get('status') == "ERROR" or not output.get('vyatta_rule_num'):
                return jsonify(status='ERROR', message=('Vyatta configuration failed: %s' % output['message'])), 400
            '''
            vyatta_rule_num = 1 # TODO: delete this after.

            try:
                nobj.status = 'CONFIGURED'
                nobj.vyatta_rule_num = vyatta_rule_num
                db.session.commit()
            except Exception as e:
                return jsonify(status='ERROR', message='Failed to update NAT IP info: %s' % str(e)), 400

        return jsonify(status='OK', message='Nat IP is added.'), 200

    elif request.method == 'DELETE':
        ''' This delete one NAT IP address each time.
            { 'hostname': '' }
        '''
        hostname = request.args.get('HOSTNAME','').strip()
        sl_private_ip = request.args.get('SL_PRIVATE_IP','').strip()

        if not hostname and not sl_private_ip: # either.
            return jsonify(status='ERROR', message='Either hostname or SL Private IP should be provided.'), 400

        nobj = None
        if hostname and sl_private_ip:
            nobj = Natip.query.filter_by(hostname=hostname).filter_by(sl_private_ip=sl_private_ip).first()
        elif hostname:
            nobj = Natip.query.filter_by(hostname=hostname).first()
        elif sl_private_ip:
            nobj = Natip.query.filter_by(sl_private_ip=sl_private_ip).first()

        if not nobj:
            return jsonify(status='ERROR', message=('Fail to retrieve natip.')), 400

        sasglib = SASGLIB()
        status, output = sasglib.vyatta_delete_nat() # TODO: arguments
        if status == "FAILED":
            return jsonify(status='ERROR', message=('Vyatta access failed: %s' % output)), 400

        # release IP address.
        gobj = Gsniip.query.filter_by(gsni_ip=str(nobj.gsni_ip)).first()
        gobj.used = False
        gobj.desc = ''

        try:
            db.session.delete(nobj)
            db.session.commit()
        except Exception as e:
            return jsonify(status='ERROR', message='Failed to update info: %s' % str(e)), 400

        return jsonify(status='OK', message='Nat IP is deleted.'), 200

    # GET
    items = Natip.query.all()
    output = []
    for item in items:
        output.append(item.to_dict())

    return jsonify(status='OK', message='natip info.', output=output), 200
"""

@src.route('/net_test', methods=['GET', 'POST'])
@require_api_auth
@csrf.exempt
def net_test():
    '''
        This test network connectivity between CDS Vyos to servers on-prem.
    '''

    if request.method == 'POST':
        pass

    customername = request.args.get('CUSTOMER_NAME')

    meta_info = get_info(current_user, 'metadata')
    if customername not in meta_info.get('customers', []):
        return jsonify(status='ERROR', message='Customer name does not exist'), 400

    customer_info = get_info(current_user, 'customer', customername)
    if not customer_info:
        return jsonify(status='ERROR', message='Internal error: data structure for customer does not exist'), 400

    # get vars file.. and DNS_IP:53, LDAP_IP:636, so on..

    target_servers = []
    for dns in customer_info.get('vars',{}).get('DNS_IP', []):
        target_servers.append(dns)
        target_servers.append(dns + ':53')

    for ldap in customer_info.get('vars',{}).get('LDAP_IP', []):
        target_servers.append(ldap)
        target_servers.append(ldap + ':389')
        target_servers.append(ldap + ':636')

    if len(target_servers) == 0:
        return jsonify(status='ERROR', message='NO DNS or LDAP servers are provided in vars file.'), 400

    sasglib = SASGLIB()

    # NOTE: should be 2222 after configuration, but for testing 22
    #output = sasglib.net_test(current_user.username, target_servers, customer_info.get('vyos_auto_username'), customer_info.get('vyos_auto_passkey'), customer_info.get('vars',{}).get('PRIVATE_VYOS_IP'))

    anchor_ip = None
    for tool in default_tools_servers:
        tool_ip = customer_info.get('vars',{}).get(tool)
        print('tool_ip', tool_ip)
        if tool_ip:
            anchor_ip = tool_ip
            break

    if not anchor_ip:
        return jsonify(status='ERROR', message='No anchor IP was found to test on the network.'), 400

    output = sasglib.net_test(get_val('bluegroup', current_user.desc), target_servers, customer_info.get('tools_auto_username'), customer_info.get('tools_auto_passkey'), anchor_ip, customer_info)
    if output['status'] == 'ERROR':
        return jsonify(**output), 400

    return jsonify(**output), 200

# TODO: Upload a file? for API, only json format.. no file.
'''
@src.route('/upload', methods=['GET', 'POST'])
@require_api_auth
def upload():
    if request.method == 'POST':
        ifile = request.files['file'] # one at a time.
        if ifile and allowed_file(ifile.filename):
            filename = secure_filename(ifile.filename)
            try:
                #ifile.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                #return redirect(url_for('uploaded_file', filename=filename))

                #update_servers_from_file('ADD', filename)
                #update_file(SERVER_DATA_FILE, SERVERS)

                return output_json('OK', 'Saved')
            except Exception, e:
                return output_json('ERROR', str(e))
        else:
            return output_json('ERROR', 'Provided file type is not supported')
    return jsonify(name='SASGaaS', version='0.1', url='/home'), 200
'''

def get_image_info(request_arg_image):
    for image in application.config['DOCKER_IMAGES']:
        if request_arg_image == image['type']:
            return (
                image['type'],
                os.path.join(application.config['DOCKER_IMAGES_DIR'], image['filename'])
            )
    return None, None

def get_image_params(image_path):
    DOCKER_MANIFEST = 'manifest.json'
    tarfile.open(image_path).extract(DOCKER_MANIFEST)
    with open(DOCKER_MANIFEST) as f:
        tags = json.load(f)[0]['RepoTags']

    for tag in tags:
        name_tag, label_tag = tag.split(':')
        if label_tag == 'latest':
            continue
        for image in application.config['DOCKER_IMAGES']:
            if name_tag == image['nametag']:
                os.remove(DOCKER_MANIFEST)
                return image['type'], label_tag, image['filename']

    os.remove(DOCKER_MANIFEST)
    return None, None, None

@src.route('/get-image', methods=['GET', 'POST'])
def get_images():
    if request.method == 'GET':
        image_type, image_filename = get_image_info(request.args.get('image'))
        if not image_type:
            return output_json('ERROR', 'Unknown image type: ' + str(request.args.get('image')))
        if not os.path.exists(image_filename):
            return output_json('ERROR', 'Image %s was not yet uploaded' % image_type)
        return send_file(os.path.join(
            application.config['DOCKER_IMAGES_DIR'], image_filename
        ))

@src.route('/upload-image', methods=['POST'])
@require_api_auth
@csrf.exempt
def upload_image():
    if request.method == 'POST':
        if 'image' not in request.files:
            return output_json('ERROR', 'No file provided')

        image_file = request.files['image']
        ts = datetime.datetime.now()
        file_name_ts = 'tmp_image.%s-%s-%s_%s%s%s' % (ts.year, ts.month, ts.day, ts.hour, ts.minute, ts.second)
        tmp_file_name = os.path.join(application.config['DOCKER_IMAGES_DIR'], file_name_ts)

        image_file.save(tmp_file_name)
        image_type, image_label, image_filename = get_image_params(tmp_file_name)
        image_filename = os.path.join(application.config['DOCKER_IMAGES_DIR'], image_filename)
        if not image_type:
            return output_json('ERROR', 'Could not identify file - upload cancelled')
        os.rename(tmp_file_name, image_filename)

        return output_json('SUCCESS', '%s image %s successfully uploaded' % (image_type, image_label))

@src.route('/image-version', methods=['GET'])
def images_version():
    if request.method == 'GET':
        image_type, image_filename = get_image_info(request.args.get('image'))
        if not image_type:
            return output_json('ERROR', 'Unknown image type: ' + str(request.args.get('image')))
        if not os.path.exists(image_filename):
            return output_json('ERROR', 'Image %s was not yet uploaded' % image_type)

        image_type, image_label, image_filename = get_image_params(image_filename)
        return image_label

@src.route('/generate-image-package', methods=['GET', 'POST'])
@require_api_auth
@csrf.exempt
def generate_image_package():

    if request.method == 'POST': # configure
        req_json = request.get_json(silent=True) or request.form

        customername = req_json.get('CUSTOMER_NAME')

        meta_info = get_info(current_user, 'metadata')
        if customername not in meta_info.get('customers', []):
            return jsonify(status='ERROR', message='Customer name does not exist'), 400

        customer_info = get_info(current_user, 'customer', customername)
        if not customer_info:
            return jsonify(status='ERROR', message='Internal error: data structure for customer does not exist'), 400

        debug_init(customer_info)
        debug_message(customer_info, 'Process: Generate image package')

        # Existing customers won't have this hence creating record here
        if not 'package' in customer_info.keys():
            deployment_package_file_url = '/'.join(['/userdata/customers', customername, application.config['DEPLOYMENT_PACKAGE_FILE']]).replace('//','/')
            customer_info['package'] = { 'deployment_package_file_url': deployment_package_file_url, 'generated': 0, 'generated_timestamp': 0, 'sasgc_version': 'None', 'main_image_tag': 'None', 'checker_version': 'None'}
            packinfo = customer_info.get('package')

        packinfo = customer_info.get('package')

        sasglib = SASGLIB()

        set_info(current_user, 'customer', customer_info, customername)
        root_customer_dir = os.path.join(application.config.get('CUSTOMERS_DIR'), customername)
        install_script = os.path.join(root_customer_dir, 'sasg_install.sh')
        package = os.path.join(root_customer_dir, application.config['DEPLOYMENT_PACKAGE_FILE'])
        images = []

        if not os.path.isfile(install_script):
            debug_message(customer_info, 'Could not find install script')
            return jsonify(
                status='ERROR',
                message=('No sasg_install.sh created for customer "%s"' % customername)), 400

        try:
            tunnel_type = customer_info.get('vars')['TUNNEL_TYPE']
        except:
            tunnel_type = ''
        debug_message(customer_info, 'Found tunnel type: %s' % tunnel_type)
        if tunnel_type.lower() == 'ipsec':
            main_image_tag = 'sasgc-ipsec'
        else:
            main_image_tag = 'sasgc'

        debug_message(customer_info, 'Main image chosen: %s' % main_image_tag)

        # Checking if images are present
        for docker_image_type in [ main_image_tag, 'checker' ]:
            for docker_image in application.config['DOCKER_IMAGES']:
                if docker_image_type in docker_image['type']:
                    if not os.path.isfile(os.path.join(application.config['DOCKER_IMAGES_DIR'], docker_image['filename'])):
                        return jsonify(
                            status='ERROR',
                            message=('Image %s could not be found' % docker_image['type'])), 400
                    debug_message(customer_info, 'Adding docker image: %s (%s)' % (docker_image['filename'], docker_image['type']))
                    images.append(docker_image)
                    break

        if os.path.isfile(package):
            os.remove(package)

        with tarfile.open(package, 'w:gz') as tarpack:
            # checking if the image is present and getting the info
            for docker_image in images:
                image_full_path = os.path.join(application.config['DOCKER_IMAGES_DIR'], docker_image['filename'])

                image_type, image_tag, image_filename = get_image_params(image_full_path)
                if image_type == main_image_tag:
                    sasgc_version = image_tag
                elif image_type == 'checker':
                    checker_version = image_tag
                else:
                    return jsonify(
                        status='ERROR',
                        message=('Unknown image type: ' + image_type)), 400

                tarpack.add(name=image_full_path, arcname=image_filename)

            tarpack.add(name=install_script, arcname='sasg_install.sh')

        packinfo['generated'] = 1
        packinfo['generated_timestamp'] = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())
        packinfo['sasgc_version'] = sasgc_version
        packinfo['checker_version'] = checker_version
        packinfo['main_image_tag'] = main_image_tag

        set_info(current_user, 'customer', customer_info, customername)

        debug_message(customer_info, 'Images version: sasgc - %s, checker - %s' % (sasgc_version, checker_version))

        return_message = (
            'Deployment package "%s" was generated. %s: %s; checker: %s'
            % (application.config['DEPLOYMENT_PACKAGE_FILE'], main_image_tag, sasgc_version, checker_version)
        )
        flash(return_message)
        return jsonify(
            status='SUCCESS',
            message=return_message), 200

@src.route('/toggle-debug', methods=['GET', 'POST'])
@require_api_auth
@csrf.exempt
def toggle_debug():

    if request.method == 'POST':
        req_json = request.get_json(silent=True) or request.form

        customername = req_json.get('CUSTOMER_NAME')

        meta_info = get_info(current_user, 'metadata')
        if customername not in meta_info.get('customers', []):
            return jsonify(status='ERROR', message='Customer name does not exist'), 400

        customer_info = get_info(current_user, 'customer', customername)
        if not customer_info:
            return jsonify(status='ERROR', message='Internal error: data structure for customer does not exist'), 400

        # Existing customers won't have this hence creating record here
        if not 'debug' in customer_info.keys():
            customer_info['debug'] = { 'status': 'disabled' } # it's the first time we add this so the status is disabled

        customer_info['debug']['status'] = 'enabled' if (customer_info['debug']['status'] == 'disabled') else 'disabled'

        set_info(current_user, 'customer', customer_info, customername)

        return_message = (
            'Debug status for "%s" is set to %s"' % (customername, customer_info['debug']['status'])
        )
        flash(return_message)
        return jsonify(
            status='SUCCESS',
            message=return_message), 200

@src.route('/upload-image-package', methods=['POST'])
@require_api_auth
@csrf.exempt
def upload_image_package():
    req_json = request.get_json(silent=True) or request.form

    customer = Customer(user_name=current_user.username,
                                     bg=get_val('bluegroup', current_user.desc),
                                     customer_name=req_json.get('CUSTOMER_NAME'))
    if not customer.exists:
        return jsonify(status='ERROR',
                       message=('Could not get data for customer "%s"' % customer.name)
                       ), 400

    if not customer.allowed:
        return jsonify(status='ERROR',
                       message=('Access to customer "%s" is restricted' % customer.name)
                       ), 400

    if not customer.get_deployment_image():
        # TODO add deployment image generation
        return jsonify(status='ERROR',
                        message=('Could not get deployment image for "%s"' % customer.name)
                        ), 400

    try:
        extract_image(customer.get_deployment_image(), 'sasgc', customer.dir)
        extract_image(customer.get_deployment_image(), 'checker', customer.dir)
        create_update_package(customer.dir)
    except:
        return jsonify(status='ERROR',
                message=('Could not create update image for "%s"' % customer.name)
                ), 400

    try:
        upload_update_package(customer.dir, customer)
    except Exception as e:
        return jsonify(status='ERROR',
                message=('Could not upload update image for "%s"' % customer.name)
                ), 400

    return_message = ('Update package was uploaded to %s' % customer.sasfw_ip)
    flash(return_message)
    return jsonify(
        status='SUCCESS',
        message=return_message), 200

@src.route('/initiate-update', methods=['POST'])
@require_api_auth
@csrf.exempt
def initiate_update():
    if not request.method == 'POST':
        return jsonify(status='ERROR', message='Only POST requests are supported'), 400

    req_json = request.get_json(silent=True) or request.form

    customer = Customer(user_name=current_user.username,
                                     bg=get_val('bluegroup', current_user.desc),
                                     customer_name=req_json.get('CUSTOMER_NAME'))
    if not customer.exists:
        return jsonify(status='ERROR',
                       message=('Could not get data for customer "%s"' % customer.name)
                       ), 400

    if not customer.allowed:
        return jsonify(status='ERROR',
                       message=('Access to customer "%s" is restricted' % customer.name)
                       ), 400

    try:
        init_update(customer)
    except:
        return jsonify(status='ERROR',
                message=('Could not initiate update procedure for "%s"' % customer.name)
                ), 400

    return_message = ('Update was initiated')
    flash(return_message)
    return jsonify(
        status='SUCCESS',
        message=return_message), 200

@src.route('/stop_update', methods=['POST'])
@require_api_auth
@csrf.exempt
def stop_update():
    if not request.method == 'POST':
        return jsonify(status='ERROR', message='Only POST requests are supported'), 400

    req_json = request.get_json(silent=True) or request.form

    customer = lib.sasglib2.Customer(user_name=current_user.username,
                                     bg=get_val('bluegroup', current_user.desc),
                                     customer_name=req_json.get('CUSTOMER_NAME'))
    if not customer.exists:
        return jsonify(status='ERROR',
                       message=('Could not get data for customer "%s"' % customer.name)
                       ), 400

    if not customer.allowed:
        return jsonify(status='ERROR',
                       message=('Access to customer "%s" is restricted' % customer.name)
                       ), 400

    try:
        lib.sasglib2.stop_update(customer)
    except:
        return jsonify(status='ERROR',
                message=('Could not stop update procedure for "%s"' % customer.name)
                ), 400

    return_message = ('Update was stopped')
    flash(return_message)
    return jsonify(
        status='SUCCESS',
        message=return_message), 200


################################################################################
# GUI
################################################################################
@src.route('/', methods=['GET'])
@src.route('/home', methods=['GET'])
def home():
    bluegroup = None

    if current_user.is_authenticated:
        bluegroup = get_val('bluegroup', current_user.desc)

    return render_template(
        'home.html',
        home_active='active',
        version=version,
        bluegroup=bluegroup)

@src.route('/docz/index.html', defaults = {'filename': 'index.html'}, methods=['GET'])
@src.route('/docz/<path:filename>')
@login_required
def docz(filename):
    path = os.path.join('docz', filename)
    return application.send_static_file(path)

@src.route('/dashboard', methods=['GET'])
@login_required
def dashboard():
    customer_info = get_all_customers(get_val('bluegroup', current_user.desc))

    bluegroup = get_val('bluegroup', current_user.desc)
    bluegroups = get_val('all_bluegroups', current_user.desc).split(';')

    # iterate all bluegroups folders and find whether this customer
    for cname in customer_info.keys():
        assoc_bluegroups = []
        for bg in bluegroups:
            temp_user = User(current_user.username, None, desc='bluegroup='+bg)
            meta_info = get_info(temp_user, 'metadata')
            for in_cname in meta_info.get('customers', []):
                if cname == in_cname:
                    assoc_bluegroups.append(bg)
        customer_info[cname]['assoc_bluegroups'] = json.dumps(assoc_bluegroups)

    bluegroups_s = json.dumps(bluegroups)
    meta_info = get_info(current_user, 'metadata')

    keys = json.dumps(list(meta_info.get('keys',{}).keys()))
    user_info = get_info(current_user, 'user')

    commands = Command.query.all()

    return render_template('dashboard.html', dashboard_active='active', customer_info=customer_info, keys=keys, commands=commands, bluegroup=bluegroup, bluegroups=bluegroups_s)

def get_juniper_info():
    juniper_info = {}

    JUNIPER_DATA_FOLDER = '/sasg_data/userdata/juniper' # TODO move to config
    CLIENT_CONFIG = 'client.yml'

    if not os.path.isdir(JUNIPER_DATA_FOLDER): os.mkdir(JUNIPER_DATA_FOLDER)

    for juniper_client in os.listdir(JUNIPER_DATA_FOLDER):
        juniper_data = {}
        client_config = os.path.join(JUNIPER_DATA_FOLDER, juniper_client, CLIENT_CONFIG)
        if not os.path.isfile(client_config):
            flash('No config for client "%s" (%s)' % (juniper_client, client_config))
            continue
        try:
            with open(client_config, 'r') as f:
                juniper_data = yaml.load(f, Loader=yaml.Loader)
        except:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            err_message = 'Error "%s" (%s) on %s:%s' % (exc_obj, exc_type, exc_tb.tb_lineno, fname)
            flash('Could not load "%s" due to error:\n%s' % (juniper_client, err_message))
            continue
        juniper_info[juniper_client] = juniper_data

    return juniper_info

@src.route('/juniper', methods=['GET'])
@login_required
def juniper():
    bluegroup = get_val('bluegroup', current_user.desc)
    bluegroups = get_val('all_bluegroups', current_user.desc).split(';')

    if not application.config['JUNIPER_BLUEGROUP'] in bluegroups:
        flash('You are not authorized to manage Juniper configs')
        return redirect(url_for('src.home'))

    juniper_info = get_juniper_info()

    return render_template(
        'juniper.html',
        juniper_active='active',
        juniper_info=juniper_info,
        bluegroup=bluegroup,
        bluegroups=json.dumps(bluegroups))

@src.route('/delete-juniper', methods=['POST'])
@login_required
def delete_juniper():
    if request.method == 'POST':

        req_json = request.get_json(silent=True) or request.form
        juniper_id = req_json.get('JUNIPER_ID')
        sasglib = SASGLIB()

        bluegroup = get_val('bluegroup', current_user.desc)
        bluegroups = get_val('all_bluegroups', current_user.desc).split(';')

        if not juniper_bluegroup in bluegroups:
            return jsonify(status='ERROR', message=('Access denied')), 400

        juniper_info = get_juniper_info()

        if not juniper_id in juniper_info.keys():
            return jsonify(status='ERROR', message=('Juniper record "%s" was not found' % juniper_id)), 400

        juniper_dir = os.path.join('/sasg_data/userdata/juniper', juniper_id)

        if not os.path.isdir(juniper_dir):
            return jsonify(status='ERROR', message=('No data to remove found in "%s"' % juniper_dir)), 400

        try:
            shutil.rmtree(juniper_dir)
        except:
            return jsonify(status='ERROR', message=('Could not delete Juniper data in "%s"' % juniper_dir)), 400

        return jsonify(status='OK', message='Juniper record "%s" deleted' % juniper_id), 200

def save_local_config(juniper_general_config_path, new_juniper_config):

    try:
        with open(juniper_general_config_path) as yf:
            juniper_info = yaml.load(yf, Loader=yaml.Loader)

        config_file_path = os.path.join('userdata/juniper', juniper_info['client_id'], '%s_local.yml' % juniper_info['client_id'])

        if os.path.isfile(os.path.join('/sasg_data', config_file_path)):
            os.remove(os.path.join('/sasg_data', config_file_path))
        new_juniper_config.save(os.path.join('/sasg_data', config_file_path))

        juniper_info['local_config'] = {}
        juniper_info['local_config']['config_url'] = config_file_path
        juniper_info['local_config']['ts'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M')

        with open(juniper_general_config_path, 'w') as yf:
            yaml.dump(juniper_info, yf)


    except:
        exc_type, exc_obj, exc_tb = sys.exc_info()
        fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
        err_message = 'Error "%s" (%s) on %s:%s' % (exc_obj, exc_type, exc_tb.tb_lineno, fname)
        print(err_message)
        return False, err_message

    return True, 'Local config for "%s" was successfully saved' % juniper_info['client_id']


@src.route('/juniper-local-config', methods=['POST'])
@login_required
def juniper_local_config():

    if request.method == 'POST':

        bluegroups = get_val('all_bluegroups', current_user.desc).split(';')
        if not application.config['JUNIPER_BLUEGROUP'] in bluegroups:
            flash('You are not authorized to manage Juniper configs')
            return jsonify(status='ERROR', message='Access denied'), 400

        juniper_id = str(clean_user_input(request.form.get('confjuniperid','').strip()))
        juniper_config = request.files.get('juniper_config')

        existing_junipers_info = get_juniper_info()
        if not juniper_id in existing_junipers_info.keys():
            return jsonify(status='ERROR', message='Juniper ID "%s" does not exist' % juniper_id), 400

        juniper_dir = os.path.join('/sasg_data/userdata/juniper', juniper_id)
        client_config = os.path.join(juniper_dir, 'client.yml')

        if not juniper_config:
            return jsonify(status='ERROR', message='New config was not chosen'), 400

        result, message = save_local_config(client_config, juniper_config)
        if not result:
            return jsonify(status='ERROR', message=('Could not save Juniper config due to error: %s' % message)), 400

        flash('Local config for "%s" was successfully uploaded' % juniper_id)
        return jsonify(status='OK', message='Config successfully uploaded'), 200

@src.route('/set_juniper', methods=[ 'POST' ])
@require_api_auth
@csrf.exempt
def set_juniper():
    # Handle create/modify.
    if request.method == 'POST':

        bluegroups = get_val('all_bluegroups', current_user.desc).split(';')
        if not application.config['JUNIPER_BLUEGROUP'] in bluegroups:
            flash('You are not authorized to manage Juniper configs')
            return jsonify(status='ERROR', message='Access denied'), 400

        random_suffix = str(random.getrandbits(64))

        if 'client' not in request.files:
            return output_json('ERROR', 'No client file provided')

        tmp_client_file_name = os.path.join('/tmp', 'tmp_client.%s' % random_suffix)

        request.files['client'].save(tmp_client_file_name)

        with open(tmp_client_file_name) as f:
            new_client = yaml.load(f, Loader=yaml.Loader)

        for mandatory_param in [ 'client_name', 'client_id', 'ip', 'port', 'junusername', 'key' ]:
            if mandatory_param not in new_client.keys():
                return jsonify(status='ERROR', message='Mandatory param "%s" is missing'), 400

        juniper_dir = os.path.join('/sasg_data/userdata/juniper', new_client['client_id'])

        if not os.path.exists(juniper_dir):
            try:
                os.mkdir(juniper_dir)
            except:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                err_message = 'Error "%s" (%s) on %s:%s' % (exc_obj, exc_type, exc_tb.tb_lineno, fname)
                flash('Could not create dir for "%s" due to error:\n%s' % (new_client['client_id'], err_message))
                return jsonify(status='ERROR', message='Could not create new Juniper record'), 400

        client_file_name = os.path.join(juniper_dir, 'client.yml')
        existing_client = {}
        if os.path.isfile(client_file_name):
            with open(client_file_name) as f:
                existing_client = yaml.load(f, Loader=yaml.Loader)

        for mandatory_param in [ 'client_name', 'client_id', 'ip', 'port', 'junusername', 'key' ]:
            existing_client[mandatory_param] = new_client[mandatory_param]

        with open(client_file_name, 'w') as f:
            yaml.dump(existing_client, f)

        if 'config' in request.files:
            result, message = save_local_config(client_file_name, request.files['config'])
            if not result:
                return jsonify(status='ERROR', message=('Could not save Juniper config due to error: %s' % message)), 400

        os.remove(tmp_client_file_name)

        message = 'Client "%s" was set' % existing_client['client_name']
        print(message)

        return jsonify(status='OK', message=message), 200


@src.route('/juniper_gui', methods=['POST'])
@login_required
def juniper_gui():

    if request.method == 'POST':

        bluegroups = get_val('all_bluegroups', current_user.desc).split(';')
        if not application.config['JUNIPER_BLUEGROUP'] in bluegroups:
            flash('You are not authorized to manage Juniper configs')
            return jsonify(status='ERROR', message='Access denied'), 400

        sasglib = SASGLIB()

        new_juniper = {}
        new_juniper['client_name'] = str(clean_user_input(request.form.get('junipername','').strip()))
        new_juniper['client_id'] = str(clean_user_input(request.form.get('juniperid','').strip()))
        new_juniper['ip'] = str(clean_user_input(request.form.get('ip','').strip()))
        new_juniper['port'] = str(clean_user_input(request.form.get('port','').strip()))
        new_juniper['junusername'] = str(clean_user_input(request.form.get('junusername','').strip()))
        new_juniper['key'] = str(clean_user_input(request.form.get('keyname','').strip()))

        juniper_config = request.files.get('juniper_config')

        if not new_juniper['client_id']:
            return jsonify(status='ERROR', message='Empty juniper ID'), 400

        existing_junipers_info = get_juniper_info()

        try:
            numeric_port = int(new_juniper['port'])
        except:
            return jsonify(status='ERROR', message='Wrong port "%s" for juniper record "%s"' % (new_juniper['port'], new_juniper['client_id'])), 400

        if numeric_port == 0:
            return jsonify(status='ERROR', message='Wrong port "%s" for juniper record "%s"' % (new_juniper['port'], new_juniper['client_id'])), 400

        key = os.path.join('/sasg_data/userdata', application.config['JUNIPER_BLUEGROUP'], 'keys', new_juniper['key'])
        if not os.path.exists(key):
            return jsonify(status='ERROR', message='SSH key %s does not exist' % key), 400

        if ' ' in new_juniper['client_id']:
            return jsonify(status='ERROR', message='Juniper id "%s" cannot contain spaces' % new_juniper['client_id']), 400

        outline = (
            ('Name:       %s\n' % new_juniper['client_name']) +
            ('ID:         %s\n' % new_juniper['client_id']) +
            ('IP:         %s\n' % new_juniper['ip']) +
            ('Port:       %s\n' % new_juniper['port']) +
            ('User:       %s\n' % new_juniper['junusername']) +
            ('Key:        %s\n' % new_juniper['key'])
        )
        print('Creating new Juniper w/ the following info:\n%s' % outline)

        juniper_dir = os.path.join('/sasg_data/userdata/juniper', new_juniper['client_id'])

        if not os.path.exists(juniper_dir):
            try:
                os.mkdir(juniper_dir)
            except:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                err_message = 'Error "%s" (%s) on %s:%s' % (exc_obj, exc_type, exc_tb.tb_lineno, fname)
                flash('Could not create dir for "%s" due to error:\n%s' % (new_juniper['client_id'], err_message))
                return jsonify(status='ERROR', message='Could not create new Juniper record'), 400

        client_config = os.path.join(juniper_dir, 'client.yml')

        try:
            config_to_write = new_juniper
            if os.path.isfile(client_config):
                with open(client_config) as f:
                    existing_config = yaml.load(f, Loader=yaml.Loader)
                for key in new_juniper.keys():
                    existing_config[key] = new_juniper[key]
                config_to_write = existing_config

            with open(client_config, 'w') as yf:
                yaml.dump(config_to_write, yf)
        except:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            err_message = 'Error "%s" (%s) on %s:%s' % (exc_obj, exc_type, exc_tb.tb_lineno, fname)
            flash('Could not create client file for "%s" due to error:\n%s' % (new_juniper['client_id'], err_message))
            return jsonify(status='ERROR', message='Could not create new Juniper record'), 400

        if juniper_config:
            result, message = save_local_config(client_config, juniper_config)
            if not result:
                shutil.rmtree(juniper_dir)
                return jsonify(status='ERROR', message=('Could not save Juniper config due to error: %s' % message)), 400

        return jsonify(status='OK', message='Juniper record created'), 200

@src.route('/get-remote-juniper-config', methods=['POST'])
@require_api_auth
@csrf.exempt
def get_remote_juniper_config():
    if request.method == 'POST':

        req_json = request.get_json(silent=True) or request.form
        juniper_id = req_json.get('JUNIPER_ID')
        sasglib = SASGLIB()

        bluegroup = get_val('bluegroup', current_user.desc)
        bluegroups = get_val('all_bluegroups', current_user.desc).split(';')

        if not juniper_bluegroup in bluegroups:
            return jsonify(status='ERROR', message=('Access denied')), 400

        print('Getting config file for id "%s"' % juniper_id)
        client_config = os.path.join('/sasg_data/userdata/juniper', juniper_id, 'client.yml')

        if not os.path.isfile(client_config):
            return jsonify(status='ERROR', message=('Could not find Juniper by ID: %s (config file: %s)' % (juniper_id, client_config))), 400

        with open(client_config) as yf:
            client = yaml.load(yf, Loader=yaml.Loader)

        try:
            result = sasglib.get_remote_juniper_config(client, application.config['JUNIPER_SSH_KEYS_DIR'])
        except:
            return jsonify(status='ERROR', message=('Exception during getting remote config')), 400

        if result.get('status') == 'OK':
            return jsonify(status='OK', message=('Remote config was fetched successfully')), 200
        else:
            return jsonify(status='ERROR', message=('Remote config was not fetched')), 400

@src.route('/get-config-diff', methods=['POST'])
@require_api_auth
@csrf.exempt
def get_config_diff():
    if request.method == 'POST':

        sasglib = SASGLIB()

        req_json = request.get_json(silent=True) or request.form
        juniper_id = req_json.get('JUNIPER_ID')
        bluegroup = get_val('bluegroup', current_user.desc)
        bluegroups = get_val('all_bluegroups', current_user.desc).split(';')

        if not juniper_bluegroup in bluegroups:
            return jsonify(status='ERROR', message=('Access denied')), 400

        client_config = os.path.join('/sasg_data/userdata/juniper', juniper_id, 'client.yml')

        if not os.path.isfile(client_config):
            return jsonify(status='ERROR', message=('Could not find Juniper by ID: %s (config file: %s)' % (juniper_id, client_config))), 400

        with open(client_config) as yf:
            client = yaml.load(yf, Loader=yaml.Loader)

        result = sasglib.get_config_diff(client)

        if result.get('status') == 'OK':
            return jsonify(status='OK', message=('Diff for "%s" was generated' % juniper_id)), 200
        else:
            return jsonify(status='ERROR', message=('Generating diff for "%s" has failed' % juniper_id)), 400

@src.route('/juniper-config', methods=['POST'])
@login_required
def juniper_config():
    if not request.method == 'POST':
        return jsonify(status='ERROR', message='Only POST requests are allowed'), 400

    req_json = request.get_json(silent=True) or request.form
    juniper_id = req_json.get('JUNIPER_ID')
    sasglib = SASGLIB()

    bluegroup = get_val('bluegroup', current_user.desc)
    bluegroups = get_val('all_bluegroups', current_user.desc).split(';')

    if not juniper_bluegroup in bluegroups:
        return jsonify(status='ERROR', message=('Access denied')), 400

    juniper_info = get_juniper_info()

    if not juniper_id in juniper_info.keys():
        return jsonify(status='ERROR', message=('Could not find Juniper by ID: %s' % juniper_id)), 400

    result = sasglib.run_juniper_config(juniper_info[juniper_id], application.config['JUNIPER_SSH_KEYS_DIR'])

    if result['status'] == 'OK':
        return jsonify(status='OK', message='SCRIPT OUTPUT:\n %s' % result['message']), 200
    else:
        return jsonify(status='ERROR', message='SCRIPT OUTPUT:\n %s' % result['message']), 400


@src.route('/command_gui', methods=['GET', 'POST'])
@login_required
def command_gui():
    ''' User command that can be applied to the vyos or tools server directly. '''

    if request.method == 'POST':
        name = clean_user_input(request.form.get('command_name','').strip())
        desc = clean_user_input(request.form.get('command_desc','').strip())
        content = clean_user_input(request.form.get('command_content','').strip()) # do not escape, but protect from alert

        key = name.replace(' ', '')

        #content = content.replace('\r\n', '<br>')

        cobj = Command.query.filter_by(name=name).first()
        if cobj:
            return jsonify(status='ERROR', message=('Name already exists. Please use different name.')), 400

        cobj = Command(key, name, desc, content)
        if not cobj:
            return jsonify(status='ERROR', message=('Fail to store command.')), 400

        # this should not fail
        try:
            db.session.add(cobj)
            db.session.commit()
        except Exception as e:
            return jsonify(status='ERROR', message='Failed to update info: %s' % str(e)), 400

        return jsonify(status='OK', message='Command is saved.'), 200

    commands = Command.query.all()
    bluegroup = get_val('bluegroup', current_user.desc)

    return render_template('command.html', command_active='active', commands=commands, bluegroup=bluegroup)

@src.route('/user_gui', methods=['GET', 'POST'])
@login_required
def user_gui():
    ''' User GUI POST handles key file upload '''

    if request.method == 'POST':
        keyname = clean_user_input(request.form.get('keyname','').strip())
        ifile = request.files.get('key_file')
        bluegroups = request.form.getlist('bluegroups')
        override = request.form.get('key_override') == 'on'

        if not keyname or not ifile:
            return jsonify(status='ERROR', message='All fields need to be sent.'), 400

        for bg in bluegroups:
            temp_user = User(current_user.username, None, desc='bluegroup='+bg)

            meta_info = get_info(temp_user, 'metadata')
            if not meta_info.get('keys'):
                meta_info['keys'] = {}

            if not override:
                for key in meta_info.get('keys',{}).keys():
                    if key == keyname:
                        return jsonify(status='ERROR', message='Key already exists'), 400

            kdir = '/'.join([userdata_dir, get_val('bluegroup', temp_user.desc), 'keys'])
            if not os.path.isdir(kdir):
                os.makedirs(kdir)

            keypath = '/'.join([kdir, keyname])
            keyurl = '/'.join(['/userdata', get_val('bluegroup', temp_user.desc), 'keys', keyname]).replace('//','/')
            try:
                if os.path.isfile(keypath):
                    os.remove(keypath)
                ifile.seek(0,0) # rewind
                ifile.save(keypath) # key file
                os.chmod(keypath, 0o400)
            except Exception as e:
                return jsonify(status='ERROR', message='Internal Error - Failed to save key file.'), 400

            meta_info['keys'][keyname] = { 'url': keyurl, 'path': keypath, 'created': '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now()) }

            set_info(temp_user, 'metadata', meta_info)

        return jsonify(status='OK', message='Key file is saved.'), 200

    user_info = get_info(current_user, 'user')
    meta_info = get_info(current_user, 'metadata')
    bluegroup = get_val('bluegroup', current_user.desc)
    return render_template('user_profile.html', user_info=user_info, meta_info=meta_info, bluegroup=bluegroup)

@src.route('/group_gui', methods=['GET', 'POST'])
@login_required
def group_gui():
    ''' Group GUI POST handles key file upload '''

    if request.method == 'POST':
        keyname = clean_user_input(request.form.get('keyname','').strip())
        ifile = request.files.get('key_file')

        if not keyname or not ifile:
            return jsonify(status='ERROR', message='All fields need to be sent.'), 400

        for bg in bluegroups:
            temp_user = User(current_user.username, None, desc='bluegroup='+bg)

            meta_info = get_info(temp_user, 'metadata')
            if not meta_info.get('keys'):
                meta_info['keys'] = {}

            for key in meta_info.get('keys',{}).keys():
                if key == keyname:
                    return jsonify(status='ERROR', message='Key already exists'), 400

            kdir = '/'.join([userdata_dir, get_val('bluegroup', temp_user.desc), 'keys'])
            if not os.path.isdir(kdir):
                os.makedirs(kdir)

            keypath = '/'.join([kdir, keyname])
            keyurl = '/'.join(['/userdata', get_val('bluegroup', temp_user.desc), 'keys', keyname]).replace('//','/')
            try:
                ifile.seek(0,0) # rewind
                ifile.save(keypath) # key file
                os.chmod(keypath, 0o400)
            except Exception as e:
                return jsonify(status='ERROR', message='Internal Error - Failed to save key file.'), 400

            meta_info['keys'][keyname] = { 'url': keyurl, 'path': keypath, 'created': '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now()) }

            set_info(temp_user, 'metadata', meta_info)

        return jsonify(status='OK', message='Key file is saved.'), 200

    user_info = get_info(current_user, 'user')
    meta_info = get_info(current_user, 'metadata')

    # lazy key deletion
    ''' just keep the other one.
    delete_keys = []
    for key in meta_info.get('keys',[]):
        kdir = '/'.join([userdata_dir, get_val('bluegroup', current_user.desc), 'keys', key])
        if not os.path.isfile(kdir):
            delete_keys.append(key)

    if len(delete_keys) > 0:
        for key in delete_keys:
            meta_info['keys'].remove(key)
        set_info(current_user, 'metadata', meta_info)
    '''

    bluegroup = get_val('bluegroup', current_user.desc)
    bluegroups = json.dumps(get_val('all_bluegroups', current_user.desc).split(';'))
    return render_template('group.html', user_info=user_info, meta_info=meta_info, bluegroup=bluegroup, bluegroups=bluegroups)

def validate_input(vars_json):
    # Find the vyos IP address (Pvyos_IP in vars file).
    if not vars_json.get('PRIVATE_VYOS_IP'):
        return 'VyOS IP address is not provided.'

    return None


@src.route('/customer_gui', methods=['GET', 'POST'])
@login_required
def customer_gui():
    ''' Customer GUI POST handles vars file upload '''

    # handle create/modify.
    if request.method == 'POST':
        customername = clean_user_input(request.form.get('customername','').strip().replace(' ', '')) # NOTE: used in html, thus remove space.
        vyos_auto_username = clean_user_input(request.form.get('vyos_auto_username','').strip())
        vyos_auto_passkey = clean_user_input(request.form.get('vyos_auto_passkey'))
        tools_auto_username = clean_user_input(request.form.get('tools_auto_username','').strip())
        tools_auto_passkey = clean_user_input(request.form.get('tools_auto_passkey'))
        ifile = request.files.get('vars_file')
        bluegroups = request.form.getlist('bluegroups')

        if not customername or not vyos_auto_username or not vyos_auto_passkey or not tools_auto_username or not tools_auto_passkey or not bluegroups:
            return jsonify(status='ERROR', message='All fields need to be sent.'), 400

        # Access Control to Group
        all_bluegroups = get_val('all_bluegroups', current_user.desc).split(';')
        for bg in all_bluegroups:
            temp_user = User(current_user.username, None, desc='bluegroup='+bg)

            # if directory not exist, create bluegroup directory.
            bluegroup_dir = '/'.join([userdata_dir, bg])
            if not os.path.isdir(bluegroup_dir): # first time user.
                os.makedirs(bluegroup_dir)
                meta_info = get_info(temp_user, 'metadata')
                meta_info['keys'] = {}
                meta_info['customers'] = []
                set_info(temp_user, 'metadata', meta_info)

            meta_info = get_info(temp_user, 'metadata')
            if not meta_info: # initialize {}
                meta_info['keys'] = {}
                meta_info['customers'] = []

            if not meta_info.get('keys'):
                meta_info['keys'] = {}

            if not meta_info.get('customers'):
                meta_info['customers'] = []

            if bg in bluegroups:
                if customername not in meta_info.get('customers',[]):
                    meta_info['customers'].append(customername)
            else:
                if customername in meta_info.get('customers',[]):
                    meta_info['customers'].remove(customername)
            set_info(temp_user, 'metadata', meta_info)

        # MODIFY EXISTING CUSTOMER-----------
        cdir = '/'.join([customers_dir, customername])
        if os.path.isdir(cdir): # if already exists, update basic info.
            print("## Modifying entry for the customer %s" % customername)
            cinfo = get_info(current_user, 'customer', customername)
            cinfo['vyos_auto_username'] = vyos_auto_username
            cinfo['vyos_auto_passkey'] = vyos_auto_passkey
            cinfo['tools_auto_username'] = tools_auto_username
            cinfo['tools_auto_passkey'] = tools_auto_passkey

            if ifile:
                vars_path = '/'.join([cdir, "vars"])
                try:
                    ifile.save(vars_path) # vars
                except Exception as e:
                    return jsonify(status='ERROR', message='Internal Error - Failed to save vars file.'), 400

                vars_json = vars_to_json(vars_path)

                validate_error = validate_input(vars_json)
                if validate_error:
                    return jsonify(status='ERROR', message=validate_error), 400

                org_vars_json = cinfo.get('vars',{})

                vars_file = '/'.join([customers_dir, customername, 'vars'])
                vars_str = vars_parsing(vars_file)
                cinfo['vars_str'] = vars_str
                cinfo['script_gen_date'] = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())

                # new tools
                tools = cinfo.get('tools',{})
                tools_exist = False
                for tool in default_tools_servers:
                    if vars_json.get(tool):
                        tools_exist = True
                        if org_vars_json.get(tool):
                           if not vars_json.get(tool) == org_vars_json.get(tool):
                               print("##Changing info about ", tool)
                               if type(vars_json.get(tool)) is list:
                                  if tool in tools: del tools[tool]
                                  for tool_address in vars_json.get(tool):
                                      tool_alias = '_'.join([tool, str(vars_json.get(tool).index(tool_address))])
                                      if not tools.get(tool_alias, {}) or tools.get(tool_alias, {}).get('tool_ip') != tool_address:
                                          tool_alias_for_url = '_'.join([tool_address, tool])
                                          tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                                          tools[tool_alias] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address }
                               else:
                                   tool_address = vars_json.get(tool)
                                   tool_alias_for_url = '_'.join([tool_address, tool])
                                   tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                                   tools[tool] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address}
                        else:
                           print("##Adding info about ", tool)
                           if type(vars_json.get(tool)) is list:
                               for tool_address in vars_json.get(tool):
                                   tool_alias = '_'.join([tool, str(vars_json.get(tool).index(tool_address))])
                                   tool_alias_for_url = '_'.join([tool_address, tool])
                                   tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                                   tools[tool_alias] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address }
                           else:
                               tool_address = vars_json.get(tool)
                               tool_alias_for_url = '_'.join([tool_address, tool])
                               tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                               tools[tool] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address}
                    else:
                        if org_vars_json.get(tool):
                            print("Deleting info about ", tool)
                            if type(org_vars_json.get(tool)) is list:
                                for tool_address in org_vars_json.get(tool):
                                    tool_alias = '_'.join([tool, str(org_vars_json.get(tool).index(tool_address))])
                                    if tool_alias in tools: del tools[tool_alias]
                            else:
                                if tool in tools:
                                    del tools[tool]
                        else:
                                if tool in tools:
                                    del tools[tool]
                if (not tools_exist) and ('tools_configure_file_url' in cinfo):
                    del cinfo['tools_configure_file_url']

                sasg_is_present = 0
                for sasg_var in ['SASG_IP_1', 'SASG_IP_2']:
                    if sasg_var in vars_json:
                        sasg_is_present += int(is_not_empty_var(vars_json[sasg_var]))
                if not bool(sasg_is_present):
                    if 'vyos' in cinfo:
                        cinfo['vyos']['sasg_created'] = 0
                    if 'package' in cinfo:
                        cinfo['package']['generated'] = 0
                cinfo['vars'] = vars_json
                cinfo['tools'] = tools

            set_info(current_user, 'customer', cinfo, customername)
            log_action(current_user.username, customername, 'Modify')

            return jsonify(status='OK', message='Customer modified'), 200

        # CREATE NEW CUSTOMER-----------
        print("## Creating entry for the customer %s" % customername)
        if not ifile:
            return jsonify(status='ERROR', message='Vars file should be provided.'), 400

        cdir = '/'.join([customers_dir, customername])
        if not os.path.isdir(cdir):
            os.makedirs(cdir)

        #vars_path = '/'.join([cdir, ifile.filename])
        vars_path = '/'.join([cdir, "vars"])
        try:
            ifile.save(vars_path) # vars
        except Exception as e:
            log_action(current_user.username, customername, 'Create', False)
            return jsonify(status='ERROR', message='Internal Error - Failed to save vars file.'), 400

        vars_json = vars_to_json(vars_path)

        validate_error = validate_input(vars_json)
        if validate_error:
            log_action(current_user.username, customername, 'Create', False)
            return jsonify(status='ERROR', message=validate_error), 400

        # Run make.sh to generate sasg_vyos_configure.sh
        sasglib = SASGLIB()
        output = sasglib.scripts_generate(cdir)

        vars_file = '/'.join([customers_dir, customername, 'vars'])
        vars_str = vars_parsing(vars_file)

        vyos_configure_file_url = '/'.join(['/userdata/customers', customername, 'sasg_vyos_configure.sh']).replace('//','/')
        vyos_log_file_url = '/'.join(['/userdata/customers', customername, 'sasg_vyos_configure.log']).replace('//','/')
        tools_configure_file_url = '/'.join(['/userdata/customers', customername, 'sasg_tools_configure.sh']).replace('//','/')
        sasg_install_file_url = '/'.join(['/userdata/customers', customername, 'sasg_install.sh']).replace('//','/')
        deployment_package_file_url = '/'.join(['/userdata/customers', customername, application.config['DEPLOYMENT_PACKAGE_FILE']]).replace('//','/')

        vyos = { 'configure_file_url': vyos_configure_file_url, 'log_file_url': vyos_log_file_url, 'executed': 0, 'log_uploaded': 0, 'configured': 0, 'configured_timestamp': 0, 'sasg_install_file_url': sasg_install_file_url }
        package = { 'deployment_package_file_url': deployment_package_file_url, 'generated': 0, 'generated_timestamp': 0, 'sasgc_version': 'None', 'checker_version': 'None'}

        # TODO: this is not consistent with customer:POST
        tools = {}
        for tool in default_tools_servers:
            if vars_json.get(tool):
                if type(vars_json.get(tool)) is list:
                   for tool_address in vars_json.get(tool):
                       tool_alias = '_'.join([tool, str(vars_json.get(tool).index(tool_address))])
                       tool_alias_for_url = '_'.join([tool_address, tool])
                       tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                       tools[tool_alias] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address }
                else:
                       tool_address = vars_json.get(tool)
                       tool_alias_for_url = '_'.join([tool_address, tool])
                       tool_log_file_url = '/'.join(['/userdata/customers', customername, tool_alias_for_url + '.log']).replace('//','/')
                       tools[tool] = { 'executed': 0, 'configured': 0, 'log_file_url': tool_log_file_url, 'configured_timestamp': 0, 'tool_name': tool, 'tool_ip': tool_address }

        #tools = { 'BPM_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 }, 'CHEF_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 }, 'EE_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 }, 'ASB_IP': { 'executed': 0, 'configured': 0, 'log_file_url': '', 'configured_timestamp': 0 } }

        customer_info = {
            'created': '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now()),
            'script_gen_date': '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now()),
            'script_version': version,
            'customername': customername,
            'vyos_auto_username': vyos_auto_username,
            'vyos_auto_passkey': vyos_auto_passkey,
            'tools_auto_username': tools_auto_username,
            'tools_auto_passkey': tools_auto_passkey,
            'vars_str': vars_str,
            'vars': vars_json,
            'vyos': vyos,
            'package': package,
            'tools': tools,
            'tools_configure_file_url': tools_configure_file_url
        }

        set_info(current_user, 'customer', customer_info, customername)

        sasg_ansible.create_ansible_inventory(customer_info['vars'], customername)

        log_action(current_user.username, customername, 'Create')
        return jsonify(status='OK', message='VyOS install script is generated.'), 200

    return redirect(url_for('src.dashboard'))

"""
@src.route('/natip_gui', methods=['GET'])
@login_required
def natip_gui():
    ''' Nat IP GUI POST handles key file upload '''
    # NOTE: Everything can be done via REST API /natip. just GUI template rendering here.

    gsniips = Gsniip.query.all()
    natips = Natip.query.all()

    # Unique IP addresses.
    unique_subnets = []
    for item in db.session.query(Gsniip.subnet).distinct():
        unique_subnets.append(str(item[0]))

    # just find the first element of each subnet and use that as the representative ones.
    unique_gsniips = []
    for subnet in unique_subnets:
        unique_gsniips.append(Gsniip.query.filter_by(subnet=subnet).first())

    return render_template('natip.html', natip_active='active', gsniips=gsniips, u_gsniips=unique_gsniips, natips=natips)
"""

################################################################################
# Login Routine
################################################################################
@src.route('/login', methods=['POST'])
def login():
    if current_user.is_authenticated:
        flash('You are already logged in.')
        return redirect(url_for('src.home'))
    if request.method == 'POST':
        username = request.form.get('username','').strip().lower()
        password = request.form.get('password','').strip()
        bluegroup = request.form.get('bluegroup','').strip()
        all_groups = []
        user_groups = []

        #if 'ibm.com' in username: # bluepages
        try:
            User.try_login(username, password)
            user_groups = User.get_groups(username)
            if len(user_groups) == 0:
                flash('Unauthorized: please ask admin to add to bluegroup.', 'danger')
                log_action(username, 'SASGaaS', 'Login', False)
                return render_template('login.html')

            all_groups = User.get_all_groups()
        except Exception as e:
        #except ldap.INVALID_CREDENTIALS as e:
            flash( '%s. Please try again.' % str(e), 'danger')
            return render_template('login.html')
        #else: # service login.
        #    service = User.query.filter_by(username=username).first()
        #    if not service or password != base64.b64decode(service.password):
        #        flash( 'Login failed. Please try again.', 'danger')
        #        return render_template('login.html')

        user = User.query.filter_by(username=username).first()
        if not user:
            user = User(username, generate_hash_key())

        if not bluegroup:
            bluegroup = user_groups[0] # cause not 0, pick first

        user.desc = set_val('bluegroup', bluegroup, user.desc)
        user.desc = set_val('user_bluegroups', ';'.join(user_groups), user.desc)
        user.desc = set_val('all_bluegroups', ';'.join(all_groups), user.desc)
        db.session.add(user)
        db.session.commit()

        user_dir = '/'.join([userdata_dir, username])
        if not os.path.isdir(user_dir): # first time user.
            os.makedirs(user_dir)
            #user_info['apikey'] = generate_hash_key()
            user_info = get_info(user, 'user')
            user_info['username'] = username
            set_info(user, 'user', user_info) # user_info.json

        bluegroup_dir = '/'.join([userdata_dir, bluegroup])
        if not os.path.isdir(bluegroup_dir): # first time user.
            os.makedirs(bluegroup_dir)
            meta_info = get_info(user, 'metadata')
            meta_info['keys'] = {}
            meta_info['customers'] = []
            set_info(user, 'metadata', meta_info)

        session.clear() # clear session contents.
        session.sid = str(uuid.uuid4()) # change session id.
        login_user(user)

        log_action(username, 'SASGaaS', 'Login')
        flash('You have successfully logged in.', 'success')
        return redirect(url_for('src.home'))

    return render_template('login.html')

@src.route('/logout', methods=['POST'])
@login_required
def logout():
    g.user = None
    logout_user()
    session.clear()
    return jsonify(status='OK', message='Successfully logged out'), 200
