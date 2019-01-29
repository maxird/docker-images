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
        libapache2-mod-phpAPP_VERSION \
        phpAPP_VERSION \
        phpAPP_VERSION-cli \
        phpAPP_VERSION-curl \
        phpAPP_VERSION-gd \
        phpAPP_VERSION-imagick \
        phpAPP_VERSION-intl \
        phpAPP_VERSION-mbstring \
        phpAPP_VERSION-mcrypt \
        phpAPP_VERSION-mysql \
        phpAPP_VERSION-recode \
        phpAPP_VERSION-soap \
        phpAPP_VERSION-tidy \
        phpAPP_VERSION-xml \
        phpAPP_VERSION-xmlrpc \
        phpAPP_VERSION-zip \
        --yes

RUN a2enmod rewrite && \
    mkdir -p /docker-entrypoint.d

COPY 000-logging.conf /etc/apache2/conf-enabled/
COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD /docker-entrypoint.sh

ONBUILD COPY /docker-entrypoint.d/* /docker-entrypoint.d/
