#!/bin/bash -x

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
rm -rf rpm/RPMS/*
rm -rf rpm/SRPMS/*



#
# snap
#
snapcraft clean
rm -rf snap/*.snap
