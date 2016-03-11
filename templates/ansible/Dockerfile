FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

RUN yum -y install python-pip && \
    pip install --upgrade pip && \
    pip install --upgrade ansible && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    echo 'done'
