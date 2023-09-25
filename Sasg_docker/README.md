# Sasg_docker for GSAR project

Dockerized JH solution

## `container`

Code for building the container. More information in its own [README.md](./container/README.md)

## `tools`

Supplementary code

### `tools/container-resiliency`

Code related to container resiliency implementation for SJHP
containers.

* `check-client-container.sh` - containers' state watchdog. Will recreate container is OpenVPN tunnel fails
* `sjhp@.service` - parametrized systemd unit file to manage SJHP containers as Linux services

### `tools/HA`

Code related to HA implementation for SJHP containers

* `lib/HA.sh` - shared HA library
* `pre-start_master.sh`/`pre-start_slave.sh` - scripts to execute before starting master/slave services
* `post-start_master.sh`/`post-start_slave.sh` - scripts to execute after starting master/slave services
* `sjhp-slave@.service` - parametrized service to manage customer in slave state
* `sjhp-watchdog.service` - service to manage watchdog script execution
* `sjhp@.service` - parametrized service to manage customer in master state
* `watchdog_slave.sh` - script to run per customer in slave state
* `watchdog.sh` - script to run per machine to manage all customers in master state
