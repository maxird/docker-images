FROM maxird/centos:7

RUN yum install -y ntp git bind-utils gawk curl wget tar xz gzip bzip2 zip unzip && \
    yum install -y epel-release && \
    yum install -y jq python-pip gcc python-devel openssl-devel && \
    pip install pip --upgrade && \
    pip install ansible==2.2.1.0 && \
    mkdir -p /etc/ansible/hosts && \
    echo '[local]' > /etc/ansible/hosts/inventory && \
    echo 'localhost ansible_connection=local' >> /etc/ansible/hosts/inventory && \
    echo done
