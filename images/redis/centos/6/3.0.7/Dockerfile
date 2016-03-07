FROM maxird/centos:6

RUN export VERSION=3.0.7 && \
    yum -y install gcc make && \
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
    yum -y remove gcc make && \
    yum -y remove cpp glibc-devel glibc-headers kernel-headers libgomp libmpc mpfr && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    cd / && \
    rm -rf /tmp/redis-${VERSION} && \
    echo "done"

VOLUME ["/opt/redis/data"]
EXPOSE 6379

ENTRYPOINT ["/usr/local/bin/redis-server"]
CMD ["/opt/redis/conf/redis.conf"]
