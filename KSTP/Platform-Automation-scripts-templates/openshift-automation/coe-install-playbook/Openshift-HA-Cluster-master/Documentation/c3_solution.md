##### CHAPTER 3
# SOLUTION

### 3.1 Solution steps
The solution includes several steps, each representing a different part of the OpenShift cluster. The steps need to be performed on the control host. There are a few manual configurations to be done before executing the playbooks at 13th step. The steps are:
 1. Setup hostnames of all nodes
 1. Add entries in `/etc/hosts`
 1. Establish keyless SSH login
 1. Configure DNS on the nodes
 2. Create Inventory file
 1. Enable the repos required for OpenShift Origin
 2. Clone the installation playbooks
 1. Install required packages
 1. Restart services
 1. Setup ETCD and Origin Volumes
 1. Setup Docker storage
 1. Create empty directories
 1. Run the Ansible playbooks
 1. Create OpenShift user accounts


#### 3.1.1 Setup hostnames of all nodes
 - This command creates or overwrites any existing hostname of the machine (replace `{hostname}` with your hostname)
    <pre>hostnamectl set-hostname <b>{hostname}</b></pre>
 - __Note__ : Existing hostname can be retreived by command `hostname`
 - __Note__ : Existing hostnames can be used. If the machines have no hostnames, hostnames should be assigned in following pattern.
   - *Masters* should be named as `master1.domain.com`, ...
   - *Infra* should be named as `infra1.domain.com`, ...
   - *Compute* should be named as `compute1.domain.com`, ...

#### 3.1.2 Add entries in `/etc/hosts`
 - Add the IPs and hostnames of the nodes in `/etc/hosts` file in the following manner
    ```sh
    IP              hostname
    ```
 - Example:
    ```sh
    192.168.0.100   master.domain.com
    192.168.0.101   infra.domain.com
    192.168.0.102   compute.domain.com
    ```
       
#### 3.1.3 Establish keyless SSH login
 - Generate SSH keys 
   <pre>ssh-keygen -f ~/.ssh/id_rsa -N ''</pre>
 - Copy SSH keys to other nodes to enable the masters to communicate with each other
    <pre>
    for host in <b>{hosts}</b> ; 
    do 
        ssh-copy-id -i ~/.ssh/id_rsa.pub $host; 
    done
   </pre>
 - __Note__ : Replace `{hosts}` by the hostnames of all the nodes in the cluster, seperated by a space
 - __Note__ : The above step requires SSH password of each of the nodes. So, if it prompts, please enter SSH password of the individual machines.

#### 3.1.4 Configure DNS
 - This step allows the nodes to resolve hostnames to IPs of respective nodes. Also, the following parameter allows NetworkManager to modify the network according to the cluster.
 - Edit the __NM_CONTROLLED__ parameter for NetworkManager
    -  Add the following line in all the files with following path (`{xxxx}` can vary from machine to machine)
    -  File path : `/etc/sysconfig/network-scripts/ifcfg-{xxxx}`
    -  Example file names : `ifcfg-eth0`, `ifcfg-eth1`
    -  Line : `NM_CONTROLLED=yes`
    -  __Note__ : If this parameter already set to `no`, change it to `yes`
 - Edit the __PEERDNS__ parameter
    -  Add the following line in all the files with following path (`{xxxx}` can vary from machine to machine)
    -  File path : `/etc/sysconfig/network-scripts/ifcfg-{xxxx}`
    -  Example file names : `ifcfg-eth0`, `ifcfg-eth1`
    -  Line : `PEERDNS=yes`
    -  __Note__ : If this parameter already set to `no`, change it to `yes`
 - Reload the network configurations
    - The connections (`eth0`, `eth1`, ...) need to be reloaded before proceeded further
      ```sh
      nmcli connection down eth0
      nmcli connection reload
      nmcli connection up eth0
      ```
 - Install the DNSMasq package on all nodes using this command
    - `ansible -i inventory nodes -a 'yum install dnsmasq'`
 - Configure __Wildcard entry__ in DNSMasq on all nodes
    - Add the following line at the end of DNSMasq configuration file
    - DNSMasq config file path : `/etc/dnsmasq.conf`
    - Line : <pre>address=/apps.domain_name.com/<b>{ip_address_of_the_infra_node}</b></pre>
    - Example : `address=/apps.domain.com/192.168.0.101`

