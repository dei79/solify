#
# Cookbook Name:: main
# Recipe:: apache2
#
# Author:: Dirk Eisenberg (<dirk.eisenberg@gmail.com>)
#

# install apache2
include_recipe "apache2"

# install the developemtn headers needed via passenger
%w{ apache2-prefork-dev libapr1-dev libcurl4-gnutls-dev }.each do |pkg|
  package pkg do
    action :upgrade
  end
end

rbenv_gem "passenger" do
  version         node[:passenger][:version]
  rbenv_version   node[:rbenv][:global]
  action          :install
end

rbenv_rehash "Doing the rehash dance"

execute "passenger_module" do
  command 'passenger-install-apache2-module --auto'
  # creates node[:passenger][:module_path]
end


