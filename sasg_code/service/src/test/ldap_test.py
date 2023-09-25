import ldap, datetime
import json
 
def get_ldap_connection():
    conn = ldap.initialize('ldaps://bluepages.ibm.com:636/')
    #conn = ldap.open('bluepages.ibm.com')
    return conn

conn = get_ldap_connection()

username = raw_input('Username: ')
password = raw_input('Password: ')
person = conn.search_st("ou=bluepages,o=ibm.com", ldap.SCOPE_SUBTREE, "(mail=%s)" % username)

print(person[0][1].get('uid')[0])

if len(person) == 0:
    raise Exception('Invalid Username')

print(person[0][0])
#uid=1G8500897,c=us,ou=bluepages,o=ibm.com

conn.simple_bind_s(person[0][0], password)
#conn.simple_bind_s("uid=1G8500897,c=us,ou=bluepages,o=ibm.com", password)
#conn.simple_bind_s("email=jinho@us.ibm.com,ou=bluepages,o=ibm.com", password)
print('Login Success')
'''
def get_val(key, metadata):
    items = metadata.split(',')
    for item in items:
        if key+'=' in item: # exact key
            return item.split('=')[1]
    return ''

#groups = conn.search_st("ou=bluepages,o=ibm.com", ldap.SCOPE_SUBTREE, "(objectClass=group)")
#groups = conn.search_s("ou=bluepages,o=ibm.com", ldap.SCOPE_SUBTREE, "(objectClass=group)")
#groups = conn.search_st("ou=metadata,ou=ibmgroups,o=ibm.com", ldap.SCOPE_SUBTREE, "(cn=sasg*)")
groups = conn.search_st("ou=memberlist,ou=ibmgroups,o=ibm.com", ldap.SCOPE_SUBTREE, "(cn=sasg*)")
print(len(groups), groups)
for group in groups:
    for each in group[1]['uniquemember']:
	print(each)
        print(get_val('cn', group[0]))
#print(groups[0][1]['uniquemember'])

#[('cn=sasg_test_jinho,ou=metadata,ou=ibmgroups,o=ibm.com', {'endcomputedate': ['2017-02-15-04.33.49.991'], 'cn': ['sasg_test_jinho'], 'objectClass': ['gmMetaData', 'top'], 'o': ['ibm.com'], 'viewAccess': ['Owner/Admins'], 'startcomputedate': ['2017-02-15-04.18.43.144'], 'expirationDate': ['20180215'], 'mode': ['memberlist'], 'owner': ['uid=1G8500897,c=us,ou=bluepages,o=ibm.com'], 'ou': ['metadata', 'ibmgroups'], 'memberListDN': ['cn=sasg_test_jinho,ou=memberlist,ou=ibmgroups,o=ibm.com'], 'description': ['sasg testing bluegroup']}), ('cn=sasg_test_jinho,ou=memberlist,ou=ibmgroups,o=ibm.com', {'objectClass': ['ibm-nestedGroup', 'groupOfUniqueNames', 'top'], 'ou': ['memberlist', 'ibmgroups'], 'uniquemember': ['uid=1G8500897,c=us,ou=bluepages,o=ibm.com', 'uid=978704897,c=us,ou=bluepages,o=ibm.com'], 'cn': ['sasg_test_jinho'], 'o': ['ibm.com']})]
'''
