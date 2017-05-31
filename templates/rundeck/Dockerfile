FROM BASE_IMAGE:BASE_FROM_VERSION

RUN export VERSION=APP_VERSION && \
    export URL="https://github.com/Batix/rundeck-ansible-plugin/releases/download/${VERSION}/ansible-plugin-${VERSION}.jar" && \
    cd /var/lib/rundeck/libext && \
    curl -s -L -o "ansible-plugin-${VERSION}.jar" "$URL" && \
    echo 'done'
