#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  outpath="$OUTDIR/$version"
  mkdir -p "$outpath"
  sed -e "s|BASE_FROM_VERSION|$version|" Dockerfile > "$outpath/Dockerfile"
}

process
