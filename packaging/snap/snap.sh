#!/bin/bash

cd "$(dirname "$0")"

mkdir -p bin


cp ../../bin/ccolor bin

sed -i "s/^version: .*/version: '$(cat ../VERSION)'/" snapcraft.yaml

snapcraft --destructive-mode
#snapcraft remote-build

mv ccolor_*.snap ../build/
cp -f ../build/ccolor_$(cat ../VERSION)_all-platforms.snap ../build/ccolor_all-platforms.snap

