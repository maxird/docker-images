#!/bin/bash

mkdir -p /var/log
touch /var/log/haproxy.log

rsyslogd -n &

tail -f /var/log/haproxy.log &

./parse.sh
result=$?
if [ ${result} -eq 2 ]; then
  exit 1
fi

./reload.sh
while true; do
  sleep 60
  ./parse.sh
  result=$?
  if [ ${result} -eq 1 ]; then
    ./reload.sh
  fi
done
