FROM maxird/centos:7

RUN echo 'starting' && \
    yum -y localinstall https://d3pxv6yz143wms.cloudfront.net/11.0.4.11.1/java-11-amazon-corretto-devel-11.0.4.11-1.x86_64.rpm && \
    echo 'done'
RUN echo 'start' && \
    export JREBIN=$(dirname $(readlink -f $(which java))) && \
    echo "JREBIN=$JREBIN" && \
    if [ "11" == "11" ]; then \
      sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../conf/security/java.security" && \
      echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../lib/net.properties"; \
    else \
      sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../lib/security/java.security" && \
      echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../lib/net.properties"; \
    fi; \
    echo 'done'
