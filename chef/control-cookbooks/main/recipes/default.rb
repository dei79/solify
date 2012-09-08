# extend the module
extend Opscode::Solify::General

# set up the user who will be used from capistrano later on
create_user(node[:user][:name])

# bring up the apache2 server
include_recipe "passenger"
