FROM centos:7
LABEL maintainer=maxird

ENTRYPOINT ["/bin/tini", "-g", "--"]
CMD ["bash"]

RUN export JQ_VERSION=1.6 && \
    export TINI_VERSION=0.18.0 && \
    export HAPROXY_VERSION=1.8.22 && \
    export GOMPLATE_VERSION=3.5.0 && \
    date --iso-8601 > /etc/image-date && \
    echo -e "\nclean_requirements_on_remove=1" >> /etc/yum.conf && \
    sed -i 's/.*installonly_limit=.*/installonly_limit=2/g' /etc/yum.conf && \
    yum -y upgrade && \
    yum -y install epel-release && \
    yum -y install centos-release-scl-rh && \
    ( \
      if [ "7" == "7" ]; then \
        yum install -y initscripts && \
        ( \
          cd /lib/systemd/system/sysinit.target.wants/; \
          for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; \
          done \
        ); \
        rm -f /lib/systemd/system/multi-user.target.wants/*; \
        rm -f /etc/systemd/system/*.wants/*; \
        rm -f /lib/systemd/system/local-fs.target.wants/*; \
        rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
        rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
        rm -f /lib/systemd/system/basic.target.wants/*; \
        rm -f /lib/systemd/system/anaconda.target.wants/*; \
      fi; \
    ) && \
    yum -y install \
            yum-utils \
            crontabs \
            curl wget telnet openssh-server openssh-clients sshpass bind-utils nc lsof \
            tar xz bzip bzip2 zip unzip \
            which \
            scl-utils \
            haproxy openssl rsyslog \
            sudo strace net-tools iproute dnsmasq nc \
            selinux-policy policycoreutils policycoreutils-python \
            libselinux-python libsemanage-python \
            python git && \
    yum -y install \
            python-pip \
            gcc gcc-c++ ar make \
            python-devel \
            pcre-static \
            pcre-devel \
            openssl-devel \
            libffi-devel \
            dstat \
            htop && \
    yum install -y rh-git29 && \
    echo -e '#!/bin/bash\nsource scl_source enable rh-git29\n' > /etc/profile.d/rh-git29.sh && \
    pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install --upgrade cffi && \
    pip install --upgrade cryptography pyyaml jinja2 httplib2 six paramiko pycrypto && \
    pip install --upgrade docker-py && \
    pip install --upgrade ply && \
    pip install --upgrade pyhcl && \
    pip install --upgrade python-consul && \
    pip install --upgrade ansible && \
    pip install --upgrade ansible-lint && \
    pip install --upgrade yamllint && \
    mkdir -p /etc/ansible/hosts && \
    echo 'localhost ansible_connection=local' > /etc/ansible/hosts/inventory && \
    mkdir -p /build && \
    cd /build && \
    wget http://www.haproxy.org/download/1.8/src/haproxy-${HAPROXY_VERSION}.tar.gz && \
    tar xf haproxy-${HAPROXY_VERSION}.tar.gz && \
    cd haproxy-${HAPROXY_VERSION} && \
    make TARGET=linux2628 && \
    make install && \
    ln -sf /usr/local/sbin/haproxy /usr/sbin/haproxy && \
    cd / && \
    rm -rf /build && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    rm -rf /root/.cache && \
    rm -r /etc/haproxy/haproxy.cfg && \
    rm -f /etc/rsyslog.d/listen.conf && \
    echo '$ModLoad imudp' > /etc/rsyslog.d/0-udp.conf && \
    echo '$UDPServerRun 514' >> /etc/rsyslog.d/0-udp.conf && \
    echo 'local2.* /var/log/haproxy.log' > /etc/rsyslog.d/haproxy.conf && \
    echo '& ~' >> /etc/rsyslog.d/haproxy.conf && \
    wget -q -O /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 && \
    chmod +x /usr/local/bin/jq && \
    wget -q -O /bin/tini https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static-amd64 && \
    chmod +x /bin/tini && \
    wget -q -O /bin/gomplate https://github.com/hairyhenderson/gomplate/releases/download/v${GOMPLATE_VERSION}/gomplate_linux-amd64 && \
    chmod +x /bin/gomplate && \
    mkdir -p /etc/profile.d && \
    echo 'export HISTCONTROL=ignoreboth:erasedups' > /etc/profile.d/bash-history.sh && \
    chmod 0644 /etc/profile.d/bash-history.sh && \
    cd /tmp && \
    echo 'downloading aws-cli' && \
    curl -s https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip && \
    unzip awscli-bundle.zip && \
    echo 'installing aws-cli' && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    echo 'dumping version' && \
    aws --version 2>&1 && \
    echo 'cleanup' && \
    rm -rf awscli-bundle.zip awscli-bundle && \
    echo 'done' && \
    yum -y upgrade && \
    package-cleanup --oldkernels --count=1 -y && \
    yum -y clean all && \
    rm -rf /var/cache/yum/* && \
    yum -y clean all

ENV PERL5LIB=/opt/rh/rh-git29/root/usr/share/perl5/vendor_perl
ENV X_SCLS=rh-git29
ENV LD_LIBRARY_PATH=/opt/rh/httpd24/root/usr/lib64
ENV PATH=/opt/rh/rh-git29/root/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
