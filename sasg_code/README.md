Service Access Solution Gateway
===============================

|Branch|Build Status|
|------|------------|
|Master|[![Build Status](https://travis.ibm.com/SASG-ORG/sasg.svg?token=PZUFDk4EaycJz2CvpeVK&branch=master)](https://travis.ibm.com/SASG-ORG/sasg)|
|Dev|[![Build Status](https://travis.ibm.com/SASG-ORG/sasg.svg?token=PZUFDk4EaycJz2CvpeVK&branch=dev)](https://travis.ibm.com/SASG-ORG/sasg)|

This is a micro-service that allows automation (e.g., UCD or Jenkins) to configure SASG servers including VyOS, tools servers (customer dedicated segment in SL), and SASG servers (customer on-premise data center). 

# Version
The version number of SASGaaS is in [version file](./scripts/src/VERSION). GUI and API have the same version number all the time. 

# System Environmental Variables

System environmental variables can be defined and set to adjust the behaviors.

```
export SASG_DATA_DIR=<where data folder is>
export SASG_ENV=<environment keyword: DEVELOPMENT, TESTING, STAGING, PRODUCTION>
export SASG_RUNNING_PLATFORM=<CONTAINER, VM, BARE-METAL>
```

# Deployment (for production)

Install docker (and compose). The instruction is in https://docs.docker.com/engine/installation/

## Release (using Tag)

Add a tag to the current commit:
```
git tag -a 1.1 -m "my version 1.1"
```

Add a tag to a specific commit:
```
git tag -a 1.2 9fceb02
```
(Find the specific commit from 'git log' command)

Push to the origin:
```
git push origin 1.1
```

Delete a remote and local tag
```
git push --delete origin [tagname]
git tag -d [tagname]
```

## Build Docker Container
Run as a docker container.

```
git clone https://github.ibm.com/jinho/sasg.git
docker build -t sla/sasg .
docker run -d -h sasg -v /sasg_data:/sasg_data -p 443:443 --add-host bluepages.ibm.com:9.57.182.78 --name sasg sla/sasg
```

/sasg_data is the default user data location, so one can add -v host_dir:/sasg_data to maintain the states. 

NOTE: The /sasg_data should be protected in the host. 


Other useful commands:
```
docker logs sasg
docker exec -i -t sasg /bin/bash
```

## Setup Database

sudo -i -u postgres psql -h localhost
python manage.py db init
python manage.py db migrate
python manage.py db upgrade

## Move Docker Container to Production Server
Note: if the docker container is built in the production server, the docker file may be registered to docker registry.

From your local dev machine:
```
docker save -o <save image to path> <image name>
```

Move the image to the production server.

Then, load the image as a docker image:
```
docker load -i <path to image tar file>
```

# Local Installation (for development)
For development, one can run the service in the local machine using http. 

## Install Flask + Libraries
Install prerequisites.

```
sudo apt-get update
sudo apt-get install -y build-essential python-pip python-dev libssl-dev libffi-dev libsasl2-dev python-dev libldap2-dev libssl-dev nginx
```

Install python modules:

```
pip install -r ./requirements.txt
```

## Run
Download the code, and run the web server using a built-in python flask:

```
git clone https://github.ibm.com/jinho/sasg.git
python sasg.py
```

Put http://host:5000 in your browser. 
