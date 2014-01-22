# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.4.3"

VAGRANTFILE_API_VERSION = "2"
BOX_NAME = ENV['BOX_NAME'] || "ubuntu"
BOX_URI = ENV['BOX_URI'] || "http://files.vagrantup.com/precise64.box"
FORWARD_DOCKER_PORTS = ENV['FORWARD_DOCKER_PORTS']
SSH_PRIVKEY_PATH = ENV["SSH_PRIVKEY_PATH"]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = BOX_NAME
  config.vm.box_url = BOX_URI
  config.vm.synced_folder "~/dev", "/data/dev"
  config.vm.synced_folder "~/dotfiles", "/data/dotfiles"
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

  #if !FORWARD_DOCKER_PORTS.nil?
    #(49000..49900).each do |port|
      #config.vm.network :forwarded_port, :host => port, :guest => port
    #end
  #end

end
