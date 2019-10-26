FROM BASE_IMAGE:BASE_FROM_VERSION

RUN bin/elasticsearch-plugin install --batch --silent discovery-ec2 && \
    bin/elasticsearch-plugin install --batch --silent repository-s3 && \
    bin/elasticsearch-plugin install --batch --silent discovery-gce && \
    bin/elasticsearch-plugin install --batch --silent repository-gcs && \
    if [ -n "ALERTING_VERSION" ]; then bin/elasticsearch-plugin install --batch --silent https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-alerting/opendistro_alerting-ALERTING_VERSION.zip; fi && \
    if [ -n "SQL_VERSION" ]; then bin/elasticsearch-plugin install --batch --silent https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-sql/opendistro_sql-SQL_VERSION.zip; fi && \
    echo done

## more just a reminder of setting memory footprint
#
ENV ES_JAVA_OPTS -Xms1g -Xmx1g
