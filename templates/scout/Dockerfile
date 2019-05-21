FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm && \
    yum install -y python36u python36u-devel && \
    pip install -U pip && \
    pip install -U virtualenv && \
    virtualenv -p python3.6 /scout && \
    cd /scout && \
    source bin/activate && \
    pip install -U scoutsuite && \
    echo 'done'
