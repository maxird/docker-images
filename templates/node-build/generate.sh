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
  4.3.2 \
  4.4.0 \
  4.4.1 \
  4.4.2 \
  4.4.3 \
  5.7.1 \
  5.8.0 \
  5.9.0 \
  5.9.1 \
  5.10.0 \
  5.10.1 \
  5.11.0 \
"

for b in $BASES; do
  process $BASE_IMAGE $b "$VERSIONS"
done
