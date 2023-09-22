az acr login --name kstp0core0acr.azurecr.io

docker tag jvb_phpipam:latest kstp0core0acr.azurecr.io/jvb_phpipam:latest

docker push kstp0core0acr.azurecr.io/jvb_phpipam:latest