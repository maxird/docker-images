FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

RUN pip install --upgrade scoutsuite
RUN pip install --upgrade awscli
RUN pip install --upgrade pyyaml===4.2b1
RUN mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/Alfresco/prowler && \
    ln -s /opt/prowler/prowler /usr/bin/prowler
