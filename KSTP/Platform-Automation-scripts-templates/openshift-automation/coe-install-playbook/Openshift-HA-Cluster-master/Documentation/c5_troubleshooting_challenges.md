##### CHAPTER 5
# Troubleshooting and Challenges faced

We faced several challenges and errors during the course of this project. With the help of online resources and our mentor, we were able to troubleshoot most of the errors. A list of errors and their troubleshooting steps are mentioned below.

### 4.1 Troubleshooting
1. __Control plane pods didn't come up__
    - We faced this error several times. There are many reasons that can make this error to come up. 
    - This error was mainly associated with the next 2 errors.
4. __`Unable to connect to the server: dial tcp: lookup {master_hostname} on {DNS_server}:53: no such host`__
    - This error occurs when the master is unable to resolve the names of nodes. 
    - It was resolved by adding the IP and hostnames in `/etc/hosts`, described in Section 3.1.2
6. __`The connection to the server {master_hostname} was refused - did you specify the right host or port?`__
    - This is the most frequent error in OpenShift installation. Since the error message lacks any information about the cause, it is often difficult to debug and rectify.
    - Debugging: Exact problem can be found by looking at the logs. API logs can be found by `master-logs api api`, ETCD logs by `master-logs etcd etcd` and Controller logs by `master-logs controllers controllers`
    - We found two issues leading to this error.
      - First, the ETCD was hosted at the private IP of the node, but the Master API was looking for it on the public IP. Hence, making API to fail again and again. Since the Master API was not available on the desired port, any connection to that port was refused. This error was resolved by mentioning `openshift_ip` and `openshift_public_ip` in ETCD section in the Inventory file.
      - Second, the liveliness probe responsible for keeping the pods alive had some bug. It was confirmed that the bug exists, by viewing the RedHat bug report forums. This bug was resolved in the next commit of OpenShift repository. So, this issue can be solved just by fetching the latest commit from the Openshift-Ansible repository.
2. __`Unable to add physical volume '/dev/xvdc'`__
    - This occurs when the installer is unable to initialize the physical volume used for ETCD or Origin storage
    - It is resolved by removing all the existing logical volumes, volume group and physical volume using `lvremove`, `vgremove`, `pvremove` respectively from the disk. 
    - After this, follow the steps given in Setup 3.1.10 to correctly setup the storage
3. __`Available memory (7.6 GiB) is too far below recommended value (16.0 GiB)`__
    - The recommended memory for Master and Infra is 16GB, and 8GB for Compute. Consider upgrading the hardware for production use.
    - For testing purposes, this validation check can be skipped by adding `memory_availability` in `openshift_disable_check` in inventory file.
    - Validation check for disk can also be skipped by adding `disk_availability` in `openshift_disable_check` in inventory file.
    - This resolution is also mention in Inventory file in Section 3.2
5. __`Failed to query Docker API. Is docker running on this host?`__
    - This error occurs when Docker-storage is incorrectly setup or Docker is failing to start.
    - It is resolved by installing latest version of Docker and setting up Docker storage
    - The steps are mentioned in Section 3.1.11
8. __`Could not find csr for nodes (Approve node certificates when bootstrapping)`__
    - This error is related to firewall of the cluster
    - It is resolved by adding the following variable in Inventory file under `[OSEv3:vars]`, which enables the usage of Firewalld as a firewall for the cluster
      `os_firewall_use_firewalld=True`
9. __Redirecting between the VMs after installing the HA cluster__
    - This error occured when trying to access the Web Console, after successfully installing the HA cluster. 
    - It is caused due repetitive deployment of the cluster, in other words, running the `deploy_cluster.yml` playbook multiple times without uninstalling the previous instance. This creates an issue with the authentication to the Web Console.
    - It can only be resolved by completely uninstalling the cluster and setting it up all again.
7. __`htpasswd` file not found__
    - This error occurs when the installer is unable to find `htpasswd` file under `/etc/origin/master/`.
    - It is resolved by touching this file before invoking the prerequisites playbook 
      `touch /etc/origin/master/htpasswd`
10. DNS
