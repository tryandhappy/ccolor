#!/bin/bash


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

