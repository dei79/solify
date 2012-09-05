#
# Cookbook Name:: main
# Recipe:: user
#
# Author:: Dirk Eisenberg (<dirk.eisenberg@gmail.com>)
#

package "zsh"

user node[:user][:name] do
  password node[:user][:password]
  gid "admin"
  home "/home/#{node[:user][:name]}"
  supports :manage_home => true
  shell "/bin/zsh"
end

template "/home/#{node[:user][:name]}/.zshrc" do
  source "zshrc.erb"
  owner node[:user][:name]
end
