#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  version=$3
  folder=$4
  uuid=$5
  outpath="$OUTDIR/$image/$base/$version"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      -e "s|APP_VERSION|$version|" \
      -e "s|APP_FOLDER|$folder|" \
      -e "s|APP_JDK_UUID|$uuid|" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="centos"

BASES="6 7"

VERSIONS="
  8:121:13:e9e7ea248e2c4826b92b3f075a80e441
  8:131:11:d54c1d3a095b4ff2b6607d096fa80163
  8:141:15:336fa29ff2bb4ef291e347e091f7f4a7
  8:144:01:090f390dda5b47b9b721c7dfaa008135
"

for b in $BASES; do
  for v in $VERSIONS; do
    major=$(echo $v | awk -F ':' '{print $1}')
    minor=$(echo $v | awk -F ':' '{print $2}')
    build=$(echo $v | awk -F ':' '{print $3}')
    uuid=$(echo $v | awk -F ':' '{print $4}')
    version="${major}u${minor}b${build}"
    folder="jdk1.${major}.0_${minor}"
    process $BASE_IMAGE $b $version $folder $uuid
  done
done
