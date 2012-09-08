#
# Cookbook Name:: general
# Recipe:: java
#
# Author:: Dirk Eisenberg (<dirk.eisenberg@gmail.com>)
#
execute 'echo deb http://www.duinsoft.nl/pkg debs all > /etc/apt/sources.list.d/oracle.list'
execute 'apt-key adv --keyserver keys.gnupg.net --recv-keys 5CB26B26'
execute 'apt-get update'
package 'update-sun-jre'
