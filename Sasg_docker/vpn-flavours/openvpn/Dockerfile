#
# SASGaaS Shared Docker Host Deployment
#
FROM gliderlabs/alpine:3.8
LABEL maintainer="Andrei.Sokalau1@ibm.com"

# Run updates and install development tools
RUN \
  apk add --no-cache \
    bash \
    bash-completion \
    bash-doc \
    conntrack-tools \
    curl \
    grep \
    ipsec-tools \
    ipset \
    iptables \
    logrotate \
    netcat-openbsd \
    nginx \
    openvpn \
    tcpdump \
    ulogd \
  && mkdir -p /etc/nginx/SSL \
  && mkdir -p /opt/sasg/ \
  && mkdir -p /opt/sasg/sasg_install \
  && mkdir -p /sasg/tmp \
  && mkdir -p /var/log/nginx \
  && rm -rf /etc/logrotate.d/* \
  && rm /etc/ulogd.conf \
  && rm /etc/nginx/conf.d/default.conf \
  && rm -f /usr/share/nginx/html/*
ADD Build_files/sasglogs /etc/logrotate.d/
ADD Build_files/ulogd.conf /etc/
ADD Build_files/nginx/* /etc/nginx/SSL/
ADD Build_files/nginx.conf /etc/nginx/
ADD sasg_install /opt/sasg/sasg_install
RUN chmod 600 /etc/logrotate.d/sasglogs
ADD run.sh /opt/sasg/
WORKDIR /opt/sasg/
CMD ./run.sh
HEALTHCHECK \
  --start-period=180s \
  --interval=120s \
  --timeout=60s \
  CMD ping -c 10 -q 3.0.0.1
