#!/bin/bash

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: bearer $ACCESS_TOKEN" -d '{"crn": "crn:v1:icp:private:k8:mycluster.icp:n/poc-aiops-mcms:::"}' 'https://100.120.35.17:8443/idmgmt/identity/api/v1/teams/hcms-admin/resources' --insecure

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: bearer $ACCESS_TOKEN" -d '{"crn": "crn:v1:icp:private:k8:mycluster.icp:n/poc-aiops-mcms-core:::"}' 'https://100.120.35.17:8443/idmgmt/identity/api/v1/teams/hcms-admin/resources' --insecure

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: bearer $ACCESS_TOKEN" -d '{"crn": "crn:v1:icp:private:k8:mycluster.icp:n/cb-monitoring:::"}' 'https://100.120.35.17:8443/idmgmt/identity/api/v1/teams/hcms-admin/resources' --insecure
