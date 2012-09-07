# update the repositories
execute "apt-get update"

# set up git to be able to check out
package "git-core"

# set up the needed ruby version based on rbenv and ruby_build
include_recipe "main::ruby"

# set up the user who will be used from capistrano later on
include_recipe "main::user"

# bring up the apache2 server
include_recipe "passenger"
