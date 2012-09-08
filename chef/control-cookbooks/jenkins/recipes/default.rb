#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Author:: Dirk Eisenberg (<dirk.eisenberg@gmail.com>)
#

#
# This function installs a jenkins plugin
def jenkins_plugin(plugin)

  # dowload the cli client
  execute "download_jenkins_cli" do
    command 'wget http://localhost:8080/jnlpJars/jenkins-cli.jar'
  end

  # install the needed default plugins
  execute "install-git-plugin" do
    command "java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin #{plugin}"
  end

end

# ensure we have wget installed
package "wget"

# Integrate the jenkins apt source
execute "integrate_jenkins_apt_source_pgp_key" do
  command 'wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -'
end

execute "integrate_jenkins_apt_source" do
  command 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
end

# update the repositories
execute "apt-get update"

# install the jenkins package
package "jenkins"

# install the plugins
jenkins_plugin "git"
jenkins_plugin "ruby"
jenkins_plugin "rubyMetrics"

# stop jenkins
service "jenkins" do
  action :restart
end