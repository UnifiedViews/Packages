Packages
========

Provides source for creating UnifiedViews packages for various Linux distributions.


Till the package repository will be established use this

~~~bash
dpkg -i  unifiedviews-backend_1.5.0_all.deb unifiedviews-webapp_1.5.0_all.deb
#... some dependency errors
apt-get install -f -y
~~~
How to uninstall with dependency 
~~~bash
 apt-get purge unifiedviews-webapp unifiedviews-backend
 apt-get autoremove 
~~~

How to create .deb packages for Debian:

go to where pom.xml is placed and run
~~~bash
mvn package
~~~

that creates files .deb in target/


The known issues:
- be aware of the possible problem - https://github.com/UnifiedViews/Core/issues/258
- to add backup configuration before an update installation of packages
- to clean database schema during a purge phase 
- to change location from /etc/unifiedviews to /etc/default/unifiedviews

