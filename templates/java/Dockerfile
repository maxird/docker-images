FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

ENV JAVA_HOME=/usr/java/APP_FOLDER-amd/jre

RUN cd /tmp && \
    export COOKIE="Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" && \
    wget -q -t 5 --retry-connrefused --no-cookies --no-check-certificate --header "$COOKIE" "APP_URL" && \
    export URL="" && \
    if [ "APP_JCE" == "1" ]; then \
        wget -q -t 5 \
            --retry-connrefused \
            --no-cookies \
            --no-check-certificate \
            --header "$COOKIE" \
            "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip"; \
    fi && \
    rpm -i "APP_FILENAME" ; \
    export JREBIN=$(dirname $(readlink -f $(which java))) && \
    echo "JREBIN=$JREBIN" && \
    if [ "APP_JCE" == "1" ]; then \
        cd "$JREBIN/../lib/security" ; \
        unzip -j -o /tmp/jce_policy-8.zip ; \
    fi; \
    if [ "APP_JCE" == "1" ]; then \
        sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../lib/security/java.security" && \
        echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../lib/net.properties" ; \
    else \
        sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../conf/security/java.security" && \
        echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../conf/net.properties" ; \
    fi; \
    cd /tmp && \
    rm -f *.rpm *.zip
