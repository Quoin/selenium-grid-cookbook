# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  #config.vm.network :forwarded_port, guest: 38080, host: 38080
  config.ssh.forward_agent = true

  #Make sure you let Berkshelf tell Vagrant where to pull the cookbooks from.
  #The Berksfile is located in the same directory as this Vagrantfile
  config.berkshelf.enabled = true


  config.vm.define "hub", :primary => true do |hub|
    hub.vm.hostname = "selenium-hub"

    hub.vm.provision :chef_solo do |chef|
      chef.provisioning_path = "/tmp/vagrant-chef"
      chef.log_level = :debug
      chef.add_recipe "selenium-grid::hub"
      #chef.json = {}
    end

    # config.vm.provider "virtualbox" do |v|
    #   v.customize ["modifyvm", :id, "--memory", 1024]
    # end
  end

end
