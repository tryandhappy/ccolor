#!/bin/bash

cd "$(dirname "$0")"


#
# build
#
rm -rf build/*



#
# debian
#
rm -rf *.rpm
rm -rf *.deb

rm -rf ../*.deb
rm -rf ../*.buildinfo
rm -rf ../*.changes



#
# rpm
#
rm -rf rpmbuild/RPMS/*
rm -rf rpmbuild/SRPMS/*



#
# snap
#
snapcraft clean
rm -rf snap/*.snap
