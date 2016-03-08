FROM maxird/node:6-4.3.2

RUN export VERSION=0 && \
    yum -y install centos-release-scl-rh && \
    yum -y install devtoolset-3-gcc devtoolset-3-gcc-c++ && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    cd /opt && \
    export BASENAME=`/bin/ls -d node-*` && \
    export PLATFORM=`cat /etc/system-release | awk '{ print $3 }' | cut -c1` && \
    tar cJf "/tmp/$BASENAME+deps.el${PLATFORM}.tar.xz" "$BASENAME/" && \
    echo "done"
