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

  cp prepare.sh boot.sh "$outpath/"
}

BASE_IMAGE="java"

BASES="7-8"

VERSIONS=" \
  5.15.10 \
"

for b in $BASES; do
  for v in $VERSIONS; do
    process $BASE_IMAGE $b $v
  done
done
