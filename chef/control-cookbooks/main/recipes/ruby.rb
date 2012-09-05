#
# Cookbook Name:: main
# Recipe:: ruby
#
# Author:: Dirk Eisenberg (<dirk.eisenberg@gmail.com>)
#

# Bring rbenv and the standard ruby version to the system
rbenv_ruby node[:rbenv][:global] do
  action :install
end

rbenv_global node[:rbenv][:global]
