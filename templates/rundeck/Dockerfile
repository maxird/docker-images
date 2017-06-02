FROM BASE_IMAGE

RUN export RUNDECK_VERSION=BASE_FROM_VERSION && \
    export PLUGIN_VERSION=APP_VERSION && \
    rpm -Uvh http://repo.rundeck.org/latest.rpm && \
    yum install -y rundeck rundeck-cli rundeck-config && \
    mkdir -p /var/lib/rundeck/libext && \
    cd /var/lib/rundeck/libext && \
    export URL="https://github.com/Batix/rundeck-ansible-plugin/releases/download/${PLUGIN_VERSION}/ansible-plugin-${PLUGIN_VERSION}.jar" && \
    wget -q $URL && \
    chown rundeck:rundeck * && \
    chkconfig --add rundeckd && \
    pip install ansible==2.3.0.0 && \
    echo 'done'

ADD install.sh /

RUN export RUNDECK_VERSION=BASE_FROM_VERSION && \
    export PLUGIN_VERSION=APP_VERSION && \
    /install.sh

ADD bootstrap.sh /

VOLUME /data

USER rundeck

CMD ["/bootstrap.sh"]
