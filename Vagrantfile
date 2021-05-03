# -*- mode: ruby -*-
# # vi: set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version '>= 1.6.0'
VAGRANTFILE_API_VERSION = '2'


# List vm configure
servers = [
    {
        "name": "jessie",
        "box": "slowe/debian-81-x64",
        "ram": 512,
        "vcpu": 1,
        "ip_addr": "192.168.100.101"
    },

    {
        "name": "trusty",
        "box": "slowe/ubuntu-trusty-x64",
        "ram": 512,
        "vcpu": 1,
        "ip_addr": "192.168.100.102"
    }
]

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Iterate through entries in JSON
  servers.each do |server|
    config.vm.define server['name'] do |srv|
      srv.vm.box = server['box']
      srv.vm.box_version
      srv.vm.network 'private_network', ip: server['ip_addr']
      srv.vm.provider :vmware_fusion do |vmw|
        vmw.vmx['memsize'] = server['ram']
        vmw.vmx['numvcpus'] = server['vcpu']
      end # srv.vm.provider
    end # config.vm.define
  end # servers.each
end # Vagrant.configure
