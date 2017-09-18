#!/bin/bash

oldpid=`cat /var/run/haproxy.pid`
/usr/sbin/haproxy -D -p /var/run/haproxy.pid -f /etc/haproxy/haproxy.cfg -sf $oldpid
now=`date`
echo "$now - reload"
echo "---------------------------------------------------------------------------"
cat /etc/haproxy/haproxy.cfg
echo "---------------------------------------------------------------------------"
