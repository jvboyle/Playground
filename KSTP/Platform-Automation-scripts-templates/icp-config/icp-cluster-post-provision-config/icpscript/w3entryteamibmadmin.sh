#This script used to add LDAPS entry and Team IbmAdmin creation 
#Get Cluster Variable

if [ -z "$CL_IP_ENV" ] ; then
  echo "Enter CL_IP : "; read CL_IP
  export CL_IP
else
  CL_IP="${CL_IP_ENV}"
fi

if [ -z "$PASS_ENV" ] ; then
  echo "Enter Password : "; read PASS
  export PASS
else
  PASS="${PASS_ENV}"
fi

#login to Cluster
cloudctl_311 login -a https://$CL_IP:8443 --skip-ssl-validation -u admin -p $PASS -n default

sleep 20
#export the ACCESS TOKEN
export ACCESS_TOKEN=`cloudctl_311 tokens|grep Access |awk  '{print $4'}`

sleep 5

#Add LDAPS entry 
curl -k -X POST --header "Authorization: bearer $ACCESS_TOKEN" --header 'Content-Type: application/json' -d '{"LDAP_ID": "W3","LDAP_REALM":"REALM","LDAP_HOST":"bluepages.ibm.com","LDAP_PORT":"636","LDAP_IGNORECASE":"false","LDAP_BASEDN":"o=ibm.com","LDAP_BINDDN":"","LDAP_TYPE":"IBM Tivoli Directory Server","LDAP_USERFILTER":"(&(emailAddress=%v)(objectclass=ePerson))","LDAP_GROUPFILTER":"(&(cn=%v)(objectclass=groupOfUniqueNames))","LDAP_USERIDMAP":"*:emailAddress","LDAP_GROUPIDMAP":"*:cn","LDAP_GROUPMEMBERIDMAP":"groupOfUniqueNames:uniqueMember","LDAP_URL":"ldaps://bluepages.ibm.com:636","LDAP_PROTOCOL":"ldaps"}' "https://$CL_IP:8443/idmgmt/identity/api/v1/directory/ldap/onboardDirectory"

sleep 20

#create Team  called IbmAdmin
curl -k -X POST --header 'Content-Type: application/json' --header "Authorization: bearer $ACCESS_TOKEN" -d '{"teamId":"ibm-admin","name":"IbmAdmin"}' "https://$CL_IP:8443/idmgmt/identity/api/v1/teams"

sleep 10
#Add User to Team IbmAdmin
curl -k -X PUT --header "Authorization: Bearer $ACCESS_TOKEN" --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{"teamId":"ibm-admin","name":"IbmAdmin","users":[{"userId":"gzeien@us.ibm.com","firstName":"GARY ZEIEN","lastName":"","email":"gzeien@us.ibm.com","userBaseDN":"uid=2A0122897,c=us,ou=bluepages,o=ibm.com","roles":[{"id":"crn:v1:icp:private:iam::::role:ClusterAdministrator"}]},{"userId":"svimalra@in.ibm.com","firstName":"SENTHILKUMAR VIMALRAJ","lastName":"","email":"svimalra@in.ibm.com","userBaseDN":"uid=076823744,c=in,ou=bluepages,o=ibm.com","roles":[{"id":"crn:v1:icp:private:iam::::role:ClusterAdministrator"}]},{"userId":"rameshp@us.ibm.com","firstName":"Ramesh S. Palakodeti","lastName":"","email":"rameshp@us.ibm.com","userBaseDN":"uid=1A6061897,c=us,ou=bluepages,o=ibm.com","roles":[{"id":"crn:v1:icp:private:iam::::role:ClusterAdministrator"}]}],"usergroups":[{"name":"ISPW ICP support","directoryId":"fe9f6580-2912-11e9-a16c-cd3b42944d90","userGroupDN":"cn=ISPW ICP support,ou=memberlist,ou=ibmgroups,o=ibm.com","roles":[{"id":"crn:v1:icp:private:iam::::role:ClusterAdministrator"}]}],"serviceids":[]}' "https://$CL_IP:8443/idmgmt/identity/api/v1/teams/ibm-admin"

