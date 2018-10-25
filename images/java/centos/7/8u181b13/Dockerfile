FROM maxird/centos:7

RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    export JREBIN=$(dirname $(readlink -f $(which java))) && \
    echo "JREBIN=$JREBIN" && \
    if [ "1" == "1" ]; then \
        sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../lib/security/java.security" && \
        echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../lib/net.properties" ; \
    else \
        sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../conf/security/java.security" && \
        echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../conf/net.properties" ; \
    fi; \
    echo 'done'
