#!/bin/bash

mkdir -p packaging/snap/bin
cp ../bin/ccolor packaging/snap/bin



cd snap
snapcraft --destructive-mode

