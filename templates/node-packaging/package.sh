#!/bin/bash
# this script is run in the scl wrapped process

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
npm install --production
echo "return code $?"

echo creating tarfile
sleep 3s
tar cJf $TARFILE node_modules/ --mtime='2016-01-01T09:30:00' --owner 0 --group 0 --no-xattrs

rm -rf node_modules
echo '------------------------------------'
