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
    wget -q http://apache.forsale.plus/apache/maven/maven-3/MAVEN_VERSION/binaries/apache-maven-MAVEN_VERSION-bin.tar.gz && \
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

RUN cd /tmp && \
    wget -q https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh && \
    chmod +x /tmp/install.sh && \
    /tmp/install.sh && \
    source ~/.nvm/nvm.sh && \
    nvm install stable && \
    npm install -g npm && \
    ln -s $(which node) /usr/bin/node && \
    ln -s $(which npm) /usr/bin/npm && \
    ln -s $(which npx) /usr/bin/npx && \
    echo 'done'