#### 3.1.5 Create Inventory file
 - Please refer __Section 3.2__ for creating the Inventory file.

#### 3.1.6 Enable the repos required for OpenShift Origin
 - Go to the directory where the inventory file is located using `cd`
 - Install EPEL repo on the control node and disable it. Leaving is enabled can create issues later in the installation
   ```sh
    ansible -i inventory nodes -a 'yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
    ansible -i inventory nodes -a ‘sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo’
    ```
 - Install Ansible package from EPEL repo and subscribe to additional RHEL repos
    ```sh
    ansible -i inventory nodes -a ‘yum -y --enablerepo=epel install ansible pyOpenSSL’
    ansible -i inventory nodes-a ‘subscription-manager repos \
	--enable="rhel-7-server-rpms" \
    --enable="rhel-7-server-extras-rpms" ‘
   ```

#### 3.1.7 Clone the installation playbooks
 -  The installation playbooks are located in this Github repo. It is required to clone this repo and change it's working branch to 3.11
    ```sh
    git clone https://github.com/openshift/openshift-ansible.git
    cd openshift-ansible && git fetch && git checkout release-3.11
    cd ../
    ```

#### 3.1.8 Install required packages
  - Install the following packages using `yum` package manager on all the nodes. These are required by the OpenShift installation
    ```sh
    ansible -i inventory nodes -a ‘yum -y install wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct lvm2’
    ansible -i inventory nodes -a ‘yum -y install docker.x86_64 docker-distribution’
    ```

#### 3.1.9 Restart services
 - It is required to restart the services on all the nodes after changing their configuration. This enables the services to update their configuration to the latest. It can be done using `systemctl` command
   ```sh
    ansible -i inventory nodes -a ‘systemctl enable dnsmasq’
    ansible -i inventory nodes -a ‘systemctl restart dnsmasq’
    ansible -i inventory nodes -a ‘systemctl enable NetwokManager’
    ansible -i inventory nodes -a ‘systemctl start NetworkManager’
    ansible -i inventory nodes -a ‘systemctl enable firewalld’
    ansible -i inventory nodes -a ‘systemctl start firewalld’
   ```

#### 3.1.10 Setup ETCD and Origin Volumes
 - Follow this sequence on all __master__ and __infra__ nodes
     - __Note__ : Replace `{disk_name}` with the name of disk on which ETCD is to be mounted. Example: `xvdc`
     - __Note__ : Replace `{disk_size}` with size of the required ETCD storage. Example: `20G`
     - Execute the following to create the logical volume for ETCD and formatting it with XFS file-system
        <pre>
        pvcreate /dev/<b>{disk_name}</b>
        vgcreate node-vg /dev/<b>{disk_name}</b>
        lvcreate -n etcd-lv -L <b>{disk_size}</b> node-vg
        mkfs.xfs /dev/mapper/node--vg-etcd—lv
        mkdir /var/lib/etcd</pre>
     - Edit the following file and add the following line to end of it
        - File path : `/etc/fstab`
        - Line : `/dev/mapper/node--vg-etcd--lv /var/lib/etcd xfs defaults 0 0`
     - Mount the ETCD partition
       ```sh
       mount -a
       ```
 - Follow this sequence on all __compute__ nodes
     - __Note__ : Replace `{disk_name}` with the name of disk on which Origin is to be mounted. Example: `xvdc`
     - __Note__ : Replace `{disk_size}` with size of the required Origin storage. Example: `20G`
     - Execute the following to create the logical volume for Origin and formatting it with XFS file-system
        <pre>
        pvcreate /dev/<b>{disk_name}</b>
        vgcreate node-vg /dev/<b>{disk_name}</b>
        lvcreate -n origin-lv -L <b>{disk_size}</b> node-vg
        mkfs.xfs /dev/mapper/node--vg-origin—lv
        mkdir /var/lib/origin</pre>
     - Edit the following file and add the following line to end of it
        - File path : `/etc/fstab`
        - Line : `/dev/mapper/node--vg-origin--lv /var/lib/origin xfs defaults 0 0`
     - Mount the Origin partition
       ```sh
       mount -a
       ```
       
