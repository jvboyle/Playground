# -*- coding: utf-8 -*-
import os
from flask import Flask, send_file
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager

import logging
 
application = Flask(__name__)
application.secret_key = 'YmJiYjQ4MmJiYzNmYzVjZDJmNjY0NTc3'
application.config['SESSION_TYPE'] = 'filesystem'

if os.getenv('SASG_ENV') == 'production':
    application.config['SESSION_COOKIE_SECURE'] = True # only for https.
    application.config['DEBUG'] = False

#application.config['SESSION_COOKIE_NAME'] = '0.0.0.0' # optional.
#application.config['SESSION_COOKIE_DOMAIN'] = '0.0.0.0' # optional.

application.config['WTF_CSRF_ENABLED'] = True
application.config['WTF_CSRF_CHECK_DEFAULT'] = True

application.config['ROOT_DIR'] = '/'.join([os.path.dirname(os.path.realpath(__file__)), '..'])
try:
    application.config['VERSION'] = open(application.config['ROOT_DIR'] + '/VERSION', 'r').read().strip()
except:
    application.config['VERSION'] = '0.0'

application.config['DATA_ROOT_DIR'] = '/'.join([application.config.get('ROOT_DIR'), 'service'])
if os.getenv('SASG_DATA_DIR'):
    application.config['DATA_ROOT_DIR'] = os.getenv('SASG_DATA_DIR')
if os.path.isdir('/sasg_data'): # default global location.
    application.config['DATA_ROOT_DIR'] = '/sasg_data'

application.config['SERVICE_DIR'] = '/'.join([application.config.get('ROOT_DIR'), 'service'])
application.config['SCRIPTS_DIR'] = '/'.join([application.config.get('ROOT_DIR'), 'scripts'])

application.config['LOG_DIR'] = '/'.join([application.config.get('DATA_ROOT_DIR'), 'log'])
application.config['USER_DATA_DIR'] = '/'.join([application.config.get('DATA_ROOT_DIR'), 'userdata'])
application.config['CUSTOMERS_DIR'] = '/'.join([application.config.get('USER_DATA_DIR'), 'customers'])
application.config['DB_DIR'] = '/'.join([application.config.get('DATA_ROOT_DIR'), 'postgres'])
application.config['DOCKER_IMAGES_DIR'] = '/'.join([application.config.get('DATA_ROOT_DIR'), 'images'])
application.config['DOCKER_IMAGES'] = [
    {
        'filename': 'docker-container.sasgc.tgz',
        'type': 'sasgc',
        'nametag': 'gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg_build'
    },
    {
        'filename': 'docker-container.sasgc-ipsec.tgz',
        'type': 'sasgc-ipsec',
        'nametag': 'gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg_build-ipsec'
    },
    {
        'filename': 'docker-container.checker.tgz',
        'type': 'checker', 
        'nametag': 'gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg-sidecar-checker'
    }
]
application.config['DEPLOYMENT_PACKAGE_FILE'] = 'sasg_install.tgz'
application.config['JUNIPER_BLUEGROUP'] = 'sasgaas-msadmin'
application.config['JUNIPER_SSH_KEYS_DIR'] = os.path.join(
    application.config['USER_DATA_DIR'],
    application.config['JUNIPER_BLUEGROUP'],
    'keys')
application.config['JUNIPER_HEADER_CONFIG_CATEGORIES'] = [
    '@changed-localtime',
    '@changed-seconds',
    'version',
    'system'
]
application.config['JUNIPER_CONFIG_ALLOWED_SECURITY_CATEGORIES'] = [
    'address-book',
    'nat',
    'policies'
]
application.config['IMAGES_FILE'] = 'sasg_images.tgz'
application.config['JUNIPER_BLUEGROUP'] = 'sasgaas-msadmin'
application.config['JUNIPER_SSH_KEYS_DIR'] = os.path.join(
    application.config['USER_DATA_DIR'],
    application.config['JUNIPER_BLUEGROUP'],
    'keys')
application.config['JUNIPER_HEADER_CONFIG_CATEGORIES'] = [
    '@changed-localtime',
    '@changed-seconds',
    'version',
    'system'
]
application.config['GCM_POLICY_DIR'] = '/app/scripts/src/gcm'

if not os.path.isdir(application.config.get('LOG_DIR')):
    os.makedirs(application.config.get('LOG_DIR'))

if not os.path.isdir(application.config.get('USER_DATA_DIR')):
    os.makedirs(application.config.get('USER_DATA_DIR'))

if not os.path.isdir(application.config.get('DB_DIR')):
    os.makedirs(application.config.get('DB_DIR'))

if not os.path.isdir(application.config.get('CUSTOMERS_DIR')):
    os.makedirs(application.config.get('CUSTOMERS_DIR'))

#application.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + application.config.get('DB_DIR') + '/sasg.db'
#application.config['LDAP_PROVIDER_URL'] = 'ldap://bluepages.ibm.com:389/'
POSTGRES = {
    'user': os.getenv('POSTGRES_USERNAME', 'postgres'),
    'pw': os.getenv('POSTGRES_PASSWORD', 'passw0rd'),
    'db': 'sasg',
    'host': os.getenv('POSTGRES_HOST', 'localhost'),
    'port': os.getenv('POSTGRES_PORT', '5432')
}
application.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://%(user)s:%(pw)s@%(host)s:%(port)s/%(db)s' % POSTGRES

application.config['LDAP_PROVIDER_URL'] = 'ldaps://bluepages.ibm.com:636/'
application.config['LDAP_PROTOCOL_VERSION'] = 3

db = SQLAlchemy(application)
db.init_app(application)
#db.create_all() # does not work if no database is created.
    
login_manager = LoginManager()
login_manager.session_protection = "strong"
login_manager.login_view = 'src.login'
login_manager.init_app(application)

from service.src.views import src
application.register_blueprint(src)

# custom userdata directory to keep all data.
@application.route('/userdata/<path:filename>')
def userdata(filename):
    return send_file('/'.join([application.config.get('USER_DATA_DIR'), filename])) 

#db.create_all()

# TODO: SEED FILE for network info.

# LOGGING - Print both screen and file
# set up logging to file - see previous section for more details
logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s %(name)-12s %(levelname)-8s %(message)s',
                    datefmt='%m-%d %H:%M',
                    filename=application.config.get('LOG_DIR') + '/sasg.log',
                    filemode='a')
# define a Handler which writes INFO messages or higher to the sys.stderr
console = logging.StreamHandler()
console.setLevel(logging.INFO)
# set a format which is simpler for console use
formatter = logging.Formatter('%(name)-12s: %(levelname)-8s %(message)s')
# tell the handler to use this format
console.setFormatter(formatter)
# add the handler to the root logger
logging.getLogger('').addHandler(console)
