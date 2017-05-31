FROM jordan/rundeck:2.8.2

RUN export VERSION=2.0.2 && \
    export URL="https://github.com/Batix/rundeck-ansible-plugin/releases/download/${VERSION}/ansible-plugin-${VERSION}.jar" && \
    cd /var/lib/rundeck/libext && \
    curl -s -L -o "ansible-plugin-${VERSION}.jar" "$URL" && \
    echo 'done'
