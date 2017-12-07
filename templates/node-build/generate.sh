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
  6.11.2 \
  6.11.3 \
  6.11.4 \
  6.11.5 \
  6.12.0 \
  6.12.1 \
  8.9.0 \
  8.9.1 \
  8.9.2 \
"

for b in $BASES; do
  process $BASE_IMAGE $b "$VERSIONS"
done
