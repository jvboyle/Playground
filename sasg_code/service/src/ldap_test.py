import ldap, datetime
 
def get_ldap_connection():
    conn = ldap.initialize('ldaps://bluepages.ibm.com:636/')
    #conn = ldap.open('bluepages.ibm.com')
    return conn

username = raw_input('Username: ')
password = raw_input('Password: ')
conn = get_ldap_connection()
person = conn.search_st("ou=bluepages,o=ibm.com", ldap.SCOPE_SUBTREE, "(mail=%s)" % username)

if len(person) == 0:
    raise Exception('Invalid Username')

print(person[0][0])

conn.simple_bind_s(person[0][0], password)
print('Success')
