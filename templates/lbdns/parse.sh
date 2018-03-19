#!/bin/bash

echo "scanning environment"

list_named=$(env | grep '^LB_.*=' | awk -F '=' '{print $2}')
list_inline=$(env | grep '^LB=' | awk -F '=' '{print $2}' | tr '::' '\n')

list="
  ${list_named}
  ${list_inline}
"

count=0
for line in $list; do
  count=$(($count + 1))
done

if [ $count -eq 0 ]; then
  echo 'No LB_name or LB environment variables present'
  exit 2
fi

CONTENT=""

## domain,name,port[,health-uri[,target_port]]
#
for line in $list; do
  one=$(echo "${line}" | awk -F ',' '{print $1}')
  two=$(echo "${line}" | awk -F ',' '{print $2}')
  three=$(echo "${line}" | awk -F ',' '{print $3}')
  four=$(echo "${line}" | awk -F ',' '{print $4}')
  five=$(echo "${line}" | awk -F ',' '{print $5}')

  domain=${one}
  name=${two}
  port=${three}

  if [ -n "${five}" ]; then
    health_uri=${four}
    target_port=${five}
  elif [ -n "${four}" ]; then
    health_uri=${four}
    target_port=${port}
  else
    health_uri="/"
    target_port=${port}
  fi

  echo "${name}.${domain}:${target_port}${health_uri} via ${port}"
  echo "looking for servers for ${name}.${domain}..."
  addresses=$(
    nslookup ${name}.${domain} |
    tail -n +3 |
    grep 'Address:.*' |
    awk '{ print $2; }' |
    sort ; exit ${PIPESTATUS[0]}
  )
  error=$?
  if [ ${error} -ne 0 ]; then
    echo "ERROR: nslookup error ${error} on ${name}.${domain}"
  else
    CONTENT="${CONTENT}
frontend ${name}
    bind *:${port}
    option logasap
    http-request    set-header X-Forwarded-Port %[dst_port]
    default_backend backend-${name}

backend backend-${name}
    balance static-rr
    option httpchk GET ${health_uri}
    http-request set-header X-Forwarded-Port %[dst_port]"

    for address in ${addresses}; do
      echo "    adding ${address}:${target_port}..."
      CONTENT="${CONTENT}
    server ${name}-${address}-${port} ${address}:${target_port} check"
    done

    CONTENT="${CONTENT}
"
  fi
done


## add the header
HEADER=$(cat header.cfg)
CONTENT="
${HEADER}

${CONTENT}
"

echo "${CONTENT}" > /tmp/new.cfg
mkdir -p /etc/haproxy
if [ ! -f /etc/haproxy/haproxy.cfg ]; then
  result=1
else
  diff /etc/haproxy/haproxy.cfg /tmp/new.cfg
  result=$?
fi
echo "result:[$result]"
if [ $result -ne 0 ]; then
  echo 'updating proxy configuration...'
  mv -f /tmp/new.cfg /etc/haproxy/haproxy.cfg
  exit 1
else
  echo 'no changes to proxy configuration'
  exit 0
fi
