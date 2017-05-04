#!/bin/bash

## rewrite a package.nsp.json with explicit versions
#
out=package.nsp.json
cp package.json $out

echo "scanning node_modules folder for packages"
cd node_modules
for module in $(/bin/ls -1 -d *); do
  if [ -f $module/package.json ]; then
    version=$(cat $module/package.json | jq -r .version)
    # echo "$module -> $version"
    cat ../$out | jq ".dependencies[\"$module\"] = \"$version\"" > "../$out.tmp"
    mv "../$out.tmp" ../$out
  else
    cd $module
    for submodule in $(/bin/ls -1 -d *); do
      version=$(cat $submodule/package.json | jq -r .version)
      # echo "$module -> $version"
      cat ../../$out | jq ".dependencies[\"$module\"] = \"$version\"" > "../../$out.tmp"
      mv "../../$out.tmp" ../../$out
    done
    cd ..
  fi
done
cd ..

## temporarily replace package.json with package.nsp.json
## and run nsp against it
#
echo "running nsp"
cp package.json package.nsp-safe.json
mv $out package.json
nsp check
result=$?
mv package.json $out
if [ $result -ne 0 ]; then
  echo "package with issues saved as $out"
else
  echo "clean package saved as $out"
fi
mv package.nsp-safe.json package.json

exit $result

