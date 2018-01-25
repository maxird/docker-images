#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  maven_version=$3
  gradle_version=$4
  outpath="$OUTDIR/$image/$base"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|g" \
      -e "s|BASE_FROM_VERSION|$base|g" \
      -e "s|GRADLE_VERSION|$gradle_version|g" \
      -e "s|MAVEN_VERSION|$maven_version|g" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="maxird/java"
BASES="
  7-8
  7-9
"
MAVEN_VERSION="3.5.2"
GRADLE_VERSION="4.5"

for b in $BASES; do
  process $BASE_IMAGE $b $MAVEN_VERSION $GRADLE_VERSION
done
