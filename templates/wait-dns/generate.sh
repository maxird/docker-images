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
  cp Dockerfile "$outpath/Dockerfile"
  cp wait.sh "$outpath/wait.sh"
}

BASE_IMAGE="centos"

BASES="7"

for b in $BASES; do
  process $BASE_IMAGE $b
done