#### 3.1.11 Setup Docker Storage
 - Remove old Docker-storage configuration
    ```sh
    cd /etc/sysconfig/
    systemctl stop docker
    rm -rf /var/lib/docker/
    rm -f docker-storage
    rm -f docker-storage-setup
    ```
 - Create the new _docker-storage-setup_ file. Replace `{storage_size}` by size of the storage to be configured. Example: `50GB`
    ```sh
    cat <<EOF > docker-storage-setup
    VG=node-vg
    DATA_SIZE={storage_size}
    EOF
    ```
 - Reload Docker to accept new configuration
    ```sh
    docker-storage-setup
    systemctl daemon-reload
    systemctl enable docker
    systemctl restart docker
    ```
 - __Note__ : New configuration can be verified by running `docker info` and looking for storage setup.

#### 3.1.12 Create empty directories
 - Cluster requires the folowing empty directories to write data into. These directories represent a part of OpenShift.
    ```sh
    mkdir /var/lib/openshift
    mkdir /var/lib/docker
    mkdir /var/lib/containers
    mkdir /var/lib/origin
    mkdir /var/lib/origin/openshift.local.volumes
    mkdir /var/log 
    mkdir -p /etc/origin/master/
    ```
 - Touch the following file using `touch` command. This file is used by OpenShift for authentication and login into Web Console. This file will be populated later in the installation.
    ```sh
    touch /etc/origin/master/htpasswd
    ```
 
#### 3.1.13 Run the Ansible playbooks
 - First, run the prerequisites playbook that will setup all the required configurations and install packages used by OpenShift. This step shouldn't take more than 15 minutes
    ```sh
    ansible-playbook -i inventory openshift-ansible/playbooks/prerequisites.yml
    ```
 - Then, run the deploy-cluster playbook that'll install the cluster on the selected nodes. This step can take upto 1 hour to complete.
    ```sh
    ansible-playbook -i inventory openshift-ansible/playbooks/deploy_cluster.yml
    ```
 - __Note__ : More verbose output can be obtained by adding `-vvv` parameter at the end of above commands

#### 3.1.14 Create OpenShift user accounts
 - We use htpasswd for simple authentication for login into OpenShift cluster. Replace {username} with desired username and {password} with desired password
    ```sh
    htpasswd -b /etc/origin/master/htpasswd {username} {password}
    ```
 - Replace {username} with the username of the account
    ```sh
    oc adm policy add-cluster-role-to-user cluster-admin {username}
    ```
 
 ___
 
### 3.2 Inventory file

Ansible Inventory file stores all the configuration required to install the cluster. The final inventory file of our project is attached below. 

<pre>
[OSEv3:children]
masters
nodes
etcd
lb

[OSEv3:vars]
ansible_ssh_user=root
openshift_release=<b>v3.11</b>
openshift_deployment_type=origin
openshift_master_default_subdomain=<b>apps.gtslabs.com</b>
openshift_docker_insecure_registries=172.30.0.0/16,localhost:5000
os_firewall_use_firewalld=true
openshift_master_console_port=<b>8443</b>
openshift_master_api_port=<b>8443</b>
openshift_master_cluster_method=native
openshift_disable_check=memory_availability,disk_availability
openshift_master_identity_providers=[{'name': 'htpasswd_auth','login': 'true', 'challenge': 'true','kind': 'HTPasswdPasswordIdentityProvider',}]
openshift_master_htpasswd_users=<b>{'admin': '$apr1$AN9wzSeA$W/lJqrglIucSMIwG7aNmM1'}</b>
osm_cluster_network_cidr=10.128.0.0/14
openshift_portal_net=172.30.0.0/16 
openshift_enable_unsupported_configurations=True
use_openshift_sdn=true
os_sdn_network_plugin_name='redhat/openshift-ovs-multitenant'

[masters]
<b>CoE-Redhat3-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-master" openshift_node_problem_detector_install=true
<b>CoE-Redhat4-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-master-infra" openshift_node_problem_detector_install=true
<b>CoE-Redhat5-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-master-infra" openshift_node_problem_detector_install=true

