# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"

    config.vm.provision :shell, path: "scripts/bootstrap.sh"
    config.vm.provision :shell, path: "scripts/setup-nodejs.sh"
    config.vm.provision :shell, privileged: false, path: "scripts/setup-golang.sh"
    config.vm.provision :shell, path: "scripts/setup-mysql.sh"
    config.vm.provision :shell, path: "scripts/setup-nginx.sh"
    config.vm.provision :shell, privileged: false, path: "scripts/setup-app.sh"

    config.vm.network :forwarded_port, guest: 6666, host: 6666 # Application
    config.vm.network :forwarded_port, guest: 80, host: 8080 # Nginx http
    config.vm.network :forwarded_port, guest: 443, host: 8443 # Nginx ssl
    config.vm.network :forwarded_port, guest: 3306, host: 8033 # Mariadb

    # Application folder
    config.vm.synced_folder "src/", "/home/vagrant/app/"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    # config.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
    #   vb.memory = "1024"
    # end
end
