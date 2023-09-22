#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:20.04

# Install.
RUN apt-get update && apt-get install --no-install-recommends -y net-tools python ansible\
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /root
ADD entrypoint.sh /root
RUN chmod 775 /root/*
RUN mkdir -p /root/.ssh

WORKDIR /SOURCE
# Define default command.
CMD /root/entrypoint.sh