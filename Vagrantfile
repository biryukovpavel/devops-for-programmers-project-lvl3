Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.ssh.forward_agent = true
  
  # Define VM
  config.vm.define "devops-project-lvl3"

  # The hostname the machine should have
  config.vm.hostname = "devops-project-lvl3"

  # Share an additional folder to the guest VM.
  config.vm.synced_folder ".", "/vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize the amount of memory on the VM
    vb.memory = "2048"

    # Customize the name that appears in the VirtualBox GUI
    vb.name = "devops-project-lvl3"

    # Enable Symbolic Links
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "./vagrant-provision/playbook.yml"
    ansible.galaxy_role_file = "./vagrant-provision/requirements.yml"
    ansible.galaxy_roles_path = "./vagrant-provision/tmp/thirdparty_roles"
  end
end
