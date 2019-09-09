#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  version=$3
  outpath="$OUTDIR/$version"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      -e "s|APP_VERSION|$version|" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="amazon/opendistro-for-elasticsearch"

BASES="
  1.1.0:7.1.1
"

for b in $BASES; do
  od_base=$(echo "$b" | awk -F ':' '{ print $1; }')
  es_base=$(echo "$b" | awk -F ':' '{ print $2; }')
  process $BASE_IMAGE $od_base $es_base
done
