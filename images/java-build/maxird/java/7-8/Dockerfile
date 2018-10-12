FROM maxird/java:7-8

ENV PATH=$PATH:/opt/gradle/bin:/opt/maven/bin:/opt/dependency-check/bin

RUN cd /tmp && \
    wget -q https://services.gradle.org/distributions/gradle-4.10.2-bin.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/gradle-4.10.2-bin.zip && \
    ln -s gradle-4.10.2 gradle && \
    rm -f /tmp/gradle-4.10.2-bin.zip && \
    echo 'done'

RUN cd /tmp && \
    wget -q http://apache.forsale.plus/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz && \
    mkdir -p /opt && \
    cd /opt && \
    tar xf /tmp/apache-maven-3.5.4-bin.tar.gz && \
    ln -s apache-maven-3.5.4 maven && \
    rm -f /tmp/apache-maven-3.5.4-bin.tar.gz && \
    echo 'done'

RUN cd /tmp && \
    wget -q http://dl.bintray.com/jeremy-long/owasp/dependency-check-3.3.2-release.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/dependency-check-3.3.2-release.zip && \
    rm -f /tmp/dependency-check-3.3.2-release.zip && \
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
