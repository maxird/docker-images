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
  cp $SRCDIR/monitor.sh $outpath/monitor.sh
  cp $SRCDIR/header.cfg $outpath/header.cfg
  cp $SRCDIR/parse.sh $outpath/parse.sh
  cp $SRCDIR/reload.sh $outpath/reload.sh
}

BASE_IMAGE="centos"

BASES="7"

for b in $BASES; do
  process $BASE_IMAGE $b $NODE_VERSION
done
