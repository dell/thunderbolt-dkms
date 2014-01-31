#!/bin/bash

VER="$1"

while [ -z "$VER" ]; do
    read -p "Please enter a new version: " VER
done

shift

MSG="$*"

while [ -z "$MSG" ]; do
    read -p "Please enter a message of changelog: " MSG
done

sed -i "s/^VERSION=.*/VERSION=$VER/" debian/rules debian/prerm
sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$VER\"/" thunderbolt-icm/dkms.conf
dch -v "$VER" "$MSG"
