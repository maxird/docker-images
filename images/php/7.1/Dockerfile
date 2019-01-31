FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update --yes
RUN apt-get install \
    apt-utils \
    zip \
    unzip \
    apache2 \
    mariadb-client \
    software-properties-common \
    --yes

RUN add-apt-repository ppa:ondrej/php --yes
RUN apt-get update --yes

RUN apt-get install \
        libapache2-mod-php7.1 \
        php7.1 \
        php7.1-cli \
        php7.1-curl \
        php7.1-gd \
        php7.1-imagick \
        php7.1-intl \
        php7.1-mbstring \
        php7.1-mcrypt \
        php7.1-mysql \
        php7.1-recode \
        php7.1-soap \
        php7.1-tidy \
        php7.1-xml \
        php7.1-xmlrpc \
        php7.1-zip \
        --yes

RUN a2enmod rewrite && \
    a2enmod remoteip && \
    mkdir -p /docker-entrypoint.d && \
    sed -i \
        -e '/ErrorLog/d' \
        -e '/CustomLog/d' \
        /etc/apache2/sites-enabled/000-default.conf

COPY 999-logging.conf /etc/apache2/conf-enabled/
COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD /docker-entrypoint.sh

# ONBUILD COPY /docker-entrypoint.d/* /docker-entrypoint.d/
