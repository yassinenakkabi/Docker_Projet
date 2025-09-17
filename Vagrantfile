Vagrant.configure("2") do |config|
  config.vm.define "docker_vm" do |vm|
    # Box Ubuntu 22.04
    vm.vm.box = "ubuntu/jammy64"   # Ubuntu 22.04 LTS
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
      path: "install_docker.sh"
  end
end
