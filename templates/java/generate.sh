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
  8u121b13:e9e7ea248e2c4826b92b3f075a80e441 \
  8u131b11:d54c1d3a095b4ff2b6607d096fa80163 \
  8u141b15:336fa29ff2bb4ef291e347e091f7f4a7 \
"

for b in $BASES; do
  for v in $VERSIONS; do
    version=$(echo $v | awk -F ':' '{print $1}')
    uuid=$(echo $v | awk -F ':' '{print $2}')
    process $BASE_IMAGE $b $version $uuid
  done
done
