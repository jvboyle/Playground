#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:20.04

# Install.
RUN apt-get update && apt-get install --no-install-recommends -y wget unzip gnupg netcat python curl ca-certificates lsb-release python3-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget -O- https://apt.releases.hashicorp.com/gpg --no-check-certificate | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

RUN apt-get update && apt-get -y install terraform \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# install Some Tools 
RUN curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# install required Python's packages
RUN python3.8 -m pip install pandas openpyxl

# Define working directory.
WORKDIR /root
ADD entrypoint.sh /root
RUN chmod 775 /root/*
RUN mkdir -p /root/.ssh
RUN unlink /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /SOURCE
# Define default command.
CMD /root/entrypoint.sh