#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

export WSO2_FOLDER=identity-server
export WSO2_CODE=is
export WSO2_LAUNCH=wso2server.sh
export WSO2_EXPOSE="9443 9763 8000 10500"

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
      -e "s|APP_VERSION|$version|" \
      -e "s|APP_FOLDER|$WSO2_FOLDER|" \
      -e "s|APP_CODE|$WSO2_CODE|" \
      -e "s|APP_LAUNCH|$WSO2_LAUNCH|" \
      -e "s|APP_EXPOSE|$WSO2_EXPOSE|" \
      ${SRCDIR}/Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="java"
BASES="7-8"
VERSIONS="
  5.3.0
"

for b in $BASES; do
  for v in $VERSIONS; do
    process $BASE_IMAGE $b $v
  done
done
