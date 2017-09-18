#!/bin/bash

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
