#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  versions=$3
  outpath="$OUTDIR/$image/$base"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|g" \
      -e "s|BASE_FROM_VERSION|$base|g" \
      -e "s|APP_VERSION|$versions|g" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="centos"

BASES="7"

VERSIONS=" \
  8.15.0 \
  8.15.1 \
  10.15.0 \
  10.15.1 \
  10.15.2 \
"

for b in $BASES; do
  process $BASE_IMAGE $b "$VERSIONS"
done
