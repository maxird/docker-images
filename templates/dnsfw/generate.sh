#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  version=$3
  outpath="$OUTDIR/$base/$version"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      Dockerfile > "$outpath/Dockerfile"
  cp -f reload "$outpath/"
  cp -f run "$outpath/"
  cp -f rotate "$outpath/"
  cp -f config/domains.conf "$outpath/"
  cp -f config/local.conf "$outpath/"
}

BASE_IMAGE="maxird/centos"
BASE_VERSION="7"

process $BASE_IMAGE $BASE_VERSION
