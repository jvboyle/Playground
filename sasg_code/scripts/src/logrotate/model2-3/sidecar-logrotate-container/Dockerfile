FROM alpine:latest

COPY run.sh /root
COPY logrotate.sh /root
COPY logrotate.conf /etc/logrotate.conf

RUN apk add --update \
      curl \
      logrotate \
    && \
    rm -rf /var/cache/apk/* && rm -rf /tmp/*

CMD ["/root/run.sh"]
