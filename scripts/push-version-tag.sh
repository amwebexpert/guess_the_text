#!/bin/bash

set -e

file=$(cat pubspec.yaml)
semanticVersionWithPlus=$(echo $file | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p')
semanticVersion=${semanticVersionWithPlus:0:$((${#semanticVersionWithPlus}-1))}

export APP_VERSION="$semanticVersion"

echo "Adding Tag: $semanticVersion";
git tag -a $semanticVersion -m $semanticVersion
git push origin --tags
