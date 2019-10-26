#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  version=$3
  alerting=$4
  jobs=$5
  outpath="$OUTDIR/$version"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      -e "s|APP_VERSION|$version|" \
      -e "s|ALERTING_VERSION|$alerting|g" \
      -e "s|JOBS_VERSION|$jobs|g" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="docker.elastic.co/kibana/kibana"

## es:alerting:jobs
#
BASES="
  6.8.1
  7.2.0:1.2.0.0:1.2.0
"

for b in $BASES; do
  version=$(echo "$b" | awk -F ':' '{ print $1; }')
  alerting=$(echo "$b" | awk -F ':' '{ print $2; }')
  jobs=$(echo "$b" | awk -F ':' '{ print $3; }')
  process $BASE_IMAGE $version $version $alerting $jobs
done
