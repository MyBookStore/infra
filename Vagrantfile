# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"

  config.ssh.forward_agent = true
  require_relative './tasks/repositories'  
  config.vm.synced_folder '.', '/home/vagrant/infra', type: 'nfs' 
  Repositories::ALL.each do |repo|
    config.vm.synced_folder "../#{repo}", "/home/vagrant/#{repo}", type: 'nfs'
  end

   config.vm.define :dev do |cm_config|
    cm_config.vm.network :forwarded_port, guest: 3000, host: 3000
    cm_config.vm.network :forwarded_port, guest: 4002, host: 4002
    cm_config.vm.network :forwarded_port, guest: 4003, host: 4003
    cm_config.vm.network :forwarded_port, guest: 4009, host: 4009

    config.vm.network "private_network", ip: "192.168.33.10"
    #config.vm.network "public_network", use_dhcp_assigned_default_route: true

    cm_config.vm.provision 'file', source: ENV['GIT_FILE_PATH_FOR_VAGRANT'] || '~/.gitconfig', destination: '.gitconfig'
   end
  

# config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
