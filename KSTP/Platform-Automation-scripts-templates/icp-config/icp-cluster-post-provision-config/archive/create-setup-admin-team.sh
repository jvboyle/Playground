

#create hcms-admin Team
curl -k -X POST --header 'Content-Type: application/json' --header "Authorization: bearer $ACCESS_TOKEN" -d '{"teamId":"hcms-admin","name":"HCMSAdmin"}' https://100.120.35.17:8443/idmgmt/identity/api/v1/teams


#associate functionalid to teams
#Add user and group to the team IbmAdmin
curl -k -X PUT --header "Authorization: Bearer $ACCESS_TOKEN" --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{"teamId":"hcms-admin","name":"HCMSAdmin",
"users":
[{"userId":"cbdevops@in.ibm.com","firstName":"CloudBroker Devopsplatform","lastName":"","email":"cbdevops@in.ibm.com","userBaseDN":"uid=AVP730744,c=in,ou=bluepages,o=ibm.com","roles":[{"id":"crn:v1:icp:private:iam::::role:ClusterAdministrator"}]}},
"usergroups":[],
"serviceids":[]}'
"https://100.120.35.17:8443/idmgmt/identity/api/v1/teams/hcms-admin"
