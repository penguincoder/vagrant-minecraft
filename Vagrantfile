VAGRANTFILE_API_VERSION = '2'
MEMSIZE = 4096
CPUS = 4

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'mc-house-server'
  config.vm.box = 'jpbriquet/alpine2docker'
  config.ssh.forward_agent = true
  config.vm.network :forwarded_port, host: 8088, guest: 8088
  config.vm.network :forwarded_port, host: 25565, guest: 25565
  
  config.vm.provider :virtualbox do |p|
    p.memory = MEMSIZE
    p.cpus = CPUS
  end
  
  config.vm.provision 'shell', run: 'once', inline: '/bin/sh -c "apk update && apk add make"'
  config.vm.provision 'shell', run: 'once', inline: '/vagrant/provision.sh'
end
