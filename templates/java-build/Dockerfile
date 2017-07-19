FROM BASE_IMAGE:BASE_FROM_VERSION

ENV PATH=$PATH:/opt/gradle/bin:/opt/maven/bin

RUN cd /tmp && \
    wget -q https://services.gradle.org/distributions/gradle-GRADLE_VERSION-bin.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/gradle-GRADLE_VERSION-bin.zip && \
    ln -s gradle-GRADLE_VERSION gradle && \
    echo 'done'

RUN cd /tmp && \
    wget -q http://download.nextag.com/apache/maven/maven-3/MAVEN_VERSION/binaries/apache-maven-MAVEN_VERSION-bin.tar.gz && \
    mkdir -p /opt && \
    cd /opt && \
    tar xf /tmp/apache-maven-MAVEN_VERSION-bin.tar.gz && \
    ln -s apache-maven-MAVEN_VERSION maven && \
    echo 'done'
