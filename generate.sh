#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $PWD
$SRCDIR/templates/generate.sh
popd
