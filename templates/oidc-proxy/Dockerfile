FROM maxird/centos:7

WORKDIR /app
ADD https://github.com/keycloak/keycloak-gatekeeper/releases/download/v2.3.0/keycloak-proxy-linux-amd64 /app/keycloak-proxy
RUN chmod +x /app/keycloak-proxy
EXPOSE 80
CMD ["./keycloak-proxy", "--config", "/app/config.yml"]
