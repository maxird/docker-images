#!/bin/bash

mkdir -p /var/log
touch /var/log/haproxy.log

if [ -z "${NO_LOGGING}" ]; then
  echo 'enhanced logging is enabled'
  rsyslogd -n &
  tail -F /var/log/haproxy.log 2> /dev/null &
else
  echo 'enhanced logging is disabled'
fi

./parse.sh
result=$?
if [ ${result} -eq 2 ]; then
  exit 1
fi

./reload.sh
while true; do
  sleep 60
  > /var/log/haproxy.log
  ./parse.sh
  result=$?
  if [ ${result} -eq 1 ]; then
    ./reload.sh
  fi
done
