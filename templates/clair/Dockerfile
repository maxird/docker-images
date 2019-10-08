FROM quay.io/coreos/clair:BASE_FROM_VERSION

ADD config.yml /config/config.yml
ADD boot.sh /boot.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/boot.sh"]
