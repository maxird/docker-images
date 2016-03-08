#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $PWD
cd $SRCDIR

eval `docker-machine env dm0`
docker pull maxird/centos:6
docker pull maxird/centos:7
docker pull maxird/java:6-8
docker pull maxird/java:7-8
docker pull maxird/node:6-4.3.2
docker pull maxird/node:7-4.3.2
docker pull maxird/redis:6-3.0.7
docker pull maxird/redis:7-3.0.7
docker pull maxird/activemq:6-8-5.13.2
docker pull maxird/activemq:7-8-5.13.2
docker pull maxird/tomcat:6-8-8.0.32
docker pull maxird/tomcat:7-8-8.0.32
docker pull maxird/cordra:6-8-1.0.7
docker pull maxird/cordra:7-8-1.0.7
docker pull maxird/keycloak:6-8-1.9.0.Final
docker pull maxird/keycloak:7-8-1.9.0.Final
docker pull maxird/node-build:6-4.3.2-0
docker pull maxird/node-build:7-4.3.2-0

popd

