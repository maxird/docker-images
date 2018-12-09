FROM maxird/centos:7

RUN pip install --upgrade scoutsuite
RUN pip install --upgrade awscli
RUN mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/Alfresco/prowler && \
    ln -s /opt/prowler/prowler /usr/bin/prowler
