FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

RUN yum install -y openssl-devel python-devel libffi-devel gcc && \
    cd /tmp && \
    git clone --depth 0 -b master https://github.com/maxird/elastalert.git && \
    cd elastalert && \
    python setup.py install && \
    cd / && \
    rm -rf /tmp/elastalert && \
    yum -y remove openssl-devel python-devel gcc && \
    mkdir -p /opt/elastalert/rules && \
    mkdir -p /opt/elastalert/config && \
    mkdir -p /opt/elastalert/sample && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    yum -y clean all && \
    echo 'done'

ADD startup /opt/elastalert/startup
ADD config.yml /opt/elastalert/sample/config.yml

VOLUME /opt/elastalert/rules
VOLUME /opt/elastalert/config

CMD ["/opt/elastalert/startup"]
