FROM maxird/node-build:6

ENV NODE_VERSION=4.4.3

ADD bootstrap.sh /app/
ADD package.sh /app/

WORKDIR /app

RUN mkdir -p /out && \
    ln -sf /out /app/out
VOLUME ["/out"]

ENTRYPOINT ["/app/bootstrap.sh"]
