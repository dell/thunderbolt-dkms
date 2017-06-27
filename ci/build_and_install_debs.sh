#!/bin/bash -e

#build deb packages
VERSION=`git describe | sed 's/-/+r/;s/-/+/'`
[ -z $VERSION ] && VERSION=`dpkg-parsechangelog -S version`

rm -rf build/
CP=`ls`
mkdir -p build
cp -R $CP build
pushd build
rm debian/changelog -f
EDITOR=/bin/true dch --create --package thunderbolt-dkms -v $VERSION "CI Build"
dpkg-buildpackage

#test the packages install
dpkg -i ../*.deb
