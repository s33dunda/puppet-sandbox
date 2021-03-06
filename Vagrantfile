# -*- mode: ruby -*-
# vi: set ft=ruby :

domain = '2tor.net'

puppet_nodes = [
  {:hostname => 'puppet',  :ip => '172.16.32.10', :box => 'UPrecise', :fwdhost => 8140, :fwdguest => 8140, :ram => 512},
  {:hostname => 'mysql', :ip => '172.16.32.11', :box => 'UPrecise', :fwdhost => 3306, :fwdguest => 3306},
  {:hostname => 'mongodb', :ip => '172.16.32.12', :box => 'UPrecise', :fwdhost =>27017, :fwdguest => 27017},
  {:hostname => 'apache2', :ip => '172.16.32.13', :box => 'UPrecise', :fwdhost =>80, :fwdguest =>80},
  {:hostname => 'dev', :ip => '172.16.32.14', :box => 'UPrecise'}
]

Vagrant::Config.run do |config|
  puppet_nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
      node_config.vm.box_url = 'http://files.vagrantup.com/' + node_config.vm.box + '.box'
      node_config.vm.host_name = node[:hostname] + '.' + domain
      node_config.vm.network :hostonly, node[:ip]
      node_config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

      if node[:fwdhost]
        node_config.vm.forward_port node[:fwdguest], node[:fwdhost]
      end

      memory = node[:ram] ? node[:ram] : 256;
      node_config.vm.customize [
        'modifyvm', :id,
        '--name', node[:hostname],
        '--memory', memory.to_s
      ]

      node_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'provision/manifests'
        puppet.module_path = 'provision/modules'
      end
    end
  end
end
