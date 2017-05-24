#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  version=$3
  outpath="$OUTDIR/$image/$base/$version"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      -e "s|APP_VERSION|$version|" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="java"

BASES="6-8 7-8"

VERSIONS=" \
  8.0.38 \
  8.0.39 \
  8.0.41 \
  8.0.42 \
  8.0.43 \
  8.0.44 \
  8.5.6 \
  8.5.8 \
  8.5.9 \
  8.5.11 \
  8.5.12 \
  8.5.13 \
  8.5.14 \
  8.5.15 \
"

for b in $BASES; do
  for v in $VERSIONS; do
    process $BASE_IMAGE $b $v
  done
done
