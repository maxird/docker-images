FROM maxird/centos:7

ENV JAVA_HOME=/usr/java/jdk1.8.0_152/jre

RUN cd /tmp && \
    export COOKIE="Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" && \
    wget -q -t 5 --retry-connrefused --no-cookies --no-check-certificate --header "$COOKIE" "http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-x64.rpm" && \
    export URL="" && \
    if [ "1" == "1" ]; then \
        wget -q -t 5 \
            --retry-connrefused \
            --no-cookies \
            --no-check-certificate \
            --header "$COOKIE" \
            "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip"; \
    fi && \
    rpm -i "jdk-8u152-linux-x64.rpm" ; \
    export JREBIN=$(dirname $(readlink -f $(which java))) && \
    echo "JREBIN=$JREBIN" && \
    if [ "1" == "1" ]; then \
        cd "$JREBIN/../lib/security" ; \
        unzip -j -o /tmp/jce_policy-8.zip ; \
    fi; \
    if [ "1" == "1" ]; then \
        sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../lib/security/java.security" && \
        echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../lib/net.properties" ; \
    else \
        sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../conf/security/java.security" && \
        echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../conf/net.properties" ; \
    fi; \
    cd /tmp && \
    rm -f *.rpm *.zip
