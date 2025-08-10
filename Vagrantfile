# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "docker_vm" do |vm|
    vm.vm.box = "centos/7"
    vm.vm.box_version = "2004.01"
    vm.vm.hostname = "docker-vm"

    # Réseau privé avec IP fixe
    vm.vm.network "private_network", ip: "192.168.56.10"

    # Config VirtualBox
    vm.vm.provider "virtualbox" do |vb|
      vb.name   = "docker_vm"
      vb.cpus   = 2
      vb.memory = 2048
    end

    # Provision : script d'installation Docker
    vm.vm.provision "shell",
      path: "install_docker.sh",
      env: { "ENABLE_ZSH" => ENV["ENABLE_ZSH"] || "false" }
  end
end
