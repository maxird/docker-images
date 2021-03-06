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
  sql=$5
  jobs=$6
  outpath="$OUTDIR/$version"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      -e "s|APP_VERSION|$version|" \
      -e "s|ALERTING_VERSION|$alerting|g" \
      -e "s|SQL_VERSION|$sql|g" \
      -e "s|JOBS_VERSION|$jobs|g" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="docker.elastic.co/elasticsearch/elasticsearch"

## es:alerting:sql:jobs
#
BASES="
  6.8.1
  7.2.0:1.2.0.0:1.2.0.0:1.2.0
"

for b in $BASES; do
  version=$(echo "$b" | awk -F ':' '{ print $1; }')
  alerting=$(echo "$b" | awk -F ':' '{ print $2; }')
  sql=$(echo "$b" | awk -F ':' '{ print $3; }')
  jobs=$(echo "$b" | awk -F ':' '{ print $4; }')
  process $BASE_IMAGE $version $version $alerting $sql $jobs
done
