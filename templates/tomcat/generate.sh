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

VERSIONS="
  8.0.48
  8.0.49
  8.5.24
  8.5.27
"

for b in $BASES; do
  for v in $VERSIONS; do
    process $BASE_IMAGE $b $v
  done
done
