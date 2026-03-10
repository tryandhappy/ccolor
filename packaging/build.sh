#!/bin/bash -x

cd "$(dirname "$0")"

mkdir -p build
cp ../bin/ccolor build/ccolor

echo
echo '#'
echo '# Debian'
echo '#'
debian/debian.sh

echo
echo '#'
echo '# RPM'
echo '#'
rpm/rpm.sh

echo
echo '#'
echo '# SNAP'
echo '#'
snap/snap.sh

