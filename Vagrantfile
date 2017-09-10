# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "xenial64"
    config.vm.synced_folder ".", "/home/ubuntu/swift-package", :mount_options => ["dmode=775", "fmode=776"]
    
    # Optional NFS. Make sure to remove other synced_folder line too
    #config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666"] }

    config.vm.provider "virtualbox" do |vm|
        vm.memory = 4096
        vm.cpus = 4
    end
end
