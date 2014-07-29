#!/bin/sh
VERSION="1.0.0"
if  [ -f /etc/debian_version ] ; then
    dpkg-deb -b debian unifiedviews-webapp_"$VERSION"_all.deb
    exit 0
fi
echo "Build OS not supported"
