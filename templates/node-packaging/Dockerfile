FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

ENV NODE_VERSION=APP_VERSION

ADD bootstrap.sh /app/
ADD package.sh /app/

WORKDIR /app

RUN mkdir -p /out && \
    ln -sf /out /app/out
VOLUME ["/out"]

ENTRYPOINT ["/app/bootstrap.sh"]
