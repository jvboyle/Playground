#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:20.04

# Install.
RUN apt-get update && apt-get install --no-install-recommends -y net-tools tcpdump wget unzip gnupg sshuttle netcat iputils-ping python iproute2 curl lsb-release ca-certificates wireguard\
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget -O- https://apt.releases.hashicorp.com/gpg --no-check-certificate | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

RUN apt-get update && apt-get install terraform\
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# install Some Tools 
RUN curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Define working directory.
WORKDIR /root
ADD proxy_select.sh /root
ADD entrypoint.sh /root
ADD proxy.csv /root
ADD wireguard /etc/wireguard/
RUN chmod 775 /root/*
RUN mkdir -p /root/.ssh

WORKDIR /SOURCE
# Define default command.
CMD /root/entrypoint.sh