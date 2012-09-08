module Opscode
  module Solify
    module General
      def create_user(user_id)
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
        user "#{user_id}" do
          extend Opscode::OpenSSL::Password
          password secure_password
          gid "sudo"
          home "/home/#{user_id}"
          supports :manage_home => true
          shell "/bin/zsh"
        end

        Chef::Resource::Template.new "/home/#{user_id}/.zshrc" do
          source "zshrc.erb"
          owner "#{user_id}"
        end

      end
    end
  end
end

