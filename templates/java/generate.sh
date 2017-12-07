#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  version=$3
  filename=$4
  url=$5
  folder=$6
  jce=$7

  outpath="$OUTDIR/$image/$base/$version"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      -e "s|APP_FILENAME|$filename|" \
      -e "s|APP_URL|$url|" \
      -e "s|APP_JCE|$jce|" \
      -e "s|APP_VERSION|$version|" \
      -e "s|APP_FOLDER|$folder|" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="centos"

BASES="6 7"

VERSIONS="
  8:121:13:e9e7ea248e2c4826b92b3f075a80e441
  8:131:11:d54c1d3a095b4ff2b6607d096fa80163
  8:141:15:336fa29ff2bb4ef291e347e091f7f4a7
  8:144:01:090f390dda5b47b9b721c7dfaa008135
  8:151:12:e758a0de34e24606bca991d704f6dcbf
  8:152:16:aa0333dd3019491ca4f6ddbe78cdb6d0
  9:0.1:11:none
"

for b in $BASES; do
  for v in $VERSIONS; do
    major=$(echo $v | awk -F ':' '{print $1}')
    minor=$(echo $v | awk -F ':' '{print $2}')
    build=$(echo $v | awk -F ':' '{print $3}')
    uuid=$(echo $v | awk -F ':' '{print $4}')
    prefix="http://download.oracle.com/otn-pub/java/jdk"
    if [ "$major" == "8" ]; then
      filename="jdk-${major}u${minor}-linux-x64.rpm"
      url="${prefix}/${major}u${minor}-b${build}/${uuid}/${filename}"
      folder="jdk1.${major}.0_${minor}"
      jce=1

      version="${major}u${minor}b${build}"

      process $BASE_IMAGE $b $version $filename $url $folder $jce
    else
      filename="jdk-${major}.${minor}_linux-x64_bin.rpm"
      url="${prefix}/${major}.${minor}+${build}/${filename}"
      folder="jdk1.${major}.0_${minor}"
      jce=0

      version="${major}.${minor}+${build}"

      process $BASE_IMAGE $b $version $filename $url $folder $jce
    fi
  done
done
