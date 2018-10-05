#!/bin/bash

echo "Services: [$@]"
for service in "$@"; do
  until nslookup ${service} > /dev/null; do
    echo "Waiting for ${service}..."
    sleep 2
  done
done
