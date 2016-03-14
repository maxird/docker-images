#!/bin/bash

if [ -z "$CONSUL" ]; then
  export CONSUL=consul:8500
fi

if [ -n "$PROXY_TAG" ]; then
  export PROXY_TAG="${PROXY_TAG}."
fi
if [ -n "$PROXY_DC" ]; then
  export PROXY_DC="@${PROXY_DC}"
fi
if [ -z "$PROXY_PORT" ]; then
  export PROXY_PORT=80
fi
if [ -z "$PROXY_TAG" ]; then
  export PROXY_TAG=
fi
if [ -z "$PROXY_DC" ]; then
  export PROXY_DC=
fi
if [ -z "$PROXY_SERVICE" ]; then
  export PROXY_SERVICE=
fi
if [ -z "$PROXY_PASSWORD" ]; then
  export PROXY_PASSWORD=`uuidgen`
fi

echo "---------------------------------------------------------------------------"
echo "CONSUL:               [$CONSUL]"
echo "PROXY_PORT:           [$PROXY_PORT]"
echo "PROXY_SERVICE:        [$PROXY_SERVICE]"
echo "PROXY_DC:             [$PROXY_DC]"
echo "PROXY_TAG:            [$PROXY_TAG]"
echo "PROXY_PASSWORD:       [$PROXY_PASSWORD]"
echo "---------------------------------------------------------------------------"

echo "validating environment settings"
retcode=0
if [ -z "$PROXY_SERVICE" ]; then
  echo "error: require PROXY_SERVICE to know what service to proxy"
  retcode=1
fi

if [ $retcode == 1 ]; then
  exit $retcode
fi

echo "altering template to match proxy environment"
# transfer PROXY_ and SERVICE_ entries to string replacements
#
rm -f /proxy/commands.sed
for i in `env | grep PROXY_`; do
  echo $i | sed 's|=| |' | awk '{print "s|" $1 "|" $2 "|g" }' >> commands.sed
done
for i in `env | grep SERVICE_`; do
  echo $i | sed 's|=| |' | awk '{print "s|" $1 "|" $2 "|g" }' >> commands.sed
done

sed -i -f /proxy/commands.sed /proxy/template.ctmpl

echo "---------------------------------------------------------------------------"
cat /proxy/template.ctmpl
echo "---------------------------------------------------------------------------"

echo "starting consul monitoring"
/usr/local/bin/consul-template \
    -consul $CONSUL \
    -wait "1s:10s" \
    -template template.ctmpl:/etc/haproxy/haproxy.cfg:/proxy/reload.sh

retcode=$?

if [ $retcode != 12 ]; then
  echo "Should only be here if process requested exit: $?"
fi

exit $retcode
