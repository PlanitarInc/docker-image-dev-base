# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "parallels/ubuntu-14.04"
  config.vm.synced_folder ".", "/share"
  config.vm.provision :shell, :inline => "apt-get update -yqq && apt-get install -yqq curl"
  config.vm.provision :shell, :inline => "curl -s https://get.docker.io/ubuntu/ | sudo sh"
  config.vm.provision :shell, :inline => "cd /share && make build && make test"
end
