#!/bin/bash

cd "$(dirname "$0")"


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
rm -rf snap/*.snap
rm -rf snap/prime/*
