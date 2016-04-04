#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  version=$3
  outpath="$OUTDIR/$image/$base"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      -e "s|APP_VERSION|$version|" \
      Dockerfile > "$outpath/Dockerfile"
  cp $SRCDIR/bootstrap.sh $outpath/bootstrap.sh
  cp $SRCDIR/package.sh $outpath/package.sh
}

BASE_IMAGE="node-build"

BASES="6 7"

NODE_VERSION=" \
  4.4.0 \
  4.4.1 \
  4.4.2 \
  5.9.0 \
  5.10.0 \
"

for b in $BASES; do
  process $BASE_IMAGE $b $NODE_VERSION
done
