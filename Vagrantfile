# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 5044, host: 5044
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |vb|
	    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "java8"
    chef.add_recipe "elasticsearch"
    chef.add_recipe "kibana"
    chef.add_recipe "nginx"
    chef.add_recipe "logstash"
  end
end
