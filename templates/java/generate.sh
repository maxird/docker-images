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
  8:162:12:0da788060d494f5095bf8624735fa2f1
  9:0.4:11:c2514751926b4512b076cc82f959763f
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
      if [ "${uuid}" == "none" ]; then
        url="${prefix}/${major}.${minor}+${build}/${filename}"
      else
        url="${prefix}/${major}.${minor}+${build}/${uuid}/${filename}"
      fi
      folder="jdk1.${major}.0_${minor}"
      jce=0

      version="${major}.${minor}+${build}"

      process $BASE_IMAGE $b $version $filename $url $folder $jce
    fi
  done
done
