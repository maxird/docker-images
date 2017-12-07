FROM maxird/java:7-9

ENV PATH=$PATH:/opt/gradle/bin:/opt/maven/bin

RUN cd /tmp && \
    wget -q https://services.gradle.org/distributions/gradle-4.4-bin.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/gradle-4.4-bin.zip && \
    ln -s gradle-4.4 gradle && \
    rm -f /tmp/gradle-4.4-bin.zip && \
    echo 'done'

RUN cd /tmp && \
    wget -q http://download.nextag.com/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz && \
    mkdir -p /opt && \
    cd /opt && \
    tar xf /tmp/apache-maven-3.5.2-bin.tar.gz && \
    ln -s apache-maven-3.5.2 maven && \
    rm -f /tmp/apache-maven-3.5.2-bin.tar.gz && \
    echo 'done'
