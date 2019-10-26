FROM docker.elastic.co/kibana/kibana:7.2.0

RUN echo 'starting' && \
    if [ -n "1.2.0.0" ]; then bin/kibana-plugin install https://d3g5vo6xdbdb9a.cloudfront.net/downloads/kibana-plugins/opendistro-alerting/opendistro-alerting-1.2.0.0.zip; fi && \
    bin/kibana --optimize && \
    echo done

## more just a reminder of setting memory footprint
#
ENV ES_JAVA_OPTS -Xms1g -Xmx1g
