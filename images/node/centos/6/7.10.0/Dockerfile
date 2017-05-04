FROM maxird/centos:6

RUN export VERSION=7.10.0 && \
    cd /opt && \
    wget -q https://nodejs.org/dist/v${VERSION}/node-v${VERSION}-linux-x64.tar.xz && \
    tar xf node-v${VERSION}-linux-x64.tar.xz && \
    rm node-v${VERSION}-linux-x64.tar.xz && \
    ln -s node-v${VERSION}-linux-x64 node && \
    export PATH=/opt/node/bin:$PATH && \
    alternatives --install /usr/bin/node node /opt/node-v${VERSION}-linux-x64/bin/node 0 && \
    alternatives --install /usr/bin/npm npm /opt/node-v${VERSION}-linux-x64/bin/npm 0 && \
    alternatives --install /usr/bin/nodemon nodemon /opt/node-v${VERSION}-linux-x64/bin/nodemon 0 && \
    alternatives --install /usr/bin/bunyan bunyan /opt/node-v${VERSION}-linux-x64/bin/bunyan 0 && \
    alternatives --install /usr/bin/nsp nsp /opt/node-v${VERSION}-linux-x64/bin/nsp 0 && \
    npm -g upgrade npm --log-level=warn && \
    npm -g install nodemon --production --log-level=warn && \
    npm -g install bunyan --production --log-level=warn && \
    npm -g install nsp --production --log-level=warn && \
    echo 'export PATH=/opt/node/bin:$PATH' > /etc/profile.d/node.sh
