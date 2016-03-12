FROM BASE_IMAGE:BASE_FROM_VERSION

RUN yum -y install \
            haproxy \
            openssl && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    rm -f /etc/haproxy/haproxy.cfg && \
    echo 'done'

VOLUME ["/etc/haproxy"]

EXPOSE 80 443 1936
