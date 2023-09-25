import ldap, datetime
from flask_wtf import Form
from wtforms import TextField, PasswordField
from wtforms.validators import InputRequired
from service import db, application
 
def get_ldap_connection():
    conn = ldap.initialize(application.config['LDAP_PROVIDER_URL'])
    #conn = ldap.open('bluepages.ibm.com')
    return conn

def get_val(key, metadata):
    items = metadata.split(',')
    for item in items:
        if key+'=' in item: # exact key
            return item.split('=')[1]
    return None

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100))
    password = db.Column(db.String(100)) # only used for service.
    apikey = db.Column(db.String(256))
    desc = db.Column(db.String(512))
    created = db.Column(db.String(64))
 
    def __init__(self, username, apikey, desc=None, password=None):
        self.username = username
        # NOTE: Never keep password for real users, but can keep service password.
        self.password = password
        self.apikey = apikey
        self.desc = desc
        self.created = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())

    def to_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}
 
    @staticmethod
    def try_login(username, password):
        #bp = ldap.open("bluepages.ibm.com") # deprecated.
        #bp.protocol_version = ldap.VERSION3

        conn = get_ldap_connection()
        person = conn.search_st("ou=bluepages,o=ibm.com", ldap.SCOPE_SUBTREE, "(mail=%s)" % username)

        if len(person) == 0:
            raise Exception('Invalid Username')

        conn.simple_bind_s(person[0][0], password)


    @staticmethod
    def get_groups(username, prefix='sasgaas-'): # XXX: prefix should be used when creating bluegroups
        bluegroups = []
        conn = get_ldap_connection()
        person = conn.search_st("ou=bluepages,o=ibm.com", ldap.SCOPE_SUBTREE, "(mail=%s)" % username)
        if len(person) == 0:
            raise Exception('User does not exist')

        uid = get_val('uid', person[0][0])
        groups = conn.search_st("ou=memberlist,ou=ibmgroups,o=ibm.com", ldap.SCOPE_SUBTREE, "(cn=%s*)" % prefix)
        for group in groups:
            for each in group[1].get('uniquemember',[]):
                if uid == get_val('uid', str(each)):
                    bluegroup = get_val('cn', group[0])
                    if bluegroup and bluegroup not in bluegroups:
                        bluegroups.append(bluegroup)

        return bluegroups

    @staticmethod
    def get_all_groups(prefix='sasgaas-'): # XXX: prefix should be used when creating bluegroups
        bluegroups = []
        conn = get_ldap_connection()
        groups = conn.search_st("ou=memberlist,ou=ibmgroups,o=ibm.com", ldap.SCOPE_SUBTREE, "(cn=%s*)" % prefix)

        for group in groups:
            for each in group[1].get('uniquemember',[]):
                bluegroup = get_val('cn', group[0])
                if bluegroup and bluegroup not in bluegroups:
                    bluegroups.append(bluegroup)

        return bluegroups
 
    def is_authenticated(self):
        return True
 
    def is_active(self):
        return True
 
    def is_anonymous(self):
        return False
 
    def get_id(self):
        #return unicode(self.id)
        return str(self.id)

class Command(db.Model):
    key = db.Column(db.String(64)) # no space from name
    name = db.Column(db.String(64), primary_key=True)
    desc = db.Column(db.String(256))
    command = db.Column(db.String(512))
    created = db.Column(db.String(64))
 
    def __init__(self, key, name, desc, command):
        self.key = key
        self.name = name
        self.desc = desc
        self.command = command
        self.created = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())

    def to_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}
    
    def get_id(self):
        return unicode(self.id)

'''
class Gsniip(db.Model):
    subnet = db.Column(db.String(64)) #xxx.xxx.xxx.xxx/xx
    gsni_ip = db.Column(db.String(64), primary_key=True) 
    used = db.Column(db.Boolean)
    desc = db.Column(db.String(256))
    created = db.Column(db.String(64))

    def __init__(self, subnet, gsni_ip, used=False, desc=''):
        self.subnet = subnet
        self.gsni_ip = gsni_ip
        self.used = used
        self.desc = desc
        self.created = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())

    def to_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

    def get_id(self):
        return unicode(self.id)

class Natip(db.Model):
    subnet = db.Column(db.String(64)) #xxx.xxx.xxx.xxx/xx
    gsni_ip = db.Column(db.String(64), primary_key=True) 
    sl_private_ip = db.Column(db.String(64)) 
    hostname = db.Column(db.String(64)) 
    sas_environment = db.Column(db.String(64))
    customer_name = db.Column(db.String(64))
    service_request = db.Column(db.String(64))
    vyatta_rule_num = db.Column(db.Integer)
    status = db.Column(db.String(64))
    created = db.Column(db.String(64))
 
    def __init__(self, subnet, gsni_ip, sl_private_ip, hostname, sas_environment, customer_name, service_request, vyatta_rule_num=0, status=''):
        self.subnet = subnet
        self.gsni_ip = gsni_ip
        self.sl_private_ip = sl_private_ip 
        self.hostname = hostname 
        self.sas_environment = sas_environment 
        self.customer_name = customer_name 
        self.service_request = service_request 
        self.vyatta_rule_num = vyatta_rule_num
        self.status = status
        self.created = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())

    def to_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}
    
    def get_id(self):
        return unicode(self.id)
'''
