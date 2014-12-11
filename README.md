Packages
========

Provides source for creating UnifiedViews packages for various Linux distributions.


Till the package repository will be established use this

~~~bash
# dpkg -i  debian-backend_1.4.1~SNAPSHOT_all.deb debian-frontend_1.4.1~SNAPSHOT_all.deb
... some dependency errors
# apt-get install -f -y
~~~
How to uninstall with dependency 
~~~bash
# apt-get purge unifiedviews-webapp unifiedviews-backend
# apt-get autoremove 
~~~

How to create .deb packages for Debian:

go to where pom.xml is placed and run
~~~bash
# mvn package
~~~

that creates files .deb in target/


The known issues:

- you have to set java 7 in tomcat.  - https://github.com/UnifiedViews/Core/issues/258
~~~bash
# add line into /etc/default/tomcat7
# JAVA_HOME= {location of your JAVA 7 HOME}
~~~

- to add backup configuration before an update installation of packages
- to clean database schema during a purge phase 
- to change location /etc/unifiedviews to /etc/default/unifiedviews
- to remove sql-install.log after purge phase

