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
  5.7.1 \
"

for b in $BASES; do
  process $BASE_IMAGE $b "$VERSIONS"
done
