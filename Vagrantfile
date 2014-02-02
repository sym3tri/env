# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.4.3"

VAGRANTFILE_API_VERSION = "2"
BOX_NAME = ENV['BOX_NAME'] || "ubuntu"
BOX_URI = ENV['BOX_URI'] || "http://files.vagrantup.com/precise64.box"
SSH_PRIVKEY_PATH = ENV["SSH_PRIVKEY_PATH"]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = BOX_NAME
  config.vm.box_url = BOX_URI
  config.vm.synced_folder "~/dev", "/data/dev"
  config.vm.synced_folder "~/dotfiles", "/data/dotfiles"
  config.vm.network :forwarded_port, guest: 8000, host: 8000
  config.ssh.forward_agent = true
  if SSH_PRIVKEY_PATH
    config.ssh.private_key_path = SSH_PRIVKEY_PATH
  end

  config.vm.provision "docker" do |d|
    d.pull_images "ubuntu"
    #d.run "ubuntu",
      #cmd: "echo l",
      #args: "-v '/vagrant:/var/www'"
  end

  #docker run -v /data/dev:/container/dev -p 8000:8000 -i -t <image-name> node /container/dev/<app-to-run>.js

  # Fix docker not being able to resolve private registry in VirtualBox
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

end
