#
# Cookbook Name:: general
# Recipe:: default
#
# Author:: Dirk Eisenberg (<dirk.eisenberg@gmail.com>)
#

# update the repositories
execute "apt-get update"

# set up git to be able to check out
package "git-core"

# Overwrite the /etc/default/locale file to fix the following warning
# warning: setlocale: LC_CTYPE: cannot change locale (UTF-8)
template "/etc/default/locale" do
  source "locale"
  owner "root"
  group "root"
end
