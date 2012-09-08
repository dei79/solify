# install the zsh
package "zsh"

# create the teamcity user
user node[:user][:name] do
  extend Opscode::OpenSSL::Password
  password secure_password
  gid "sudo"
  home "/home/#{node[:user][:name]}"
  supports :manage_home => true
  shell "/bin/zsh"
end

template "/home/#{node[:user][:name]}/.zshrc" do
  source "zshrc.erb"
  owner "#{node[:user][:name]}"
end
