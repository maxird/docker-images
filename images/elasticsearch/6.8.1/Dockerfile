FROM docker.elastic.co/elasticsearch/elasticsearch:6.8.1

RUN bin/elasticsearch-plugin install --batch --silent discovery-ec2 && \
    bin/elasticsearch-plugin install --batch --silent repository-s3 && \
    bin/elasticsearch-plugin install --batch --silent discovery-gce && \
    bin/elasticsearch-plugin install --batch --silent repository-gcs && \
    if [ -n "" ]; then bin/elasticsearch-plugin install --batch --silent https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-alerting/opendistro_alerting-.zip; fi && \
    if [ -n "" ]; then bin/elasticsearch-plugin install --batch --silent https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-sql/opendistro_sql-.zip; fi && \
    echo done

## more just a reminder of setting memory footprint
#
ENV ES_JAVA_OPTS -Xms1g -Xmx1g
