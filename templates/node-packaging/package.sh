#!/bin/bash
# this script is run in the scl wrapped process
SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '------------------------------------'
echo 'Packaging script'
echo "running in `pwd`"
export PATH=/opt/node-v${NODE_VERSION}-linux-x64/bin:$PATH
echo $PATH
gcc --version
echo "node: `node --version` npm: `npm --version`"
PLATFORM=`cat /etc/system-release | awk '{ if(match($3, /\d*\.\d*/)) print $3; else print $4 }' | cut -c1`
TARFILE="node-modules.el${PLATFORM}.tar.xz"
echo "platform tar file: $TARFILE"
echo configuring registry pointers
[ "$NPM_REGISTRY" != "" ] && npm config set registry "$NPM_REGISTRY"
[ "$NPM_REGISTRY_IRD" != "" ] && npm config set @ird:registry "$NPM_REGISTRY_IRD"

## cleanup
##
[ -e package-lock.json ] && rm package-lock.json
[ -e node_modules ] && rm -rf node_modules
[ -e "$TARFILE" ] && rm "$TARFILE"

## if the custom.sh exists execute it
if [ -e ./custom.sh ]; then
  echo executing custom build pre step
  ./custom.sh
fi

cat package.json

## perform the build
##
npm install --production --log-level=warn
npm_result=$?
echo "npm return code $npm_result"
cp -f package-lock.json out/

## run the nsp check
##
$SRCDIR/nsp-check-deep.sh
nsp_result=$?
echo "nsp return code $nsp_result"

echo creating tarfile $TARFILE
sleep 3s
if [ ! -d node_modules ]; then
  mkdir node_modules
  echo 'placeholder for no dependencies' > node_modules/README.txt
fi
tar cJf $TARFILE node_modules/ --mtime='2016-01-02T10:30:00' --owner 0 --group 0 --no-xattrs

rm -rf node_modules
echo '------------------------------------'
