# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.hostname = "vagrant4545"

  config.vm.provider "virtualbox" do |vb|
     vb.name = "4545-tools"
  end

  config.vm.provision :shell, :path => "./initial-setup.sh", run: "once", privileged: false
  config.vm.provision :shell, :path => "./startup.sh", run: "always", privileged: false

  config.ssh.forward_agent = true
end
