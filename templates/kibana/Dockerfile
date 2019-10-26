FROM BASE_IMAGE:BASE_FROM_VERSION

RUN echo 'starting' && \
    if [ -n "ALERTING_VERSION" ]; then bin/kibana-plugin install https://d3g5vo6xdbdb9a.cloudfront.net/downloads/kibana-plugins/opendistro-alerting/opendistro-alerting-ALERTING_VERSION.zip; fi && \
    bin/kibana --optimize && \
    echo done

## more just a reminder of setting memory footprint
#
ENV ES_JAVA_OPTS -Xms1g -Xmx1g
