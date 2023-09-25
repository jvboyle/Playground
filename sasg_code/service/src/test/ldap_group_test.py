import ldap, datetime

LDAP_SERVER = 'ldaps://bluepages.ibm.com:636/'
LDAP_BASE = "ou=bluepages,o=ibm.com"

def users_ldap_groups(uid="jinho@us.ibm.com"):
    """ Returns a list of the groups that the uid is a member of.
        Returns False if it can't find the uid or throws an exception.
        It's up to the caller to ensure that the UID they're using exists!
    """
    print("uid: ", uid)
    # ignore certificate errors
    ldap.set_option(ldap.OPT_X_TLS_REQUIRE_CERT, ldap.OPT_X_TLS_NEVER)
    l = ldap.initialize(LDAP_SERVER)
    # this search for all objectClasses that user is in.
    # change this to suit your LDAP schema
    search_filter='(|(&(objectClass=*)(member=uid=%s,cn=users,cn=accounts)))' % uid
    
    try:
        # this returns the groups!
        results = l.search_s(LDAP_BASE, ldap.SCOPE_SUBTREE, search_filter, ['cn',])
        print('%s groups: %s' % (uid, results) )
        return results
    except ldap.NO_SUCH_OBJECT as e:
        print("{}:{}unable to lookup uid {} on LDAP server {}: {}".format(__file__, sys._getframe().f_code.co_name, uid, LDAP_SERVER, e))
        return False
    except Exception as e: # some other error occured
        print("{}:{}: other error occurred looking up {} in LDAP: {}".format(__file__, sys._getframe().f_code.co_name,uid,e))
        return False
    # shouldn't get here, but if we do, we don't have any results!
    return False

users_ldap_groups()
