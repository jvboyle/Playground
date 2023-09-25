FROM ubuntu:18.04
LABEL maintainer="sokalau@us.ibm.com"

ADD ./requirements.txt /app/
ADD ./config /app/

RUN apt-get update \
  && apt-get install -y \
    build-essential \
    libffi-dev \
    libldap2-dev \
    libpq-dev \
    libsasl2-dev \
    libssl-dev \
    libssl-dev \
    netcat \
    nginx \
    openssh-client \
    python3-dev \
    python3 \
    python3-pip \
    python3-psycopg2 \ 
  && chown -R www-data:www-data /var/lib/nginx \
  && mkdir /etc/nginx/ssl \
  && update-alternatives \
    --install \
    /usr/bin/python \
    python \
    /usr/bin/python3 \
    1 \
  && python -m pip install --upgrade pip \
  && apt-get remove python2.7

# Do not combine pip upgrade with pip install.
# pip might need to run from new shell instance
# if the version gap before/after upgrade is 
# big enough
RUN python -m pip install -r /app/requirements.txt

RUN apt-get install -y ansible

ADD . /app/
WORKDIR /app/

RUN cp /app/config/gtsonsl.com.crt /etc/nginx/ssl/nginx.crt \
  && cp /app/config/gtsonsl.com.key /etc/nginx/ssl/nginx.key \
  && cp /app/config/nginx-sites.conf /etc/nginx/sites-enabled/default \
  && make -C docz html \
  && mv docz/_build/html service/static/docz \
  && rm -rf /app/docz

# PRODUCTION
#RUN echo "9.57.182.78 bluepages.ibm.com" >> /etc/hosts && wget http://bluepages.ibm.com # host dynamically generated. when creating, --add-host www.domain.com:8.8.8.8
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=US/ST=New York/L=New York/O=IBM/OU=Research/CN=ibm.com"

EXPOSE 443

CMD ./run.sh
