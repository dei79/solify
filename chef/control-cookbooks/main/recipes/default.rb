# set up the user who will be used from capistrano later on
include_recipe "main::user"

# bring up the apache2 server
include_recipe "passenger"
