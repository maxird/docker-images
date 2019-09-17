#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEREDIR=`basename $SRCDIR`
OUTDIR="$SRCDIR/../../images/$HEREDIR"

function process
{
  image=$1
  base=$2
  version=$3
  url=$4

  outpath="$OUTDIR/$image/$base/$version"
  mkdir -p "$outpath"
  sed \
      -e "s|BASE_IMAGE|$image|" \
      -e "s|BASE_FROM_VERSION|$base|" \
      -e "s|APP_VERSION|$version|g" \
      -e "s|APP_URL|$url|g" \
      Dockerfile > "$outpath/Dockerfile"
}

BASE_IMAGE="centos"

BASES="7"

VERSIONS="
  1.8.0
  11
"

VERSIONS="
  1.8.0|https://d3pxv6yz143wms.cloudfront.net/8.222.10.1/java-1.8.0-amazon-corretto-devel-1.8.0_222.b10-1.x86_64.rpm
  11|https://d3pxv6yz143wms.cloudfront.net/11.0.4.11.1/java-11-amazon-corretto-devel-11.0.4.11-1.x86_64.rpm
"

for b in $BASES; do
  for v in $VERSIONS; do
    version=$(echo "$v" | awk -F '|' '{ print $1; }')
    url=$(echo "$v" | awk -F '|' '{ print $2; }')
    process $BASE_IMAGE $b $version $url
  done
done
