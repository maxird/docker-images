#!/bin/bash

set -e

function migrate_data()
{
  folder=$1
  mkdir -p /data/${folder}
  if [ -d /${folder} ]; then
    cd /${folder}
    cp -R . /data/$folder
    rm -rf /${folder}
  fi
  ln -s /data/${folder} /${folder}
  chown -R rundeck:rundeck /${folder}
}

migrate_data etc/rundeck
migrate_data var/rundeck
migrate_data var/lib/rundeck
migrate_data var/log/rundeck

chown -R rundeck:rundeck /data

echo 'done'
