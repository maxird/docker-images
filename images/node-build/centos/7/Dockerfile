FROM maxird/centos:7

RUN cd /opt && \
    yum -y install centos-release-scl-rh && \
    yum -y install make devtoolset-3-gcc devtoolset-3-gcc-c++ && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    export ALL_VERSIONS="   4.1.2   4.2.6   4.3.1   4.3.2   5.7.0   5.7.1 " && \
    export SAVED_PATH=$PATH && \
    export PATH=$PATH:/opt/node/bin && \
    for VERSION in $ALL_VERSIONS; do \
      echo "downloading $VERSION" && \
      wget -q https://nodejs.org/dist/v${VERSION}/node-v${VERSION}-linux-x64.tar.xz && \
      echo "unpacking $VERSION" && \
      tar xf node-v${VERSION}-linux-x64.tar.xz && \
      rm node-v${VERSION}-linux-x64.tar.xz && \
      ln -s node-v${VERSION}-linux-x64 node && \
      echo "installing $VERSION" && \
      npm -g upgrade npm && \
      npm -g install nodemon && \
      npm -g install bunyan && \
      rm -f node && \
      export BASENAME="node-v${VERSION}-linux-x64" && \
      export PLATFORM=`cat /etc/system-release | awk '{ if(match($3, /\d*\.\d*/)) print $3; else print $4 }' | cut -c1` && \
      echo "compressing $VERSION" && \
      tar cJf "/tmp/$BASENAME+deps.el${PLATFORM}.tar.xz" "$BASENAME/" ; \
    done && \
    echo "done"
