#!/bin/bash

echo "$#:[$*]"

service rundeckd start
stty sane
sleep 5
tail -f /var/log/rundeck/*.log
exit 0
