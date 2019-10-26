FROM docker.elastic.co/kibana/kibana:6.8.1

RUN echo 'starting' && \
    if [ -n "" ]; then bin/kibana-plugin install https://d3g5vo6xdbdb9a.cloudfront.net/downloads/kibana-plugins/opendistro-alerting/opendistro-alerting-.zip; fi && \
    bin/kibana --optimize && \
    echo done

## more just a reminder of setting memory footprint
#
ENV ES_JAVA_OPTS -Xms1g -Xmx1g
