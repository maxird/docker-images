FROM quay.io/coreos/clair:v2.0.9

ADD config.yml /config/config.yml
ADD boot.sh /boot.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/boot.sh"]
