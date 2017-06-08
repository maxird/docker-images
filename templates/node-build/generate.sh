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

BASES="6 7"

VERSIONS=" \
  4.7.3 \
  6.9.5 \
  6.10.0 \
  6.10.1 \
  6.10.2 \
  6.10.3 \
  6.11.0 \
  7.8.0 \
  7.9.0 \
  7.10.0 \
  8.0.0 \
"

for b in $BASES; do
  process $BASE_IMAGE $b "$VERSIONS"
done
