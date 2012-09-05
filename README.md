# solify - Simplify typical chef-solo deployments

solify is a set of cookbooks and tools which makes it ultra simple to move a basic system into a server which is able to run ruby on rails applications. Everything will be prepared in a way that the application can be deployed via capistrano into this server. 

## Just do it
Just log into your target machine via ssh with a user who has sudo right and copy and paste this command line:

* Ubuntu 10.04/12.04 LTS

 ```bash
 (curl -L https://raw.github.com/dei79/solify/master/solify-ubuntu-default | bash)
 ```

## Attention
solify creates a user on the system with the username "deployer". This user has sudo rights and the password is
initialized with the value "password".

!!! PLEASE CHANGE THIS PASSWORD DIRECTLY BEFORE YOU DEPLOY THE FIRST APPLICATION !!!

## Credits

* Thanks to @rbates for his [railscast](http://railscasts.com/episodes/339-chef-solo-basics) about chef
* Thanks to the [librarian project](https://github.com/applicationsonline/librarian) for the chef dependencies