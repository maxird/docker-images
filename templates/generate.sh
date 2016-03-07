#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $PWD
cd $SRCDIR

for f in `/bin/ls -d -p -1 * | grep /`; do
  cd $f
  ./generate.sh
  cd ..
done

popd
