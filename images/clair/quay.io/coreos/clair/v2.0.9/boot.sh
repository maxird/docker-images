#!/bin/sh

if [ -z "${DB_HOST}" ]; then
  echo 'DB_HOST must be provided'
  exit 1
fi

sed -i "s|DATABASE|${DB_HOST}|g" /config/config.yml

if [ -z "$1" ]; then
  exec /clair -config /config/config.yml
else
  exec /clair $*
fi
