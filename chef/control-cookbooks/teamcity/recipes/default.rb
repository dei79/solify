#
# Cookbook Name:: tc
# Recipe:: default
#
# Author:: Dirk Eisenberg (<dirk.eisenberg@gmail.com>)
#

# generate the tc download cache
directory "/.tcdl" do
  owner "root"
  group "root"
end

# download the teamcity binaries
execute "teamcity-download" do
  command "wget http://download.jetbrains.com/teamcity/TeamCity-#{node[:teamcity][:version]}.tar.gz"
  creates "/.tcdl/TeamCity-#{node[:teamcity][:version]}.tar.gz"
  cwd "/.tcdl"
end

# install the zsh
package "zsh"

# create the teamcity user
user node[:teamcity][:user] do
  extend Opscode::OpenSSL::Password
  password secure_password
  gid "sudo"
  home "/home/#{node[:teamcity][:user]}"
  supports :manage_home => true
  shell "/bin/zsh"
end

template "/home/#{node[:teamcity][:user]}/.zshrc" do
  source "zshrc.erb"
  owner "#{node[:teamcity][:user]}"
end

# extract the team city binaries
execute "teamcity-extract" do
  command "tar -xvzf /.tcdl/TeamCity-#{node[:teamcity][:version]}.tar.gz && mv ./TeamCity ./teamcity-server"
  creates "/home/teamcity/teamcity-server"
  cwd "/home/teamcity"
  user "teamcity"
end

# generate the data directory
directory "/home/teamcity/teamcity-server-data" do
  owner "teamcity"
end

# set the start template
template "/etc/init.d/teamcity" do
  source "teamcity.erb"
  owner "root"
  mode 0755
end

# update the service
service "teamcity" do
  supports :restart => false, :start => true, :stop => true, :reload => false
  action [ :enable, :start]
end

# clean up
#file "/tmp/TeamCity-#{node[:teamcity][:version]}.tar" do
#  action :delete
#end