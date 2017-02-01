#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  version=$3
  uuid=$4
  outpath="$OUTDIR/$image/$base/$version"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      -e "s|APP_VERSION|$version|" \
      -e "s|APP_JDK_UUID|$uuid|" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="centos"

BASES="6 7"

VERSIONS=" \
  8u121b13 \
"

# this changes on each release
JDK_UUID="e9e7ea248e2c4826b92b3f075a80e441"

for b in $BASES; do
  for v in $VERSIONS; do
    process $BASE_IMAGE $b $v $JDK_UUID
  done
done
