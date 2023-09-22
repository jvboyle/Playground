FROM php:7.4.30-apache

ARG PHPIPAM_VERSION=1.5.0 

# Install required deb packages
RUN apt-get update && apt-get install --no-install-recommends -y gettext-base wget unzip ca-certificates bash libgmp-dev zlib1g-dev libpng-dev\
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN set -x \
    && wget --no-verbose -O phpipam-v${PHPIPAM_VERSION}.tgz https://github.com/phpipam/phpipam/releases/download/v${PHPIPAM_VERSION}/phpipam-v${PHPIPAM_VERSION}.tgz \
    && tar -xvf phpipam-v${PHPIPAM_VERSION}.tgz --strip-components=1 --directory /var/www/html \
    && rm phpipam-v${PHPIPAM_VERSION}.tgz

# Configure apache and required PHP modules
RUN docker-php-ext-configure mysqli --with-mysqli=mysqlnd && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install gd && \
    docker-php-ext-install gmp && \
    docker-php-ext-install sockets && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install gettext && \
    echo ". /etc/environment" >> /etc/apache2/envvars && \
    a2enmod rewrite

# Use system environment variables into config.php
COPY config_template.php /var/www/html/
COPY docker-php-entrypoint /usr/local/bin/
RUN chown -R www-data:www-data /var/www/html/
EXPOSE 80