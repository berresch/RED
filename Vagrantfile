# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.0"
require './plugins/vagrant-provision-reboot-plugin'

BOX_NAME = "red"

Vagrant.configure("2") do |config|
  
  config.vm.define BOX_NAME do |t| end

  config.vm.box = "ubuntu14.04"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network "private_network", ip: "10.34.1.10", netmask: "255.255.0.0"
  config.vm.hostname = "#{BOX_NAME}.localdomain"
  
  config.vm.provider :virtualbox do |vbox|
    vbox.name = BOX_NAME
    vbox.customize ["modifyvm", :id, "--cpus", "2", "--memory", "2048"]
    1.upto(8) do |nic|
	  vbox.customize ["modifyvm", :id, "--nicpromisc#{nic}", 'allow-all']
    end
  end
  
  # To get rid of the warning "stdin: is not a tty error" configure Vagrant's ssh shell to be a non-login one.  
  config.ssh.shell = "/bin/bash -c 'BASH_ENV=/etc/profile exec /bin/bash'"

  config.vm.provision "docker", version: "1.4.0"

  config.vm.provision :shell, :path => "provisioning/run.sh"

  config.vm.provision :unix_reboot
end
