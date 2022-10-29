#!/bin/bash

set -e

cd cli
dart run
cd ..

file=$(cat semver.txt)
semanticVersion=$(echo $file)

export APP_VERSION="$semanticVersion"

echo "Adding Tag: $semanticVersion";
git tag -a $semanticVersion -m $semanticVersion
git push origin --tags
