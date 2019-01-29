#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  version=$1
  outpath="$OUTDIR/$version"
  mkdir -p "$outpath"
  sed \
      -e "s|APP_VERSION|$version|" \
      Dockerfile > "$outpath/Dockerfile"
  cp $SRCDIR/docker-entrypoint.sh $outpath/
  cp $SRCDIR/000-logging.conf $outpath/
}

VERSIONS="
  7.1
"

for v in $VERSIONS; do
  process $v
done
