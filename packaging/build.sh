#!/bin/bash

cd "$(dirname "$0")"

cp ../bin/ccolor build

echo
echo '#'
echo '# Debian'
echo '#'
debian/debian.sh

echo
echo '#'
echo '# RPM'
echo '#'
rpmbuild/rpmbuild.sh

echo
echo '#'
echo '# SNAP'
echo '#'
snap/snap.sh

