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
  dependency_check_version=$5
  outpath="$OUTDIR/$image/$base"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|g" \
      -e "s|BASE_FROM_VERSION|$base|g" \
      -e "s|GRADLE_VERSION|$gradle_version|g" \
      -e "s|MAVEN_VERSION|$maven_version|g" \
      -e "s|DEPENDENCY_CHECK_VERSION|$dependency_check_version|g" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="maxird/java"
BASES="
  7-8
  7-11
"
MAVEN_VERSION="3.6.1"
GRADLE_VERSION="5.6.1"
DEPENDENCY_CHECK_VERSION="4.0.2"

for b in $BASES; do
  process $BASE_IMAGE $b $MAVEN_VERSION $GRADLE_VERSION $DEPENDENCY_CHECK_VERSION
done
