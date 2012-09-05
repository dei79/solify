#
# Cookbook Name:: main
# Recipe:: nginx
#
# Author:: Dirk Eisenberg (<dirk.eisenberg@gmail.com>)
#

include_recipe "nginx::source"

directory "/home/#{node[:user][:name]}/example" do
  owner node[:user][:name]
end

file "/home/#{node[:user][:name]}/example/index.html" do
  owner node[:user][:name]
  content "<h1>Hello World!</h1>"
end

file "#{node[:nginx][:dir]}/sites-available/example" do
  content "server
           {
              listen 8080;
              root /home/#{node[:user][:name]}/example;
           }"
end

nginx_site "example"