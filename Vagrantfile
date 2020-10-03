# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
    config.vm.define :servidor do |servidor|
        servidor.vm.box = "bento/ubuntu-20.04"
        servidor.vm.network :private_network, ip: "192.168.100.3"
        servidor.vm.hostname = "servidor"
        servidor.vm.synced_folder "kube/", "/home/vagrant"
        servidor.vm.provider "virtualbox" do |v|
            v.cpus = 2
        end
    end
end