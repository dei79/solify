#
# Cookbook Name:: main
# Recipe:: user
#
# Author:: Dirk Eisenberg (<dirk.eisenberg@gmail.com>)
#

package "zsh"

pass = ENV(['PASSWORD']) || node[:user][:password]

user node[:user][:name] do
  password pass
  gid "admin"
  home "/home/#{node[:user][:name]}"
  supports :manage_home => true
  shell "/bin/zsh"
end

template "/home/#{node[:user][:name]}/.zshrc" do
  source "zshrc.erb"
  owner node[:user][:name]
end
