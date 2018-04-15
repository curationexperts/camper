# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "bento/ubuntu-16.04"
  # box-cutter/ubuntu1604
  #config.vm.box_url = "file:///Users/mark/Documents/workspace/_no_backup/deployinghydra/open-vagrant-boxes/ubuntu-14.04.3-amd64-vbox.box"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # Add port forwarding for jetty and the rails development server
  config.vm.network "forwarded_port", guest: 8983, host: 8983, auto_correct: true
  config.vm.network "forwarded_port", guest: 8984, host: 8984, auto_correct: true
  config.vm.network "forwarded_port", guest: 8985, host: 8985, auto_correct: true
  config.vm.network "forwarded_port", guest: 8986, host: 8986, auto_correct: true
  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
  
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
  
  # Set the VM hostname
  config.vm.hostname = "camper"
  
  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    #vb.gui = true
    #
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--name", "Samvera Demo"]
    vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
  end
  #
  # View the documentation for the provider you're using for more
  # information on available options.
    
  # Enable ansible provisioning to setup prerequites and dependencies for Hydra tutorials
  config.vm.provision "ansible" do |ansible|
    # ansible.verbose = 'vvv'

    ansible.playbook = "build_camp_box.yml"

    # update start_at_task and re-run `vagrant provison` if your configuration scripts fail on a particular task
    # and you want to restart the provisioning at the step where the failure occurred
    # ansible.start_at_task = "samvera-tutorials : download solr installer files"
    # ansible.verbose = "false" # other options "v", "vv", "vvv", "vvvv"

    # for further details on using ansible with vagrant, see
    # Ansible documentation: http://docs.ansible.com/ansible/guide_vagrant.html
    # Vagrant documentation: https://docs.vagrantup.com/v2/provisioning/ansible.html
    # - note the ./provisioning directory in the examples will be replaced by ./ansible-hydra when using this repo
  end
  

end
