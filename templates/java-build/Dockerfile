FROM BASE_IMAGE:BASE_FROM_VERSION

ENV PATH=$PATH:/opt/gradle/bin:/opt/maven/bin:/opt/dependency-check/bin

RUN cd /tmp && \
    wget -q https://services.gradle.org/distributions/gradle-GRADLE_VERSION-bin.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/gradle-GRADLE_VERSION-bin.zip && \
    ln -s gradle-GRADLE_VERSION gradle && \
    rm -f /tmp/gradle-GRADLE_VERSION-bin.zip && \
    echo 'done'

RUN cd /tmp && \
    wget -q http://download.nextag.com/apache/maven/maven-3/MAVEN_VERSION/binaries/apache-maven-MAVEN_VERSION-bin.tar.gz && \
    mkdir -p /opt && \
    cd /opt && \
    tar xf /tmp/apache-maven-MAVEN_VERSION-bin.tar.gz && \
    ln -s apache-maven-MAVEN_VERSION maven && \
    rm -f /tmp/apache-maven-MAVEN_VERSION-bin.tar.gz && \
    echo 'done'

RUN cd /tmp && \
    wget -q http://dl.bintray.com/jeremy-long/owasp/dependency-check-DEPENDENCY_CHECK_VERSION-release.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/dependency-check-DEPENDENCY_CHECK_VERSION-release.zip && \
    rm -f /tmp/dependency-check-DEPENDENCY_CHECK_VERSION-release.zip && \
    file=$(find /opt/dependency-check -name '*.jar' | head -n 1) && \
    dependency-check.sh --project seed --scan "$file" --out /tmp/seed ; \
    rm -rf /tmp/seed && \
    echo 'done'
