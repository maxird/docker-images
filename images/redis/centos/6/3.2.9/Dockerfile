FROM maxird/centos:6

RUN export VERSION=3.2.9 && \
    yum -y clean all && \
    touch /var/lib/rpm/* && \
    yum -y install gcc make && \
    yum -y clean all && \
    cd /tmp && \
    wget -q http://download.redis.io/releases/redis-${VERSION}.tar.gz -O - | tar -xvz && \
    (cd /tmp/redis-${VERSION} && make install) && \
    mkdir -p /opt/redis/data && \
    mkdir -p /opt/redis/conf && \
    sed \
        -e 's|# bind 127\.0\.0\.1|bind 0\.0\.0\.0|g' \
        -e 's|dir \./|dir /opt/redis/data|g' \
        /tmp/redis-${VERSION}/redis.conf > /opt/redis/conf/redis.conf && \
    cp /tmp/redis-${VERSION}/sentinel.conf /opt/redis/conf/ && \
    cd / && \
    rm -rf /tmp/redis-${VERSION} && \
    yum -y remove gcc cloog-ppl cpp glibc-devel glibc-headers kernel-headers libgomp libmpc mpfr ppl && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    yum -y clean all && \
    echo "done"

VOLUME ["/opt/redis/data"]
EXPOSE 6379

ENTRYPOINT ["/usr/local/bin/redis-server"]
CMD ["/opt/redis/conf/redis.conf"]
