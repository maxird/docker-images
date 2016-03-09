#!/bin/bash

function usage
{
  echo "usage: trigger-hub-build.sh image-name"
  exit 1
}


IMAGE=$1

if [ -z "$IMAGE" ]; then
  usage
fi

if [ "$IMAGE" = "--help" ]; then
  usage
fi


TOKEN=`cat ./.triggers.json | jq -r ".[\"$IMAGE\"]" 2>/dev/null`

if [ "$TOKEN" = "null" ]; then
  echo "error: unable to locate image $IMAGE"
  usage
fi

if [ -z "$TOKEN" ]; then
  echo "error: unable to locate image $IMAGE"
  usage
fi

URL="https://registry.hub.docker.com/u/maxird/${IMAGE}/trigger/${TOKEN}/"

echo "URL [$URL]"

curl -v -s -H "Content-Type: application/json" --data '{"build": true}' -X POST $URL

echo ""
