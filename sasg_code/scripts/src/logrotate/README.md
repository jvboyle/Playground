# SJHP LOGROTATE SUBSYSTEM

## Models

* **Model 1** - Shared Jumphosts Plus Muti client , with GSNI SDS - single container
  per customer - PUSH ALL logs to gsni Infra ( push logs with curl to sds (shell
  script on docker hosts ).
* **Model 2** - Shared Jumphosts Plus Muti clien , with OUT gsni SDS - Side card
  container Pushing logs to Customer SDS ( push logs with curl to sds ( side car )
* **Model 3** - Dedicated Jumphosts ( customer Premise ) - Side car pushing logs
  to dedicated SDS ( push logs with curl to sds ( side car )

## Folders

* `model1-gsni` - model1-related files. Single script should be run by cron, rotate
  logs and upload archives to remote machine. EE IP is used as an upload target
* `model2-3` - models 2/3-related files. Sidecar container should run as a supplement
  to the main sasgc service and perform rotate at midnight. `docker-compose.yml` file
  in the same folder serves as an example. Upload target - EE if with the first octet
  replaced by 2 (i.e. 2.x.x.x) in order to route through the tunnel
* `nginx-listener` - docker container to be run at EE machine and to listen for 3443
  port. Only IPs provided in `.env` file under `ENV_ALLOWED_IPS` var can upload files

```ini
ENV_ALLOWED_IPS=1.2.3.4 5.6.7.8 9.10.11.12
```

## Listener

The following is required for listener to work:

* List of allowed IPs (search for the example above)
* Path to SSL certificate & key on the machine (pls correct `docker-compose.yml` with
  correct paths)

## Supplementary Updates

### Vars file updates

* `LOGROTATE_MODEL` variable added to vars file

### Flows configuration updates

* `sasg_iptables.sh` (Sasg_docker repo) includes opening **3443** port along with default
  EE's **3333**

## Installation

* **Model 1** - files from correspondent folder should be put to /sasg/bin and the main script
  should be added to cron
* **Model 2/3** - make sure image is loaded to the target SJHP system and "proper
  `docker-compose.yml` is used.
* EE side - make sure nginx-listener image is loaded to EE side and container is started
  (via compose). Pls remember to update allowed hosts in `.env` file and restart (=recreate)
  the container via compose after new upload target is added (machine for model1 & customer
  for model2/3)
