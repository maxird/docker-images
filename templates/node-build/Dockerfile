FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

RUN export VERSION=APP_VERSION && \
    yum -y install centos-release-scl-rh && \
    yum -y install devtoolset-3-gcc devtoolset-3-gcc-c++ && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    cd /opt && \
    export BASENAME=`/bin/ls -d node-*` && \
    tar cJf "/tmp/$BASENAME+deps.tar.xz" "$BASENAME/" && \
    echo "done"
