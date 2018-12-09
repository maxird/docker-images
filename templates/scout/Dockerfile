FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

RUN pip install --upgrade scoutsuite
RUN pip install --upgrade awscli
RUN mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/Alfresco/prowler && \
    ln -s /opt/prowler/prowler /usr/bin/prowler
