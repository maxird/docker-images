FROM maxird/java:6-8

RUN export VERSION=1.9.0.Final && \
    cd /opt && \
    wget -q "http://downloads.jboss.org/keycloak/${VERSION}/keycloak-${VERSION}.tar.gz" -O - | tar -xvz && \
    ln -s keycloak-${VERSION} keycloak && \
    echo 'export PATH=$PATH:/opt/keycloak/bin' > /etc/profile.d/keycloak.sh && \
    echo '[ { \
    "realm" : "master", \
    "users" : [ {"username" : "admin", "enabled" : true, \
    "credentials" : [ {"type" : "password", "value" : "admin"} ], \
    "realmRoles" : [ "admin" ]} ]} ]' > /opt/keycloak/standalone/configuration/keycloak-add-user.json

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/standalone.sh", "-Djboss.bind.address=0.0.0.0"]
