FROM maxird/centos:7

RUN echo 'starting' && \
    yum -y localinstall https://d3pxv6yz143wms.cloudfront.net/8.232.09.1/java-1.8.0-amazon-corretto-devel-1.8.0_232.b09-1.x86_64.rpm && \
    echo 'done'
RUN echo 'start' && \
    export JREBIN=$(dirname $(readlink -f $(which java))) && \
    echo "JREBIN=$JREBIN" && \
    if [ "1.8.0" == "11" ]; then \
      sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../conf/security/java.security" && \
      echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../lib/net.properties"; \
    else \
      sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../lib/security/java.security" && \
      echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../lib/net.properties"; \
    fi; \
    echo 'done'
