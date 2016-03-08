#!/bin/bash
# this script is launched in the docker container and
# is responsible for setting up the build based on the
# volumes that were mapped into the container. The
# actual build is performed in the build.sh script.
#

# address files being "rooted" when running docker on Linux host
if [ "$HOST_OS" = "Linux" ]; then
  groupadd -g $HOST_UID $HOST_USER
  useradd -u $HOST_UID -g $HOST_UID $HOST_USER
fi

echo '------------------------------------'
echo 'Bootstrap package build'
echo '------------------------------------'
cd /app
mkdir -p out
cp /tmp/package.json .
scl enable devtoolset-3 ./package.sh
rm package.json

# same deal, keeps the owner as the logged in user so they
# can delete the package when they want. The group will
# still be screwed up though :(
#
cp /tmp/node-v${NODE_VERSION}-*.tar.xz ./out/
mv node-modules* ./out/
if [ "$HOST_OS" = "Linux" ]; then
  chown $HOST_USER ./out/node-*.tar.xz
fi
