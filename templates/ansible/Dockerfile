FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

RUN pip install --upgrade pip && \
    pip install --upgrade ansible && \
    pip install --upgrade docker-py && \
    pip install --upgrade python-consul && \
    pip install --upgrade pyhcl && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    rm -rf /root/.cache && \
    echo 'done'
