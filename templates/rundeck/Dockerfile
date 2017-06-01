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

ADD bootstrap.sh /

VOLUME /var/rundeck

## rundeck configuration
#
VOLUME /etc/rundeck

## rundeck projects
#
VOLUME /var/rundeck

## rundeck persistence
#
VOLUME /var/lib/rundeck/data
VOLUME /var/lib/rundeck/logs

## local mysql persistence
#
VOLUME /var/lib/mysql

## log storage
#
VOLUME /var/log/rundeck

# VOLUME /opt/rundeck-plugins


CMD ["/bootstrap.sh"]
