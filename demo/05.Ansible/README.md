# Ansible

## Vagrantfile

```ruby
$script = <<-SCRIPT
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get upgrade -yqq
apt-get install -yqq vim mc net-tools
cat /tmp/pub_key.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
SCRIPT

PUB_KEY_PATH = "~/.ssh/id_rsa.pub"

MACHINES = {
  'host1'  =>  { vcpu: '1', ram: '512', ip: '10.20.30.20'},
  'host2' =>  { vcpu: '1', ram: '512', ip: '10.20.30.21'},
  'jump' =>  { vcpu: '1', ram: '512', ip: '10.20.30.22'},
}

INSTANCES = MACHINES.flat_map do |server_name, server|
    server.merge({
      :vagrant_name => "#{server_name}",
    })
end

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true

  INSTANCES.each do |instance|
    config.vm.define instance[:vagrant_name] do |node|
      node.vm.box = "bento/debian-10"
      node.vm.hostname = instance[:vagrant_name]
      node.vm.network "private_network", ip: instance[:ip]
      if instance[:vagrant_name] == "jump"
        node.vm.network "public_network", ip: "192.168.1.40", bridge: "eno1"
      end
      node.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = instance[:ram]
        vb.cpus = instance[:vcpu]
      end
      node.vm.provision "file", source: PUB_KEY_PATH, destination: "/tmp/pub_key.pub"
      node.vm.provision "shell", inline: $script
    end
  end
end
```


## history

```bash
 3765  cd /home/plu/sa/infra/AnsibleStart
 3766  ls -l
 3767  vim Vagrantfile
 3768  vagrant global-status
 3769  vim Vagrantfile
 3770  cat /etc/ansible/ansible.cfg
 3771  vim /etc/ansible/ansible.cfg
 3772  vim /etc/ansible/hosts
 3773  vim Vagrantfile
 3774  ping 192.168.1.40
 3775  vagrantfile halt
 3776  vagrant halt
 3777  vagrant up
 3778  ping 192.168.1.40
 3779  ssh vagrant@192.168.1.40
 3780  vim Vagrantfile
 3781  ping 10.20.30.20
 3782  vim ~/.ssh/config
 3783  ssh vagrant@10.20.30.20
 3784  ansible -m ping jump -u vagrant
 3785  vim /etc/ansible/hosts
 3786  ansible -m ping internal -u vagrant
 3787  ansible -m shell -a "cat /etc/os-release"  internal -u vagrant
 3788  ssh-copy-id jump_sa@178.124.206.53
 3789  vim ~/.ssh/config
 3790  vim /etc/ssh/ssh_config
 3791  vim ~/.ssh/config
 3792  vim /etc/ansible/hosts
 3793  ansible -m shell -a "cat /etc/os-release"  ec -u root --ask-pass
 3794  vim /home/plu/.ssh/known_hosts
 3795  ansible -m shell -a "cat /etc/os-release"  ec -u root --ask-pass
 3796  vim /home/plu/.ssh/known_hosts
 3797  ansible --varsion
 3798  ansible --version
 3799  ansible -m shell -a "cat /etc/os-release"  ec -u root --ask-pass
 3800  sudo vim /etc/ansible/ansible.cfg
 3801  ansible -m shell -a "cat /etc/os-release"  ec -u root --ask-pass
 3802  sudo vim /etc/ansible/ansible.cfg
 3803  ansible -m shell -a "cat /etc/os-release"  ec -u root --ask-pass
 3804  sudo vim /etc/ansible/ansible.cfg
 3805  ansible -m shell -a "cat /etc/os-release"  ec -u root --ask-pass
 3806  sudo vim /etc/ansible/ansible.cfg
 3807  ansible -m shell -a "cat /etc/os-release"  ec -u root --ask-pass
 3808  sudo vim /etc/ansible/ansible.cfg
 3809  ssh root@192.168.203.10
 3810  ssh root@192.168.203.11
 3811  ansible -m shell -a "cat /etc/os-release"  192.168.203.11 -u root --ask-pass
 3812  ansible-inventory --graph
 3813  ansible -m shell -a "cat /etc/os-release"  192.168.203.12 -u root --ask-pass
 3814  ansible -m shell -a "cat /etc/os-release"  192.168.203.13 -u root --ask-pass
 3815  ansible -m shell -a "cat /etc/os-release"  ec -u root --ask-pass
 3816  vim /home/plu/.ssh/config
 3817  ansible-inventory --graph
 3818  ansible-inventory --host host1
 3819  vim /etc/ansible/hosts
 3820  sudo vim /etc/ansible/hosts
 3821  ansible-inventory --host host1
 3822  sudo mkdir /etc/ansible/{group_vars,host_vars}
 3823  sudo vim /etc/ansible/hosts
 3824  sudo vim  /etc/ansible/group_vars/infra.yaml
 3825  ansible-inventory --host host1
 3826  sudo vim /etc/ansible/hosts
 3827  sudo vim  /etc/ansible/host_vars/bastion.yaml
 3828  ansible-inventory --host bastion
 3829  sudo vim /etc/ansible/hosts
 3830  sudo mkdir /etc/ansible/group_vars/internal
 3831  sudo ansible-vault create /etc/ansible/group_vars/internal/vault.yaml
 3832  vim /etc/ansible/group_vars/internal/vault.yaml
 3833  sudo vim /etc/ansible/group_vars/internal/vault.yaml
 3834  ansible -m shell -a "cat /etc/os-release"  internal
 3835  ls -l /etc/ansible/group_vars/internal/vault.yaml
 3836  sudo chmod 755 /etc/ansible/group_vars/internal/vault.yaml
 3837  ls -l /etc/ansible/group_vars/internal/vault.yaml
 3838  sudo chmod 744 /etc/ansible/group_vars/internal/vault.yaml
 3839  ls -l /etc/ansible/group_vars/internal/vault.yaml
 3840  ansible -m shell -a "cat /etc/os-release"  internal
 3841  ansible -m shell -a "cat /etc/os-release"  internal --ask-vault-pass
 3842  sudo vim /etc/ansible/hosts
 3843  ansible -m shell -a "cat /etc/os-release"  internal --ask-vault-pass
 3844  ansible -m shell -a "cat /etc/os-release" host1 --ask-vault-pass
 3845  ansible -m shell -a "cat /etc/os-release" host2 --ask-vault-pass
 3846  ansible -m shell -a "cat /etc/os-release"  internal --ask-vault-pass
 3847  sudo ansible-vault edit /etc/ansible/group_vars/internal/vault.yaml

```