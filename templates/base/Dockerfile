FROM centos:BASE_FROM_VERSION
MAINTAINER maxird

ENV JQ_VERSION=1.5
ENV CONSUL_VERSION=0.6.3
ENV ENVCONSUL_VERSION=0.6.1
ENV CONSUL_REPLICATE_VERSION=0.2.0
ENV CONSUL_TEMPLATE_VERSION=0.13.0
ENV VAULT_VERSION=0.5.1
ENV VAULT_SSH_HELPER_VERSION=0.1.1

RUN yum -y update && \
    yum -y install \
            curl wget telnet openssh-clients bind-utils nc \
            tar xz bzip bzip2 zip unzip \
            which \
            scl-utils \
            openssh-clients \
            sudo strace \
            policycoreutils policycoreutils-python \
            libselinux-python libsemanage-python \
            python \
            epel-release && \
    yum -y install \
            ansible \
            htop && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
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
    mkdir -p /usr/local/lib/consul/ui && \
    cd /usr/local/lib/consul/ui && \
    wget -q -O - https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip | python -c "import zipfile,sys,StringIO;zipfile.ZipFile(StringIO.StringIO(sys.stdin.read())).extractall('.')" && \
    mkdir -p /etc/consul.d
