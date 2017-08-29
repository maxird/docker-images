FROM maxird/centos:6

RUN export FULL_VERSION=8u144b01 && \
    export JDK_UUID=090f390dda5b47b9b721c7dfaa008135 && \
    export VERSION=`echo $FULL_VERSION | sed -e 's|b.*||'` && \
    export BUILD=`echo $FULL_VERSION | sed -e 's|.*b||'` && \
    cd /tmp && \
    export COOKIE="Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" && \
    export URL="http://download.oracle.com/otn-pub/java/jdk/${VERSION}-b${BUILD}/${JDK_UUID}/jdk-${VERSION}-linux-x64.rpm" && \
    wget -q -t 5 --retry-connrefused --no-cookies --no-check-certificate --header "$COOKIE" "$URL" && \
    export URL="http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" && \
    wget -q -t 5 --retry-connrefused --no-cookies --no-check-certificate --header "$COOKIE" "$URL" && \
    rpm -i "jdk-${VERSION}-linux-x64.rpm" && \
    export JREBIN=`dirname $(readlink -f $(which java))` && \
    echo "JREBIN=$JREBIN" && \
    cd "$JREBIN/../lib/security" && \
    unzip -j -o /tmp/jce_policy-8.zip && \
    sed -i 's|securerandom.source=file:/dev/random|securerandom.source=file:/dev/urandom|g' "$JREBIN/../lib/security/java.security" && \
    echo 'java.net.preferIPv4Stack=true' >> "$JREBIN/../lib/net.properties" && \
    cd /tmp && \
    rm -f *.rpm *.zip
