FROM maxird/centos:7

RUN export VERSION=5.0.3 && \
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
    cd /usr/local/bin && \
    mkdir -p /builds && \
    tar cJf /builds/redis-${VERSION}.tar.xz redis* && \
    echo "done"

VOLUME ["/opt/redis/data"]
EXPOSE 6379

CMD ["/usr/local/bin/redis-server", "/opt/redis/conf/redis.conf"]
