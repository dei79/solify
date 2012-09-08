module Opscode
  module Solify
    module General
      def create_user(username)
        # install the zsh
        package "zsh"

        # for password supper
        rbenv_gem "ruby-shadow" do
          rbenv_version   node[:rbenv][:global]
          action          :install
        end

        # rehash
        rbenv_rehash "Doing the rehash dance"

        # generate a teamcity account
        user "#{username}" do
          extend Opscode::OpenSSL::Password
          password secure_password
          gid "sudo"
          home "/home/#{username}"
          supports :manage_home => true
          shell "/bin/zsh"
        end

        Chef::Resource::Template.new "/home/#{username}/.zshrc" do
          source "zshrc.erb"
          owner "#{username}"
        end

      end
    end
  end
end

