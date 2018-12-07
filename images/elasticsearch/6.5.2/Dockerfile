FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.2

RUN bin/elasticsearch-plugin install --batch --silent discovery-ec2 && \
    bin/elasticsearch-plugin install --batch --silent repository-s3 && \
    bin/elasticsearch-plugin install --batch --silent discovery-gce && \
    bin/elasticsearch-plugin install --batch --silent repository-gcs && \
    echo done

## more just a reminder of setting memory footprint
#
ENV ES_JAVA_OPTS -Xms1g -Xmx1g
