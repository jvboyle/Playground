FROM gliderlabs/alpine:3.8

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
    libreswan \
    logrotate \
    netcat-openbsd \
    nginx \
    tcpdump \
    ulogd \
  && mkdir -p \
    /opt/sasg/ \
    /opt/sasg/sasg_install \
    /etc/nginx/SSL \
    /sasg/tmp \
    /var/log/nginx \
  && rm -rf \
    /etc/logrotate.d/* \
    /etc/ulogd.conf \
    /etc/nginx/conf.d/default.conf \
    /usr/share/nginx/html

COPY Build_files/sasglogs /etc/logrotate.d/
COPY Build_files/ulogd.conf /etc/
COPY Build_files/nginx/* /etc/nginx/SSL/
COPY Build_files/nginx.conf /etc/nginx/
COPY sasg_install /opt/sasg/sasg_install
COPY run.sh /opt/sasg/

RUN chmod 600 /etc/logrotate.d/sasglogs

WORKDIR /opt/sasg/

CMD [ "./run.sh" ]
