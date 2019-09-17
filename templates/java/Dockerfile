FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

RUN echo 'starting' && \
    yum -y localinstall APP_URL && \
    echo 'done'
RUN echo 'start' && \
    export JREBIN=$(dirname $(readlink -f $(which java))) && \
    echo "JREBIN=$JREBIN" && \
    if [ "APP_VERSION" == "11" ]; then \
      sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../conf/security/java.security" && \
      echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../lib/net.properties"; \
    else \
      sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../lib/security/java.security" && \
      echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../lib/net.properties"; \
    fi; \
    echo 'done'
