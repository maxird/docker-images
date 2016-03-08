FROM maxird/node:7-4.3.2

RUN export VERSION=0 && \
    yum -y install centos-release-scl-rh && \
    yum -y install devtoolset-3-gcc devtoolset-3-gcc-c++ && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    cd /opt && \
    export BASENAME=`/bin/ls -d node-*` && \
    tar cJf "/tmp/$BASENAME+deps.tar.xz" "$BASENAME/" && \
    echo "done"
