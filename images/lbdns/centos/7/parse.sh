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

for line in $list; do
  port=$(echo "${line}" | awk -F ',' '{print $1}')
  name=$(echo "${line}" | awk -F ',' '{print $2}')
  domain=$(echo "${line}" | awk -F ',' '{print $3}')
  target_port=$(echo "${line}" | awk -F ',' '{print $4}')
  if [ -n "${target_port}" ]; then
    temp=${target_port}
    target_port=${name}
    name=${domain}
    domain=${temp}
  else
    target_port=${port}
  fi
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
  # http-request    set-header X-Forwarded-Port %[dst_port]
  default_backend backend-${name}

backend backend-${name}"

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
