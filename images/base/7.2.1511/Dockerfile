FROM centos:7.2.1511
MAINTAINER maxird

RUN export JQ_VERSION=1.5 && \
    export CONSUL_VERSION=0.6.4 && \
    export ENVCONSUL_VERSION=0.6.1 && \
    export CONSUL_REPLICATE_VERSION=0.2.0 && \
    export CONSUL_TEMPLATE_VERSION=0.14.0 && \
    export VAULT_VERSION=0.5.2 && \
    export VAULT_SSH_HELPER_VERSION=0.1.1 && \
    yum -y update && \
    yum -y install \
            curl wget telnet openssh-clients bind-utils nc \
            tar xz bzip bzip2 zip unzip \
            which \
            scl-utils \
            openssh-clients \
            haproxy openssl \
            sudo strace net-tools iproute dnsmasq \
            selinux-policy policycoreutils policycoreutils-python \
            libselinux-python libsemanage-python \
            python \
            epel-release && \
    yum -y install \
            python-pip \
            openssl-devel \
            python-cffi \
            libffi-devel \
            htop && \
    yum -y install gcc python-devel && \
    pip install --upgrade pip && \
    pip install --upgrade ansible && \
    pip install --upgrade docker-py && \
    pip install --upgrade python-consul && \
    pip install --upgrade pyhcl && \
    yum -y erase gcc python-devel cpp glibc-devel glibc-headers kernel-headers && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    rm -rf /root/.cache && \
    rm -r /etc/haproxy/haproxy.cfg && \
    wget -q -O /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 && \
    chmod +x /usr/local/bin/jq && \
    cd /usr/local/bin && \
    wget -q -O - https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip | python -c "import zipfile,sys,StringIO;zipfile.ZipFile(StringIO.StringIO(sys.stdin.read())).extractall('.')" && \
    wget -q -O - https://releases.hashicorp.com/consul-replicate/${CONSUL_REPLICATE_VERSION}/consul-replicate_${CONSUL_REPLICATE_VERSION}_linux_amd64.zip | python -c "import zipfile,sys,StringIO;zipfile.ZipFile(StringIO.StringIO(sys.stdin.read())).extractall('.')" && \
    wget -q -O - https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip | python -c "import zipfile,sys,StringIO;zipfile.ZipFile(StringIO.StringIO(sys.stdin.read())).extractall('.')" && \
    wget -q -O - https://releases.hashicorp.com/envconsul/${ENVCONSUL_VERSION}/envconsul_${ENVCONSUL_VERSION}_linux_amd64.zip | python -c "import zipfile,sys,StringIO;zipfile.ZipFile(StringIO.StringIO(sys.stdin.read())).extractall('.')" && \
    wget -q -O - https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip | python -c "import zipfile,sys,StringIO;zipfile.ZipFile(StringIO.StringIO(sys.stdin.read())).extractall('.')" && \
    wget -q -O - https://releases.hashicorp.com/vault-ssh-helper/${VAULT_SSH_HELPER_VERSION}/vault-ssh-helper_${VAULT_SSH_HELPER_VERSION}_linux_amd64.zip | python -c "import zipfile,sys,StringIO;zipfile.ZipFile(StringIO.StringIO(sys.stdin.read())).extractall('.')" && \
    chmod +x consul* envconsul vault* && \
    mkdir -p /etc/consul.d
