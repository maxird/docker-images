#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  outpath="$OUTDIR/$image/$base"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      Dockerfile > "$outpath/Dockerfile"
  cp $SRCDIR/bootstrap.sh $outpath/bootstrap.sh
  cp $SRCDIR/package.sh $outpath/package.sh
  cp $SRCDIR/nsp-check-deep.sh $outpath/nsp-check-deep.sh
}

BASE_IMAGE="node-build"

BASES="6 7"

for b in $BASES; do
  process $BASE_IMAGE $b
done
