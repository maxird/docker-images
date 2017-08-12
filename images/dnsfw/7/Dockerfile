FROM maxird/centos:7

LABEL Name=dnsfw \
      Version=1.0.0

EXPOSE 53/udp 53/tcp
VOLUME /config

ADD run /app/
ADD reload /app/
ADD rotate /app/
RUN mkdir -p /config && \
    chmod +x /app/run /app/reload /app/rotate

ENV PATH $PATH:/app
WORKDIR /app


CMD ["run"]