[lb]
<b>CoE-Redhat6-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-infra" openshift_node_problem_detector_install=true

[etcd]
<b>CoE-Redhat3-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-master" openshift_node_problem_detector_install=true
<b>CoE-Redhat4-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-master-infra" openshift_node_problem_detector_install=true
<b>CoE-Redhat5-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-master-infra" openshift_node_problem_detector_install=true

[nodes]
<b>CoE-Redhat3-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-master" openshift_node_problem_detector_install=true
<b>CoE-Redhat4-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-master-infra" openshift_node_problem_detector_install=true
<b>CoE-Redhat5-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-master-infra" openshift_node_problem_detector_install=true
<b>CoE-Redhat6-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-infra" openshift_node_problem_detector_install=true
<b>CoE-Redhat7-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-compute" openshift_node_problem_detector_install=true
<b>CoE-Redhat8-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-compute" openshift_node_problem_detector_install=true
<b>CoE-Redhat9-softlayer.gtslabs.com</b> openshift_ip=<b>x.x.x.x</b> openshift_public_ip=<b>x.x.x.x</b> openshift_schedulable=true openshift_node_group_name="node-config-compute" openshift_node_problem_detector_install=true
</pre>

 - `[OSEv3:children]` group defines all the groups including masters, etcd, nodes, lb, nfs, etc.
 - `[OSEv3:vars]` group includes all the variables that define the configuration of the cluster
     - `ansible_ssh_user` allows ssh based auth without requiring a password.
     - `openshift_release` defines the version of OpenShift to be installed
     - `openshift_deployment_type` defines the type of OpenShift cluster, out of `origin` & `openshift-enterprise`
     - `openshift_master_default_subdomain` defines the default subdomain to use for exposed routes. It needs a wildcard DNS
     - `openshift_docker_insecure_registries` specifies the insecure Docker registries for OpenShift to use
     - `os_firewall_use_firewalld`, it defines usage of firewalld
     - `openshift_master_console_port` defines the port where console will be listening to
     - `openshift_master_api_port` defines the port where Master API will be listening to
     - `openshift_master_cluster_method` defines the clustering method of the Load Balancer
     - `openshift_disable_check` defines the health checks that have to be skipped during deployment of cluster
     - `openshift_master_identity_providers` defines the htpasswd authentication configurations 
     - `openshift_master_htpasswd_users` specifies the OpenShift user and their hashed password
     - `osm_cluster_network_cidr` defines the address space for the Pods and the maximum number of Pods in the cluster
     - `openshift_portal_net` defines the address space for the Services and the maximum number of Services in the cluster
     - `use_openshift_sdn` allows the use of OpenShift SDN plugin
     - `os_sdn_network_plugin_name` defines the plugin name for SDN
 - `[masters]`, `[etcd]`, `[lb]`, `[nodes]` includes information about all the respective node group. We need to specify the hostnames of the nodes along with other parameters
    - `openshift_schedulable` sets the schedulability of the nodes
    - `openshift_node_group_name` identifies the node as master, infra, compute, etc... 
    - `openshift_node_problem_detector_install` tells whether to install Node Problem Detector on particular node
    - `openshift_ip` defines the private IP of the node
    - `openshift_public_ip` defines the public IP of the node
    - __Note__ : Whichever node is defined under `[lb]` group, the playbooks install __HAProxy Load Balancer__ on that particular node

 ___

### 3.3 Authentication to OCP Web Console
 
After successful installation of the OCP cluster, web console can be accessed via the hostname of the load balancer. For example, web console in this case can be accessed using `https://CoE-Redhat6-softlayer.gtslabs.com`. Be sure to add the IP and hostname in `/etc/hosts` of the machine on which web console is opened. Otherwise, the browser cannot resolve the hostname.
Console can be accessed via the following credentials. These credentials can be changed by adding their hash in `openshift_master_htpasswd_users` in Inventory file.
 - ID : "admin"
 - Password : "adm-password"
 
 The hash for the password can be changed using this command:
  - Command: `htpasswd -nb {username} {password}`
  - Example: `htpasswd -nb admin adm-password`
  
  
