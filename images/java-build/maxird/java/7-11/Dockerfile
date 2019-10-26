FROM maxird/java:7-11

ENV PATH=$PATH:/opt/gradle/bin:/opt/maven/bin:/opt/dependency-check/bin

RUN cd /tmp && \
    wget -q https://services.gradle.org/distributions/gradle-5.6.3-bin.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/gradle-5.6.3-bin.zip && \
    ln -s gradle-5.6.3 gradle && \
    rm -f /tmp/gradle-5.6.3-bin.zip && \
    echo 'done'

RUN cd /tmp && \
    wget -q https://archive.apache.org/dist/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz && \
    mkdir -p /opt && \
    cd /opt && \
    tar xf /tmp/apache-maven-3.6.2-bin.tar.gz && \
    ln -s apache-maven-3.6.2 maven && \
    rm -f /tmp/apache-maven-3.6.2-bin.tar.gz && \
    echo 'done'

RUN cd /tmp && \
    wget -q http://dl.bintray.com/jeremy-long/owasp/dependency-check-5.2.2-release.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/dependency-check-5.2.2-release.zip && \
    rm -f /tmp/dependency-check-5.2.2-release.zip && \
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
