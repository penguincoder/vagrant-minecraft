VAGRANTFILE_API_VERSION = '2'
MEMSIZE = 4096
CPUS = 4

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'mc-house-server'
  config.vm.hostname = 'mc-house-server'
  config.vm.box = 'ubuntu/trusty64'
  config.ssh.forward_agent = true
  config.vm.network :private_network, type: 'dhcp'
  config.vm.network :forwarded_port, host: 8088, guest: 80
  config.vm.network :forwarded_port, host: 25565, guest: 25565
  
  config.vm.provider :libvirt do |provider, override|
    override.vm.box = 'baremettle/ubuntu-14.04'
    provider.memory = MEMSIZE
    provider.cpus = CPUS
  end
  
  %w(virtualbox parallels).each do |provider|
    config.vm.provider provider do |p|
      p.memory = MEMSIZE
      p.cpus = CPUS
    end
  end
  
  %w(vmware_fusion vmware_workstation).each do |provider|
    config.vm.provider provider do |p, override|
      override.vm.box = 'phusion/ubuntu-14.04-amd64'
      p.vmx["memsize"] = MEMSIZE
      p.vmx["numvcpus"] = CPUS
    end
  end
  
  config.vm.provider :parallels do |parallels, override|
    override.vm.box = 'parallels/ubuntu-14.04'
  end
  
  config.vm.provision 'shell', run: 'once', inline: '/vagrant/provision.sh'
end
