#
# Cookbook Name:: general
# Recipe:: ruby
#
# Author:: Dirk Eisenberg (<dirk.eisenberg@gmail.com>)
#

# Bring rbenv and the standard ruby version to the system
rbenv_ruby node[:rbenv][:global] do
  action :install
end
rbenv_global node[:rbenv][:global]
rbenv_rehash "Doing the rehash dance"

gem_package "bundler"
rbenv_rehash "Doing the rehash dance"

# for password support needed
rbenv_gem "ruby-shadow" do
  rbenv_version   node[:rbenv][:global]
  action          :install
end

rbenv_rehash "Doing the rehash dance"



