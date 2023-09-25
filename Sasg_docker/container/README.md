# Container based SASG

All configuration is supposed to be run under user `root`. Pls use `sudo` in 
case non-root user is used.

## Configure kernel (RHEL 7 only)

```bash
# Add repository
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm

# Ensure repository uses connection over TLS
sed -i".$(date "+%Y%m%d_%H%M").bak" "s/http/https/" /etc/yum.repos.d/elrepo.repo

# List available kernels
yum --disablerepo="*" --enablerepo="elrepo-kernel" list available

# Install updated kernel
yum --enablerepo=elrepo-kernel install kernel-lt

# Backup original grub
cp "/etc/default/grub" "/etc/default/grub.$(date "+%Y%m%d_%H%M").bak"

# Update kernel to load
sed -i "s/^\(GRUB_DEFAULT\)=.*$/\1=0/" "/etc/default/grub"

# Check if updated correctly (GRUB_DEFAULT=0 line should be present)
cat "/etc/default/grub"

# Update grub
grub2-mkconfig -o "/boot/grub2/grub.cfg"

reboot

# After reboot is complete check the kernel
uname -a

# Remove outdated kernel to avoid it to automatically take over as
# part of the update process
yum remove kernel
```

## Configure docker

```bash
# Install pre-requisites
yum install \
  device-mapper-persistent-data \
  lvm2 \
  python2 \
  yum-utils

# Enable extra-repository
subscription-manager repos --enable=rhel-7-server-extras-rpms

# Add docker repo
yum-config-manager --add-repo "https://download.docker.com/linux/centos/docker-ce.repo"

################################################################
#Ipvaln needs experimental enabled Update docker 

# Install docker
yum -y install docker-ce

# Enable & start docker daemon
systemctl enable docker && systemctl start docker

# Install docker compose
curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o "/usr/local/bin/docker-compose"
chmod +x "/usr/local/bin/docker-compose"

# Modify docker daemon settings
vi "/etc/docker/daemon.json"
```

The last action above will open docker daemon json file. Make sure
the following statement is present there

```json
{
  "experimental": true
}
```

Save the changes to docker daemon config file and restart docker daemon

```bash
systemctl restart docker
```

## Configure docker networks

### IPvlan network 

Make sure the following variables are set before you run 
the command to create the network:

* `VIP_SUBNET`
* `HOST_OS_GW`
* `ENDPOINT_NIC`

Pls find how to determine the values for them below

#### `VIP_SUBNET`

Use your VIPs to determine the correct subnet. Example:

> If my VIPs are 10.148.11.142 and 10.148.11.143 , a valid subnet would be 10.148.11.0/24 or 10.148.11.128/27

#### `HOST_OS_GW`

To determine `HOST_OS_GW` one should run `ip route` and use default
gateway (the ip from _default via_ line) as the value for this variable

```bash
HOST_OS_GW="$(ip route | grep "default via" | awk '{ print $3 }')
```

#### `ENDPOINT_NIC`

Run `ip addr` and use your VIPs to determine the correct NIC. Example:

```bash
ip addr
```

```
eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
  link/ether 06:62:f1:b5:1a:2d brd ff:ff:ff:ff:ff:ff
  inet 10.148.11.141/26 brd 10.148.11.191 scope global eth0
      valid_lft forever preferred_lft forever

eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
  link/ether 16:62:f1:a5:1a:3d brd ff:ff:ff:ff:ff:ff
  inet 192.168.1.100/24 brd 10.148.11.191 scope global eth0
      valid_lft forever preferred_lft forever
```

> If my VIPs are 10.148.11.142 and 10.148.11.143
>
> * use **eth0** for `ENDPOINT_NIC`

#### Run command

```bash
# Make sure the output of the following command is correct
echo "VIP_SUBNET    = ${VIP_SUBNET}"
echo "HOST_OS_GW    = ${HOST_OS_GW}"
echo "ENDPOINT_NIC  = ${ENDPOINT_NIC}"

# Create docker network
docker network create \
  -d ipvlan \
  --subnet="${VIP_SUBNET}" \
  --gateway="${HOST_OS_GW}" \
  -o parent="${ENDPOINT_NIC}" \
  ipvlan
```

### Host-only network

Host-only network is used to nat traffic from the container IP to the
Docker host for the VPN return traffic to work. This network will be
static, and the same for all Accounts unless conflict is found, were
conflict, exception process will be followed.

For all SASGs (including dual homed with multiple NICs), the Internet Facing NIC should be used in this command

```bash
docker network create --subnet="158.87.34.0/30" --gateway="158.87.34.1" -o parent=<Internet Facing NIC> host-only
```
