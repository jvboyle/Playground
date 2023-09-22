SSHKEY=/home/sasauto/.ssh/authorized_keys

sudo useradd sasauto
sudo echo "%sasauto ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

sudo mkdir -p /home/sasauto/.ssh
sudo touch /home/sasauto/.ssh/authorized_keys

sudo chmod 777 /home/sasauto
sudo chmod 777 /home/sasauto/.ssh
sudo chmod 777 /home/sasauto/.ssh/authorized_keys


sudo wget http://10.148.11.145/jvboyle/sshd_cmd_logger.sh -O /tmp/sshd_cmd_logger.sh
sudo cp /tmp/sshd_cmd_logger.sh /home/sasauto/.ssh/
sudo mkdir /var/log/hist
sudo chmod 1777 /var/log/hist

sudo cat > ${SSHKEY} <<EOL
from="10.149.99.238/32",command="~/.ssh/sshd_cmd_logger.sh  US:F:*SLASAS:SLA+SAS+Cloud+automation" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDrtnqmQey1UE/vtjdGhot399IXpJLjJZp83OsVgIwMXs6aPx1F0tAzDUbZOH4EloBXBRhy3Dg5BgiPnULaLUkxID9SXerSlhZ7w2TpLKS/ZXY5GSOJBII5VoN+U0zk6nY/RNGf0OhusayvnLUqV4T/Pz/y4rko1/M4OEt2G9OR2sioWutG9X584V/6A+PnpL2NWGVQrBqLrC0223iCcM899VRn9IYAs/re+a0YRdWj3LDWDrb73JRDFNaFOslyMFoX08dqTiYODG1RyCCLvC8tIy7JteykpkFopRgHVByAxEcSCQofJaIbzqcbAt1KVgKS5ygloi7CCAUstBAWulx/ !!US/F/*SLASAS/IBM/SLA SAS Cloud automation!!
EOL

sudo usermod -a -G automate sasauto

sudo chown -R sasauto:sasauto /home/sasauto/
sudo chmod -R 700 /home/sasauto/
sudo chmod -R 700 /home/sasauto/.ssh
