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
      Dockerfile > "$outpath/Dockerfile"

  cp -f boot.sh "$outpath/boot.sh"
  cp -f config.yml "$outpath/config.yml"
}

BASE_IMAGE="quay.io/coreos/clair"

BASE="
  v2.0.9
"

for b in ${BASE}; do
  process $BASE_IMAGE $b
done
