#!/bin/bash

cd /opt/activemq/bin

if [ -z "${ACTIVEMQ_MEMORY}" ]; then
  ACTIVEMQ_MEMORY="1024"
  echo "default memory configured to ${ACTIVEMQ_MEMORY}"
fi

if [ -z "${ACTIVEMQ_ADMIN_PASSWORD}" ]; then
  ACTIVEMQ_ADMIN_PASSWORD=$(uuidgen)
  echo "generated admin password ${ACTIVEMQ_ADMIN_PASSWORD}"
fi

# if [ -z "${ACTIVEMQ_JMX_MONITOR_PASSWORD}" ]; then
#   ACTIVEMQ_JMX_MONITOR_PASSWORD=$(uuidgen)
#   echo "generated JMX monitor password ${ACTIVEMQ_JMX_MONITOR_PASSWORD}"
# fi

# if [ -z "${ACTIVEMQ_JMX_MANAGE_PASSWORD}" ]; then
#   ACTIVEMQ_JMX_MANAGE_PASSWORD=$(uuidgen)
#   echo "generated JMX manage password ${ACTIVEMQ_JMX_MANAGE_PASSWORD}"
# fi


sed -i "s/.*ACTIVEMQ_OPTS_MEMORY=.*/ACTIVEMQ_OPTS_MEMORY=\"-Xms32M -Xmx${ACTIVEMQ_MEMORY}M\"/" env

echo "admin=${ACTIVEMQ_ADMIN_PASSWORD}" > /conf/users.properties
echo "admin: ${ACTIVEMQ_ADMIN_PASSWORD}, admin" > /conf/jetty-realm.properties


exec ./activemq console
