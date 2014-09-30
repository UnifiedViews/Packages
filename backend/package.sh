#!/bin/sh
VERSION="1.3.1"
if [ -f /etc/debian_version  ] ; then
    dpkg-deb -b debian unifiedviews-backend_"$VERSION"_all.deb
    exit 0
fi
echo "Build OS not supported"
