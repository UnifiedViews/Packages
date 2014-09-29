#!/bin/sh
VERSION="1.3.0-1"
if  [ -f /etc/debian_version ] ; then
    dpkg-deb -b debian unifiedviews-core-plugins_"$VERSION"_all.deb
    exit 0
fi
echo "Build OS not supported"
