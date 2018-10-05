#!/bin/bash
echo "Services: [$@]"

CERT=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
if [ ! -f ${CERT} ]; then
  echo 'Unable to read certificate'
  exit 1
fi

NS=$(</var/run/secrets/kubernetes.io/serviceaccount/namespace)
if [ $? -ne 0 ]; then
  echo 'Unable to read namespace'
  exit 1
fi

TOKEN=$(</var/run/secrets/kubernetes.io/serviceaccount/token)
if [ $? -ne 0 ]; then
  echo 'Unable to read token'
  exit 1
fi

function check
{
  svc=$1
  data=$(
    curl -s \
        --cacert $CERT \
        --header "Authorization: Bearer ${TOKEN}" \
        https://kubernetes.default.svc/api/v1/namespaces/${NS}/endpoints/${svc}
  )
  # echo "${data}" | jq .
  code=$(echo "${data}" | jq -r '.code' 2> /dev/null)
  if [ "${code}" != "null" ]; then
    echo "${svc}.${NS}: FAIL"
    return 1
  fi
  count=$(echo "${data}" | jq -r '.subsets[].addresses | length' 2> /dev/null)
  if [ -z "${count}" ]; then
    echo "${svc}.${NS}: WAIT"
    return 2
  fi
  if [ "${count}" == "0" ]; then
    echo "${svc}.${NS}: WAIT"
    return 2
  fi
  echo "${svc}.${NS}: OK (${count})"
  return 0
}

for svc in "$@"; do
  echo "Waiting for ${svc}.${NS}..."
  until check ${svc}; do
    sleep 3
  done
done
