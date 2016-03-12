FROM centos:6

RUN yum -y install \
            haproxy \
            openssl && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    rf -f /etc/haproxy/haproxy.cfg && \
    echo 'done'

VOLUME ["/etc/haproxy"]

EXPOSE 80 443 1936
