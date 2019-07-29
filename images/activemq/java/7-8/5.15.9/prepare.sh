#!/bin/bash

mkdir -p /data
rm -rf /opt/activemq/data
ln -s /data /opt/activemq/data

mkdir -p /conf
mv /opt/activemq/conf /
ln -s /conf /opt/activemq/conf

rm -rf /opt/activemq/webapps-demo

mv /opt/activemq/bin/env /conf/
ln -s /conf/env /opt/activemq/bin/env
