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

  cp startup "$OUTDIR/$image/$base/"
  cp config.yml "$OUTDIR/$image/$base/"
}

BASE_IMAGE="centos"

BASES="7"

for b in $BASES; do
  process $BASE_IMAGE $b
done
