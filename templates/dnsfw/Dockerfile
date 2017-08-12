FROM BASE_IMAGE:BASE_FROM_VERSION

LABEL Name=dnsfw \
      Version=1.0.0

EXPOSE 53/udp 53/tcp
VOLUME /config

ADD run /app/
ADD reload /app/
RUN mkdir -p /config && \
    chmod +x /app/run /app/reload

ENV PATH $PATH:/app
WORKDIR /app


CMD ["run"]
